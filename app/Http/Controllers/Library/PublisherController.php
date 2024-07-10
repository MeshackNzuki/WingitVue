<?php

namespace App\Http\Controllers\Library;

use App\Http\Controllers\Controller;
use App\Models\Library\Publisher;
use App\Http\Requests\Library\StorePublisherRequest;
use App\Http\Requests\Library\UpdatePublisherRequest;

class PublisherController extends Controller
{
   

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function index()
    {
        return $this->ResSuccess(Publisher::all());
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function create()
    {
        // You may want to return data needed to create a publisher, if any.
        return $this->ResSuccess('Form to create a publisher.');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \App\Http\Requests\Library\StorePublisherRequest  $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function store(StorePublisherRequest $request)
    {
        Publisher::create($request->validated());
        return $this->ResSuccess('Publisher created successfully.');
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Library\Publisher  $publisher
     * @return \Illuminate\Http\JsonResponse
     */
    public function edit(Publisher $publisher)
    {
        return $this->ResSuccess([
            'publisher' => $publisher
        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \App\Http\Requests\Library\UpdatePublisherRequest  $request
     * @param  int  $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function update(UpdatePublisherRequest $request, $id)
    {
        $publisher = Publisher::find($id);
        $publisher->update($request->validated());
        return $this->ResSuccess('Publisher updated successfully.');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function destroy($id)
    {
        Publisher::find($id)->delete();
        return $this->ResSuccess('Publisher deleted successfully.');
    }
}
