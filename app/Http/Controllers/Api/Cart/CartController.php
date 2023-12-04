<?php

namespace App\Http\Controllers\Api\Cart;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Controllers\BaseController;
use App\Http\Requests\Cart\CartRequest;
use App\Repositories\Interfaces\Cart\CartRepositoryInterface;

class CartController extends BaseController
{
    protected $repository; // Fix the variable name here

    public function __construct(CartRepositoryInterface $repository)
    {
        $this->repository = $repository; // Fix the variable name here
    }

    public function index(Request $request)
    {
        try {
            $response = $this->repository->get($request); // Fix the variable name here

            if ($response->success) {
                return $this->successResponse($response->message, $response->data->data, $response->data->pagination);
            } else {
                return $this->errorResponse($response->message, $response->data);
            }
        } catch (\Exception $e) {
            return $this->badResponse($e->getMessage(), null);
        }
    }

    public function store(CartRequest $request)
    {
        try {
            $response = $this->repository->insert($request);
            if ($response->success) {
                return $this->successResponse($response->message, $response->data);
            } else {
                return $this->errorResponse($response->message, $response->data);
            }
        } catch (\Exception $e) {
            return $this->badResponse($e->getMessage(), null);
        }
    }

    public function total(Request $request)
    {
        try {
            $response = $this->repository->total($request); // Fix the variable name here

            if ($response->success) {
                return $this->successResponse($response->message, $response->data->data, $response->data->pagination);
            } else {
                return $this->errorResponse($response->message, $response->data);
            }
        } catch (\Exception $e) {
            return $this->badResponse($e->getMessage(), null);
        }
    }

}
