<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use http\Client\Response;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/
Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
Route::get('test', function(){
    $data = [
        'message' => 'Hello World'
    ];

    return response()->json($data);
});

