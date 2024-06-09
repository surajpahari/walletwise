<?php

use App\Http\Controllers\UserController;
use App\Http\Controllers\StockController;
use App\Http\Controllers\SavingController;
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
Route ::post('income/add',function(Request $request){

    $requestBody = file_get_contents('php://input');
     return response()->json(['request_body' => $requestBody]);
});


Route::controller(StockController::class)->group(function(){
    Route::post('search_stock','search');
    Route::post('random_stock','random10');
});

Route::controller(SavingController::class)->group(function(){
    Route::post('savings/fetch','fetch');
});

Route::post('test2', function(Request $request){

    $id = $request->input('id'); // Assuming the user sends the 'id' in the request body

    switch($id) {
        case 1:
            $data = [
                [
                    'category'=>'Education',
                    'id'=>1,
                    'items'=>[["name"=>"college fee", "amount"=>2000],["name"=>"stationary", "amount"=>20],["name"=>"Other", "amount"=>20]],
                ]
            ];
            break;
        case 4:
            $data = [
                [
                    'category'=>'Transportation',
                    'id'=>4,
                    'items'=>[["name"=>"Petrol", "amount"=>2000],["name"=>"Servicing", "amount"=>20],["name"=>"other", "amount"=>20]],
                ]
            ];
            break;
        case 3:
            $data = [
                [
                    'id'=>3,
                    'category'=>'Government and bills',
                    'items'=>[["name"=>"Electricity", "amount"=>2000],["name"=>"Home Tax", "amount"=>20],["name"=>"Internet", "amount"=>20]],
                ]
            ];
            break;
        default:
            $data = []; // Empty response for unknown id
    }

    return response()->json($data);
})->middleware('auth:sanctum');

Route::post('test', function(){
    $data = [
        [
            'category'=>'Education',
            'amount'=>7300,
            'duration'=>"Oct01 to Oct10",
            'id'=>1
        ],
        [
            'category'=>'Fitness',
            'amount'=>1500,
            'duration'=>"Oct01 to Oct10",
            'id'=>2
        ],
        [
            'category'=>'Government and bills',
            'amount'=>1500,
            'duration'=>"Oct01 to Oct10",
            'id'=>3
        ],

        [
            'category'=>'Transportation',
            'amount'=>1500,
            'duration'=>"Oct01 to Oct10",
            'id'=>4
        ],

        [
            'category'=>'Others',
            'amount'=>1500,
            'duration'=>"Oct01 to Oct10",
            'id'=>5
        ],

    ];
    return response()->json($data);
})->middleware('auth:sanctum');
//savings
Route::post('saving/add',function(Request $request){
    return response()->json(["messagge"=>"hi"]);
})->middleware('auth:sanctum');

Route::post('payment/fetch', function(Request $request) {
    return response()->json([
        [
        "title" => "Internet Bill",
        "totalPay" => 1580.00,
        "totalSaved"=>1000.00,
        "dueDuration" => "Due in 2 day"
        ],
        [
        "title" => "College Fee",
        "totalPay" => 80000,
        "totalSaved"=>1000,
        "dueDuration" => "Due in 60 day"
        ]
    ]);
})->middleware('auth:sanctum');

Route::get('savings/test',function(Request $request){
    return response()->json([
        "edited"=>true
    ]);

});
Route::post('/auth/register',[UserController::class,'create']);
Route::post('/auth/login',[UserController::class,'login']);
Route::post('/auth/logout',[UserController::class,'logout']);
