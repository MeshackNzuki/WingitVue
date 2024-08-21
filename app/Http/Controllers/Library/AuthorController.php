<?php

namespace App\Http\Controllers\Library;

use App\Http\Controllers\Controller;
use App\Models\Library\Author;
use App\Http\Requests\Library\StoreAuthorRequest;
use App\Http\Requests\Library\UpdateAuthorRequest;
use App\Http\Traits\JsonResponseTrait;

class AuthorController extends Controller
{
    use JsonResponseTrait;

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $authors = Author::all();
        return $this->ResSuccess($authors);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return $this->ResSuccess('author.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \App\Http\Requests\Library\StoreAuthorRequest  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreAuthorRequest $request)
    {
        $author = Author::create($request->validated());
        return $this->ResSuccess($author, 201);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Library\Author  $author
     * @return \Illuminate\Http\Response
     */
    public function edit(Author $author)
    {
        return $this->ResSuccess([
            'view' => 'author.edit',
            'author' => $author
        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \App\Http\Requests\Library\UpdateAuthorRequest  $request
     * @param  \App\Models\Library\Author  $author
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateAuthorRequest $request, $id)
    {
        $author = Author::find($id);

        if (!$author) {
            return $this->ResError('Author not found', 404);
        }

        $author->update($request->validated());
        return $this->ResSuccess($author, 200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $author = Author::findOrFail($id);
        $author->delete();
        return $this->ResSuccess(['message' => 'Author deleted successfully.'], 200);
    }
}
