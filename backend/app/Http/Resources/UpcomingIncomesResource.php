<?php

namespace App\Http\Resources;

use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class UpcomingIncomesResource extends JsonResource
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
            'due' => $daysUntilNextPayment,
        ];
    }
}
