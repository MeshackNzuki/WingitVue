<?php

namespace App\Http\Controllers;

use App\Http\Requests\changePasswordRequest;
use App\Models\auther;
use App\Models\book;
use App\Models\staff;
use App\Models\book_issue;
use App\Models\book_issue_staff;
use App\Models\category;
use App\Models\publisher;
use App\Models\student;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
class dashboardController extends Controller
{
    public function index() 
    {
        return  response()->json([
            'authors' => auther::count(),
            'publishers' => publisher::count(),
            'categories' => category::count(),
            'books' => book::count(),
            'students' => student::count(),
            'staff' => staff::count(),
            'issued_books' => book_issue::count(),
            'issued_books_staff' => book_issue_staff::count(),       
            'lost_books'=>book_issue::where('return_date','<',now())->count(),
            'issue_today'=>book_issue::where('issue_date',today())->count()
        ]);
    }

    public function change_password_view()
    {
        return   response()->json("success", 200);
    }

    public function change_password(changePasswordRequest $request)
    {
        if (Auth::check(["username" => auth()->user()->username, "password" => $request->c_password])) {
            auth()->user()->password = bcrypt($request->password);
            return redirect()->back()->with(['message' => "Password Changed Successfully!."]);
        } else {
            return "";
        }
    }
}
