<?php

namespace App\Http\Resources;

use App\Services\BalanceService;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class UpcomingExpensesResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        $lastPaid = $this->date;
        $period = $this->period;

        $daysUntilNextPayment = Carbon::parse($lastPaid)->addDays($period)->diffInDays();

        if ($daysUntilNextPayment == 0) {
            $daysUntilNextPayment = 'Today';
        }

        return [
            'id' => (string) $this->id,
            'name' => $this->name,
            'amount' => $this->amount,
            'savings' => (new BalanceService)->getTotalBalance(),
            'due' => $daysUntilNextPayment,
        ];
    }
}
