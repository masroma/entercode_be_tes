<?php

namespace App\Http\Requests\Product;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Contracts\Validation\Validator;
use App\Traits\ApiResponser;
use Illuminate\Http\Exceptions\HttpResponseException;

class ProductRequest extends FormRequest
{
    use ApiResponser;
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    // public function authorize()
    // {
    //     return true;
    // }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'name' => 'required',
            'image'=> 'image|mimes:jpeg,jpg,png|max:2000',
            'price'         => 'required|numeric',
            'qty'         => 'required|numeric',
        ];
    }

    public function messages()
    {
        return [
            'name.required' => 'Mohon masukkan field nama',
            'image.image' => 'Mohon pilih file gambar yang valid',
            'image.mimes' => 'Format gambar tidak valid. Hanya diperbolehkan file dengan ekstensi jpeg, jpg, dan png',
            'image.max' => 'Ukuran gambar tidak boleh lebih dari 2 MB',
            'price.required' => 'Mohon masukkan harga',
            'price.numeric' => 'Mohon masukkan harga dalam bentuk angka',
            'qty.required' => 'Mohon masukkan kuantitas',
            'qty.numeric' => 'Mohon masukkan kuantitas dalam bentuk angka',
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
