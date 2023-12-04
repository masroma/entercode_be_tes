<?php

namespace App\Repositories\Eloquent\Product;

use App\Http\Controllers\BaseController;
use App\Http\Resources\Product\ProductResource;
use App\Models\Product;
use App\Repositories\Interfaces\Product\ProductRepositoryInterface;

class ProductRepository implements ProductRepositoryInterface
{
    protected $apiController;

    public function __construct(BaseController $apiController)
    {
        $this->apiController = $apiController;
    }


    public function get($request)
    {
        $item_data = Product::first();
        $columns = $item_data ? array_keys($item_data->toArray()) : [];
        $queryFilter = setQueryList($request, $columns, $request->date_range ?? "created_at", $request->id ?? "id");

        $results = Product::select('*')
            ->whereRaw($queryFilter["queryKey"], $queryFilter["queryVal"])
            ->WhereRaw($queryFilter["querySearchKey"], $queryFilter["querySearchVal"])
            ->orderBy($request->orderKey ?? "id", $request->orderBy ?? "desc")
            ->paginate($request->limit ?? 10);

        if ($results) {
            return $this->apiController->trueResult("Data product berhasil di temukan", (object) ["data" => ProductResource::collection($results), "pagination" => setPagination($results)]);
        } else {
            return $this->apiController->falseResult("Data product tidak di temukan", null);
        }
    }

    public function insert($request)
    {

        // upload image
        $image = $request->file('image');
        $image->storeAs('public/product', $image->hashName());


        $input['name']          = $request->name;
        $input['price']          = $request->price;
        $input['qty']          = $request->qty;
        $input['image']         = $image->hashName() ?? NULL;

        $result = Product::create($input);
        if ($result) {
            return $this->apiController->trueResult("Data product berhasil di buat", new ProductResource($result));
        } else {
            return $this->apiController->falseResult("Data product gagal berhasil di buat", null);
        }
    }

    public function getById($id)
    {
        $data = Product::find($id);

        if ($data) {
            return $this->apiController->trueResult("Data product berhasil di temukan", $data);
        } else {
            return $this->apiController->falseResult("Data product tidak di temukan", null);
        }
    }

    public function update($request, $id)
    {

        $result = Product::find($id);

        if ($result) {

            if ($request->file('image')) {

                //remove old image
                Storage::disk('local')->delete('public/product/'.basename($result->image));

                //upload new image
                $image = $request->file('image');
                $image->storeAs('public/product', $image->hashName());

                //update category with new image
                $result->name = $request->name;
                $result->price = $request->price;
                $result->qty = $request->qty;
                $result->image = $image->hashName();



                if ($result->isClean()) {
                    return $this->apiController->falseResult("Tidak ada perubahan data yang anda masukan", null);
                }

                $result = $result->save();

            }

            //update category without image
            $result->name = $request->name;
            $result->price = $request->price;
            $result->qty = $request->qty;

            if ($result->isClean()) {
                return $this->apiController->falseResult("Tidak ada perubahan data yang anda masukan", null);
            }

            $result = $result->save();

            if ($result) {
                $results =  Product::find($id);
                return $this->apiController->trueResult("Product berhasil di update", new ProductResource($results));
            } else {
                return $this->apiController->falseResult("Product tidak di update", null);
            }
        } else {
            return $this->apiController->falseResult("Data tidak di temukan", null);
        }
    }

    public function delete($id)
    {
        $product = Product::find($id);

        if ($product) {
            $deleted = $product->delete();

            if ($deleted) {
                return $this->apiController->trueResult("Product berhasil di delete", null);
            } else {
                return $this->apiController->falseResult("Data product tidak dapat dihapus", null);
            }
        } else {
            return $this->apiController->falseResult("Data product tidak ditemukan", null);
        }
    }






}
