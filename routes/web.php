<?php

use Illuminate\Support\Facades\Route;

// Define specific routes for your frontend pages here
Route::get('/Seo-pages', function () {
    return view('Welcome'); // or specify a view for login if different
});

// Catch-all route for Vue
Route::get('/{any?}', function () {
    return view('VueEntry');
})->where('any', '.*');
