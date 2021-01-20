<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Auth;
use App\Host;
use App\Banned_Ip;
use App\Jail;
use App\Log;
use Illuminate\Support\Facades\DB;

class DashboardController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    function __construct()
    {
         $this->middleware('permission:filter-list|filter-create|filter-edit|filter-delete', ['only' => ['index']]);
         $this->middleware('permission:filter-create', ['only' => ['store']]);
         $this->middleware('permission:filter-edit', ['only' => ['update']]);
         $this->middleware('permission:filter-delete', ['only' => ['destroy']]);
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
    	$total_host = Host::count();
    	$total_banned_now = Banned_Ip::where('status','banned')->count();
    	$total_banned = Banned_Ip::count();
    	$total_jail = Jail::count();
    	$recent_act = Log::orderBy('id','DESC')->limit('4')->get();
    	$sql = "select replace(json_extract(banned_ips.info, '$.country'),'\"','') as country, count(json_extract(banned_ips.info, '$.country')) as count from banned_ips group by country";
    	$most_ip_loc = DB::select($sql);
    	$host_under_attack = 'select h.name host,time(b.created_at) time,date(b.created_at) date from hosts h, jails j, banned_ips b where b.jail_id=j.id and j.host_id=h.id and b.status="banned" order by host,time,date DESC';
    	$host_under_attack = DB::select($host_under_attack);
    	$monthly_stats = 'select count(ip) ip,DATE_FORMAT(created_at,"%b") month_str,month(created_at) month from banned_ips group by month,month_str order by month ASC limit 6';
    	$monthly_stats = DB::select($monthly_stats);
    	$daily_stats = 'select count(ip) ip,DATE_FORMAT(created_at, "%a, %e %b") day,date(created_at) date from banned_ips group by day,date order by date ASC limit 7';
    	$daily_stats = DB::select($daily_stats);
    	$banned_ip = Banned_Ip::where('status','banned')->orderBy('created_at','DESC')->limit(10)->get();
    	$i=0;
        return view('dashboard',compact('total_host','total_banned_now','total_banned','total_jail','recent_act','most_ip_loc','host_under_attack','monthly_stats','daily_stats','banned_ip','i'));
    }
}
