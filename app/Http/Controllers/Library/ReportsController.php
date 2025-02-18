<?php

namespace App\Http\Controllers\Library;

use App\Http\Controllers\Controller;

use App\Models\Library\Book;
use App\Models\Library\BookIssueHistory;
use App\Models\Library\BookIssue;
use Illuminate\Http\Request;
use Illuminate\Database\Eloquent\Builder;
use DB;

class ReportsController extends Controller
{
 

    /**
     * Generate a report for book issues by a specific date.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function generateDateWiseReport(Request $request)
    {
        $request->validate(['date' => 'required|date']);

        $issues = BookIssueHistory::with('student', 'book')
            ->whereDate('issue_date', $request->date)
            ->latest()
            ->paginate(50);

        return $this->resSuccess($issues);
    }

    /**
     * Display the view for generating a monthly report.
     *
     * @return \Illuminate\View\View
     */
    public function monthWise()
    {
        return view('report.monthWise', ['books' => '']);
    }

    /**
     * Generate a report for book issues by a specific month.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function generateMonthWiseReport(Request $request)
    {
        $request->validate(['month' => 'required|date_format:Y-m']);

        $issues = BookIssueHistory::with('student', 'book')
            ->whereYear('issue_date', $request->month)
            ->whereMonth('issue_date', $request->month)
            ->latest()
            ->paginate(80);

        return $this->resSuccess($issues);
    }

    /**
     * Generate a report for books not returned by today.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function notReturned()
    {
        $today = now()->format('Y-m-d');

        $issues = BookIssue::with('student', 'book')
            ->whereDate('return_date', '<', $today)
            ->paginate(80);

        return $this->resSuccess($issues);
    }

    /**
     * Count books by subject.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function countSubject()
    {
        $subjects = [
            'mathematics', 'eng', 'kiswahili', 'cre', 'agriculture',
            'history', 'physics', 'chemistry', 'biology', 'business',
            'geography', 'fasihi', 'literature', 'computer', 'reference',
            'guide', 'PE', 'life skills', 'general knowledge'
        ];

        $counts = [];
        foreach ($subjects as $subject) {
            $counts[$subject] = Book::with('subject')
                ->whereHas('subject', function (Builder $q) use ($subject) {
                    $q->where('title', 'like', "%{$subject}%");
                })
                ->count();
        }

        return $this->resSuccess($counts);
    }

    /**
     * Count books by title with optional search query.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  string  $query
     * @return \Illuminate\Http\JsonResponse
     */
    public function countTitle(Request $request, $query = '')
    {
        if ($query !== '') {
            $titles = Book::where('title', 'LIKE', "%{$query}%")
                ->select('title', DB::raw('count(*) as total'))
                ->groupBy('title')
                ->paginate(80);
        } else {
            $titles = Book::select('title', DB::raw('count(*) as total'))
                ->groupBy('title')
                ->paginate(80);
        }

        return $this->resSuccess($titles);
    }
}
