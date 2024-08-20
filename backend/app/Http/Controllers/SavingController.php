<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreSavingRequest;
use App\Http\Requests\UpdateSavingRequest;
use App\Http\Resources\SavingCollection;
use App\Http\Resources\SavingResource;
use App\Models\Saving;
use Illuminate\Support\Facades\Auth;

class SavingController extends Controller
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
    public function store(StoreSavingRequest $request)
    {
        $fields = $request->validated();

        $fields['user_id'] = Auth::id();

        $saving = Saving::create($fields);

        $savingResource = new SavingResource($saving);

        return response()->json([
            'message' => 'Saving created',
            'saving' => $savingResource,
        ]);
    }

    /**
     * Display the specified resource.
     */
    public function show(Saving $saving)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Saving $saving)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateSavingRequest $request, Saving $saving)
    {
        $fields = $request->validated();

        $saving->update($fields);

        $savingResource = new SavingResource($saving);

        return response()->json([
            'message' => 'Saving updated',
            'saving' => $savingResource,
        ]);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Saving $saving)
    {
        $saving->delete();

        return response()->json([
            'message' => 'Saving deleted',
        ]);
    }

    public function fetch()
    {
        $user = Auth::user();
        $savings = $user->savings;

        $savingsResource = new SavingCollection($savings);

        return $savingsResource
            ->additional([
                'status' => 'Request was successful.',
                'message' => 'Savings fetched succesfully.',
            ]);
    }
}
