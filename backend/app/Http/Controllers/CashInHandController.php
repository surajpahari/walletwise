<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreCashInHandRequest;
use App\Http\Requests\UpdateCashInHandRequest;
use App\Models\CashInHand;
use Illuminate\Support\Facades\Auth;

class CashInHandController extends Controller
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
    public function store(StoreCashInHandRequest $request)
    {
        $fields = $request->validated();
        $fields['user_id'] = Auth::id();

        $cashInHand = CashInHand::create($fields);

        return response()->json(['message' => 'Cash in hand created']);
    }

    /**
     * Display the specified resource.
     */
    public function show(CashInHand $cashInHand)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(CashInHand $cashInHand)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateCashInHandRequest $request, CashInHand $cashInHand)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(CashInHand $cashInHand)
    {
        //
    }
}
