<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreAssetRequest;
use App\Http\Requests\UpdateAssetRequest;
use App\Http\Resources\AssetCollection;
use App\Models\Asset;
use Illuminate\Http\Request;
use App\Http\Resources\AssetResource;
use Illuminate\Support\Facades\Auth;

class AssetController extends Controller
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
    public function store(StoreAssetRequest $request)
    {
        $fields = $request->validated();
        $fields['user_id'] = Auth::id();

        $asset = Asset::create($fields);

        $assetResource = new AssetResource($asset);

        return response()->json([
            'message' => 'Asset created',
            'asset' => $assetResource,
        ]);
    }

    /**
     * Display the specified resource.
     */
    public function show(Asset $asset)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Asset $asset)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateAssetRequest $request, Asset $asset)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Asset $asset)
    {
        //
    }

    public function fetch(Request $request)
    {
        $user = Auth::user();
        $assets = $user->assets;

        $assetsResource = new AssetCollection($assets);

        return $assetsResource
            ->additional([
                'status' => 'Request was successful.',
                'message' => 'Assets fetched succesfully.',
            ]);
    }
}
