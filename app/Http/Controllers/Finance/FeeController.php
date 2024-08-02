<?php
namespace App\Http\Controllers\Finance;

use App\Http\Controllers\Controller;
use App\Models\Finance\Student;
use App\Models\Finance\StudentFee;
use App\Models\Finance\FeePayment;
use App\Models\Finance\FeeStructure;
use Illuminate\Http\Request;
use App\Http\Traits\JsonResponseTrait;
use DB;

class FeeController extends Controller
{

    /**
     * View fee structure for a specific level.
     *
     * @param int $level_id
     * @return \Illuminate\Http\JsonResponse
     */
    public function viewFeeStructure($level_id)
    {
        $feeStructure = FeeStructure::with('feeDetails')->where('level_id', $level_id)->first();

        if (!$feeStructure) {
            return $this->ResError('Fee structure not found', 404);
        }

        return $this->ResSuccess($feeStructure);
    }

    /**
     * View balance for a specific student.
     *
     * @param int $student_id
     * @return \Illuminate\Http\JsonResponse
     */
    public function viewBalance($student_id)
    {
        $studentFee = StudentFee::where('student_id', $student_id)->with('level')->first();

        if (!$studentFee) {
            return $this->ResError('Student fee record not found', 404);
        }

        return $this->ResSuccess($studentFee);
    }

    /**
     * Make a payment for a specific student.
     *
     * @param \Illuminate\Http\Request $request
     * @param int $student_id
     * @return \Illuminate\Http\JsonResponse
     */
    public function makePayment(Request $request, $student_id)
    {
        $request->validate([
            'amount' => 'required|numeric|min:0.01',
        ]);

        $student = Student::findOrFail($student_id);
        $studentFee = StudentFee::where('student_id', $student_id)->first();

        if (!$studentFee) {
            return $this->ResError('Student fee record not found', 404);
        }

        // Calculate the new balance
        $newBalance = $studentFee->balance - $request->amount;

        // Begin a transaction
        DB::beginTransaction();

        try {
            // Create a new payment record
            $payment = new FeePayment();
            $payment->student_id = $student_id;
            $payment->amount = $request->amount;
            $payment->save();

            // Update the student's balance
            $studentFee->balance = $newBalance;
            $studentFee->save();

            // Commit the transaction
            DB::commit();

            return $this->ResSuccess('Payment successful');
        } catch (\Exception $e) {
            // Rollback the transaction
            DB::rollBack();

            return $this->ResError('Payment failed: ' . $e->getMessage(), 500);
        }
    }

    /**
     * View payment history for a specific student.
     *
     * @param int $student_id
     * @return \Illuminate\Http\JsonResponse
     */
    public function viewPaymentHistory($student_id = null)
    {
        // Check if a student ID is provided
        if ($student_id) {
            // Fetch payments for the specific student
            $payments = FeePayment::where('student_id', $student_id)->with('student')->latest()->paginate(20);
        } else {
            // Fetch all payments
            $payments = FeePayment::latest()->with('student')->paginate(20);
        }
    
        return $this->ResSuccess($payments);
    }
    
    /**
     * Create or update fee structure for a specific level.
     *
     * @param \Illuminate\Http\Request $request
     * @param int $level_id
     * @return \Illuminate\Http\JsonResponse
     */
    public function saveFeeStructure(Request $request, $level_id)
    {
        $request->validate([
            'details' => 'required|array',
            'details.*.description' => 'required|string',
            'details.*.amount' => 'required|numeric|min:0',
        ]);

        // Begin a transaction
        DB::beginTransaction();

        try {
            // Find or create the fee structure for the given level
            $feeStructure = FeeStructure::firstOrNew(['level_id' => $level_id]);
            $feeStructure->save();

            // Delete existing fee details
            $feeStructure->feeDetails()->delete();

            // Create new fee details
            foreach ($request->details as $detail) {
                $feeStructure->feeDetails()->create($detail);
            }

            // Commit the transaction
            DB::commit();

            return $this->ResSuccess('Fee structure saved successfully');
        } catch (\Exception $e) {
            // Rollback the transaction
            DB::rollBack();

            return $this->ResError('Failed to save fee structure: ' . $e->getMessage(), 500);
        }
    }

    public function editFeeDetail(Request $request, $detail_id)
    {
        $request->validate([
            'description' => 'required|string',
            'amount' => 'required|numeric|min:0',
        ]);

        $feeDetail = FeeDetail::find($detail_id);

        if (!$feeDetail) {
            return $this->ResError('Fee detail not found', 404);
        }

        $feeDetail->description = $request->description;
        $feeDetail->amount = $request->amount;
        $feeDetail->save();

        return $this->ResSuccess('Fee detail updated successfully');
    }
}
