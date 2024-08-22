<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreStockRequest;
use App\Http\Requests\UpdateStockRequest;
use App\Models\Stock;
use App\Models\StockUser;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class StockController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $stocks = StockUser::with('stock')
            ->where('user_id', Auth::id())
            ->get();

        return response()->json([
            'stocks' => $stocks,
        ]);
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
    public function store(StoreStockRequest $request)
    {
        $fields = $request->validated();

        $fields['user_id'] = Auth::user()->id;

        $stock = StockUser::create($fields);

        return response()->json([
            'message' => 'Stock added',
            'stock' => $stock,
        ]);
    }

    /**
     * Display the specified resource.
     */
    public function show(Stock $stock)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Stock $stock)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateStockRequest $request, StockUser $stock)
    {
        $fields = $request->validated();

        $stock->update($fields);

        return response()->json([
            'message' => 'Stock updated',
            'stock' => $stock,
        ]);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(StockUser $stock)
    {
        $stock->delete();

        return response()->json([
            'message' => 'Stock deleted', j,
        ]);
    }

    public function search(Request $request)
    {
        $key = $request->key;

        $stocks = Stock::where('securityName', 'like', '%'.$key.'%')
            ->where('activeStatus', 'A')
            ->take(5)
            ->get();

        return response()->json($stocks);
    }

    public function random10()
    {
        $stocks = Stock::inRandomOrder()
            ->where('activeStatus', 'A')
            ->where('check', 1)
            ->take(10)
            ->get();

        return response()->json($stocks);
    }
}
