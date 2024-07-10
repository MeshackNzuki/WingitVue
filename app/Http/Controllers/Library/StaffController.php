<?php

namespace App\Http\Controllers\Library;

use App\Http\Controllers\Controller;
use App\Models\Library\Settings; // Ensure the model name is correctly cased
use App\Http\Requests\Library\StoreSettingsRequest; // Ensure naming consistency
use App\Http\Requests\Library\UpdateSettingsRequest; // Ensure naming consistency

class SettingsController extends Controller
{
    /**
     * Display the current settings.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        // Fetch the latest settings record
        $settings = Settings::latest()->first();

        // Return the settings view with the data
        return view('settings', ['data' => $settings]);
    }

    /**
     * Update the specified settings.
     *
     * @param  \App\Http\Requests\Library\UpdateSettingsRequest  $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function update(UpdateSettingsRequest $request)
    {
        // Fetch the latest settings record
        $settings = Settings::latest()->first();

        if ($settings) {
            // Update settings with validated data
            $settings->update($request->validated());

            // Return a successful response
            return response()->json(['message' => 'Settings updated successfully.'], 200);
        }

        // Return an error response if settings not found
        return response()->json(['error' => 'Settings not found.'], 404);
    }
}
