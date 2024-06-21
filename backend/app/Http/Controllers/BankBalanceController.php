<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreBankBalanceRequest;
use App\Http\Requests\UpdateBankBalanceRequest;
use App\Http\Resources\BankBalanceResource;
use App\Models\BankBalance;
use Illuminate\Support\Facades\Auth;

class BankBalanceController extends Controller
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
    public function store(StoreBankBalanceRequest $request)
    {
        $fields = $request->validated();
        $fields['user_id'] = Auth::id();

        $bankBalance = BankBalance::create($fields);

        $bankBalanceResource = new BankBalanceResource($bankBalance);

        return response()->json([
            'message' => 'Bank balance created',
            'bank_balance' => $bankBalanceResource,
        ]);
    }

    /**
     * Display the specified resource.
     */
    public function show(BankBalance $bankBalance)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(BankBalance $bankBalance)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateBankBalanceRequest $request, BankBalance $bankBalance)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(BankBalance $bankBalance)
    {
        //
    }
}
