<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Debt extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id',
        'name',
        'amount',
    ];

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class);
    }
}
