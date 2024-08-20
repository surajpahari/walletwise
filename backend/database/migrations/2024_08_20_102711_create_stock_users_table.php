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
        Schema::create('stock_user', function (Blueprint $table) {
            $table->id();
            $table->foreignId('stock_id')->constrained();
            $table->foreignId('user_id')->constrained();
            $table->integer('no_of_units')->default(10);
            $table->double('price');
            $table->date('bought_at');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('stock_user');
    }
};
