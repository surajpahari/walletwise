<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class StockUser extends Model
{
    use HasFactory;

    protected $table = 'stock_user';

    protected $fillable = [
        'stock_id',
        'user_id',
        'no_of_units',
        'price',
        'bought_at',
    ];

    public function stock()
    {
        return $this->belongsTo(Stock::class, 'stock_id');
    }
}
