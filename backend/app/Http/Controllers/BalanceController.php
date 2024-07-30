<?php

namespace App\Http\Controllers;

use App\Services\BalanceService;

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
        return response()->json([
            'total_amount' => $totalAmount,
            //in and outAmount of last 30 days
            'in_amount'=>1300,
            'out_amount'=>1600
        ]);

    }
}
