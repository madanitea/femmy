<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Log;

class LogController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    function __construct()
    {
         $this->middleware('permission:log-list|log-create|log-edit|log-delete', ['only' => ['index']]);
    }

    public function index(Request $request)
    {
    	$logs = Log::orderBy('id','DESC')->get();
    	$i = 0;
    	return view('log',compact('logs','i'));
    }
}
