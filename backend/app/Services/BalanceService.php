<?php

namespace App\Services;

use App\Models\BankBalance;
use App\Models\CashInHand;
use App\Models\User;
use Exception;
use Illuminate\Support\Facades\Auth;

class BalanceService
{
    public function getTotalBalance()
    {
        $user = Auth::user();
        /*$user = User::find(1);*/

        $totalAmount = 0;
        $bankBalances = $user->bankBalances;
        $cashInHand = $user->cashInHand;

        foreach ($bankBalances as $bankBalance) {
            $totalAmount += $bankBalance->amount;
        }

        $totalAmount += $cashInHand->amount;

        return $totalAmount;

    }

    public function deductExpenseAmount($sourceName, $sourceId, $amount): bool
    {
        switch ($sourceName) {
            case 'bank_balance':
                $bankBalance = BankBalance::findOrFail($sourceId);

                if ($amount > $bankBalance->amount) {
                    throw new Exception('Expense amount is greater than your bank balance');
                }

                $bankBalance->amount = $bankBalance->amount - $amount;
                $bankBalance->save();
                break;
            case 'cash_in_hand':
                $cashInHand = CashInHand::findOrFail($sourceId);

                if ($amount > $cashInHand->amount) {
                    throw new Exception('Expense amount is greater than the amount you have');
                }

                $cashInHand->amount = $cashInHand->amount - $amount;
                $cashInHand->save();
                break;
            default:
                break;
        }
    }
}
