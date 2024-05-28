<?php

namespace App\Http\Controllers;

use App\Models\book_issue_staff;
use App\Models\auther;
use App\Models\book;
use App\Models\settings;
use App\Models\staff;
use \Illuminate\Http\Request;
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

        if ($query !='') {
            $issued_books = book_issue_staff::with('staff','book')->WhereHas('staff', function (Builder $q) use($query) { $q->where('adm', 'like', "%{$query}%")->orWhere('name', 'like', "%{$query}%");})
            ->orWhereHas('book', function (Builder $q) use($query) { $q->where('id', 'like', "%{$query}%")
            ->orWhere('name', 'like', "%{$query}%")->orWhere('id', 'like', "%{$query}%");})->paginate();
            return response()->json($issued_books);

        } else {
         
            $issued_books = book_issue_staff::with('staff','book')->paginate(20);
            return response()->json($issued_books);
        }
       
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('book.issueBook_add', [
            'staffs' => staff::latest()->get(),
            'books' => book::where('status', 'Y')->get(),
        ]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \App\Http\Requests\ $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {   
        
       $checkifissued = book::where('id',$request->book_id)->first(['status'])->status;
          
         if($checkifissued != "Y"){
            return response()->json('Book Not available');
         }
         else{
            try {
                $staff_id = staff::where('id_number',$request->id_number)->first()->id;
            } catch (\Throwable $th) {
                 return response()->json('Staff not Registered');
                 die();
            }         
            $issue_date = date('Y-m-d');
            $return_date = date('Y-m-d', strtotime("+" . (settings::latest()->first()->return_days) . " days"));
            $data = book_issue_staff::create([
                'staff_id' => $staff_id,
                'book_id' => $request->book_id,
                'issue_date' => $issue_date,
                'return_date' => $return_date,
                'issue_status' => 'N',
            ]);
            $data->save(); //creating duplicate in issue history staff
    
            $book = book::find($request->book_id);
            $book->status = 'N';
            $book->save();
            return response()->json('issued to staff',200);
         }
        
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        // calculate the total fine  (total days * fine per day)
        $book = book_issue_staff::with('staff','book')->where('id',$id)->get()->first();
        $first_date = date_create(date('Y-m-d'));
        $last_date = date_create($book->return_date);
        $diff = date_diff($first_date, $last_date);
        $fine = (settings::latest()->first()->fine * $diff->format('%a'));
        return response()->json([
            'book' => $book,
            'fine' => $fine,
        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \App\Http\Requests\Updatebook_issue_staffequest  $request
     * @param  \App\Models\book_issue_staff $book_issue_staff     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        // dd($request->all());
        $book = book_issue_staff::find($id);
        $book->issue_status = 'Y';
        $book->return_day = now();
        $book->save();
        $bookk = book::find($book->book_id);
        $bookk->status= 'Y';
        $bookk->save();
        response()->json('success',200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\book_issue_staff $book_issue_staff     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        book_issue_staff::find($id)->delete();
    }
    public function view($id)
    {       
       return response()->json(book_issue_staff::with('staff','book')->where('staff_id', '=', $id)->get());
    }
}
