<?php

namespace App\Http\Controllers\Api\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Controllers\BaseController;
use App\Http\Requests\Auth\LoginRequest;
use App\Http\Requests\Auth\RegisterRequest;
use App\Repositories\Interfaces\Auth\AuthRepositoryInterface;

class AuthController  extends BaseController
{
    protected $repository; // Fix the variable name here

    public function __construct(AuthRepositoryInterface $repository)
    {
        $this->repository = $repository; // Fix the variable name here
    }

    public function login(LoginRequest $request)
    {
        try {
            $response = $this->repository->login($request);
            if ($response->success) {
                return $this->successResponse($response->message, $response->data);
            } else {
                return $this->errorResponse($response->message, $response->data);
            }
        } catch (\Exception $e) {
            return $this->badResponse($e->getMessage(), null);
        }
    }

    public function register(RegisterRequest $request)
    {
        try {
            $response = $this->repository->register($request);
            if ($response->success) {
                return $this->successResponse($response->message, $response->data);
            } else {
                return $this->errorResponse($response->message, $response->data);
            }
        } catch (\Exception $e) {
            return $this->badResponse($e->getMessage(), null);
        }
    }

    public function getuser(Request $request)
    {
        try {
            $response = $this->repository->getUser($request); // Fix the variable name here

            if ($response->success) {
                return $this->successResponse($response->message, $response->data, $response->data->pagination);
            } else {
                return $this->errorResponse($response->message, $response->data);
            }
        } catch (\Exception $e) {
            return $this->badResponse($e->getMessage(), null);
        }
    }

}
