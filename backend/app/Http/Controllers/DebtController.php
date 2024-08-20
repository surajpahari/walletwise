<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreDebtRequest;
use App\Http\Requests\UpdateDebtRequest;
use App\Http\Resources\DebtCollection;
use App\Http\Resources\DebtResource;
use App\Models\Debt;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class DebtController extends Controller
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
    public function store(StoreDebtRequest $request)
    {
        $fields = $request->validated();
        $fields['user_id'] = Auth::id();

        $debt = Debt::create($fields);

        $debtResource = new DebtResource($debt);

        return response()->json([
            'message' => 'Debt created',
            'debt' => $debtResource,
        ]);
    }

    /**
     * Display the specified resource.
     */
    public function show(Debt $debt)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Debt $debt)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateDebtRequest $request, Debt $debt)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Debt $debt)
    {
        //
    }

    public function fetch(Request $request)
    {
        $user = Auth::user();
        $debts = $user->debts;

        $debtsResource = new DebtCollection($debts);

        return $debtsResource
            ->additional([
                'status' => 'Request was successful.',
                'message' => 'Debts fetched succesfully.',
            ]);
    }
}
