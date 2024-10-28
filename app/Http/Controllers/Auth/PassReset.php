<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Http\Helpers\Helpers;
use App\Mail\SendPasswordResetToken;
use App\Mail\Welcome;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Validator;

use App\Http\Common\Logger;

use function Laravel\Prompts\error;

class AuthController extends Controller
{

    public function register(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'firstname' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => 'required|string|min:6',
        ]);
        if ($validator->fails()) {
            $errors = [];
            foreach ($validator->errors()->all()  as $error) {
                $errors[] =  $error;
            }
            return response()->json([
                'status' => false,
                'errors' => $errors
            ],);
        }
        try {
            $user = User::create([
                'name' => $request->firstname,
                'last_name' => $request->lastname,
                'phone' => $request->phone,
                'email' => $request->email,
                'password' => bcrypt($request->password),
            ]);
            // Log in the user immediately after registration
            // Auth::login($user);
            // Generate token for the logged-in user
            $token = $user->createToken('AuthToken')->plainTextToken;
          //  info($token);
            try {
                Mail::to($user->email)->send(new Welcome($user));
            } catch (\Exception $e) {
                Logger::logSystemError('500', $e, [
                    'message' => 'An exception was caught during sending mail in register.',
                ]);
            }
            return response()->json(['token' => $token, 'user' => $user, 'status' => true], 200);
        } catch (\Exception $e) {
            Logger::logSystemError('500', $e, [
                'message' => 'An exception was caught during registration.',
            ]);

            return response()->json([
                'status' => false,
                'errors' => $e
            ],);
        }
    }
    public function login(Request $request)
    {
        $credentials = $request->only('email', 'password');
        if (Auth::attempt($credentials)) {
            $user = Auth::user();

            if ($user->blocked === 1) {
                return response()->json(['status' => false, 'errorMsg' => 'Access denied! You are not authorized to access the site.']);
            }
            $request->user()->tokens()->delete();
            $token = $user->createToken('AuthToken')->plainTextToken;
          //  info($token);

            if ($user->hasRole('admin')) {
                return redirect()->route('admin-dashboard');
            }

          //  info(["token",  $token]);
            return response()->json([
                'status' => true,
                'token' => $token,
                'user' => $user,
                'hasSubscription' => isset($user->subscription) && $user->subscription->status == "1" ? true : false,
                'errorMsg' => null
            ], 200);
        } else {
            return response()->json(['status' => false, 'errorMsg' => 'Invalid login credentials. Please try again.']);
        }
    }
    public function verifyEmail(Request $request)
    {

        $data = false;
        $email = $request->email;

        if ($email) {
            if (User::where("email", $email)->first()) {
                $data  = true;
            }
        }

        return $data;
    }
    public function resetPassword(Request $request)
    {
        try{
            $user = User::where('email', $request->email)->first();
            if ($user) {
                if($request->token == $user->password_reset_code){
                    $user->update([
                        'password' => bcrypt($request->password)
                    ]);
                    return response()->json(['status' => true, 'msg' => 'Password reset was successfull.', 'error' => null]);
                }else{
                    return response()->json(['status' => false, 'msg' => 'Invalid token! Try again.', 'error' => null]);
                }
            }else{
                return response()->json(['status' => false, 'msg' => 'Unexpected error occurred. Please try again.', 'error' => null]);
            }
        }catch(\Exception $e){
            Logger::logSystemError('500', $e, [
                'message' => 'An exception was caught during reset password.',
            ]);

            return response()->json(['status' => false, 'msg' => 'Unexpected error occurred. Please try again.', 'error'=>$e->getMessage()]);
        }
        

        
    }
    public function logout(Request $request)
    {
        $request->user()->tokens()->delete();
        return response()->json(['message' => 'Logged out successfully'], 200);
    }
    public function loginForm()
    {
        return view('auth.login');
    }
    public function logoutAdmin(Request $request)
    {
        Auth::logout();
        return redirect()->route('login-form');
    }

    public function sendPasswdResetToken(Request $request){
        try{
            $user  = User::where("email", $request->email)->first();
            if($user){
                $token  = mt_rand(111111,999999);
                $user->password_reset_code = $token;
                $user->save();
                Mail::to($user->email)->send(mailable: new SendPasswordResetToken(token: $user->password_reset_code));
                return response()->json(['status' => true, 'msg' => 'Password reset token was sent to your email address.', 'error' => null]);
            }else{
                return response()->json(['status' => false, 'msg' => 'Invalid email addresss. Please try again.', 'error' => null]);
            }
        }catch(\Exception $e){
            Logger::logSystemError('500', $e, [
                'message' => 'An exception was caught during send reset password token.',
            ]);

            return response()->json(['status' => false, 'msg' => 'Unexpected error occurred. Please try again.', 'error'=>$e->getMessage()]);
        }
    }
}
