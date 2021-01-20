<?php
    
namespace App\Http\Controllers;


use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use DB;
use Illuminate\Support\Arr;
use Auth;
use App\Log;

class RoleController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    function __construct()
    {
         $this->middleware('permission:role-list|role-create|role-edit|role-delete', ['only' => ['index','store']]);
         $this->middleware('permission:role-create', ['only' => ['store']]);
         $this->middleware('permission:role-edit', ['only' => ['edit','update']]);
         $this->middleware('permission:role-delete', ['only' => ['destroy']]);
    }
    
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $roles = Role::orderBy('id','DESC')->get();
        $permission = Permission::get();
        $no = 0;
        foreach ($roles as $key => $rule) {
        	$id = $rule->id;
        	$roled = Role::find($id);
        	$roledPermissions = Permission::join("role_has_permissions","role_has_permissions.permission_id","=","permissions.id")
            ->where("role_has_permissions.role_id",$id)
            ->get();
        	$role = Role::find($id);
        	$rolePermissions = DB::table("role_has_permissions")->where("role_has_permissions.role_id",$id)
            ->pluck('role_has_permissions.permission_id','role_has_permissions.permission_id')
            ->all();
            Arr::add($roles[$no],'permission',$rolePermissions);
            $no++;
        }
        return view('role',compact('roles','permission'));
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
            'name' => 'required|unique:roles,name',
            'permission' => 'required',
        ]);
    	$user_now = Auth::user()->full_name;
        $log = $user_now." added a new role named ".$request['name'].".";
        $level = "success";
        // Store log first
    	Log::create(['log' => $log, 'level' => $level]);
        $role = Role::create(['name' => $request->input('name')]);
        $role->syncPermissions($request->input('permission'));
    
        return redirect()->route('roles.index')
                        ->with('success','Role created successfully');
    }
    
    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
    	$roled = Role::find($id);
        $roledPermissions = Permission::join("role_has_permissions","role_has_permissions.permission_id","=","permissions.id")
            ->where("role_has_permissions.role_id",$id)
            ->get();
        $role = Role::find($id);
        $permission = Permission::get();
        $rolePermissions = DB::table("role_has_permissions")->where("role_has_permissions.role_id",$id)
            ->pluck('role_has_permissions.permission_id','role_has_permissions.permission_id')
            ->all();
    
        return view('roles.edit',compact('role','permission','rolePermissions','roledPermissions','roled'));
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
            'permission' => 'required',
        ]);
    	$user_now = Auth::user()->full_name;
        $role = Role::find($id);
        $log = $user_now." updated a role named ".$role->name.".";
        $level = "success";
        // Store log first
    	Log::create(['log' => $log, 'level' => $level]);
    
        $role->syncPermissions($request->input('permission'));
    
        return redirect()->route('roles.index')
                        ->with('success','Role updated successfully');
    }
    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
    	$role = Role::findOrFail($id);
    	$role =  $role->name;
    	$user_now = Auth::user()->full_name;
        $log = $user_now." deleted a role named ".$role.".";
        $level = "success";
        // Store log first
    	Log::create(['log' => $log, 'level' => $level]);
        DB::table("roles")->where('id',$id)->delete();
        return redirect()->route('roles.index')
                        ->with('success','Role deleted successfully');
    }
}