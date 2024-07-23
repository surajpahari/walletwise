<?php

namespace App\Http\Controllers;

use App\Models\Stock;
use Illuminate\Http\Request;

class StockController extends Controller
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
    public function update(Request $request, Stock $stock)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Stock $stock)
    {
        //
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
