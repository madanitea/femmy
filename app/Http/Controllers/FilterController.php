<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Filter;
use App\Log;
use Auth;
use App\Helper\ApiHelper;
use App\Host;

class FilterController extends Controller
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
        $filters = Filter::where('varian','custom')->orderBy('id','DESC')->get();
        $filters_default = Filter::where('varian','default')->orderBy('name','ASC')->get();
        $i = 0;
        return view('filter',compact('filters','filters_default','i'));
    }
    
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        request()->validate([
            'name' => 'required|alpha_dash|unique:filters,name',
            'content' => 'required',
        ]);
        $user_now = Auth::user()->full_name;
        $log = $user_now." added a new filter named ".$request['name'].".";
        $level = "success";

        // Send command to each host
        $hosts = Host::orderBy('id','DESC')->get();
        foreach ($hosts as $key => $host) {
            $ip = $host->ip;
            $port = $host->port;
            $url = 'http://'.$ip.':'.$port.'/api/v1/create_filter?';
            $payload = 'filter_name='.$request->name.'&filter_content='.rawurlencode($request->content);
            ApiHelper::getApi($url.$payload);
        }
        // Store log first
        Log::create(['log' => $log, 'level' => $level]);

        Filter::create(['name' => strtolower($request->name), 'content' => $request->content, 'varian' => 'custom']);
        return redirect()->route('filters.index')
                        ->with('success','Filter created successfully.');
    }
    
    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Host  $host
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Filter $filter)
    {
        request()->validate([
            'content' => 'required',
        ]);
        $name = Filter::findOrFail($filter->id);
        $user_now = Auth::user()->full_name;
        $log = $user_now." updated a filter named ".$name->name.".";
        $level = "success";

        // Send command to each host
        $hosts = Host::orderBy('id','DESC')->get();
        foreach ($hosts as $key => $host) {
            $ip = $host->ip;
            $port = $host->port;
            $url = 'http://'.$ip.':'.$port.'/api/v1/edit_filter?';
            $payload = 'filter_name='.$name->name.'&filter_content='.rawurlencode($request->content);
            ApiHelper::getApi($url.$payload);
        }

        // Store log first
        Log::create(['log' => $log, 'level' => $level]);

        $filter->update($request->all());
    
        return redirect()->route('filters.index')
                        ->with('success','Filter updated successfully');
    }
    
    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Host  $host
     * @return \Illuminate\Http\Response
     */
    public function destroy(Filter $filter)
    {
        $user_now = Auth::user()->full_name;
        $log = $user_now." deleted a filter named ".$filter->name.".";
        $level = "success";
        // Store log first
        Log::create(['log' => $log, 'level' => $level]);
        $filter->delete();
    
        return redirect()->route('filters.index')
                        ->with('success','Filter deleted successfully');
    }
}
