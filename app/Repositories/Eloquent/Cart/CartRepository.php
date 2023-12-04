<?php

namespace App\Repositories\Eloquent\Cart;

use App\Http\Controllers\BaseController;
use App\Http\Resources\Cart\CartResource;
use App\Models\Cart;
use App\Repositories\Interfaces\Cart\CartRepositoryInterface;

class CartRepository implements CartRepositoryInterface
{
    protected $apiController;

    public function __construct(BaseController $apiController)
    {
        $this->apiController = $apiController;
    }

    public function get($request)
    {
        $item_data = Cart::first();
        $columns = $item_data ? array_keys($item_data->toArray()) : [];
        $queryFilter = setQueryList($request, $columns, $request->date_range ?? "created_at", $request->id ?? "id");

        $results = Cart::with(['DataProducts'])->where('pembeli_id',auth()->guard('api')->user()->id)
            ->whereRaw($queryFilter["queryKey"], $queryFilter["queryVal"])
            ->WhereRaw($queryFilter["querySearchKey"], $queryFilter["querySearchVal"])
            ->orderBy($request->orderKey ?? "id", $request->orderBy ?? "desc")
            ->paginate($request->limit ?? 10);

        if ($results) {
            return $this->apiController->trueResult("Data keranjang berhasil di temukan", (object) ["data" => CartResource::collection($results), "pagination" => setPagination($results)]);
        } else {
            return $this->apiController->falseResult("Data keranjang tidak di temukan", null);
        }
    }

    public function insert($request)
    {

        $cekCart = Cart::where('pembeli_id',auth()->guard('api')->user()->id)->where('product_id', $request->product_id)->first();
        if ($cekCart) {
            $cekCart->update([
                'qty'     => $cekCart->qty+1,
            ]);
            if ($cekCart) {
                return $this->apiController->trueResult("Data keranjang berhasil di tambahkan", new CartResource($cekCart));
            } else {
                return $this->apiController->falseResult("Data keranjang gagal  di tambahkan", null);
            }
        }else{
            $input['product_id']          = $request->product_id;
            $input['pembeli_id']          = auth()->guard('api')->user()->id;
            $input['qty']                   = 1;

            $result = Cart::create($input);

            if ($result) {
                return $this->apiController->trueResult("Data keranjang berhasil di tambahkan", new CartResource($result));
            } else {
                return $this->apiController->falseResult("Data keranjang gagal  di tambahkan", null);
            }
        }






    }

    public function total($request)
    {

        $results = Cart::with(['DataProducts'])->where('pembeli_id',auth()->guard('api')->user()->id)->count();

        if ($results) {
            return $this->apiController->trueResult("Total keranjang berhasil di temukan", (object) ["data" => $results, "pagination" => null]);
        } else {
            return $this->apiController->falseResult("Total keranjang tidak di temukan", null);
        }
    }


}
