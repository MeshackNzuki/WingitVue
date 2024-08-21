<?php

namespace App\Http\Controllers\Library;

use App\Http\Controllers\Controller;
use App\Models\Library\Book;
use App\Http\Requests\Library\StoreBookRequest;
use App\Http\Requests\Library\UpdateBookRequest;
use Illuminate\Http\Request;
use App\Models\Library\Author;
use App\Models\Library\Subject;
use App\Models\Library\Publisher;

class BookController extends Controller
{

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request, $query = '')
    {
        if ($query != '') {
            $books = Book::where('number', 'like', "%$query%")
            ->orWhere('title', 'like', "%$query%")
                ->with('author', 'publisher', 'subject')->paginate(80);
        } else {
            $books = Book::with('author', 'publisher', 'subject')->paginate(80);
        }
        return $this->ResSuccess($books);    }


    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return $this->ResSuccess([
            'authors' => Author::latest()->get(),
            'publishers' => Publisher::latest()->get(),
            'categories' => subject::latest()->get(),
        ]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \App\Http\Requests\Library\StoreBookRequest  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreBookRequest $request)
    {
        $book = Book::create($request->validated() + [
            'status' => 'Y'
        ]);
        return $this->ResSuccess($book, 201);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Library\Book  $book
     * @return \Illuminate\Http\Response
     */
    public function edit(Book $book)
    {
        return $this->ResSuccess([
            'authors' => Author::latest()->get(),
            'publishers' => Publisher::latest()->get(),
            'categories' => subject::latest()->get(),
            'book' => $book
        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \App\Http\Requests\Library\UpdateBookRequest  $request
     * @param  \App\Models\Library\Book  $book
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateBookRequest $request, $id)
    {
        $book = Book::find($id);

        if (!$book) {
            return $this->ResError('Book not found', 404);
        }

        $book->update($request->validated());
        return $this->ResSuccess($book, 200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Library\Book  $book
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $book = Book::findOrFail($id);
        $book->delete();
        return $this->ResSuccess(['message' => 'Book deleted successfully.'], 200);
    }
}
