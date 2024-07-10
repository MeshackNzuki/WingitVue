<?php

namespace App\Http\Controllers\Auth;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\User;
use App\Models\Student\Student;
use App\Models\Guardian\Guardian;
use App\Http\Controllers\Controller;
use Illuminate\Validation\ValidationException;

class LoginController extends Controller
{
    /*
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function login(Request $request)
    {
        $request->validate([
            'email' => 'required|email',
            'password' => 'required',
        ]);

        // Check User
        $user = User::where('email', $request->email)->first();
        if ($user && Auth::attempt(['email' => $request->email, 'password' => $request->password])) {
            $token = $user->createToken('authToken')->plainTextToken;
            return $this->ResSuccess([
                'token' => $token,
                'roles' => $user->getRoleNames(),
                'name' => $user->name,
                'email' => $user->email
            ]);
        }

        // Check Student
        $student = Student::where('guardian_email', $request->email)->first();
        if ($student && Auth::attempt(['guardian_email' => $student->email, 'password' => $request->password])) {
            $token = $student->createToken('authToken')->plainTextToken;
            return $this->ResSuccess([
                'token' => $token,
                'roles' => $student->getRoleNames(),
                'name' => $student->name,
                'email' => $student->email
            ]);
        }

        // Check Guardian
        $guardian = Guardian::where('email', $request->email)->first();
        if ($guardian && Auth::attempt(['email' => $guardian->email, 'password' => $request->password])) {
            $token = $guardian->createToken('authToken')->plainTextToken;
            return $this->ResSuccess([
                'token' => $token,
                'roles' => $guardian->getRoleNames(),
                'name' => $guardian->name,
                'email' => $guardian->email
            ]);
        }

        // If all fail
        throw ValidationException::withMessages([
            'email' => ['Invalid credentials.'],
        ]);
    }
}
