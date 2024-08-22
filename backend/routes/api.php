<?php

use App\Http\Controllers\AssetController;
use App\Http\Controllers\BalanceController;
use App\Http\Controllers\BankBalanceController;
use App\Http\Controllers\CashInHandController;
use App\Http\Controllers\DebtController;
use App\Http\Controllers\ExpenseCategoryController;
use App\Http\Controllers\ExpenseController;
use App\Http\Controllers\IncomeCategoryController;
use App\Http\Controllers\IncomeController;
use App\Http\Controllers\SavingController;
use App\Http\Controllers\StockController;
use App\Http\Controllers\TransactionController;
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

Route::get('get-expense-items', function (Request $request) {

    $id = $request->query('id'); // Assuming the user sends the 'id' in the request body

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
                    'items' => [['name' => 'Eggs', 'amount' => 2000, 'date' => '2023/05/01'], ['name' => 'Oats', 'amount' => 20], ['name' => 'other', 'amount' => 20]],
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

//savings
/*Route::post('saving/add', function (Request $request) {*/
/*    return response()->json(['messagge' => 'hi']);*/
/*})->middleware('auth:sanctum');*/
/**/
/*Route::get('savings/test', function (Request $request) {*/
/*    return response()->json([*/
/*        'edited' => true,*/
/*    ]);*/
/**/
/*});*/
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

    Route::get('/assets/fetch', [AssetController::class, 'fetch']);
    Route::resource('assets', AssetController::class);

    Route::get('/expenses/fetch', [ExpenseController::class, 'fetch']);
    Route::resource('expenses', ExpenseController::class);

    Route::get('/incomes/fetch', [IncomeController::class, 'fetch']);
    Route::resource('incomes', IncomeController::class);

    Route::get('/upcoming', [ExpenseController::class, 'getUpcomingExpenses']);
    Route::resource('bank-balances', BankBalanceController::class);
    Route::get('/all-accounts', [BankBalanceController::class, 'getBankAccounts']);
    Route::get('/get-balance-info', [BalanceController::class, 'getTotalBalance']);
    Route::get('/all-expense-categories', [ExpenseCategoryController::class, 'getAllCategory']);
    Route::get('/expense-categories/{expenseCategory}', [ExpenseCategoryController::class, 'show']);

    Route::get('/income-categories/{incomeCategory}', [IncomeCategoryController::class, 'show']);

    Route::get('/debts/fetch', [DebtController::class, 'fetch']);
    Route::resource('debts', DebtController::class);

    Route::get('/savings/fetch', [SavingController::class, 'fetch']);
    Route::resource('savings', SavingController::class);

    //for the stocks
    Route::resource('stocks', StockController::class);

    Route::get('/transactions/fetch', [TransactionController::class, 'fetch']);
    Route::resource('transactions', TransactionController::class);
});

//TESTING TESTING TESTING
//Route for the test
Route::middleware(['auth:sanctum'])->group(function () {
    Route::post('/stocks/add_stocks', function () {
        return response()->json('hell');
    });

    Route::get('/get-bought-stocks', function () {
        $data = [
            [
                'id' => 1,
                'stock' => [
                    'id' => 1,
                    'symbol' => 'PFL',
                    'securityName' => 'Pokhara finance',
                    'name' => 'Pokhara finanance',
                ],
                'date' => '2022/03/5',
                'unit' => 15,
                'amount' => 1200,
            ],
[
                'id' => 1,
                'stock' => [
                    'id' => 1,
                    'symbol' => 'PFL',
                    'securityName' => 'Pokhara finance',
                    'name' => 'Pokhara finanance',
                ],
                'date' => '2022/03/5',
                'unit' => 15,
                'amount' => 1200,
            ],

        ];

        return response()->json($data);
    });

    //fetching category and its expense for last 7 days
    Route::get('/expenses-detail', function () {
        $data = [
            [
                'id'=>2,
                'name' => 'item1',
                'amount' => 7300,
                'date' => '2034/02/03',
            ],

            [
                'id'=>4,
                'name' => 'item2',
                'amount' => 7300,
                'date' => '2034/02/03',
            ]
        ];

        return response()->json($data);
    });
}
);
