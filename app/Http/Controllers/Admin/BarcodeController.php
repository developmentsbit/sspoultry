<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use DB;

class BarcodeController extends Controller
{

	public function __construct()
	{
		$this->middleware('auth:admin');
		
	}



	public function barcode(){

		$data = DB::table("pdt_productinfo")->where("pdt_status",1)->paginate(50);
		return view("Admin.barcode.barcode",compact('data'));

	}


	public function searchproduct2(Request $request){

		$searchproduct = $request->searchproduct;

		if ($searchproduct == NULL) {
			$data = DB::table('pdt_productinfo')
			->leftjoin('pdt_item','pdt_item.item_id','pdt_productinfo.pdt_item_id')
			->leftjoin('pdt_category','pdt_category.cat_id','pdt_productinfo.pdt_cat_id')
			->leftjoin('pdt_subcategory','pdt_subcategory.subcat_id','pdt_productinfo.pdt_subcat_id')
			->leftjoin('pdt_brand','pdt_brand.brand_id','pdt_productinfo.pdt_brand_id')
			->leftjoin('measurement_unit','measurement_unit.measurement_id','pdt_productinfo.pdt_measurement')
			->select('pdt_productinfo.*','pdt_item.item_name_en','pdt_item.item_name_bn','pdt_category.cat_name_en','pdt_category.cat_name_bn','pdt_subcategory.subcat_name_en','pdt_subcategory.subcat_name_bn','pdt_brand.brand_name_en','pdt_brand.brand_name_bn','measurement_unit.measurement_unit')
			->paginate(50);
		}
		else{
			$data = DB::table('pdt_productinfo')
			->leftjoin('pdt_item','pdt_item.item_id','pdt_productinfo.pdt_item_id')
			->leftjoin('pdt_category','pdt_category.cat_id','pdt_productinfo.pdt_cat_id')
			->leftjoin('pdt_subcategory','pdt_subcategory.subcat_id','pdt_productinfo.pdt_subcat_id')
			->leftjoin('pdt_brand','pdt_brand.brand_id','pdt_productinfo.pdt_brand_id')
			->leftjoin('measurement_unit','measurement_unit.measurement_id','pdt_productinfo.pdt_measurement')
			->select('pdt_productinfo.*','pdt_item.item_name_en','pdt_item.item_name_bn','pdt_category.cat_name_en','pdt_category.cat_name_bn','pdt_subcategory.subcat_name_en','pdt_subcategory.subcat_name_bn','pdt_brand.brand_name_en','pdt_brand.brand_name_bn','measurement_unit.measurement_unit')
			->orwhere('pdt_productinfo.pdt_name_en', 'like', '%' . $searchproduct . '%')
			->orwhere('pdt_productinfo.pdt_name_bn', 'like', '%' . $searchproduct . '%')
			->orwhere('pdt_item.item_name_en', 'like', '%' . $searchproduct . '%')
			->orwhere('pdt_item.item_name_bn', 'like', '%' . $searchproduct . '%')
			->paginate(50);
		}

		
		return view('Admin.barcode.searchproduct2',compact('data'));
	}

	public function generatebarcode(Request $request){

		$product_id = $request->product_id;
		$total   = $request->number;

		if ($product_id) {
			$data = DB::table("pdt_productinfo")->whereIn("pdt_id",$product_id)->get();
		}
		else{
			return redirect()->back();
		}
		
		



		return view("Admin.barcode.generatebarcode",compact('data','total'));
	}


}
