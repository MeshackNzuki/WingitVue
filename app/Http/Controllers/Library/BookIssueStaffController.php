<?php

namespace App\Http\Controllers\Library;

use App\Http\Controllers\Controller;
use App\Models\Library\BookIssueStaff;
use App\Models\Library\Auther;
use App\Models\Library\Book;
use App\Models\Library\Settings;
use App\Models\Library\Staff;
use Illuminate\Http\Request;
use Illuminate\Database\Eloquent\Builder;


class BookIssueStaffController extends Controller
{


    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request, $query = '')
    {
        if ($query != '') {
            $issued_books = BookIssueStaff::with('staff', 'book')
                ->whereHas('staff', function (Builder $q) use ($query) {
                    $q->where('admission', 'like', "%{$query}%")->orWhere('title', 'like', "%{$query}%");
                })
                ->orWhereHas('book', function (Builder $q) use ($query) {
                    $q->where('id', 'like', "%{$query}%")
                        ->orWhere('title', 'like', "%{$query}%")->orWhere('id', 'like', "%{$query}%");
                })->paginate();
            return $this->ResSuccess($issued_books);
        } else {
            $issued_books = BookIssueStaff::with('staff', 'book')->paginate(20);
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
            'staffs' => Staff::latest()->get(),
            'books' => Book::where('status', 'Y')->get(),
        ]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $checkifissued = Book::where('id', $request->book_id)->first(['status'])->status;

        if ($checkifissued != "Y") {
            return $this->ResError('Book Not available', 400);
        }

        try {
            $staff_id = Staff::where('id_number', $request->id_number)->firstOrFail()->id;
        } catch (\Throwable $th) {
            return $this->ResError('Staff not Registered', 400);
        }

        $issue_date = date('Y-m-d');
        $return_date = date('Y-m-d', strtotime("+" . (Settings::latest()->first()->return_days) . " days"));
        
        $data = BookIssueStaff::create([
            'staff_id' => $staff_id,
            'book_id' => $request->book_id,
            'issue_date' => $issue_date,
            'return_date' => $return_date,
            'issue_status' => 'N',
        ]);

        $book = Book::find($request->book_id);
        $book->status = 'N';
        $book->save();

        return $this->ResSuccess($data, 201);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $book = BookIssueStaff::with('staff', 'book')->findOrFail($id);
        $first_date = date_create(date('Y-m-d'));
        $last_date = date_create($book->return_date);
        $diff = date_diff($first_date, $last_date);
        $fine = (Settings::latest()->first()->fine * $diff->format('%a'));

        return $this->ResSuccess([
            'book' => $book,
            'fine' => $fine,
        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $bookIssue = BookIssueStaff::findOrFail($id);
        $bookIssue->issue_status = 'Y';
        $bookIssue->return_day = now();
        $bookIssue->save();

        $book = Book::find($bookIssue->book_id);
        $book->status = 'Y';
        $book->save();

        return $this->ResSuccess($bookIssue, 200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        BookIssueStaff::findOrFail($id)->delete();
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
        $issued_books = BookIssueStaff::with('staff', 'book')->where('staff_id', $id)->get();
        return $this->ResSuccess($issued_books);
    }
}
