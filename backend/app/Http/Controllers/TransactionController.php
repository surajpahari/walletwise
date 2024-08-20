<?php

namespace App\Http\Controllers;

use App\Models\Expense;
use App\Models\Income;
use Carbon\Carbon;
use Illuminate\Http\Request;

class TransactionController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }

    public function fetch(Request $request)
    {
        $from = $request->from;
        $to = $request->to;
        $type = $request->type; // either income or expense or ALL (both)
        $searchValue = $request->searchValue;
        $bank = $request->bank;

        $last30Days = Carbon::today()->subDays(30);
        $today = Carbon::today();

        $incomesQuery = Income::query();
        $expensesQuery = Expense::query();

        if (isset($bank)) {
            $incomesQuery->where('bank_balance_id', $bank);
            $expensesQuery->where('bank_balance_id', $bank);
        }

        if ($from && $to) {
            $incomesQuery
                ->where('date', '>=', $from)
                ->where('date', '<=', $to);

            $expensesQuery
                ->where('date', '>=', $from)
                ->where('date', '<=', $to);

        } else {
            // fetch last 30 days
            $incomesQuery
                ->where('date', '>=', $last30Days);

            $expensesQuery
                ->where('date', '>=', $last30Days);
        }

        if (isset($searchValue)) {
            $incomesQuery
                ->where(function ($query) use ($searchValue) {
                    $query->where('name', 'LIKE', "%{$searchValue}%");
                });

            $expensesQuery
                ->where(function ($query) use ($searchValue) {
                    $query->where('name', 'LIKE', "%{$searchValue}%");
                });
        }

        $transactions = null;
        if ($type == 'INCOMES') {
            $incomes = $incomesQuery->get();

            $transactions = $incomes->sortByDesc('date')->values();

        } elseif ($type == 'EXPENSES') {
            $expenses = $expensesQuery->get();

            $transactions = $expenses->sortByDesc('date')->values();
        } else {
            // Fetch both
            $incomes = $incomesQuery->get();
            $expenses = $expensesQuery->get();

            $transactions = $incomes->concat($expenses)->sortByDesc('date')->values();
        }

        return response()->json([
            'transaction' => $transactions,
        ]);

    }
}
