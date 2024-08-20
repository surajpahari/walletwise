<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class UpdateStockRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'stock_id' => ['required', 'integer', Rule::exists('stocks', 'id')],
            'no_of_units' => ['required', 'integer'],
            'price' => ['required', 'numeric'],
            'bought_at' => ['required', 'date'],
        ];
    }
}
