<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreExpenseRequest;
use App\Http\Requests\UpdateExpenseRequest;
use App\Http\Resources\UpcomingExpensesResource;
use App\Models\Expense;
use App\Services\BalanceService;
use Carbon\Carbon;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class ExpenseController extends Controller
{
    private $balanceService;

    public function __construct(BalanceService $balanceService)
    {
        $this->balanceService = $balanceService;
    }

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
    public function store(StoreExpenseRequest $request)
    {
        $fields = $request->validated();
        $fields['user_id'] = Auth::id();

        $sourceName = $fields['bank_balance_id'] ? 'bank_balance' : 'cash_in_hand';
        $sourceId = $fields['bank_balance_id'] ?? $fields['cash_in_hand_id'];

        if (! isset($fields['period'])) {
            try {
                $deductExpenseAmount = $this->balanceService->deductExpenseAmount(
                    $sourceName,
                    $sourceId,
                    $fields['amount']
                );
            } catch (Exception $e) {
                return response()->json([
                    'message' => $e->getMessage(),
                ], 403);

            }
        }

        $expense = Expense::create($fields);

        // $expenseResource = new ExpenseResource($expense);

        return response()->json([
            'message' => 'Expense created',
            'expense' => $expense,
        ]);

    }

    /**
     * Display the specified resource.
     */
    public function show(Expense $expense)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Expense $expense)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateExpenseRequest $request, Expense $expense)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Expense $expense)
    {
        //
    }

    public function getUpcomingExpenses(Request $request)
    {
        try {
            $expenseQuery = Expense::query();
            $upcomingExpenses = $expenseQuery->upcoming()->get();
            $upcomingExpensesResource = UpcomingExpensesResource::collection($upcomingExpenses);

            return response()->json(['message' => 'Upcoming Expenses', 'expenses' => $upcomingExpensesResource]);
        } catch (Exception $e) {
            return response()->json(['message' => $e->getMessage()]);
        }

    }

    public function fetch(Request $request)
    {
        /*return response()->json(['expenses' => $request->duration]);*/
        $user = Auth::user();
        $duration = $request->duration;

        $date = Carbon::today()->subDays($duration);

        $expenses = Expense::query()
            ->where('date', '>=', $date)
            ->leftJoin('expense_categories', 'expenses.category_id', '=', 'expense_categories.id')
            ->select('category_id', 'expense_categories.name as category', DB::raw('SUM(amount) as total_amount'))
            ->groupBy('category_id')
            ->get();

        return response()->json(['expenses' => $expenses]);

    }
}
