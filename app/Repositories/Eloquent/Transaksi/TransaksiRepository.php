<?php

namespace App\Repositories\Eloquent\Transaksi;

use App\Http\Controllers\BaseController;
use App\Http\Resources\Transaksi\TransaksiResource;
use App\Models\Transaksi;
use App\Models\Cart;
use App\Models\TransaksiDetail;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\DB;

use App\Repositories\Interfaces\Transaksi\TransaksiRepositoryInterface;

class TransaksiRepository implements TransaksiRepositoryInterface
{
    protected $apiController;

    public function __construct(BaseController $apiController)
    {
        $this->apiController = $apiController;
    }


    public function get($request)
    {
        $item_data = Transaksi::first();
        $columns = $item_data ? array_keys($item_data->toArray()) : [];
        $queryFilter = setQueryList($request, $columns, $request->date_range ?? "created_at", $request->id ?? "id");

        $results = Transaksi::with(['DetailTransaksi'])->where('user_id',auth()->guard('api')->user()->id)
            ->whereRaw($queryFilter["queryKey"], $queryFilter["queryVal"])
            ->WhereRaw($queryFilter["querySearchKey"], $queryFilter["querySearchVal"])
            ->orderBy($request->orderKey ?? "id", $request->orderBy ?? "desc")
            ->paginate($request->limit ?? 10);

        if ($results) {
            return $this->apiController->trueResult("Data transaksi berhasil di temukan", (object) ["data" => TransaksiResource::collection($results), "pagination" => setPagination($results)]);
        } else {
            return $this->apiController->falseResult("Data transaksi tidak di temukan", null);
        }
    }



    public function getById($id)
    {
        $data = Transaksi::with(['DetailTransaksi.product'])->find($id);

        if ($data) {
            return $this->apiController->trueResult("Data transaksi berhasil di temukan", $data);
        } else {
            return $this->apiController->falseResult("Data transaksi tidak di temukan", null);
        }
    }

    public function checkout($request)
    {
        try {
            DB::beginTransaction();
                $length = 10;
                $random = '';
                for ($i = 0; $i < $length; $i++) {
                    $random .= rand(0, 1) ? rand(0, 9) : chr(rand(ord('a'), ord('z')));
                }


                $no_invoice = 'TRX-'.Str::upper($random);


                $cart = Cart::with(['DataProducts'])->where('pembeli_id',auth()->guard('api')->user()->id)->get();

                $total = 0;

                foreach ($cart as $item) {

                    // Menghitung total untuk setiap item
                    $itemTotal = $item->qty * $item->dataproducts->price;

                    // Menambahkan total dari item saat ini ke total keseluruhan
                    $total += $itemTotal;

                    // Menambahkan kolom total ke setiap item (jika Anda ingin menyimpan total per item)
                    $item->total = $itemTotal;
                }

                // save transaksi
                $saveTransaksi = new Transaksi();
                $saveTransaksi->invoice = $no_invoice;
                $saveTransaksi->user_id = auth()->guard('api')->user()->id;
                $saveTransaksi->total = $total;
                $saveTransaksi->status = "pending";
                $saveTransaksi->save();

                foreach($cart as $r){
                    $saveDetail = new TransaksiDetail();
                    $saveDetail->transaksi_id = $saveTransaksi->id;
                    $saveDetail->product_id = $r->product_id;
                    $saveDetail->qty = $r->qty;
                    $saveDetail->sub_total = $r->qty * $r->dataproducts->price;
                    $saveDetail->save();
                }

                // delete cart
                $cart = Cart::where('pembeli_id',auth()->guard('api')->user()->id)->delete();

                $result = $saveTransaksi;

                DB::commit();
            return $this->apiController->trueResult("Checkout berhasil", $result);
        } catch (\Exception $e) {
            DB::rollback();
            return $this->apiController->falseResult("Checkout tidak berhasil", null);
        }


    }


}
