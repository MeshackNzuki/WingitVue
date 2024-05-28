<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

// Import the necessary controllers

//student
use App\Http\Controllers\Students\StudentController;
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
        Route::post('/login', [LoginController::class, 'login'])->name('login');
        Route::post('/register', [RegisterController::class, 'store'])->name('register');
        Route::post('/reset/{useremail}', [LoginController::class, 'reset'])->name('reset');
               //counts
            Route::get('/count_cat', [ReportsController::class, 'count_cat'])->name('count_cat');
            Route::get('/count_name/{query?}', [ReportsController::class, 'count_name'])->name('count_name');
               //promotion
            Route::post('/promote_all', [StudentController::class, 'promote_all'])->name('promote_all');
            Route::post('/promote_one_by_one/{param}', [StudentController::class, 'promote_one_by_one'])->name('promote_one_by_one');
            Route::post('/demote_all', [StudentController::class, 'demote_all'])->name('demote_all');
            Route::post('/demote_one_by_one/{param}', [StudentController::class, 'demote_one_by_one'])->name('demote_one_by_one');
            Route::middleware(['auth:sanctum'])->group(function () {
          //  Route::post('/register', [RegisterController::class, 'store'])->name('register');
            Route::post('/logout', [LoginController::class, 'logout'])->name('logout');
            Route::post('/change', [LoginController::class, 'change'])->name('change');
            Route::get('/info', [LoginController::class, 'read'])->name('read');
            Route::post('/update-info', [LoginController::class, 'changePassword'])->name('change_password');
            Route::middleware('auth:sanctum')->group(function () {
            Route::get('change-password',[dashboardController::class,'change_password_view'])->name('change_password_view');
            Route::post('change-password',[dashboardController::class,'change_password'])->name('change_password');
            Route::get('/dashboard', [dashboardController::class, 'index'])->name('dashboard');
        
            // author CRUD
            Route::get('/authors', [AutherController::class, 'index'])->name('authors');
            //Route::get('/authors/create', [AutherController::class, 'create'])->name('authors.create');
            Route::get('/authors/edit/{auther}', [AutherController::class, 'edit'])->name('authors.edit');
            Route::post('/authors/update/{id}', [AutherController::class, 'update'])->name('authors.update');
            Route::post('/authors/delete/{id}', [AutherController::class, 'destroy'])->name('authors.destroy');
            Route::post('/authors/create', [AutherController::class, 'store'])->name('authors.store');
            // publisher crud
            Route::get('/publishers', [PublisherController::class, 'index'])->name('publishers');
            //Route::get('/publisher/create', [PublisherController::class, 'create'])->name('publisher.create');
            Route::get('/publisher/edit/{publisher}', [PublisherController::class, 'edit'])->name('publisher.edit');
            Route::post('/publisher/update/{id}', [PublisherController::class, 'update'])->name('publisher.update');
            Route::post('/publisher/delete/{id}', [PublisherController::class, 'destroy'])->name('publisher.destroy');
            Route::post('/publisher/create', [PublisherController::class, 'store'])->name('publisher.store');
            // Category CRUD
            Route::get('/categories', [CategoryController::class, 'index'])->name('categories');
            //Route::get('/category/create', [CategoryController::class, 'create'])->name('category.create');
            //Route::get('/category/edit/{category}', [CategoryController::class, 'edit'])->name('category.edit');
            Route::post('/category/update/{id}', [CategoryController::class, 'update'])->name('category.update');
            Route::post('/category/delete/{id}', [CategoryController::class, 'destroy'])->name('category.destroy');
            Route::post('/category/create', [CategoryController::class, 'store'])->name('category.store');
        
        
        
        
            // books CRUD
            Route::get('/books/{query?}', [BookController::class, 'index'])->name('books')->where('query', '(.*)');;
            Route::get('/book/create', [BookController::class, 'create'])->name('book.create');
            Route::get('/book/edit/{book}', [BookController::class, 'edit'])->name('book.edit');
            Route::post('/book/update/{id}', [BookController::class, 'update'])->name('book.update');
            Route::post('/book/delete/{id}', [BookController::class, 'destroy'])->name('book.destroy');
            Route::post('/book/create', [BookController::class, 'store'])->name('book.store');
        
            // students CRUD
            Route::get('/students/{query?}', [StudentController::class, 'index'])->name('students');
            Route::get('/student/edit/{student}', [StudentController::class, 'edit'])->name('student.edit');
            Route::post('/student/update/{id}', [StudentController::class, 'update'])->name('student.update');
            Route::post('/student/delete/{id}', [StudentController::class, 'destroy'])->name('student.destroy');
            Route::post('/student/create', [StudentController::class, 'store'])->name('student.store');
            Route::get('/student/show/{id}', [StudentController::class, 'show'])->name('student.show');
            Route::get('/alumni/{query?}', [StudentController::class, 'alumni'])->name('alumni');
        
        
            Route::get('/book_issue/{query?}', [BookIssueController::class, 'index'])->name('book_issued');
            Route::get('/book_issue/view/{id}', [BookIssueController::class, 'view'])->name('book_issued');
            Route::get('/book_issue_staff/view/{id}', [BookIssueStaffController::class, 'view'])->name('book_issued_staff');//staff view 
            Route::get('/book_issue_staff/{query?}', [BookIssueStaffController::class, 'index'])->name('book_issued_staff');//staff get all
            Route::post('/book-issue-staff/edit/{id}', [BookIssueStaffController::class, 'edit'])->name('book_issue_staff.edit');
            Route::post('/book-issue-staff/update/{id}', [BookIssueStaffController::class, 'update'])->name('book_issue_staff.update');
            Route::post('/book-issue-staff/delete/{id}', [BookIssueStaffController::class, 'destroy'])->name('book_issue_staff.destroy');
            Route::post('/book-issue-staff/create', [BookIssueStaffController::class, 'store'])->name('book_issue_staff.store');
        
           // Route::get('/book-issue/create', [BookIssueController::class, 'create'])->name('book_issue.create');
            Route::get('/book-issue/edit/{id}', [BookIssueController::class, 'edit'])->name('book_issue.edit');
            Route::post('/book-issue/update/{id}', [BookIssueController::class, 'update'])->name('book_issue.update');
            Route::post('/book-issue/delete/{id}', [BookIssueController::class, 'destroy'])->name('book_issue.destroy');
            Route::post('/book-issue/create', [BookIssueController::class, 'store'])->name('book_issue.store');
        
         
        
            Route::post('/reports/date-wise', [ReportsController::class, 'generate_date_wise_report'])->name('reports.date_wise_generate');
            Route::post('/reports/monthly-wise', [ReportsController::class, 'generate_month_wise_report'])->name('reports.month_wise_generate');
            Route::get('/reports/not-returned/{query?}', [ReportsController::class, 'not_returned'])->name('reports.not_returned');
        
        
            Route::get('/settings', [SettingsController::class, 'index'])->name('settings');
            Route::post('/settings', [SettingsController::class, 'update'])->name('settings');
            //staff crud
            Route::get('/staff/{query?}', [StaffController::class, 'index'])->name('staff');
            Route::get('/staff/edit/{staff}', [StaffController::class, 'edit'])->name('staff.edit');
            Route::post('/staff/update/{id}', [StaffController::class, 'update'])->name('staff.update');
            Route::post('/staff/delete/{id}', [StaffController::class, 'destroy'])->name('staff.destroy');
            Route::post('/staff/create', [StaffController::class, 'store'])->name('staff.store');
            Route::get('/staff/show/{id}', [StaffController::class, 'show'])->name('staff.show');
            
            //user Crud
            
             Route::get('/users/show', [UserController::class, 'show'])->name('user.show');
             Route::post('/users/delete/{id}', [UserController::class, 'destroy'])->name('user.show');
           });
        });
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
