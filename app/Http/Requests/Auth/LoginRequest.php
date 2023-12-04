<?php

namespace App\Http\Requests\Auth;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Contracts\Validation\Validator;
use App\Traits\ApiResponser;
use Illuminate\Http\Exceptions\HttpResponseException;

class LoginRequest extends FormRequest
{
    use ApiResponser;
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'email' => 'required|email',
            'password' => 'required|string',
        ];
    }

    public function messages()
    {
        return [
            'email.required' => 'Mohon masukkan alamat email.',
            'email.email' => 'Format alamat email tidak valid.',
            'password.required' => 'Mohon masukkan kata sandi.',
            'password.string' => 'Kata sandi harus berupa teks.',
        ];
    }

    public function withValidator($validator)
    {
        $validator->addExtension('foobar', function ($attribute, $value, $parameters, $validator) {
            //
        });
    }

    /**
     * Handle a failed validation attempt.
     *
     * @param  \Illuminate\Validation\Validator  $validator
     * @return mixed
     */
    protected function failedValidation(Validator $validator)
    {
        if ($validator->errors()->count() > 0) {
            throw new HttpResponseException($this->unProsesEntityResponse($validator->errors()->first(), $validator->errors()));
        }
    }
}
