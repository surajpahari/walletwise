<?php

namespace App\Http\Controllers;

use App\Models\Expense;
use App\Models\Income;
use App\Services\BalanceService;
use Carbon\Carbon;

class BalanceController extends Controller
{
    private $balanceService;

    public function __construct(BalanceService $balanceService)
    {
        $this->balanceService = $balanceService;
    }

    public function getTotalBalance()
    {
        $totalAmount = $this->balanceService->getTotalBalance();

        $date = Carbon::today()->subDay(30);
        $income_amount = Income::where('date', '>=', $date)->sum('amount');
        $expense_amount = Expense::where('date', '>=', $date)->sum('amount');

        return response()->json([
            'total_amount' => $totalAmount,
            //in and outAmount of last 30 days
            'in_amount' => $income_amount,
            'out_amount' => $expense_amount,
        ]);

    }
}
