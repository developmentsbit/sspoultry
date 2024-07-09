<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use DB;
use Auth;

class StockController extends Controller
{

    public function __construct()
    {
        $this->middleware('auth:admin');
        
    }



    public function stocks(){
    	$data = DB::table("stock_products")
    	->where("stock_products.branch_id",Auth('admin')->user()->branch)
    	->join("pdt_productinfo","pdt_productinfo.pdt_id","stock_products.product_id")
    	->select("stock_products.*","pdt_productinfo.pdt_name_en","pdt_productinfo.pdt_name_bn")
    	->paginate(25);
    	return view("Admin.stock.stocks",compact('data'));
    }

    public function searchproductstock(Request $request){

    	$searchproduct = $request->searchproductstock;

    	$data = DB::table("stock_products")
    	->where("stock_products.branch_id",Auth('admin')->user()->branch)
    	->join("pdt_productinfo","pdt_productinfo.pdt_id","stock_products.product_id")
    	->select("stock_products.*","pdt_productinfo.pdt_name_en","pdt_productinfo.pdt_name_bn")
    	->where('pdt_productinfo.pdt_name_en', 'like', '%' . $searchproduct . '%')
    	->paginate(25);
    	return view("Admin.stock.searchproductstock",compact('data'));

    }
    
    
       public function stockreports(){
        $data = DB::table("stock_products")
        ->where("stock_products.branch_id",Auth('admin')->user()->branch)
        ->join("pdt_productinfo","pdt_productinfo.pdt_id","stock_products.product_id")
        ->select("stock_products.*","pdt_productinfo.pdt_name_en","pdt_productinfo.pdt_name_bn","pdt_productinfo.pdt_id")
        ->get();
        return view("Admin.stock.stockreports",compact('data'));
    }
}
