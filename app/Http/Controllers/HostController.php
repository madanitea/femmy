<?php
    
namespace App\Http\Controllers;
    
use App\Host;
use Illuminate\Http\Request;
use Auth;
use App\Log;

class HostController extends Controller
{ 
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    function __construct()
    {
         $this->middleware('permission:host-list|host-create|host-edit|host-delete', ['only' => ['index']]);
         $this->middleware('permission:host-create', ['only' => ['store']]);
         $this->middleware('permission:host-edit', ['only' => ['update']]);
         $this->middleware('permission:host-delete', ['only' => ['destroy']]);
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $hosts = Host::orderBy('id','DESC')->get();
        $i = 0;
        return view('host',compact('hosts','i'));
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
            'name' => 'required',
            'description' => 'required',
            'ip' => 'required|unique:hosts,ip',
            'port' => 'required',
            'api_key' => 'required',
        ]);

    	$user_now = Auth::user()->full_name;
        $log = $user_now." added a new host named ".$request['name'].".";
        $level = "success";
        // Store log first
    	Log::create(['log' => $log, 'level' => $level]);

        Host::create($request->all());
        return redirect()->route('hosts.index')
                        ->with('success','Host created successfully.');
    }
    
    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Host  $host
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Host $host)
    {
        request()->validate([
            'name' => 'required',
            'description' => 'required',
            'ip' => 'required|unique:hosts,ip',
            'port' => 'required',
            'api_key' => 'required',
        ]);
    	$user_now = Auth::user()->full_name;
        $log = $user_now." updated a host named ".$request->name.".";
        $level = "success";
        // Store log first
    	Log::create(['log' => $log, 'level' => $level]);
        $host->update($request->all());
    
        return redirect()->route('hosts.index')
                        ->with('success','Host updated successfully');
    }
    
    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Host  $host
     * @return \Illuminate\Http\Response
     */
    public function destroy(Host $host)
    {
    	$user_now = Auth::user()->full_name;
    	$hosts = Host::findOrFail($host->id);
        $log = $user_now." deleted a host named ".$hosts->name.".";
        $level = "success";
        // Store log first
    	Log::create(['log' => $log, 'level' => $level]);
    	$host->delete();
    
        return redirect()->route('hosts.index')
                        ->with('success','Host deleted successfully');
    }
}