<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Validation\ValidationException;
use App\Traits\ApiResponseTrait;

class UserManagementController extends Controller
{


    /**
     * Display a listing of the users.
     *
     */
    public function index()
    {
        $users = User::with('roles')->get();     
        return $this->ResSuccess([
            'user' => $users,
            'message' => 'Users retrieved successfully'
        ], 201);
    }

    /**
     * Store a newly created user with roles.
     *
     * @param  \Illuminate\Http\Request  $request
     */
    public function store(Request $request)
    {
        try {
            $request->validate([
                'username' => 'required|string|max:255',
                'details' => 'nullable|string',
                'email' => 'unique|string',
                'role' => 'required|string|exists:roles,name',
                'phone' => 'nullable|string|max:20',
                'staff_number' => 'nullable|string|max:20',
            ]);

            $user = User::create([
                'name' => $request->input('username'),
                'email' => 'unique|string',
                'details' => $request->input('details'),
                'phone' => $request->input('phone'),
                'staff_number' => $request->input('staff_number'),
                'password' => bcrypt('password'), // Temporary password, change as needed
            ]);

            $user->assignRole($request->input('role'));

            return $this->ResSuccess([
                'user' => $user,
                'message' => 'User created successfully'
            ], 201);
        } catch (ValidationException $e) {
            return $this->errorResponse($e->validator->errors()->all(), 'Validation error', 422);
        } catch (\Exception $e) {
            return $this->errorResponse($e->getMessage(), 'Failed to create user', 500);
        }
    }

    /**
     * Display the specified user.
     *
     * @param  int  $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function show($id)
    {
        $user = User::with('roles')->find($id);

        if (!$user) {
            return $this->errorResponse('User not found', 'User not found', 404);
        }

        return $this->ResSuccess($user, 'User retrieved successfully');
    }

    /**
     * Update the specified user with roles.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     */
    public function update(Request $request, $id)
    {
        try {
            $request->validate([
                'username' => 'required|string|max:255',
                'details' => 'nullable|string',
                'email' => 'unique|string',
                'role' => 'required|string|exists:roles,name',
                'phone' => 'nullable|string|max:20',
                'staff_number' => 'nullable|string|max:20',
            ]);

            $user = User::find($id);

            if (!$user) {
                return $this->errorResponse('User not found', 'User not found', 404);
            }

            $user->name = $request->input('username');
            $user->details = $request->input('details');
            $user->phone = $request->input('phone');
            $user->staff_number = $request->input('staff_number');
            $user->save();

            $user->syncRoles([$request->input('role')]);

            return $this->ResSuccess([
                'user' => $user,
                'message' => 'User updated successfully'
            ]);
        } catch (ValidationException $e) {
            return $this->errorResponse($e->validator->errors()->all(), 'Validation error', 422);
        } catch (\Exception $e) {
            return $this->errorResponse($e->getMessage(), 'Failed to update user', 500);
        }
    }

    /**
     * Remove the specified user from storage.
     *
     * @param  int  $id
     */
    public function destroy($id)
    {
        try {
            $user = User::find($id);

            if (!$user) {
                return $this->errorResponse('User not found', 'User not found', 404);
            }

            $user->syncRoles([]);
            $user->delete();

            return $this->ResSuccess(null, 'User deleted successfully');
        } catch (\Exception $e) {
            return $this->errorResponse($e->getMessage(), 'Failed to delete user', 500);
        }
    }
}
