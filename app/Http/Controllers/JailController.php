<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Jail;
use App\Host;
use App\Filter;
use App\Trusted_Ip;
use App\Banned_Ip;
use App\Log;
use Auth;
use App\Helper\ApiHelper;

class JailController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    function __construct()
    {
         $this->middleware('permission:jail-list|jail-create|jail-edit|jail-delete', ['only' => ['index']]);
         $this->middleware('permission:jail-create', ['only' => ['store']]);
         $this->middleware('permission:jail-edit', ['only' => ['update']]);
         $this->middleware('permission:jail-delete', ['only' => ['destroy']]);
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
    	$hosts = Host::orderBy('id','DESC')->get();
        $jails = Jail::orderBy('id','DESC')->get();
        $i = 0;
        return view('jail',compact('hosts','jails','i'));
    }

    public function manage(Request $request, $host)
    {
    	$jails = Host::find($host)->jail()->get();
    	$i = 0;
    	$host = Host::find($host);
    	$filters = Filter::orderBy('name','ASC')->get();
    	return view('jailmanage',compact('jails','host','filters','i'));
    }

    public function store(Request $request)
    {
    	request()->validate([
            'name' => 'required',
            'filter_id' => 'required',
            'logpath' => 'required',
            'port' => 'required',
            'find_time' => 'required',
            'max_retry' => 'required',
            'ban_time' => 'required',
            'host_id' => 'required',
            'status' => 'required',
        ]);

        $filter = Filter::findOrFail($request->filter_id);
        $user_now = Auth::user()->full_name;
        $host = Host::findOrFail($request->host_id);
        $ip = $host->ip;
        $port = $host->port;
        $log = $user_now." added a new jail named ".$request['name']." at ".$ip." or ".$port.".";
        $level = "success";

        // Send command using API
        $url = 'http://'.$ip.':'.$port.'/api/v1/create_jail?';
        $payload = 'jail_name='.$request->name.'&port_service='.$request->port.'&filter_name='.$filter->name.'&find_time='.$request->find_time.'&max_retry='.$request->max_retry.'&ban_time='.$request->ban_time.'&log_path='.$request->logpath.'&filter_type='.$filter->varian;
        ApiHelper::getApi($url.$payload);

        // Store log first
        Log::create(['log' => $log, 'level' => $level]);

        Jail::create($request->all());
        return redirect()->route('jails.manage',[request()->host_id])
                        ->with('success','Jail created successfully.');
    }

    public function enable(Request $request, $jail)
    {
        $user_now = Auth::user()->full_name;
        $jail = Jail::findOrFail($jail);
        $host = Host::findOrFail($request->host_id);
        $ip = $host->ip;
        $port = $host->port;
        $log = $user_now." enabled a jail named ".$jail->name." at ".$ip.".";
        $level = "success";

        // Send command using API
        $url = 'http://'.$ip.':'.$port.'/api/v1/enable_jail?';
        $payload = 'jail_name='.$jail->name;
        ApiHelper::getApi($url.$payload);

        // Store log first
        Jail::where('id', $jail->id)->update(array('status' => 'Enabled'));
        Log::create(['log' => $log, 'level' => $level]);
    	return redirect()->route('jails.manage',[request()->host_id])
                        ->with('success','Jail enabled successfully.');
    }

    public function disable(Request $request, $jail)
    {
        $user_now = Auth::user()->full_name;
        $jail = Jail::findOrFail($jail);
        $host = Host::findOrFail($request->host_id);
        $ip = $host->ip;
        $port = $host->port;
        $log = $user_now." disabled a jail named ".$jail->name." at ".$ip.".";
        $level = "success";

        // Send command using API
        $url = 'http://'.$ip.':'.$port.'/api/v1/disable_jail?';
        $payload = 'jail_name='.$jail->name;
        ApiHelper::getApi($url.$payload);

        // Store log first
        Jail::where('id', $jail->id)->update(array('status' => 'Disabled'));
        Log::create(['log' => $log, 'level' => $level]);
    	return redirect()->route('jails.manage',[request()->host_id])
                        ->with('success','Jail disabled successfully.');
    }

    public function detail(Request $request, $host, $jail)
    {
    	$jails = Jail::findOrFail($jail);
        $jailname = Jail::findOrFail($jail);
    	$filter = Filter::findOrFail($jails->filter_id);
    	$host = Host::find($host);
    	$trusted_ip = Trusted_Ip::where('jail_id',$jail)->get();
    	$banned_ip = Banned_Ip::where('jail_id',$jail)->where('status','banned')->orderBy('id','DESC')->get();
    	$i = 0;
        $u = 0;
        $o = 0;
        $historys = Banned_Ip::where('status','unbanned')->where('jail_id',$jail)->orderBy('id','DESC')->get();
        // $output_banned_history = array();
        // foreach ($banned_history as $key => $ban_history) {
        //     $jail_id = $ban_history->jail_id;
        //     $ip_banned = $ban_history->ip;
        //     $jail = Jail::findOrFail($jail_id);
        //     $jail_name = $jail->name;
        //     $host_id = $jail->host_id;
        //     $host_ip = Host::findOrFail($host_id);
        //     $host_ip = $host_ip->ip;
        //     $push = array('jail_name' => $jail_name,'host_ip' => $host_ip,'ip' => $ip_banned);
        //     $ban_history = $ban_history->toArray();
        //     $output = array_merge($ban_history, $push);
        //     array_push($output_banned_history, $output);
        // }
        // $historys = $output_banned_history;
    	return view('jaildetail',compact('jailname','jails','filter','host','trusted_ip','banned_ip','i','historys','u','o'));
    }

    public function update(Request $request, Jail $jail)
    {
        request()->validate([
            'find_time' => 'required',
            'max_retry' => 'required',
            'ban_time' => 'required',
            'host_id' => 'required',
        ]);

        $user_now = Auth::user()->full_name;
        $jails = Jail::findOrFail($jail->id);
        $host = Host::findOrFail($request->host_id);
        $ip = $host->ip;
        $port = $host->port;
        $log = $user_now." updated a jail named ".$jails->name." at ".$ip.".";
        $level = "success";

        // Send command using API
        $url = 'http://'.$ip.':'.$port.'/api/v1/edit_jail?';
        $payload = 'jail_name='.$jails->name.'&find_time='.$request->find_time.'&max_retry='.$request->max_retry.'&ban_time='.$request->ban_time;
        ApiHelper::getApi($url.$payload);

        // Store log first
        Log::create(['log' => $log, 'level' => $level]);
        $jail->update($request->all());
    
        return redirect()->route('jails.detail',[request()->host_id,$jail])
                        ->with('success','Jail updated successfully');
    }
}