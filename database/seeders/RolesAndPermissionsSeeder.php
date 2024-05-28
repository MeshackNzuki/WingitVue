<?php

use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;

class RolesAndPermissionsSeeder extends Seeder
{
    public function run()
    {
        app()[\Spatie\Permission\PermissionRegistrar::class]->forgetCachedPermissions();

        Permission::create(['name' => 'view students']);
        Permission::create(['name' => 'manage students']);
        Permission::create(['name' => 'view instructors']);
        Permission::create(['name' => 'manage instructors']);
        Permission::create(['name' => 'view finance']);
        Permission::create(['name' => 'manage finance']);
        Permission::create(['name' => 'view library']);
        Permission::create(['name' => 'manage library']);
        Permission::create(['name' => 'view parents']);
        Permission::create(['name' => 'manage parents']);
        Permission::create(['name' => 'view own profile']);
        Permission::create(['name' => 'edit own profile']);
        Permission::create(['name' => 'manage grading']);
        Permission::create(['name' => 'view grading']);
        Permission::create(['name' => 'manage orders']);

        $role = Role::create(['name' => 'admin']);
        $role->givePermissionTo(Permission::all());

        $role = Role::create(['name' => 'student']);
        $role->givePermissionTo(['view own profile', 'edit own profile']);

        $role = Role::create(['name' => 'instructor']);
        $role->givePermissionTo(['view students', 'view own profile', 'edit own profile' ,'view grading' ,'manage grading' ]);

        $role = Role::create(['name' => 'finance']);
        $role->givePermissionTo(['view finance', 'manage finance' ,'view own profile']);

        $role = Role::create(['name' => 'library']);
        $role->givePermissionTo(['view library', 'manage library' ,'view own profile']);

        $role = Role::create(['name' => 'guardian']);
        $role->givePermissionTo(['view own profile', 'edit own profile']);
    }
}
