<?php

use App\Http\Controllers\AssetController;
use App\Http\Controllers\BalanceController;
use App\Http\Controllers\BankBalanceController;
use App\Http\Controllers\CashInHandController;
use App\Http\Controllers\ExpenseController;
use App\Http\Controllers\SavingController;
use App\Http\Controllers\ExpenseCategoryController;
use App\Http\Controllers\StockController;
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
Route::post('income/add', function (Request $request) {

    $requestBody = file_get_contents('php://input');

    return response()->json(['request_body' => $requestBody]);
});

Route::controller(StockController::class)->group(function () {
    Route::post('search_stock', 'search');
    Route::post('random_stock', 'random10');
});

Route::controller(SavingController::class)->group(function () {
    Route::get('savings/fetch', 'fetch');
});

Route::get('get-expense-items', function (Request $request) {

    $id = $request->query('id');// Assuming the user sends the 'id' in the request body

    switch ($id) {
        case '1':
            $data = [
                [
                    'category' => 'Education',
                    'id' => 1,
                    'items' => [['name' => 'college fee', 'amount' => 2000], ['name' => 'stationary', 'amount' => 2000], ['name' => 'Other', 'amount' => 2000]],
                ],
            ];
            break;
        case '2':
            $data = [
                [
                    'category' => 'Food',
                    'id' => 2,
                    'items' => [['name' => 'Eggs', 'amount' => 2000,'date'=>'2023/05/01'], ['name' => 'Oats', 'amount' => 20], ['name' => 'other', 'amount' => 20]],
                ],
            ];
            break;
        case 3:
            $data = [
                [
                    'id' => 3,
                    'category' => 'Government and bills',
                    'items' => [['name' => 'Electricity', 'amount' => 2000], ['name' => 'Home Tax', 'amount' => 20], ['name' => 'Internet', 'amount' => 20]],
                ],
            ];
            break;
        default:
            $data = [
                [
                    'id' => 7,
                    'category' => 'Government and bills',
                    'items' => [['name' => 'Electricity', 'amount' => 2000], ['name' => 'Home Tax', 'amount' => 20], ['name' => 'Internet', 'amount' => 20]],
                ],
            ]; // Empty response for unknown id
    }
    return response()->json($data);
})->middleware('auth:sanctum');

Route::post('test', function () {
    $data = [
        [
            'category' => 'Education',
            'amount' => 7300,
            'duration' => 'Oct01 to Oct10',
            'id' => 1,
        ],
        [
            'category' => 'Fitness',
            'amount' => 1500,
            'duration' => 'Oct01 to Oct10',
            'id' => 2,
        ],
        [
            'category' => 'Government and bills',
            'amount' => 1500,
            'duration' => 'Oct01 to Oct10',
            'id' => 3,
        ],

        [
            'category' => 'Transportation',
            'amount' => 1500,
            'duration' => 'Oct01 to Oct10',
            'id' => 4,
        ],

        [
            'category' => 'Others',
            'amount' => 1500,
            'duration' => 'Oct01 to Oct10',
            'id' => 5,
        ],

    ];

    return response()->json($data);
})->middleware('auth:sanctum');
//savings
Route::post('saving/add', function (Request $request) {
    return response()->json(['messagge' => 'hi']);
})->middleware('auth:sanctum');

Route::get('savings/test', function (Request $request) {
    return response()->json([
        'edited' => true,
    ]);

});
Route::post('/auth/register', [UserController::class, 'create']);
Route::post('/auth/login', [UserController::class, 'login']);
Route::post('/auth/logout', [UserController::class, 'logout']);

/*Route::middleware(['auth:sanctum'])->group(function () {*/
/*    Route::resource('bank-balances', BankBalanceController::class);*/
/*    Route::resource('cash-in-hand', CashInHandController::class);*/
/*    Route::resource('assets', AssetController::class);*/
/*    Route::resource('expenses', ExpenseController::class);*/
/*    Route::post('/expenses/upcoming', [ExpenseController::class, 'getUpcomingExpenses']);*/
/*    Route::get('/bank-balances/all-accounts',[BankBalanceController::class,'getBankAccounts']);*/
/*    Route::get('/total-balance', [BalanceController::class, 'getTotalBalance']);*/
/**/
/*});*/
/**/
Route::middleware(['auth:sanctum'])->group(function () {
    Route::resource('bank-balances', BankBalanceController::class);
    Route::resource('cash-in-hand', CashInHandController::class);
    Route::resource('assets', AssetController::class);
    Route::resource('expenses', ExpenseController::class);
    Route::get('/upcoming', [ExpenseController::class, 'getUpcomingExpenses']);
    Route::resource('bank-balances', BankBalanceController::class);
    Route::get('/all-accounts', [BankBalanceController::class, 'getBankAccounts']);
    Route::get('/total-balance', [BalanceController::class, 'getTotalBalance']);
    Route::get ('/all-expense-categories',[ExpenseCategoryController::class,'getAllCategory']);
    //for the stocks
});

//Route for the test
Route::middleware(['auth:sanctum'])->group(function () {
    Route::post("/stocks/add_stocks",function(){
        return response()->json('hell');
    });

   Route::get('/stocks/bought-stocks',function(){
    $data = [
        [
            'id'=>1,
            'stock'=>[
                'id'=>1,
                'symbol'=>"PFL",
                'securityName'=>"Pokhara finance",
                'name'=>"Pokhara finanance",
            ],
            'date'=>"2022/03/5",
            'unit'=>15,
            'amount'=>1200
        ]
    ];
    return response()->json($data);
    });

    //fetch assets
    Route::get('/fetch-assets',function(){
        $data = [
            [
                'name' => 'Education',
                'amount' => 7300,
                'id' => 1,
            ],
            [
                'name' => 'Food',
                'amount' => 1500,
                'id' => 2,
            ],
            [
                'name' => 'Others',
                'amount' => 1500,
                'id' => 5,
            ],

        ];
        return response()->json($data);
    });

    //fetching category and its expense for last 7 days
    Route::get('/expenses-category',function(){
    $data = [
        [
            'category' => 'Education',
            'amount' => 7300,
            'id' => 1,
        ],
        [
            'category' => 'Food',
            'amount' => 1500,
            'id' => 2,
        ],
        [
            'category' => 'Others',
            'amount' => 1500,
            'id' => 5,
        ],

    ];
    return response()->json($data);
    });
}
);


