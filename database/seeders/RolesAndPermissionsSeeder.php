<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Permission;
use Spatie\Permission\Models\Role;
use Spatie\Permission\PermissionRegistrar;

class RolesAndPermissionsSeeder extends Seeder
{
    /**
     * Create the initial roles and permissions.
     */
    public function run(): void
    {
        // Reset cached roles and permissions
        app()[PermissionRegistrar::class]->forgetCachedPermissions();

        // Create permissions
        $permissions = [
            'view students',
            'manage students',
            'view instructors',
            'manage instructors',
            'view finance',
            'manage finance',
            'view library',
            'manage library',
            'view parents',
            'manage parents',
            'view own profile',
            'edit own profile',
            'manage grading',
            'view grading',
            'manage orders',
        ];

        foreach ($permissions as $permission) {
            Permission::create(['name' => $permission]);
        }

        // Create roles and assign permissions
        $roles_permissions = [
            'admin' => Permission::all(),
            'student' => ['view own profile', 'edit own profile'],
            'instructor' => ['view students', 'view own profile', 'edit own profile', 'view grading', 'manage grading'],
            'finance' => ['view finance', 'manage finance', 'view own profile'],
            'library' => ['view library', 'manage library', 'view own profile'],
            'guardian' => ['view own profile', 'edit own profile'],
        ];

        foreach ($roles_permissions as $role_name => $permissions) {
            $role = Role::create(['name' => $role_name]);
            $role->givePermissionTo($permissions);
        }
    }
}
