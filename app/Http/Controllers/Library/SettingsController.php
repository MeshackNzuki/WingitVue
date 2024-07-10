<?php
namespace App\Http\Controllers\Library;

use App\Http\Controllers\Controller;
use App\Models\Library\settings;
use App\Http\Requests\Library\StoresettingsRequest;
use App\Http\Requests\Library\UpdatesettingsRequest;

class SettingsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('settings',['data' => settings::latest()->first()]);
    }



    /**
     * Update the specified resource in storage.
     *
     * @param  \App\Http\Requests\Library\UpdatesettingsRequest  $request
     * @param  \App\Models\Library\settings  $settings
     * @return \Illuminate\Http\Response
     */
    public function update(UpdatesettingsRequest $request)
    {
        $setting = settings::latest()->first();
        $setting->return_days = $request->return_days;
        $setting->fine = $request->fine;
        $setting->save();
        return response()->json('Settings Updated');
    }
}
