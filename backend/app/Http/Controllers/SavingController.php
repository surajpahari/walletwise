<?php

namespace App\Http\Controllers;

use App\Models\Saving;
use Illuminate\Http\Request;

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
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(Saving $saving)
    {
        //
    }


    public  function fetch()
    {
    // Fetch the response for the authenticated user
        $data = [
            [
            "title" => "Macbook",
            "amount" => 14600,
            "note" => "need to save",
            "date" => "Oct-12"
            ],
            [
            "title" => "Gym Fee",
            "amount" => 2000,
            "note" => "need to save",
            "date" => "Oct-12"
            ],
        ];
        return response()->json($data, 200);
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
    public function update(Request $request, Saving $saving)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Saving $saving)
    {
        //
    }
}
