<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Income extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id',
        'category_id',
        'name',
        'type',
        'source',
        'bank_balance_id',
        'cash_in_hand_id',
        'amount',
        'date',
        'period',
    ];

    protected $appends = [
        'identifier',
    ];

    public function getIdentifierAttribute()
    {
        return 'income';
    }

    public function scopeUpcoming(Builder $query)
    {
        $query->whereNotNull('period');
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function category()
    {
        return $this->belongsTo(IncomeCategory::class, 'category_id');
    }
}
