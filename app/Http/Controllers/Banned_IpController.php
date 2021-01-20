<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Banned_Ip;
use App\Helper\ApiHelper;
use App\Log;
use Auth;
use App\Host;
use App\Jail;
use App\Helper\TelegramHelper;

class Banned_IpController extends Controller
{
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request, $host, $jail)
    {
        $this->validate($request, [
            'ip' => 'required',
        ]);
        $host_source = $host;
        $ip = $request->input('ip');
    	$info = ApiHelper::GetApi('http://ip-api.com/php/'.$ip.'?fields=country,regionName,city,lat,lon,timezone,isp,org,as');
    	$info = unserialize($info);
    	$user_now = Auth::user()->full_name;
    	$hosts = Host::findOrFail($host);
    	$jails = Jail::findOrFail($jail);
        $log = $user_now." banned IP ".$ip." in ".$jails->name." at ".$hosts->ip.".";
        $level = "success";

        // $send = Jail::findOrFail($jail);
        // $host = Host::findOrFail($send->host_id);
        // $url = 'http://'.$host->ip.':'.$host->port.'/api/v1/ban_ip?jail_name='.$jails->name.'&ip='.$ip;
        // ApiHelper::GetApi($url);
        // Share banned IP to other host
        $same_on_another = Jail::where('name',$jails->name)->get();
        foreach ($same_on_another as $key => $same_jail) {
            $host = Host::findOrFail($same_jail->host_id);
            $ip_host = $host->ip;
            $port_host = $host->port;
            $url = 'http://'.$ip_host.':'.$port_host.'/api/v1/ban_ip?jail_name='.$jails->name.'&ip='.$ip;
            ApiHelper::GetApi($url);
        }
        TelegramHelper::storeMessage("<b style='color:#121F45;'>[ INFO ]</b>\n".$log);
        // Store log first
    	Log::create(['log' => $log, 'level' => $level]);
        $ban = Banned_Ip::create(['ip' => $ip,'jail_id' => $jail,'info' => $info,'status' => 'banned','abuse' => 'unreported']);
        return redirect()->route('jails.detail',[$host_source,$jail])
                        ->with('success','IP Banned!');
    }
    public function destroy($host,$jail,$id)
    {
        $host_source = $host;
        $ip = Banned_Ip::findOrFail($id);
    	$user_now = Auth::user()->full_name;
    	$host = Host::findOrFail($host);
    	$jail = Jail::findOrFail($jail);
        $log = $user_now." unbanned IP ".$ip->ip." in ".$jail->name." at ".$host->ip.".";
        $level = "success";

        // $send = Jail::findOrFail($jail);
        // $host = Host::findOrFail($send->host_id);
        // $url = 'http://'.$host->ip.':'.$host->port.'/api/v1/unban_ip?jail_name='.$jail->name.'&ip='.$ip->ip;
        // ApiHelper::GetApi($url);

        // Share unbanned IP to other host
        $same_on_another = Jail::where('name',$jail->name)->get();
        foreach ($same_on_another as $key => $same_jail) {
            $host = Host::findOrFail($same_jail->host_id);
            $ip_host = $host->ip;
            $port_host = $host->port;
            $url = 'http://'.$ip_host.':'.$port_host.'/api/v1/unban_ip?jail_name='.$jail->name.'&ip='.$ip->ip;
            ApiHelper::GetApi($url);
        }

        TelegramHelper::storeMessage("<b style='color:#121F45;'>[ INFO ]</b>\n".$log);
        // Store log first
    	Log::create(['log' => $log, 'level' => $level]);
    	$unban = Banned_Ip::findOrFail($id);
    	$unban->status = 'unbanned';
    	$unban->save();
        return redirect()->route('jails.detail',[$host_source,$jail])
                        ->with('success','IP Unbanned!');
    }

    public function banfromapi(Request $request){
        request()->validate(['ip' => 'required','status'=>'required','jail_name' => 'required','host' => 'required']);
        $ip = $request->ip;
        $status = $request->status;
        $abuse = 'unreported';
        $host = Host::where('ip',$request->host)->first();
        $jail = Jail::where('name',$request->jail_name)->where('host_id',$host->id)->get();
        foreach ($jail as $key => $jail_key) {
            $jail_id = $jail_key->id;
            $host_id = $jail_key->host_id;
        }
        $host = Host::findOrFail($host_id);
        $host_name = $host->name;
        $host_ip = $host->ip;
        $info = ApiHelper::GetApi('http://ip-api.com/php/'.$ip.'?fields=country,regionName,city,lat,lon,timezone,isp,org,as');
        $info = unserialize($info);
        $ban = Banned_Ip::create(['ip' => $ip,'jail_id' => $jail_id,'info' => $info,'status' => $status,'abuse' => $abuse]);
        if($status == 'banned'){
            $level = 'danger';
            $log = "Host ".$host_name." with IP address ".$host_ip." has banned ".$ip." from the system, this IP will be automatically banned from all hosts and the jail.";
        }else{
            $level = 'warning';
            $log = "Host ".$host_name." with IP address ".$host_ip." has reported ".$ip." from the system, this IP will be automatically reported to all hosts and the jail.";
        }

        // Share banned IP to other host
        $same_on_another = Jail::where('name',$request->jail_name)->where('host_id','!=',$host_id)->get();
        foreach ($same_on_another as $key => $same_jail) {
            $host = Host::findOrFail($same_jail->host_id);
            $ip_host = $host->ip;
            $port_host = $host->port;
            $cek_share= " shared to ".$ip_host;
            $url = 'http://'.$ip_host.':'.$port_host.'/api/v1/ban_ip?jail_name='.$request->jail_name.'&ip='.$ip;
            $response = ApiHelper::GetApi($url);
        }

        // TelegramHelper::storeMessage("<b style='color:#DB0A40;'>[ INFO ]</b>\n".$log);
        Log::create(['log' => $log, 'level' => $level]);
        return response()->json('IP '.$ip.' reported or banned successfully.'.$cek_share." ".$response, 200);
    }

    public function unbanfromapi(Request $request){
        request()->validate(['ip' => 'required','status'=>'required','jail_name' => 'required','host' => 'required']);
        $ip = $request->ip;
        $status = $request->status;
        $abuse = 'unreported';
        $host = Host::where('ip',$request->host)->first();
        $jail = Jail::where('name',$request->jail_name)->where('host_id',$host->id)->get();
        foreach ($jail as $key => $jail_key) {
            $jail_id = $jail_key->id;
            $host_id = $jail_key->host_id;
        }
        Banned_Ip::where('ip',$request->ip)->orderBy('id','DESC')->first()->update(array('status' => 'unbanned'));
        $host = Host::findOrFail($host_id);
        $host_name = $host->name;
        $host_ip = $host->ip;
        $level = 'warning';
        $log = "Host ".$host_name." with IP address ".$host_ip." has unbanned ".$ip." from the system, this IP will be automatically unbanned to all hosts and the jail.";

        // Share unbanned IP to other host
        $same_on_another = Jail::where('name',$request->jail_name)->where('host_id','!=',$host_id)->get();
        foreach ($same_on_another as $key => $same_jail) {
            $host = Host::findOrFail($same_jail->host_id);
            $ip_host = $host->ip;
            $port_host = $host->port;
            $url = 'http://'.$ip_host.':'.$port_host.'/api/v1/unban_ip?jail_name='.$request->jail_name.'&ip='.$ip;
            ApiHelper::GetApi($url);
        }

        TelegramHelper::storeMessage("<b style='color:#FFCC00;'>[ INFO ]</b>\n".$log);
        Log::create(['log' => $log, 'level' => $level]);
        return response()->json('IP '.$ip.' unbanned successfully.', 200);
    }
}
