<?php
namespace App\Http\Controllers;

use App\Models\book;
use App\Models\book_issue_history;
use App\Models\book_issue;
use Illuminate\Http\Request;
use Illuminate\Database\Eloquent\Builder;
use DB;

class ReportsController extends Controller
{
 
    public function generate_date_wise_report(Request $request)
    {
        $request->validate(['date' => "required|date"]);
        return response()->json(
           book_issue_history::with('student','book')->where('issue_date', $request->date)->latest()->paginate(50)
        );
    }

    public function month_wise()
    {
        return view('report.monthWise', ['books' => '']);
    }

    public function generate_month_wise_report(Request $request)
    {
        $request->validate(['month' => "required|date"]);
        return response()->json(
            book_issue_history::with('student','book')->where('issue_date', 'LIKE', '%' . $request->month . '%')->latest()->paginate(80)
        );
    }
    public function not_returned()
    { 
        $today =date_create();
        $date =date_format($today,"Y-m-d");
        return response()->json(
             book_issue::with('student','book')->whereDate('return_date','<', $date)->paginate(80)
        );
    }
       public function count_cat() 
    {
           $math = 'mathematics';
           $eng = 'eng';
           $kisw = 'kiswahili';
           $cre = 'cre';
           $agri = 'agriculture';
           $hist = 'history';
           $phy = 'physics';
           $chem = 'chemistry';
           $bio = 'biology';
           $bus = 'business';
           $geo = 'geography';
           $fasi="fasihi";
           $lit ='literature';
           $comp='computer';
           $ref='reference';
           $guide ='guide';
           $pe ='PE';
           $life ='life skills';
           $gk ='general knowledge';
           
           
           return  response()->json([
            'mathematics' => book::with('category')->WhereHas('category', function (Builder $q) use($math) { $q->where('name', 'like', "%{$math}%");})->count(),  
            'english' => book::with('category')->WhereHas('category', function (Builder $q) use($eng) { $q->where('name', 'like', "%{$eng}%");})->count(), 
            'kiswahili' => book::with('category')->WhereHas('category', function (Builder $q) use($kisw) { $q->where('name', 'like', "%{$kisw}%");})->count(), 
            'cre' => book::with('category')->WhereHas('category', function (Builder $q) use($cre) { $q->where('name', 'like', "%{$cre}%");})->count(), 
            'agriculture' => book::with('category')->WhereHas('category', function (Builder $q) use($agri) { $q->where('name', 'like', "%{$agri}%");})->count(), 
            'history' => book::with('category')->WhereHas('category', function (Builder $q) use($hist) { $q->where('name', 'like', "%{$hist}%");})->count(), 
            'physics' => book::with('category')->WhereHas('category', function (Builder $q) use($phy) { $q->where('name', 'like', "%{$phy}%");})->count(), 
            'chemistry' => book::with('category')->WhereHas('category', function (Builder $q) use($chem) { $q->where('name', 'like', "%{$chem}%");})->count(), 
            'biology' => book::with('category')->WhereHas('category', function (Builder $q) use($bio) { $q->where('name', 'like', "%{$bio}%");})->count(), 
            'business' => book::with('category')->WhereHas('category', function (Builder $q) use($bus) { $q->where('name', 'like', "%{$bus}%");})->count(), 
            'geography' => book::with('category')->WhereHas('category', function (Builder $q) use($geo) { $q->where('name', 'like', "%{$geo}%");})->count(), 
            "fasihi" => book::with('category')->WhereHas('category', function (Builder $q) use($fasi) { $q->where('name', 'like', "%{$fasi}%");})->count(), 
            'literature'=> book::with('category')->WhereHas('category', function (Builder $q) use($lit) { $q->where('name', 'like', "%{$lit}%");})->count(), 
            'computer'=> book::with('category')->WhereHas('category', function (Builder $q) use($comp) { $q->where('name', 'like', "%{$comp}%");})->count(), 
            'reference'=> book::with('category')->WhereHas('category', function (Builder $q) use($ref) { $q->where('name', 'like', "%{$ref}%");})->count(), 
            'guide'=> book::with('category')->WhereHas('category', function (Builder $q) use($guide) { $q->where('name', 'like', "%{$guide}%");})->count(), 
            'PE' =>book::with('category')->WhereHas('category', function (Builder $q) use($pe) { $q->where('name', 'like', "%{$pe}%");})->count(), 
            'skills' =>book::with('category')->WhereHas('category', function (Builder $q) use($life) { $q->where('name', 'like', "%{$life}%");})->count(), 
            'general' =>book::with('category')->WhereHas('category', function (Builder $q) use($gk) { $q->where('name', 'like', "%{$gk}%");})->count(), 
            
        ]);
    }
    
     public function count_name(Request $request , $query = '') 
    {  
      if($query != ''){
                  $name = book::where('name', 'LIKE' ,"%{$query}%")->select('name', DB::raw('count(*) as total'))
                 ->groupBy('name')
                 ->paginate(80);

      }
      
      else {
                  $name = book::select('name', DB::raw('count(*) as total'))
                 ->groupBy('name')
                 ->paginate(80);
      }
      
     return response()->json($name);
    }
}


