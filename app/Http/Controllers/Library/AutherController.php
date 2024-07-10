<?php

namespace App\Http\Controllers\Library;

use App\Http\Controllers\Controller;
use App\Models\Library\Auther;
use App\Http\Requests\Library\StoreAutherRequest;
use App\Http\Requests\Library\UpdateAutherRequest;
use App\Http\Traits\JsonResponseTrait;

class AutherController extends Controller
{
    use JsonResponseTrait;

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $authors = Auther::all();
        return $this->ResSuccess($authors);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return $this->ResSuccess('auther.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \App\Http\Requests\Library\StoreAutherRequest  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreAutherRequest $request)
    {
        $auther = Auther::create($request->validated());
        return $this->ResSuccess($auther, 201);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Library\Auther  $auther
     * @return \Illuminate\Http\Response
     */
    public function edit(Auther $auther)
    {
        return $this->ResSuccess([
            'view' => 'auther.edit',
            'auther' => $auther
        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \App\Http\Requests\Library\UpdateAutherRequest  $request
     * @param  \App\Models\Library\Auther  $auther
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateAutherRequest $request, $id)
    {
        $auther = Auther::find($id);

        if (!$auther) {
            return $this->ResError('Author not found', 404);
        }

        $auther->update($request->validated());
        return $this->ResSuccess($auther, 200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $auther = Auther::findOrFail($id);
        $auther->delete();
        return $this->ResSuccess(['message' => 'Author deleted successfully.'], 200);
    }
}
