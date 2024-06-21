<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('expenses', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained('users')->onDelete('cascade');
            $table->foreignId('bank_balance_id')->nullable()->constrained('bank_balances')->onDelete('cascade');
            $table->foreignId('cash_in_hand_id')->nullable()->constrained('cash_in_hands')->onDelete('cascade');
            $table->string('type');
            $table->string('name');
            $table->foreignId('category_id')->constrained('expense_categories')->onDelete('cascade');
            $table->double('amount');
            $table->date('date');
            $table->integer('period')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('expenses');
    }
};
