<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class StoreExpenseRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    private function eitherBankOrCashIdRequiredRules()
    {
        return [
            'bank_balance_id' => ['nullable', Rule::exists('bank_balances', 'id')],
            'cash_in_hand_id' => ['nullable', Rule::exists('cash_in_hands', 'id')],
            'bank_balance_id' => 'required_without_all:cash_in_hand_id',
            'cash_in_hand_id' => 'required_without_all:bank_balance_id',
        ];
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        $baseRules = [
            'type' => ['required', 'string'],
            'name' => ['required', 'string'],
            'category_id' => ['required', 'integer', Rule::exists('expense_categories', 'id')],
            'amount' => ['required', 'string'],
            'date' => ['required', 'string'],
            'period' => ['nullable', 'integer'],
        ];

        if ($this->input('type') == 'daily') {
            return array_merge($baseRules, $this->eitherBankOrCashIdRequiredRules());
        }

        return $baseRules;
    }
}
