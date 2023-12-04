<?php

namespace App\Http\Controllers\Api\Product;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Controllers\BaseController;
use App\Http\Requests\Product\ProductRequest;
use App\Repositories\Interfaces\Product\ProductRepositoryInterface;
use Illuminate\Support\Facades\DB;

class ProductController extends BaseController
{
    protected $repository; // Fix the variable name here

    public function __construct(ProductRepositoryInterface $repository)
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

    public function store(ProductRequest $request)
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

    public function edit($id)
    {
        try {
            $response = $this->repository->getById($id);
            if ($response->success) {
                return $this->successResponse($response->message, $response->data);
            } else {
                return $this->errorResponse($response->message, $response->data);
            }
        } catch (\Exception $e) {
            return $this->badResponse($e->getMessage(), null);
        }
    }

    public function update(ProductRequest $request, $id)
    {
        try {
            $response = $this->repository->update($request, $id);
            if ($response->success) {
                return $this->successResponse($response->message, $response->data);
            } else {
                return $this->errorResponse($response->message, $response->data);
            }
        } catch (\Exception $e) {
            return $this->badResponse($e->getMessage(), null);
        }
    }

    public function destroy(Request $request, $id)
    {
        try {

                $response = $this->repository->delete($id);

                if ($response->success) {
                    return $this->successResponse($response->message, $response->data);
                } else {
                    return $this->errorResponse($response->message, $response->data);
                }

        } catch (\Exception $e) {
            return $this->errorResponse($e->getMessage(), $e);
        }
    }
}
