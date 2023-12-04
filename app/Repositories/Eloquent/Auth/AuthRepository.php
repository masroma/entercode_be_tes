<?php

namespace App\Repositories\Eloquent\Auth;

use App\Http\Controllers\BaseController;
use App\Http\Resources\Auth\AuthResource;
use App\Repositories\Interfaces\Auth\AuthRepositoryInterface;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use App\Models\User;

class AuthRepository implements AuthRepositoryInterface
{
    protected $apiController;

    public function __construct(BaseController $apiController)
    {
        $this->apiController = $apiController;
    }

    public function login($request)
    {
        $credentials = $request->only('email', 'password');

        if (Auth::attempt($credentials)) {
            $user = Auth::user();

            // Tambahkan penanganan role di sini
            $role = $user->role;

            // Buat token Passport
            $token = $user->createToken('authToken')->accessToken;

            $data = [
                "token" => $token,
                "user" => new AuthResource($user),
                "role" => $role,
            ];

            return $this->apiController->trueResult('Selamat datang kembali', $data);
        } else {
            return $this->apiController->falseResult("Invalid credentials", null);
        }

    }

    public function register($request)
    {

        $input['name']          = $request->name;
        $input['email']          = $request->email;
        $input['password']          = Hash::make($request->password);
        $input['role']      = "pembeli";

        $result = User::create($input);
        if ($result) {
            return $this->apiController->trueResult("Data customer berhasil di buat", new AuthResource($result));
        } else {
            return $this->apiController->falseResult("Data customer gagal berhasil di buat", null);
        }
    }

    public function getUser($request)
    {
        $result = auth()->guard('api')->user();

        if ($result) {
            return $this->apiController->trueResult("Data user", $result);
        } else {
            return $this->apiController->falseResult("Data user tidak di temukan", null);
        }

    }

}
