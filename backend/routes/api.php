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

// Protected Routes
Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::prefix('/auth')->name('auth.')->group(function () {
    // Open routes
    Route::post('/register', [UserController::class, 'store'])->name('register');
    Route::post('/login', [UserController::class, 'authenticate'])->name('login');

    // Protected Routes
    Route::group(['middleware' => ['auth:sanctum']], function () {
        Route::post('/logout', [UserController::class, 'logout'])->name('logout');
    });
});
