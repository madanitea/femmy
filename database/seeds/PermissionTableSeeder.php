<?php


use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Permission;


class PermissionTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
       $permissions = ['role-list','role-create','role-edit','role-delete','host-list','host-create','host-edit','host-delete','user-list','user-create','user-edit','user-delete','jail-list','jail-create','jail-edit','jail-delete','filter-list','filter-create','filter-edit','filter-delete','ban-ip','unban-ip','trust-ip','untrust_ip','log-list','dashboard'];
   
        foreach ($permissions as $permission) {
             Permission::create(['name' => $permission]);
        }
    }
}