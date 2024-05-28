<?php

namespace App\Http\Controllers;

use App\Models\book_issue;
use App\Models\studend;
use App\Models\book_issue_history;
use App\Http\Requests\Storebook_issueRequest;
use App\Http\Requests\Updatebook_issueRequest;
use App\Models\auther;
use App\Models\book;
use App\Models\settings;
use App\Models\student;
use \Illuminate\Http\Request;
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

        if ($query !='') {
            $issued_books = book_issue::with('student','book')->WhereHas('student', function (Builder $q) use($query) { $q->where('adm', 'like', "%{$query}%")->orWhere('name', 'like', "%{$query}%");})
            ->orWhereHas('book', function (Builder $q) use($query) { $q->where('name', 'like', "%{$query}%")
            ->orWhere('name', 'like', "%{$query}%");})->paginate();
            return response()->json($issued_books);

        } else {
         
            $issued_books = book_issue::with('student','book')->paginate(20);
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
            'students' => student::latest()->get(),
            'books' => book::where('status', 'Y')->get(),
        ]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \App\Http\Requests\Storebook_issueRequest  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Storebook_issueRequest $request)
    {

        $checkifissued = book::where('id',$request->book_id)->first(['status'])->status;
   
        if($checkifissued != "Y"){
            return response()->json('Book Not available');
         }else{
        try {
            $student_id = student::where('adm',$request->adm)->first()->id;
        } catch (\Throwable $th) {
             return response()->json('Admission not found');
             die();
        }
     
        $issue_date = date('Y-m-d');
        $return_date = date('Y-m-d', strtotime("+" . (settings::latest()->first()->return_days) . " days"));
        $data = book_issue::create($request->validated() + [
            'student_id' => $student_id,
            'book_id' => $request->book_id,
            'issue_date' => $issue_date,
            'return_date' => $return_date,
            'issue_status' => 'N',
        ]);
        $data->save();        //creating duplicate in issue history 

        $data2 = book_issue_history::create([
            'student_id' => $student_id,
            'book_id' => $request->book_id,
            'issue_date' => $issue_date,
            'return_date' => $return_date,
            'issue_status' => 'Null',
        ]);
        $data2->save();

        $book = book::find($request->book_id);
        $book->status = 'N';
        $book->save();
        return response()->json('book_issued',200);
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
        $book = book_issue::with('student','book')->where('id',$id)->get()->first();
        $today = date_create(date('Y-m-d'));

        
        $last_date = date_create($book->return_date);

        if($today > $last_date){        
        $diff = date_diff($last_date, $today);
        }
        else{ 
           $diff=$diff = date_diff($today, $today);//was in a hurry return 0
        }
        $fine =(settings::latest()->first()->fine * $diff->format('%a'));
        return response()->json([
            'book' => $book,
            'fine' => $fine,
        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \App\Http\Requests\Updatebook_issueRequest  $request
     * @param  \App\Models\book_issue  $book_issue
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        // dd($request->all());
        $book_id = book_issue::where('id',$id)->first('book_id')->book_id;
        
        $book = book::where('id',$book_id)->update(['status' => 'Y']);
        
        return response()->json($book);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\book_issue  $book_issue
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        book_issue::find($id)->delete();
        return redirect()->route('book_issued');
    }
    public function view($id)
    {       
       return response()->json(book_issue::with('student','book')->where('student_id', '=', $id)->get());
    }
}
