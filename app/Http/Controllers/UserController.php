<?php
    
namespace App\Http\Controllers;
    
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\User;
use Spatie\Permission\Models\Role;
use DB;
use Hash;
use App\Log;
use Auth;
    
class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
    	$roles = Role::pluck('name','name');
    	$role = Role::orderBy('id','DESC')->get();
        $data = User::orderBy('id','DESC')->get();
        $i = 0;
        return view('user', compact('data','roles','i','role'));
    }
    
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validate($request, [
            'full_name' => 'required',
            'email' => 'required|email|unique:users,email',
            'password' => 'required|same:confirm-password',
            'roles' => 'required'
        ]);
    
        $input = $request->all();
        $input['password'] = Hash::make($input['password']);
        $user_now = Auth::user()->full_name;
        $log = $user_now." added a new user named ".$input['full_name']." with a role ".$input['roles'][0].".";
        $level = "success";
        // Store log first
    	Log::create(['log' => $log, 'level' => $level]);
    	// Then store user
        $user = User::create($input);
        $user->assignRole($request->input('roles'));
        return redirect()->route('users.index')
                        ->with('success','User created successfully!');
    }
    
    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $this->validate($request, [
            'full_name' => 'required',
            'email' => 'required|email|unique:users,email,'.$id,
            'role' => 'required'
        ]);
    
        $input = $request->all();
        if(!empty($input['password'])){ 
            $input['password'] = Hash::make($input['password']);
        }else{
            $input = array_except($input,array('password'));    
        }
    	$user_now = Auth::user()->full_name;
        $log = $user_now." updated a user named ".$input['full_name'].".";
        $level = "success";
        // Store log first
    	Log::create(['log' => $log, 'level' => $level]);
    	// Update the user
        $user = User::find($id);
        $user->update($input);
        DB::table('model_has_roles')->where('model_id',$id)->delete();
    
        $user->assignRole($request->input('role'));
    
        return redirect()->route('users.index')
                        ->with('success','User updated successfully!');
    }
    
    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
    	$user_now = Auth::user()->full_name;
    	$input = User::findOrFail($id);
        $log = $user_now." deleted a user named ".$input['full_name'].".";
        $level = "success";
        // Store log first
    	Log::create(['log' => $log, 'level' => $level]);
        User::find($id)->delete();
        return redirect()->route('users.index')
                        ->with('success','User deleted successfully!');
    }
}