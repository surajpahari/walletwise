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

        return response()->json(['total_amount' => $totalAmount]);

    }
}
