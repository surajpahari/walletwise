<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Expense extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id',
        'bank_balance_id',
        'cash_in_hand_id',
        'type',
        'name',
        'category_id',
        'amount',
        'date',
        'period',
    ];

    protected $appends = [
        'identifier',
    ];

    public function getIdentifierAttribute()
    {
        return 'expense';
    }

    public function scopeUpcoming(Builder $query)
    {
        $query->whereNotNull('period');
    }

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class);
    }

    public function bankBalance(): BelongsTo
    {
        return $this->belongsTo(BankBalance::class);
    }

    public function cashInHand(): BelongsTo
    {
        return $this->belongsTo(CashInHand::class);
    }

    public function category(): BelongsTo
    {
        return $this->belongsTo(ExpenseCategory::class, 'category_id');
    }
}
