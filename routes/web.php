<?php

use Illuminate\Support\Facades\Route;

Route::fallback(function () {
    // Handle the fallback logic here, such as returning a 404 view
   return redirect('/');
});

    Route::get('/{any?}', function () {
        return view('VueEntry');
    })->where('any', '.*');