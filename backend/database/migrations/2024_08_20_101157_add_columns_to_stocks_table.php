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
        Schema::table('stocks', function (Blueprint $table) {
            $table->string('symbol')->after('id');
            $table->text('security_name')->after('symbol');
            $table->text('name')->after('security_name');
            $table->enum('active_status', ['A', 'D', 'S'])->after('name');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('stocks', function (Blueprint $table) {
            $table->dropColumn([
                'symbol',
                'name',
                'security_name',
                'active_status',
            ]);
        });
    }
};
