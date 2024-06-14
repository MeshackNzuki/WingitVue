<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

// Auth
use App\Http\Controllers\Auth\LoginController;

// admin
use App\Http\Controllers\Admin\AdminController;
//student
use App\Http\Controllers\Student\StudentController;
//end student

//instructor
use App\Http\Controllers\Instructor\InstructorController;
//end instructor

//finance
use App\Http\Controllers\Finance\FinanceController;
//end finance


//subject
use App\Http\Controllers\Subject\SubjectController;
//end subject


//guardian
use App\Http\Controllers\Guardian\GuardianController;
//end guardian


//grading
use App\Http\Controllers\Grading\GradingController;
//end grading

//library
use App\Http\Controllers\Libray\StaffController;
use App\Http\Controllers\Libray\BookController;
use App\Http\Controllers\Libray\BookIssueStaffController;
use App\Http\Controllers\Libray\BookIssueController;
use App\Http\Controllers\Libray\CategoryController;
use App\Http\Controllers\Libray\dashboardController;
use App\Http\Controllers\Libray\PublisherController;
use App\Http\Controllers\Libray\ReportsController;
use App\Http\Controllers\Libray\SettingsController;
use App\Http\Controllers\Libray\UserController;
//end library

use App\Http\Controllers\ProfileController;

//open routes - login -
Route::post('/login', [LoginController::class, 'login']);

Route::middleware('auth:sanctum')->group(function () {

    Route::middleware(['role:admin'])->group(function () {
        Route::get('/admin/dashboard', [AdminController::class, 'dashboard']);
        // Add more admin routes here
    });

    // Routes for managing students
    Route::middleware('can:manage students')->prefix('students')->group(function () {
        Route::get('/', [StudentController::class, 'index']);
        Route::post('/', [StudentController::class, 'store']);
        // Add more routes as needed
    });


    // Routes for managing instructors
    Route::middleware('can:manage instructors')->prefix('instructors')->group(function () {
        Route::get('/', [InstructorController::class, 'index']);
        Route::post('/', [InstructorController::class, 'store']);
        // Add more routes as needed
    });

    // Routes for managing finance
    Route::middleware('can:manage finance')->prefix('finance')->group(function () {
        Route::get('/', [FinanceController::class, 'index']);
        Route::post('/', [FinanceController::class, 'store']);
        // Add more routes as needed
    });

    // Routes for managing library
    Route::middleware('can:manage library')->prefix('library')->group(function () {
        Route::post('/login', [LoginController::class, 'login']);
        Route::post('/register', [RegisterController::class, 'store']);
        Route::post('/reset/{useremail}', [LoginController::class, 'reset']);

        Route::get('/count_cat', [ReportsController::class, 'count_cat']);
        Route::get('/count_name/{query?}', [ReportsController::class, 'count_name']);

        Route::post('/promote_all', [StudentController::class, 'promote_all']);
        Route::post('/promote_one_by_one/{param}', [StudentController::class, 'promote_one_by_one']);
        Route::post('/demote_all', [StudentController::class, 'demote_all']);
        Route::post('/demote_one_by_one/{param}', [StudentController::class, 'demote_one_by_one']);

        Route::post('/logout', [LoginController::class, 'logout']);
        Route::post('/change', [LoginController::class, 'change']);
        Route::get('/info', [LoginController::class, 'read']);
        Route::post('/update-info', [LoginController::class, 'changePassword']);
        Route::get('/dashboard', [dashboardController::class, 'index']);

        Route::get('/authors', [AutherController::class, 'index']);
        Route::get('/authors/edit/{auther}', [AutherController::class, 'edit']);
        Route::post('/authors/update/{id}', [AutherController::class, 'update']);
        Route::post('/authors/delete/{id}', [AutherController::class, 'destroy']);
        Route::post('/authors/create', [AutherController::class, 'store']);

        Route::get('/publishers', [PublisherController::class, 'index']);
        Route::get('/publisher/edit/{publisher}', [PublisherController::class, 'edit']);
        Route::post('/publisher/update/{id}', [PublisherController::class, 'update']);
        Route::post('/publisher/delete/{id}', [PublisherController::class, 'destroy']);
        Route::post('/publisher/create', [PublisherController::class, 'store']);

        Route::get('/categories', [CategoryController::class, 'index']);
        Route::post('/category/update/{id}', [CategoryController::class, 'update']);
        Route::post('/category/delete/{id}', [CategoryController::class, 'destroy']);
        Route::post('/category/create', [CategoryController::class, 'store']);

        Route::get('/books/{query?}', [BookController::class, 'index']);
        Route::get('/book/create', [BookController::class, 'create']);
        Route::get('/book/edit/{book}', [BookController::class, 'edit']);
        Route::post('/book/update/{id}', [BookController::class, 'update']);
        Route::post('/book/delete/{id}', [BookController::class, 'destroy']);
        Route::post('/book/create', [BookController::class, 'store']);

        Route::get('/students/{query?}', [StudentController::class, 'index']);
        Route::get('/student/edit/{student}', [StudentController::class, 'edit']);
        Route::post('/student/update/{id}', [StudentController::class, 'update']);
        Route::post('/student/delete/{id}', [StudentController::class, 'destroy']);
        Route::post('/student/create', [StudentController::class, 'store']);
        Route::get('/student/show/{id}', [StudentController::class, 'show']);
        Route::get('/alumni/{query?}', [StudentController::class, 'alumni']);

        Route::get('/book_issue/{query?}', [BookIssueController::class, 'index']);
        Route::get('/book_issue/view/{id}', [BookIssueController::class, 'view']);
        Route::get('/book_issue_staff/view/{id}', [BookIssueStaffController::class, 'view']);
        Route::get('/book_issue_staff/{query?}', [BookIssueStaffController::class, 'index']);
        Route::post('/book-issue-staff/edit/{id}', [BookIssueStaffController::class, 'edit']);
        Route::post('/book-issue-staff/update/{id}', [BookIssueStaffController::class, 'update']);
        Route::post('/book-issue-staff/delete/{id}', [BookIssueStaffController::class, 'destroy']);
        Route::post('/book-issue-staff/create', [BookIssueStaffController::class, 'store']);

        Route::get('/book-issue/edit/{id}', [BookIssueController::class, 'edit']);
        Route::post('/book-issue/update/{id}', [BookIssueController::class, 'update']);
        Route::post('/book-issue/delete/{id}', [BookIssueController::class, 'destroy']);
        Route::post('/book-issue/create', [BookIssueController::class, 'store']);

        Route::post('/reports/date-wise', [ReportsController::class, 'generate_date_wise_report']);
        Route::post('/reports/monthly-wise', [ReportsController::class, 'generate_month_wise_report']);
        Route::get('/reports/not-returned/{query?}', [ReportsController::class, 'not_returned']);

        Route::get('/settings', [SettingsController::class, 'index']);
        Route::post('/settings', [SettingsController::class, 'update']);

        Route::get('/staff/{query?}', [StaffController::class, 'index']);
        Route::get('/staff/edit/{staff}', [StaffController::class, 'edit']);
        Route::post('/staff/update/{id}', [StaffController::class, 'update']);
        Route::post('/staff/delete/{id}', [StaffController::class, 'destroy']);
        Route::post('/staff/create', [StaffController::class, 'store']);
        Route::get('/staff/show/{id}', [StaffController::class, 'show']);

        Route::get('/users/show', [UserController::class, 'show']);
        Route::post('/users/delete/{id}', [UserController::class, 'destroy']);
    });

    // Routes for managing profiles
    Route::prefix('profile')->group(function () {
        Route::get('/', [ProfileController::class, 'show'])->middleware('can:view own profile');
        Route::put('/', [ProfileController::class, 'update'])->middleware('can:edit own profile');
    });

    // Routes for managing grading
    Route::middleware('can:manage grading')->prefix('grading')->group(function () {
        Route::get('/', [GradingController::class, 'index']);
        Route::post('/', [GradingController::class, 'store']);
        // Add more routes as needed
    });

});
