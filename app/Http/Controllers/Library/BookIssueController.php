<?php

namespace App\Http\Controllers\Library;

use App\Http\Controllers\Controller;
use App\Models\Library\BookIssue;
use App\Models\Library\Student;
use App\Models\Library\BookIssueHistory;
use App\Http\Requests\Library\StoreBookIssueRequest;
use App\Http\Requests\Library\UpdateBookIssueRequest;
use Illuminate\Http\Request;
use App\Models\Library\Auther;
use App\Models\Library\Book;
use App\Models\Library\Settings;
use Illuminate\Database\Eloquent\Builder;


class BookIssueController extends Controller
{

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request, $query = '')
    {
        if ($query != '') {
            $issued_books = BookIssue::with('student', 'book')
                ->whereHas('student', function (Builder $q) use ($query) {
                    $q->where('adm', 'like', "%{$query}%")->orWhere('name', 'like', "%{$query}%");
                })
                ->orWhereHas('book', function (Builder $q) use ($query) {
                    $q->where('name', 'like', "%{$query}%")
                        ->orWhere('name', 'like', "%{$query}%");
                })->paginate();
            return $this->ResSuccess($issued_books);
        } else {
            $issued_books = BookIssue::with('student', 'book')->paginate(20);
            return $this->ResSuccess($issued_books);
        }
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return $this->ResSuccess([
            'students' => Student::latest()->get(),
            'books' => Book::where('status', 'Y')->get(),
        ]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \App\Http\Requests\Library\StoreBookIssueRequest  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreBookIssueRequest $request)
    {
        $book = Book::where('id', $request->book_id)->first();

        if ($book->status != "Y") {
            return $this->ResError('Book Not available', 400);
        }

        try {
            $student_id = Student::where('adm', $request->adm)->firstOrFail()->id;
        } catch (\Throwable $th) {
            return $this->ResError('Admission not found', 400);
        }

        $issue_date = date('Y-m-d');
        $return_date = date('Y-m-d', strtotime("+" . (Settings::latest()->first()->return_days) . " days"));
        
        $data = BookIssue::create($request->validated() + [
            'student_id' => $student_id,
            'book_id' => $request->book_id,
            'issue_date' => $issue_date,
            'return_date' => $return_date,
            'issue_status' => 'N',
        ]);

        BookIssueHistory::create([
            'student_id' => $student_id,
            'book_id' => $request->book_id,
            'issue_date' => $issue_date,
            'return_date' => $return_date,
            'issue_status' => 'Null',
        ]);

        $book->status = 'N';
        $book->save();

        return $this->ResSuccess($data, 201);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Library\BookIssue  $bookIssue
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $book = BookIssue::with('student', 'book')->findOrFail($id);

        $today = date_create(date('Y-m-d'));
        $last_date = date_create($book->return_date);
        $diff = ($today > $last_date) ? date_diff($last_date, $today) : date_diff($today, $today);
        $fine = (Settings::latest()->first()->fine * $diff->format('%a'));

        return $this->ResSuccess([
            'book' => $book,
            'fine' => $fine,
        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \App\Http\Requests\Library\UpdateBookIssueRequest  $request
     * @param  \App\Models\Library\BookIssue  $bookIssue
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateBookIssueRequest $request, $id)
    {
        $bookIssue = BookIssue::findOrFail($id);
        $bookIssue->update($request->validated());

        $book_id = $bookIssue->book_id;
        Book::where('id', $book_id)->update(['status' => 'Y']);

        return $this->ResSuccess($bookIssue, 200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Library\BookIssue  $bookIssue
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        BookIssue::findOrFail($id)->delete();
        return $this->ResSuccess(['message' => 'Book issue deleted successfully.'], 200);
    }

    /**
     * View the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function view($id)
    {
        $issued_books = BookIssue::with('student', 'book')->where('student_id', $id)->get();
        return $this->ResSuccess($issued_books);
    }
}
