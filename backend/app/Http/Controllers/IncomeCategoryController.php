<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreIncomeCategoryRequest;
use App\Http\Requests\UpdateIncomeCategoryRequest;
use App\Models\IncomeCategory;
use Carbon\Carbon;
use Illuminate\Http\Request;

class IncomeCategoryController extends Controller
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
    public function store(StoreIncomeCategoryRequest $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(Request $request, IncomeCategory $incomeCategory)
    {
        $duration = $request->duration;
        $date = Carbon::today()->subDays($duration);

        $incomes = IncomeCategory::with(['incomes' => function ($q) use ($date) {
            $q->select('id', 'source as name', 'date', 'category_id', 'amount')
                ->where('date', '>=', $date)
                ->where('type', '=', 'daily');
        }])
            ->where('id', '=', $incomeCategory->id)
            ->select('id', 'name')
            ->first()
            ->incomes;

        return response()->json($incomes);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(IncomeCategory $incomeCategory)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateIncomeCategoryRequest $request, IncomeCategory $incomeCategory)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(IncomeCategory $incomeCategory)
    {
        //
    }
    public function getAllCategory()
    {
        $categories = IncomeCategory::select('id', 'name')->get();

        return response()->json(['message' => 'All cateogries', 'categories' => $categories]);
    }

}
