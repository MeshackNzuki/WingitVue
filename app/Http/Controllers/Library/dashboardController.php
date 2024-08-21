<?php

namespace App\Http\Controllers\Library;

use App\Http\Controllers\Controller;
use App\Http\Requests\Library\ChangePasswordRequest;
use App\Models\Library\Author;
use App\Models\Library\Book;
use App\Models\Library\Staff;
use App\Models\Library\BookIssue;
use App\Models\Library\BookIssueStaff;
use App\Models\Library\Category;
use App\Models\Library\Publisher;
use App\Models\Library\Student;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;


class DashboardController extends Controller
{


    public function index() 
    {
        return $this->ResSuccess([
            'authors' => Author::count(),
            'publishers' => Publisher::count(),
            'categories' => Category::count(),
            'books' => Book::count(),
            'students' => Student::count(),
            'staff' => Staff::count(),
            'issued_books' => BookIssue::count(),
            'issued_books_staff' => BookIssueStaff::count(),       
            'lost_books' => BookIssue::where('return_date', '<', now())->count(),
            'issue_today' => BookIssue::where('issue_date', today())->count()
        ]);
    }

    public function change_password_view()
    {
        return $this->ResSuccess("Password change view loaded successfully.");
    }

    public function change_password(ChangePasswordRequest $request)
    {
        if (Auth::check(["username" => auth()->user()->username, "password" => $request->c_password])) {
            auth()->user()->password = bcrypt($request->password);
            auth()->user()->save();
            return $this->ResSuccess("Password Changed Successfully!");
        } else {
            return $this->ResError("Current password is incorrect.", 400);
        }
    }
}
