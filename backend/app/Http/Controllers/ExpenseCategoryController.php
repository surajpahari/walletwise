<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreExpenseCategoryRequest;
use App\Http\Requests\UpdateExpenseCategoryRequest;
use App\Models\ExpenseCategory;
use Carbon\Carbon;
use Illuminate\Http\Request;

class ExpenseCategoryController extends Controller
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
    public function store(StoreExpenseCategoryRequest $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(Request $request, ExpenseCategory $expenseCategory)
    {
        $duration = $request->duration;
        $date = Carbon::today()->subDays($duration);

        $expenses = ExpenseCategory::with(['expenses' => function ($q) use ($date) {
            $q->select('id', 'name', 'date', 'category_id', 'amount')
                ->where('date', '>=', $date)
                ->where('type', '=', 'daily');
        }])
            ->where('id', '=', $expenseCategory->id)
            ->select('id', 'name')
            ->first()
            ->expenses;

        return response()->json($expenses);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(ExpenseCategory $expenseCategory)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateExpenseCategoryRequest $request, ExpenseCategory $expenseCategory)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(ExpenseCategory $expenseCategory)
    {
        //
    }

    public function getAllCategory()
    {
        $categories = ExpenseCategory::select('id', 'name')->get();

        return response()->json(['message' => 'All cateogries', 'categories' => $categories]);
    }
}
