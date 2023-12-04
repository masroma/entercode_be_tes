<?php

namespace App\Http\Controllers\Api\Transaksi;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Controllers\BaseController;
use App\Repositories\Interfaces\Transaksi\TransaksiRepositoryInterface;

class TransaksiController extends BaseController
{
    protected $repository; // Fix the variable name here

    public function __construct(TransaksiRepositoryInterface $repository)
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

    public function checkout(Request $request)
    {

        try {
            $response = $this->repository->checkout($request); // Fix the variable name here


            if ($response->success) {
                return $this->successResponse($response->message, $response->data);
            } else {
                return $this->errorResponse($response->message, $response->data);
            }
        } catch (\Exception $e) {
            return $this->badResponse($e->getMessage(), null);
        }
    }
}
