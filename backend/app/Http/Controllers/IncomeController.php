<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreIncomeRequest;
use App\Http\Requests\UpdateIncomeRequest;
use App\Http\Resources\UpcomingIncomesResource;
use App\Models\Income;
use App\Services\BalanceService;
use Carbon\Carbon;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class IncomeController extends Controller
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
    public function store(StoreIncomeRequest $request)
    {
        $fields = $request->validated();
        $fields['user_id'] = Auth::id();

        $sourceName = $fields['bank_balance_id'] ? 'bank_balance' : 'cash_in_hand';
        $sourceId = $fields['bank_balance_id'] ?? $fields['cash_in_hand_id'];

        if (! isset($fields['period'])) {
            try {
                $increaseIncomeAmount = $this->balanceService->increaseIncomeAmount(
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

        $income = Income::create($fields);

        // $incomeResource = new IncomeResource($income);

        return response()->json([
            'message' => 'Income created',
            'income' => $income,
        ]);
    }

    /**
     * Display the specified resource.
     */
    public function show(Income $income)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Income $income)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateIncomeRequest $request, Income $income)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Income $income)
    {
        //
    }

    public function getUpcomingIncomes(Request $request)
    {
        try {
            $incomeQuery = Income::query();
            $upcomingIncomes = $incomeQuery->upcoming()->get();
            $upcomingIncomesResource = UpcomingIncomesResource::collection($upcomingIncomes);

            return response()->json(['message' => 'Upcoming Incomes', 'incomes' => $upcomingIncomesResource]);
        } catch (Exception $e) {
            return response()->json(['message' => $e->getMessage()]);
        }

    }

    public function fetch(Request $request)
    {
        $user = Auth::user();
        $duration = $request->duration;

        $date = Carbon::today()->subDays($duration);

        $incomes = Income::query()
            ->where('date', '>=', $date)
            ->leftJoin('income_categories', 'incomes.category_id', '=', 'income_categories.id')
            ->select('category_id', 'income_categories.name as category', DB::raw('SUM(amount) as total_amount'))
            ->groupBy('category_id')
            ->get();

        return response()->json(['incomes' => $incomes]);

    }
}
