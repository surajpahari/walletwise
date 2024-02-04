<?php

use App\Http\Controllers\UserController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
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
Route::post('test', function(){
    $data = [
        [
            'category'=>'Education',
            'amount'=>7300,
            'duration'=>"Oct01 to Oct10"
        ],
        [
            'category'=>'Fitness',
            'amount'=>1500,
            'duration'=>"Oct01 to Oct10"
        ],
        [
            'category'=>'Government and bills',
            'amount'=>1500,
            'duration'=>"Oct01 to Oct10"
        ],

        [
            'category'=>'Transportation',
            'amount'=>1500,
            'duration'=>"Oct01 to Oct10"
        ],

        [
            'category'=>'Others',
            'amount'=>1500,
            'duration'=>"Oct01 to Oct10"
        ],


    ];

    return response()->json($data);
})->middleware('auth:sanctum');
Route::post('/auth/register',[UserController::class,'create']);
Route::post('/auth/login',[UserController::class,'login']);
Route::post('/auth/logout',[UserController::class,'logout']);
