<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;




//Permissions not fully setup please chech as you finalize





// Auth
use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\Auth\UserManagementController;

// admin
use App\Http\Controllers\Admin\AdminController;

//student
use App\Http\Controllers\Student\StudentController;
//end student


//inventory
use App\Http\Controllers\Inventory\CategoryController;
use App\Http\Controllers\Inventory\Dashboards\DashboardController as IventoryDashboard;
use App\Http\Controllers\Inventory\Product\ProductController;
use App\Http\Controllers\Inventory\Product\ProductExportController;
use App\Http\Controllers\Inventory\Product\ProductImportController;
use App\Http\Controllers\Inventory\Purchase\PurchaseController;

use App\Http\Controllers\Inventory\SupplierController;

//end inventory

//instructor
use App\Http\Controllers\Instructor\InstructorController;
//end instructor

//Level stream
use App\Http\Controllers\Level\LevelStreamController;
//and Level stream

//hostel
use App\Http\Controllers\Hostel\HostelController;
//end hostel

//finance
use App\Http\Controllers\Finance\FinanceController;
//end finance

//feees
use App\Http\Controllers\Finance\FeeController;
//end feees



//guardian
use App\Http\Controllers\Guardian\GuardianController;
//end guardian


//grading
use App\Http\Controllers\Grading\GradingController;
//end grading


//examination
use App\Http\Controllers\Exam\PapersController ;
use App\Http\Controllers\Exam\ExamController;

//end examination


//library
use App\Http\Controllers\Library\StaffController;
use App\Http\Controllers\Library\BookController;
use App\Http\Controllers\Library\BookIssueStaffController;
use App\Http\Controllers\Library\BookIssueController;
use App\Http\Controllers\Library\SubjectController;
use App\Http\Controllers\Library\dashboardController;
use App\Http\Controllers\Library\PublisherController;
use App\Http\Controllers\Library\ReportsController;
use App\Http\Controllers\Library\SettingsController;
use App\Http\Controllers\Library\UserController;
//end library

use App\Http\Controllers\ProfileController;

//open routes - login -
Route::post('/login', [LoginController::class, 'login']);

Route::middleware('auth:sanctum')->group(function () {


    Route::prefix('admin')->group(function () {
        Route::get('/dashboard', [AdminController::class, 'dashboard']);
    
        // User Management Routes
        Route::get('/users', [UserManagementController::class, 'index']);
        Route::post('/users', [UserManagementController::class, 'store']);
        Route::get('/users/{id}', [UserManagementController::class, 'show']);
        Route::put('/users/{id}', [UserManagementController::class, 'update']);
        Route::delete('/users/{id}', [UserManagementController::class, 'destroy']);
    });

    // Routes for managing students
    Route::middleware('can:manage students')->prefix('students')->group(function () {

        // Add more routes as needed
    });
     //subjects 
     Route::get('/subjects', [SubjectController::class, 'index']);
     //end subjects

    // Routes for managing instructors
    Route::middleware('can:manage instructors')->prefix('instructors')->group(function () {
        Route::get('/', [InstructorController::class, 'index']);
        Route::post('/', [InstructorController::class, 'store']);
        // Add more routes as needed
    });

    // Routes for managing finance
    Route::middleware('can:manage finance')->prefix('finance')->group(function () {
        Route::post('fee-structures/{level_id}', [FeeController::class, 'saveFeeStructure']);
        Route::get('fee-structure/{level_id}', [FeeController::class, 'viewFeeStructure']);
        Route::get('balance/{student_id}', [FeeController::class, 'viewBalance']);
        Route::post('make-payment/{student_id}', [FeeController::class, 'makePayment']);
        Route::get('payment-history/{student_id?}', [FeeController::class, 'viewPaymentHistory']);
        // Add more routes as needed
    });

    //hostel routes    
        Route::prefix('hostel')->group(function () {
            Route::get('/hostels', [HostelController::class, 'index']);
            Route::post('/hostels', [HostelController::class, 'store']);
            Route::get('/hostels/{hostel}', [HostelController::class, 'show']);
            Route::put('/hostels/{hostel}', [HostelController::class, 'update']);
            Route::delete('/hostels/{hostel}', [HostelController::class, 'destroy']);
        });
     //end hostel routes

     //admission routes 
     Route::prefix('admissions')->group(function () {
        //classes and streams
        Route::get('/levels', [LevelStreamController::class, 'getLevels']);
        Route::get('/streams', [LevelStreamController::class, 'getStreams']);
        Route::post('/levels', [LevelStreamController::class, 'addLevel']);
        Route::post('/streams', [LevelStreamController::class, 'addStream']);
        //end class streams

        //student management
        Route::get('students/{query?}', [StudentController::class, 'index']);
        Route::post('students/', [StudentController::class, 'store']);
         // end student management
      });
     //end admission routes 

    // Routes for managing library
    Route::prefix('library')->group(function () {
        Route::get('/count_subject/{query?}', [ReportsController::class, 'countSubject']);
        Route::get('/count_title/{query?}', [ReportsController::class, 'countTitle']);

        Route::post('/promote_all', [StudentController::class, 'promote_all']);
        Route::post('/promote_one_by_one/{param}', [StudentController::class, 'promote_one_by_one']);
        Route::post('/demote_all', [StudentController::class, 'demote_all']);
        Route::post('/demote_one_by_one/{param}', [StudentController::class, 'demote_one_by_one']);
        Route::get('/info', [LoginController::class, 'read']);
        Route::get('/dashboard', [dashboardController::class, 'index']);

        Route::get('/authors', [AuthorController::class, 'index']);
        Route::get('/authors/edit/{author}', [AuthorController::class, 'edit']);
        Route::post('/authors/update/{id}', [AuthorController::class, 'update']);
        Route::post('/authors/delete/{id}', [AuthorController::class, 'destroy']);
        Route::post('/authors/create', [AuthorController::class, 'store']);

        Route::get('/publishers', [PublisherController::class, 'index']);
        Route::get('/publisher/edit/{publisher}', [PublisherController::class, 'edit']);
        Route::post('/publisher/update/{id}', [PublisherController::class, 'update']);
        Route::post('/publisher/delete/{id}', [PublisherController::class, 'destroy']);
        Route::post('/publisher/create', [PublisherController::class, 'store']);

        Route::get('/subjects', [SubjectController::class, 'index']);
        Route::post('/subject/update/{id}', [SubjectController::class, 'update']);
        Route::post('/subject/delete/{id}', [SubjectController::class, 'destroy']);
        Route::post('/subject/create', [SubjectController::class, 'store']);

        Route::get('/books/{query?}', [BookController::class, 'index']);
        Route::get('/book/create', [BookController::class, 'create']);
        Route::get('/book/edit/{book}', [BookController::class, 'edit']);
        Route::post('/book/update/{id}', [BookController::class, 'update']);
        Route::post('/book/delete/{id}', [BookController::class, 'destroy']);
        Route::post('/book/create', [BookController::class, 'store']);


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

        Route::post('/reports/date-wise', [ReportsController::class, 'generateDateWiseReport']);
        Route::post('/reports/month-wise', [ReportsController::class, 'generateMonthWiseReport']);
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
     //Inventory routes 
    Route::prefix('inventory')->group(function () {
    Route::get('dashboard/', [IventoryDashboard::class, 'index']);

    Route::apiResource('/suppliers', SupplierController::class);
    Route::apiResource('/categories', CategoryController::class);

    // Route Products
    Route::get('products/import/', [ProductImportController::class, 'create']);
    Route::post('products/import/', [ProductImportController::class, 'store']);
    Route::get('products/export/', [ProductExportController::class, 'create']);
    Route::apiResource('/products', ProductController::class);

    // Route Purchases
    Route::get('/purchases/approved', [PurchaseController::class, 'approvedPurchases']);
    Route::get('/purchases/report', [PurchaseController::class, 'purchaseReport']);
    Route::get('/purchases/report/export', [PurchaseController::class, 'getPurchaseReport']);
    Route::post('/purchases/report/export', [PurchaseController::class, 'exportPurchaseReport']);

    Route::get('/purchases', [PurchaseController::class, 'index']);
    Route::get('/purchases/create', [PurchaseController::class, 'create']);
    Route::post('/purchases', [PurchaseController::class, 'store']);

    // Route::get('/purchases/show/{purchase}', [PurchaseController::class, 'show']);
    Route::get('/purchases/{purchase}', [PurchaseController::class, 'show']);

    // Route::get('/purchases/edit/{purchase}', [PurchaseController::class, 'edit']);
    Route::get('/purchases/{purchase}/edit', [PurchaseController::class, 'edit']);
    Route::post('/purchases/update/{purchase}', [PurchaseController::class, 'update']);
    Route::delete('/purchases/delete/{purchase}', [PurchaseController::class, 'destroy']);
    });
    //end inventory
    
    // Routes for managing grading
    Route::middleware('can:manage grading')->prefix('grading')->group(function () {
        Route::get('/', [GradingController::class, 'index']);
        Route::post('/', [GradingController::class, 'store']);
        // Add more routes as needed
    });

    // Routes for managing examinations
    Route::prefix('exams')->group(function () {
        Route::apiResource('papers', PapersController::class);
        Route::apiResource('exams', ExamController::class);

    });

});
