<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Trusted_Ip;
use App\Log;
use Auth;
use App\Helper\ApiHelper;
use App\Jail;
use App\Host;

class Trusted_IpController extends Controller
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

        // Share trusted IP to other host
        $ip = $request->ip;
        $jails = Jail::findOrFail($jail);
        $same_on_another = Jail::where('name',$jails->name)->get();
        foreach ($same_on_another as $key => $same_jail) {
            $host = Host::findOrFail($same_jail->host_id);
            $ip_host = $host->ip;
            $port_host = $host->port;
            $url = 'http://'.$ip_host.':'.$port_host.'/api/v1/trust_ip?jail_name='.$jails->name.'&ip='.$ip;
            ApiHelper::GetApi($url);
        }
        
        $user = Trusted_Ip::create(['ip' => $request->input('ip'),'jail_id' => $jail]);
        return redirect()->route('jails.detail',[$host,$jail])
                        ->with('success','Trusted IP added!');
    }

    public function destroy($host,$jail,$id)
    {
        // Share untrusted IP to other host
        $ip = Trusted_Ip::findOrFail($id);
        $ip = $ip->ip;
        $jails = Jail::findOrFail($jail);
        $same_on_another = Jail::where('name',$jails->name)->get();
        foreach ($same_on_another as $key => $same_jail) {
            $host = Host::findOrFail($same_jail->host_id);
            $ip_host = $host->ip;
            $port_host = $host->port;
            $url = 'http://'.$ip_host.':'.$port_host.'/api/v1/untrust_ip?jail_name='.$jails->name.'&ip='.$ip;
            ApiHelper::GetApi($url);
        }

    	Trusted_Ip::find($id)->delete();
        return redirect()->route('jails.detail',[$host,$jail])
                        ->with('success','Trusted IP deleted!');
    }
}
