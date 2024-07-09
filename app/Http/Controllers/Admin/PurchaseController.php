<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Haruncpi\LaravelIdGenerator\IdGenerator;
use DB;
use Session;

class PurchaseController extends Controller
{

	public function __construct()
	{
		$this->middleware('auth:admin');
		
	}



	public function purchase(){

		
		return view('Admin.purchase.purchase');
	}



	public function purchaseproductcart(Request $request,$id)
	{

		$session_id   = Session::getId();
		$checkproduct = DB::table('pdt_productinfo')->where('pdt_id',$id)->first();


		$checkaddproduct = DB::table('purchase_current')->where('purchase_current.session_id',$session_id)->where('purchase_current.pdt_id',$id)->first();

		if ($checkaddproduct) 
		{

			DB::table('purchase_current')->where('pdt_id',$id)
			->update([
				'purchase_quantity'=>$checkaddproduct->purchase_quantity+1
			]);


		}
		else
		{

			DB::table('purchase_current')->insert([
				'pdt_id'             => $id,
				'sub_unit_id'        => $checkproduct->pdt_measurement,
				'purchase_quantity'  => '1',
				'purchase_price'     => $checkproduct->pdt_purchase_price,
				'discount_amount'    => 0.00,
				'per_unit_cost'      => 0.00,
				'sale_price_per_unit'=> $checkproduct->pdt_sale_price,
				'session_id'         => $session_id,
				'admin_id'           => Auth('admin')->user()->id,
			]);

		}



	}





	public function purchaseproductcart2(Request $request,$barcode)
	{

		$session_id   = Session::getId();
		$checkproduct = DB::table('pdt_productinfo')->where('barcode',$barcode)->first();


		$checkaddproduct = DB::table('purchase_current')->where('purchase_current.session_id',$session_id)->where('purchase_current.pdt_id',$checkproduct->pdt_id)->first();

		if ($checkaddproduct) 
		{

			DB::table('purchase_current')->where('pdt_id',$checkproduct->pdt_id)
			->update([
				'purchase_quantity'=>$checkaddproduct->purchase_quantity+1
			]);


		}
		else
		{

			DB::table('purchase_current')->insert([
				'pdt_id'             => $checkproduct->pdt_id,
				'sub_unit_id'        => $checkproduct->pdt_measurement,
				'purchase_quantity'  => '1',
				'purchase_price'     => $checkproduct->pdt_purchase_price,
				'discount_amount'    => 0.00,
				'per_unit_cost'      => 0.00,
				'sale_price_per_unit'=> $checkproduct->pdt_sale_price,
				'session_id'         => $session_id,
				'admin_id'           => Auth('admin')->user()->id,
			]);

		}



	}














	public function showpurchaseproductcart(){
		$session_id   = Session::getId();
		$data = DB::table('purchase_current')
		->where('purchase_current.session_id',$session_id)
		->join('pdt_productinfo','pdt_productinfo.pdt_id','purchase_current.pdt_id')
		->select('purchase_current.*','pdt_productinfo.pdt_name_en','pdt_productinfo.pdt_name_bn','pdt_productinfo.pdt_sale_price')
		->get();

		return view('Admin.purchase.showpurchaseproductcart',compact('data'));
	}




	public function qtyupdate(Request $request,$id){
		$session_id   = Session::getId();
		$data = DB::table('purchase_current')
		->where('purchase_current.session_id',$session_id)
		->where('purchase_current.id',$id)
		->update([

			'purchase_quantity' => $request->purchase_quantity

		]);

	}




	


	public function deletepurchasecartproduct($id){
		$session_id   = Session::getId();
		$data = DB::table('purchase_current')
		->where('purchase_current.session_id',$session_id)
		->where('purchase_current.id',$id)
		->delete();

	}


	public function salepriceupdate(Request $request,$id){


		$session_id   = Session::getId();
		$data = DB::table('purchase_current')
		->where('purchase_current.session_id',$session_id)
		->where('purchase_current.id',$id)
		->update([

			'sale_price_per_unit' => $request->sale_price_per_unit

		]);

	}


	public function purchasepriceupdate(Request $request,$id){
		$session_id   = Session::getId();
		$data = DB::table('purchase_current')
		->where('purchase_current.session_id',$session_id)
		->where('purchase_current.id',$id)
		->update([

			'purchase_price' => $request->purchase_price

		]);

	}


	public function purchasepricedicount(Request $request,$id){
		$session_id   = Session::getId();
		$data = DB::table('purchase_current')
		->where('purchase_current.session_id',$session_id)
		->where('purchase_current.id',$id)
		->update([

			'discount_amount' => $request->discount_amount

		]);

	}







	public function purchasecost(Request $request,$id){
		$session_id   = Session::getId();
		$data = DB::table('purchase_current')
		->where('purchase_current.session_id',$session_id)
		->where('purchase_current.id',$id)
		->update([

			'per_unit_cost' => $request->purchasecost

		]);

	}


	




	public function purchaseledger(Request $request){


		if (isset($request->draftpurchase)) {
			
			$session_id   = Session::getId();
			$data = DB::table('purchase_current')
			->where('purchase_current.session_id',$session_id)
			->get();

			$invoice_no = IdGenerator::generate(['table' => 'draft_purchase_ledger', 'field'=>'invoice_no','length' => 12, 'prefix' =>'DP-']);



			foreach ($data as $d) {
				DB::table("draft_purchase_entry")->insert([
					'invoice_no'        => $invoice_no,
					'product_id'        => $d->pdt_id,
					'sub_unit_id'       => $d->sub_unit_id,
					'product_quantity'  => $d->purchase_quantity,
					'purchase_price'    => $d->purchase_price,
					'per_unit_cost'     => $d->per_unit_cost,
					'discount_amount'   => $d->discount_amount,
					'sale_price_unit'   => $d->sale_price_per_unit,
					'admin_id'          => Auth('admin')->user()->id,
					'branch_id'         => Auth('admin')->user()->branch,


				]);


			}  


			$explode = explode('/',$request->invoice_date);
			$invoice_date = $explode[2].'-'.$explode[0].'-'.$explode[1]; 


			DB::table("draft_purchase_ledger")->insert([
				'invoice_no'       => $invoice_no,
				'voucher_no'       => $request->voucher_no,
				'voucher_date'     => $invoice_date,
				'invoice_date'     => $invoice_date,
				'suplier_id'       => $request->supplier_id,
				'total'            => $request->totalamount,
				'paid'             => $request->paid,
				'discount'         => $request->discount,
				'transaction_type' => $request->transaction_type,
				'entry_date'       => date('Y-m-d'),
				'admin_id'         => Auth('admin')->user()->id,
				'branch_id'        => Auth('admin')->user()->branch,


			]);


			DB::table("draft_supplier_payment")->insert([
				'invoice_no'       => $invoice_no,
				'payment_date'     => $invoice_date,
				'entry_date'	   => date('Y-m-d'),
				'suplier_id'       => $request->supplier_id,
				'return_amount'    => "0.00",
				'payment'          => $request->paid,
				'payment_type'     => $request->transaction_type,
				'comment'          => "firstpayment",
				'admin_id'         => Auth('admin')->user()->id,
				'branch_id'        => Auth('admin')->user()->branch,


			]);


			DB::table('purchase_current')->where('session_id',$session_id)->delete();
			Session::regenerate();



			// return redirect('invoicepurchase2/'.$invoice_no);

			return response()->json($invoice_no);
		}
		else{



			$session_id   = Session::getId();
			$data = DB::table('purchase_current')
			->where('purchase_current.session_id',$session_id)
			->get();

			$invoice_no = IdGenerator::generate(['table' => 'purchase_ledger', 'field'=>'invoice_no','length' => 10, 'prefix' =>'PI-']);



			foreach ($data as $d) {
				DB::table("purchase_entry")->insert([
					'invoice_no'        => $invoice_no,
					'product_id'        => $d->pdt_id,
					'sub_unit_id'       => $d->sub_unit_id,
					'product_quantity'  => $d->purchase_quantity,
					'purchase_price'    => $d->purchase_price,
					'per_unit_cost'     => $d->per_unit_cost,
					'discount_amount'   => $d->discount_amount,
					'admin_id'          => Auth('admin')->user()->id,
					'branch_id'         => Auth('admin')->user()->branch,


				]);

				$checkstockproduct =  DB::table("stock_products")->where("product_id",$d->pdt_id)->where("branch_id",Auth('admin')->user()->branch)->first();

				$qtysum =  DB::table("stock_products")->where("product_id",$d->pdt_id)->where("branch_id",Auth('admin')->user()->branch)->sum("quantity");



				if ($checkstockproduct) {
					DB::table("stock_products")->where("product_id",$d->pdt_id)->where("branch_id",Auth('admin')->user()->branch)->update([
						'quantity'                =>  $qtysum+$d->purchase_quantity,
						'purchase_price'          =>  $d->purchase_price-$d->discount_amount,
						'purchase_price_withcost' =>  ($d->purchase_price+$d->per_unit_cost)-$d->discount_amount,
						'sale_price'              =>  $d->sale_price_per_unit,

					]);
				}
				else{
					DB::table("stock_products")->insert([
						'invoice_no'              =>  $invoice_no,
						'product_id'              =>  $d->pdt_id,
						'quantity'                =>  $d->purchase_quantity,
						'purchase_price'          =>  $d->purchase_price-$d->discount_amount,
						'purchase_price_withcost' =>  ($d->purchase_price+$d->per_unit_cost)-$d->discount_amount,
						'sale_price'              =>  $d->sale_price_per_unit,
						'branch_id'               =>  Auth('admin')->user()->branch,
					]);
				}


			}  


			$explode = explode('/',$request->invoice_date);
			$invoice_date = $explode[2].'-'.$explode[0].'-'.$explode[1]; 


			DB::table("purchase_ledger")->insert([
				'invoice_no'       => $invoice_no,
				'voucher_no'       => $request->voucher_no,
				'voucher_date'     => $invoice_date,
				'invoice_date'     => $invoice_date,
				'suplier_id'       => $request->supplier_id,
				'total'            => $request->totalamount,
				'paid'             => $request->paid,
				'discount'         => $request->discount,
				'transaction_type' => $request->transaction_type,
				'entry_date'       => date('Y-m-d'),
				'admin_id'         => Auth('admin')->user()->id,
				'branch_id'        => Auth('admin')->user()->branch,


			]);


			DB::table("supplier_payment")->insert([
				'invoice_no'       => $invoice_no,
				'payment_date'     => $invoice_date,
				'entry_date'	   => date('Y-m-d'),
				'suplier_id'       => $request->supplier_id,
				'return_amount'    => "0.00",
				'payment'          => $request->paid,
				'payment_type'     => $request->transaction_type,
				'comment'          => "firstpayment",
				'admin_id'         => Auth('admin')->user()->id,
				'branch_id'        => Auth('admin')->user()->branch,


			]);


			DB::table('purchase_current')->where('session_id',$session_id)->delete();
			Session::regenerate();



			return response()->json($invoice_no);

		}


	}

	public function invoicepurchase($id){

		$data = DB::table('purchase_ledger')
		->where("purchase_ledger.invoice_no",$id)
		->join("supplier_info",'supplier_info.supplier_id','purchase_ledger.suplier_id')
		->join("admins",'admins.id','purchase_ledger.admin_id')
		->select("purchase_ledger.*",'supplier_info.supplier_company_name','supplier_info.supplier_company_phone','admins.name')
		->first();

		$product = DB::table("purchase_entry")
		->where("purchase_entry.invoice_no",$data->invoice_no)
		->join("pdt_productinfo",'pdt_productinfo.pdt_id','purchase_entry.product_id')
		->get();

		return view("Admin.purchase.invoicepurchase",compact('data','product'));
	}


	public function invoicepurchase2($id){

		$data = DB::table('draft_purchase_ledger')
		->where("draft_purchase_ledger.invoice_no",$id)
		->join("supplier_info",'supplier_info.supplier_id','draft_purchase_ledger.suplier_id')
		->join("admins",'admins.id','draft_purchase_ledger.admin_id')
		->select("draft_purchase_ledger.*",'supplier_info.supplier_company_name','supplier_info.supplier_company_phone','admins.name')
		->first();

		$product = DB::table("draft_purchase_entry")
		->where("draft_purchase_entry.invoice_no",$data->invoice_no)
		->join("pdt_productinfo",'pdt_productinfo.pdt_id','draft_purchase_entry.product_id')
		->get();

		return view("Admin.purchase.invoicepurchase",compact('data','product'));
	}


	public function allpurchaseledger(){

		$data = DB::table('purchase_ledger')
		->join("supplier_info",'supplier_info.supplier_id','purchase_ledger.suplier_id')
		->join("admins",'admins.id','purchase_ledger.admin_id')
		->select("purchase_ledger.*",'supplier_info.supplier_company_name','supplier_info.supplier_company_phone','admins.name')
		->orderBy("purchase_ledger.id",'DESC')
		->where("purchase_ledger.branch_id",Auth('admin')->user()->branch)
		->limit(25)
		->get();


		return view("Admin.purchase.allpurchaseledger",compact('data'));
	}



	public function alldraftpurchase(){

		$data = DB::table('draft_purchase_ledger')
		->join("supplier_info",'supplier_info.supplier_id','draft_purchase_ledger.suplier_id')
		->join("admins",'admins.id','draft_purchase_ledger.admin_id')
		->select("draft_purchase_ledger.*",'supplier_info.supplier_company_name','supplier_info.supplier_company_phone','admins.name')
		->orderBy("draft_purchase_ledger.id",'DESC')
		->where("draft_purchase_ledger.branch_id",Auth('admin')->user()->branch)
		->get();


		return view("Admin.purchase.alldraftpurchase",compact('data'));
	}


	public function deletedraftpurchaseledger($id){

		$data = DB::table('draft_purchase_ledger')
		->where("id",$id)
		->first();

		DB::table('draft_purchase_ledger')
		->where("id",$id)
		->delete();

		DB::table("purchase_entry")
		->where("invoice_no",$data->invoice_no)
		->delete();

		DB::table("supplier_payment")
		->where("invoice_no",$data->invoice_no)
		->delete();

	}


	public function confirmdraftpurchase($id){




		$invoice_no = IdGenerator::generate(['table' => 'purchase_ledger', 'field'=>'invoice_no','length' => 10, 'prefix' =>'P-']);

		$purchaseentry = DB::table("draft_purchase_entry")->where("invoice_no",$id)->where("branch_id",Auth("admin")->user()->branch)->get();

		$purchaseledger = DB::table("draft_purchase_ledger")->where("invoice_no",$id)->where("branch_id",Auth("admin")->user()->branch)->first();

		

		foreach ($purchaseentry as $d) {
			DB::table("purchase_entry")->insert([
				'invoice_no'        => $invoice_no,
				'product_id'        => $d->product_id,
				'sub_unit_id'       => $d->sub_unit_id,
				'product_quantity'  => $d->product_quantity,
				'purchase_price'    => $d->purchase_price,
				'per_unit_cost'     => $d->per_unit_cost,
				'discount_amount'   => $d->discount_amount,
				'admin_id'          => Auth('admin')->user()->id,
				'branch_id'         => Auth('admin')->user()->branch,


			]);

			$checkstockproduct =  DB::table("stock_products")->where("product_id",$d->product_id)->where("branch_id",Auth('admin')->user()->branch)->first();

			$qtysum =  DB::table("stock_products")->where("product_id",$d->product_id)->where("branch_id",Auth('admin')->user()->branch)->sum("quantity");



			if ($checkstockproduct) {
				DB::table("stock_products")->where("product_id",$d->product_id)->where("branch_id",Auth('admin')->user()->branch)->update([
					'quantity'                =>  $qtysum+$d->product_quantity,
					'purchase_price'          =>  $d->purchase_price-$d->discount_amount,
					'purchase_price_withcost' =>  ($d->purchase_price+$d->per_unit_cost)-$d->discount_amount,
					'sale_price'              =>  $d->sale_price_unit,

				]);
			}
			else{
				DB::table("stock_products")->insert([
					'invoice_no'              =>  $invoice_no,
					'product_id'              =>  $d->product_id,
					'quantity'                =>  $d->product_quantity,
					'purchase_price'          =>  $d->purchase_price-$d->discount_amount,
					'purchase_price_withcost' =>  ($d->purchase_price+$d->per_unit_cost)-$d->discount_amount,
					'sale_price'              =>  $d->sale_price_unit,
					'branch_id'               =>  Auth('admin')->user()->branch,
				]);
			}


		}  



		DB::table("purchase_ledger")->insert([
			'invoice_no'       => $invoice_no,
			'voucher_no'       => $purchaseledger->voucher_no,
			'voucher_date'     => $purchaseledger->invoice_date,
			'invoice_date'     => $purchaseledger->invoice_date,
			'suplier_id'       => $purchaseledger->suplier_id,
			'total'            => $purchaseledger->total,
			'paid'             => $purchaseledger->paid,
			'discount'         => $purchaseledger->discount,
			'transaction_type' => $purchaseledger->transaction_type,
			'entry_date'       => date('Y-m-d'),
			'admin_id'         => Auth('admin')->user()->id,
			'branch_id'        => Auth('admin')->user()->branch,


		]);


		DB::table("supplier_payment")->insert([
			'invoice_no'       => $invoice_no,
			'payment_date'     => $purchaseledger->invoice_date,
			'entry_date'	   => date('Y-m-d'),
			'suplier_id'       => $purchaseledger->suplier_id,
			'return_amount'    => "0.00",
			'payment'          => $purchaseledger->paid,
			'payment_type'     => $purchaseledger->transaction_type,
			'comment'          => "firstpayment",
			'admin_id'         => Auth('admin')->user()->id,
			'branch_id'        => Auth('admin')->user()->branch,


		]);

		DB::table("draft_purchase_entry")->where("invoice_no",$id)->delete();
		DB::table("draft_purchase_ledger")->where("invoice_no",$id)->delete();
		DB::table("draft_supplier_payment")->where("invoice_no",$id)->delete();

		return redirect()->back();
	}


	public function deletepurchaseledger($id){

		// dd($id);

		$data = DB::table('purchase_ledger')
		->where("id",$id)
		->first();


		DB::table('purchase_ledger')
		->where("id",$id)
		->delete();

		$pdt_info = DB::table('purchase_entry')->where('invoice_no',$data->invoice_no)->get();

		foreach ($pdt_info as $p) {
			$current_stock = DB::table('stock_products')->where('product_id',$p->product_id)->first();
			$updated_stock = $current_stock->quantity - $p->product_quantity;

			DB::table('stock_products')
			->where('product_id',$p->product_id)->update([
				'quantity' => $updated_stock
			]);
		}

		DB::table("purchase_entry")
		->where("invoice_no",$data->invoice_no)
		->delete();

		DB::table("supplier_payment")
		->where("invoice_no",$data->invoice_no)
		->delete();


		// DB::table("stock_products")
		// ->where("invoice_no",$data->invoice_no)
		// ->delete();


	}


	public function searchpurchaseinvoice(Request $r){

		$fromdate   = $r->fromdate;
		$todate     = $r->todate;

		$explode = explode('/',$r->fromdate);
		$fromdates = $explode[2].'-'.$explode[0].'-'.$explode[1]; 

		$explode = explode('/',$r->todate);
		$todates = $explode[2].'-'.$explode[0].'-'.$explode[1]; 

		if($fromdates != "" && $todates != ""){
			$data = DB::table('purchase_ledger')
			->whereBetween("purchase_ledger.invoice_date",array($fromdates,$todates))
			->join("supplier_info",'supplier_info.supplier_id','purchase_ledger.suplier_id')
			->select("purchase_ledger.*",'supplier_info.supplier_company_name','supplier_info.supplier_company_phone')
			->where("purchase_ledger.branch_id",Auth('admin')->user()->branch)
			->get();

		}


		return view("Admin.purchase.searchpurchaseinvoice",compact('data'));

	}





	public function searchpurchaseinvoice2(Request $r){


		$invoice_no = $r->invoice_no;


		$data = DB::table('purchase_ledger')
		->where("purchase_ledger.invoice_no",$invoice_no)
		->join("supplier_info",'supplier_info.supplier_id','purchase_ledger.suplier_id')
		->select("purchase_ledger.*",'supplier_info.supplier_company_name','supplier_info.supplier_company_phone')
		->where("purchase_ledger.branch_id",Auth('admin')->user()->branch)
		->get();

		return view("Admin.purchase.searchpurchaseinvoice",compact('data'));

	}



	public function allpurchaseledgerreports(){

		return view("Admin.purchase.allpurchaseledgerreports");

	}



	public function purchaseledgerreports(Request $request){

		$suplier_id = $request->suplier_id;
		$type       = $request->Type;
		$date1      = $request->start_date;
		$date2      = $request->end_date;
		$month      = $request->month;
		$year       = $request->year;


		if ($request->suplier_id == "All") {
			
			if ($type == 1) {

				$data = DB::table('purchase_ledger')
				->join("supplier_info",'supplier_info.supplier_id','purchase_ledger.suplier_id')
				->select("purchase_ledger.*",'supplier_info.supplier_company_name','supplier_info.supplier_company_phone')
				->where("purchase_ledger.invoice_date",$date1)
				->where("purchase_ledger.branch_id",Auth('admin')->user()->branch)
				->get();
			}

			elseif($type == 2){
				$data = DB::table('purchase_ledger')
				->join("supplier_info",'supplier_info.supplier_id','purchase_ledger.suplier_id')
				->select("purchase_ledger.*",'supplier_info.supplier_company_name','supplier_info.supplier_company_phone')
				->whereBetween("purchase_ledger.invoice_date",array($date1,$date2))
				->where("purchase_ledger.branch_id",Auth('admin')->user()->branch)
				->get();
			}


			elseif($type == 3){
				$data = DB::table('purchase_ledger')
				->join("supplier_info",'supplier_info.supplier_id','purchase_ledger.suplier_id')
				->select("purchase_ledger.*",'supplier_info.supplier_company_name','supplier_info.supplier_company_phone')
				->whereMonth("purchase_ledger.invoice_date",$month)
				->whereYear("purchase_ledger.invoice_date",$year)
				->where("purchase_ledger.branch_id",Auth('admin')->user()->branch)
				->get();
			}


			elseif($type == 4){
				$data = DB::table('purchase_ledger')
				->join("supplier_info",'supplier_info.supplier_id','purchase_ledger.suplier_id')
				->select("purchase_ledger.*",'supplier_info.supplier_company_name','supplier_info.supplier_company_phone')
				->whereYear("purchase_ledger.invoice_date",$year)
				->where("purchase_ledger.branch_id",Auth('admin')->user()->branch)
				->get();


			}



		}
		else{


			if ($type == 1) {

				$data = DB::table('purchase_ledger')
				->join("supplier_info",'supplier_info.supplier_id','purchase_ledger.suplier_id')
				->select("purchase_ledger.*",'supplier_info.supplier_company_name','supplier_info.supplier_company_phone')
				->where("purchase_ledger.invoice_date",$date1)
				->where("purchase_ledger.suplier_id",$suplier_id)
				->where("purchase_ledger.branch_id",Auth('admin')->user()->branch)
				->get();
			}

			elseif($type == 2){
				$data = DB::table('purchase_ledger')
				->join("supplier_info",'supplier_info.supplier_id','purchase_ledger.suplier_id')
				->select("purchase_ledger.*",'supplier_info.supplier_company_name','supplier_info.supplier_company_phone')
				->whereBetween("purchase_ledger.invoice_date",array($date1,$date2))
				->where("purchase_ledger.suplier_id",$suplier_id)
				->where("purchase_ledger.branch_id",Auth('admin')->user()->branch)
				->get();
			}


			elseif($type == 3){
				$data = DB::table('purchase_ledger')
				->join("supplier_info",'supplier_info.supplier_id','purchase_ledger.suplier_id')
				->select("purchase_ledger.*",'supplier_info.supplier_company_name','supplier_info.supplier_company_phone')
				->whereMonth("purchase_ledger.invoice_date",$month)
				->whereYear("purchase_ledger.invoice_date",$year)
				->where("purchase_ledger.suplier_id",$suplier_id)
				->where("purchase_ledger.branch_id",Auth('admin')->user()->branch)
				->get();
			}


			elseif($type == 4){
				$data = DB::table('purchase_ledger')
				->join("supplier_info",'supplier_info.supplier_id','purchase_ledger.suplier_id')
				->select("purchase_ledger.*",'supplier_info.supplier_company_name','supplier_info.supplier_company_phone')
				->whereYear("purchase_ledger.invoice_date",$year)
				->where("purchase_ledger.suplier_id",$suplier_id)
				->where("purchase_ledger.branch_id",Auth('admin')->user()->branch)
				->get();


			}


		}




		return view("Admin.purchase.purchaseledgerreports",compact('data','type','date1','date2','month','year'));

	}
	


	public function purchasepayment(){
		return view('Admin.purchase.purchasepayment');
	}


	public function purchasepaymententry(Request $r){

		$explode = explode('/',$r->payment_date);
		$payment_date = $explode[2].'-'.$explode[0].'-'.$explode[1]; 


		DB::table("supplier_payment")->insert([

			'payment_date'   => $payment_date,
			'suplier_id'     => $r->suplier_id,
			'payment'        => $r->payment,
			'discount'       => $r->discount,
			'payment_type'   => $r->payment_type,
			'return_amount'  => 0.00,
			'entry_date'     => date('Y-m-d'),
			'comment'        => $r->comment,
			'admin_id'       => Auth('admin')->user()->id,
			'branch_id'      => Auth('admin')->user()->branch,
			'transaction_type'=>'DuePaid',

		]);
	}


	public function purchasepaymentlist(){
		$data = DB::table("supplier_payment")
		->join('supplier_info','supplier_info.supplier_id','supplier_payment.suplier_id')
		->select("supplier_payment.*",'supplier_info.supplier_company_name','supplier_info.supplier_company_phone')
		->where("supplier_payment.branch_id",Auth('admin')->user()->branch)
		->get();
		return view("Admin.purchase.purchasepaymentlist", compact('data'));
	}


	public function deletepurchaseentry($id){
		DB::table("supplier_payment")->where("id",$id)->delete();
	}


	public function editpurchasepaymententry($id){

		$data = DB::table("supplier_payment")->where("id",$id)->first();

		$total        = DB::table("purchase_ledger")->where("suplier_id",$data->suplier_id)->sum('total');
		$discount     = DB::table("purchase_ledger")->where("suplier_id",$data->suplier_id)->sum('discount');
		$grandtotal   = $total-$discount;
		$paid         = DB::table("supplier_payment")->where("suplier_id",$data->suplier_id)->sum('payment');

		$finaldiscount   = DB::table("supplier_payment")->where("suplier_id",$data->suplier_id)->sum('discount');
		$purchasereturn   = DB::table("supplier_payment")->where("suplier_id",$id)->sum('return_amount');

		$pd   = DB::table("supplier_payment")->where("suplier_id",$id)->where("comment","PD")->sum('previous_due');

		$stotaldue   = ($grandtotal-$paid)-$finaldiscount;
		$totaldue = ($stotaldue+$pd)-$purchasereturn;

		$supplier_phone   = DB::table("supplier_info")->where("supplier_id",$data->suplier_id)->first();

		return view("Admin.purchase.editpurchasepaymententry",compact('data','totaldue','supplier_phone'));
	}



	public function updatepurchasepayment(Request $r,$id){

		$explode = explode('/',$r->payment_date);
		$payment_date = $explode[2].'-'.$explode[0].'-'.$explode[1];


		DB::table("supplier_payment")->where("id",$id)->update([

			'payment_date'   => $payment_date,
			'suplier_id'     => $r->suplier_id,
			'payment'        => $r->payment,
			'discount'       => $r->discount,
			'payment_type'   => $r->payment_type,
			'return_amount'  => 0.00,
			'entry_date'     => date('Y-m-d'),
			'comment'        => $r->comment,
			'admin_id'       => Auth('admin')->user()->id,
			'branch_id'      => Auth('admin')->user()->branch,

		]);
	}


	public function getsuplierpreviousdue($id){

		$total      = DB::table("purchase_ledger")->where("suplier_id",$id)->sum('total');
		$discount   = DB::table("purchase_ledger")->where("suplier_id",$id)->sum('discount');
		$grandtotal = $total-$discount;
		$paid       = DB::table("supplier_payment")->where("suplier_id",$id)->sum('payment');
		$finaldiscount   = DB::table("supplier_payment")->where("suplier_id",$id)->sum('discount');

		$purchasereturn   = DB::table("supplier_payment")->where("suplier_id",$id)->sum('return_amount');
		$pd   = DB::table("supplier_payment")->where("suplier_id",$id)->where("comment","PD")->sum('previous_due');
		$totaldue   = ($grandtotal-$paid)-$finaldiscount ;

		$stotaldue = ($totaldue+$pd)-$purchasereturn;



		return response()->json($stotaldue);

	}
	
	
	
	public function getpreviousdues($id){

		$total      = DB::table("purchase_ledger")->where("suplier_id",$id)->sum('total');
		$discount   = DB::table("purchase_ledger")->where("suplier_id",$id)->sum('discount');
		$grandtotal = $total-$discount;
		$paid       = DB::table("supplier_payment")->where("suplier_id",$id)->sum('payment');
		$finaldiscount   = DB::table("supplier_payment")->where("suplier_id",$id)->sum('discount');

		$purchasereturn   = DB::table("supplier_payment")->where("suplier_id",$id)->sum('return_amount');
		$pd   = DB::table("supplier_payment")->where("suplier_id",$id)->where("comment","PD")->sum('previous_due');
		$totaldue   = ($grandtotal-$paid)-$finaldiscount ;

		$stotaldue = ($totaldue+$pd)-$purchasereturn;



		return response()->json(intval($stotaldue));

	}
	



	public function purchasepaymentinvoice($id){
		$data = DB::table("supplier_payment")
		->where("supplier_payment.id",$id)
		->join('supplier_info','supplier_info.supplier_id','supplier_payment.suplier_id')
		->select("supplier_payment.*",'supplier_info.supplier_company_name','supplier_info.supplier_company_phone')
		->first();


		return view('Admin.purchase.purchasepaymentinvoice', compact('data'));
	}

	public function editdraftpurchase($invoice_no){

		$draftdata = DB::table("draft_purchase_entry")->where('invoice_no',$invoice_no)->get();


		$session_id   = Session::getId();

		foreach ($draftdata as $data) {
			DB::table("purchase_current")->insert([

				'pdt_id'             => $data->product_id,
				'sub_unit_id'        => $data->sub_unit_id,
				'purchase_quantity'  => $data->product_quantity,
				'purchase_price'     => $data->purchase_price,
				'discount_amount'    => $data->discount_amount,
				'per_unit_cost'      => $data->per_unit_cost,
				'sale_price_per_unit'=> $data->sale_price_unit,
				'session_id'         => $session_id,
				'admin_id'           => Auth('admin')->user()->id,


			]);
		}

		return redirect("/purchase");

		

	}

	public function alldraftpurchasepayment(){
		$data = DB::table("draft_supplier_payment")
		->join('supplier_info','supplier_info.supplier_id','draft_supplier_payment.suplier_id')
		->select("draft_supplier_payment.*",'supplier_info.supplier_company_name','supplier_info.supplier_company_phone')
		->where("draft_supplier_payment.branch_id",Auth('admin')->user()->branch)
		->where("draft_supplier_payment.invoice_no",Null)
		->get();
		return view("Admin.purchase.draftpurchasepaymentlist", compact('data'));
	}


	public function deletedraftpurchaseentry($id){
		DB::table("draft_supplier_payment")->where("id",$id)->delete();
	}



	public function confirmdraftpurchasepayment($id){

		$data = DB::table("draft_supplier_payment")->where("id",$id)->first();

		DB::table("supplier_payment")->insert([
			'payment_date'   => $data->payment_date,
			'suplier_id'     => $data->suplier_id,
			'payment'        => $data->payment,
			'discount'       => $data->discount,
			'payment_type'   => $data->payment_type,
			'return_amount'  => 0.00,
			'entry_date'     => date('Y-m-d'),
			'comment'        => $data->comment,
			'admin_id'       => $data->admin_id,
			'branch_id'      => $data->branch_id,

		]);

		DB::table("draft_supplier_payment")->where("id",$id)->delete();

		return redirect()->back();

	}





	public function purchasereturn(){

		
		return view('Admin.purchase.purchasereturn');
	}



	public function returnpurchaseproductcart(Request $request,$id)
	{

		$session_id   = Session::getId();
		$checkproduct = DB::table('pdt_productinfo')->where('pdt_id',$id)->first();


		$checkaddproduct = DB::table('return_purchase_current')->where('return_purchase_current.session_id',$session_id)->where('return_purchase_current.pdt_id',$id)->first();

		if ($checkaddproduct) 
		{

			DB::table('return_purchase_current')->where('pdt_id',$id)
			->update([
				'purchase_quantity'=>$checkaddproduct->purchase_quantity+1
			]);


		}
		else
		{

			DB::table('return_purchase_current')->insert([
				'pdt_id'             => $id,
				'sub_unit_id'        => $checkproduct->pdt_measurement,
				'purchase_quantity'  => '1',
				'purchase_price'     => $checkproduct->pdt_purchase_price,
				'discount_amount'    => 0.00,
				'per_unit_cost'      => 0.00,
				'sale_price_per_unit'=> $checkproduct->pdt_sale_price,
				'session_id'         => $session_id,
				'admin_id'           => Auth('admin')->user()->id,
			]);

		}



	}





	public function showreturnpurchaseproductcart(){
		$session_id   = Session::getId();
		$data = DB::table('return_purchase_current')
		->where('return_purchase_current.session_id',$session_id)
		->join('pdt_productinfo','pdt_productinfo.pdt_id','return_purchase_current.pdt_id')
		->select('return_purchase_current.*','pdt_productinfo.pdt_name_en','pdt_productinfo.pdt_name_bn','pdt_productinfo.pdt_sale_price')
		->get();

		return view('Admin.purchase.showreturnpurchaseproductcart',compact('data'));
	}


	public function returnqtyupdatepurchase(Request $request,$id){
		$session_id   = Session::getId();
		$data = DB::table('return_purchase_current')
		->where('return_purchase_current.session_id',$session_id)
		->where('return_purchase_current.id',$id)
		->update([

			'purchase_quantity' => $request->purchase_quantity

		]);

	}


	public function returnpurchasepriceupdatesingle(Request $request,$id){
		$session_id   = Session::getId();
		$data = DB::table('return_purchase_current')
		->where('return_purchase_current.session_id',$session_id)
		->where('return_purchase_current.id',$id)
		->update([

			'purchase_price' => $request->purchase_price

		]);

	}


	public function returnpurchasepricedicount(Request $request,$id){
		$session_id   = Session::getId();
		$data = DB::table('return_purchase_current')
		->where('return_purchase_current.session_id',$session_id)
		->where('return_purchase_current.id',$id)
		->update([

			'discount_amount' => $request->discount_amount

		]);

	}



	public function deletereturnpurchasecartproduct($id){
		$session_id   = Session::getId();
		$data = DB::table('return_purchase_current')
		->where('return_purchase_current.session_id',$session_id)
		->where('return_purchase_current.id',$id)
		->delete();

	}


	public function returnpurchaseledger(Request $request){

		$session_id   = Session::getId();
		$data = DB::table('return_purchase_current')
		->where('return_purchase_current.session_id',$session_id)
		->get();

		

		$invoice_no = IdGenerator::generate(['table' => 'return_purchase_ledger', 'field'=>'invoice_no','length' => 12, 'prefix' =>'PR-']);



		foreach ($data as $d) {
			DB::table("return_purchase_entry")->insert([
				'invoice_no'        => $invoice_no,
				'product_id'        => $d->pdt_id,
				'sub_unit_id'       => $d->sub_unit_id,
				'product_quantity'  => $d->purchase_quantity,
				'purchase_price'    => $d->purchase_price,
				'per_unit_cost'     => 0,
				'discount_amount'   => $d->discount_amount,
				'admin_id'          => Auth('admin')->user()->id,
				'branch_id'         => Auth('admin')->user()->branch,


			]);


		}  


		$explode = explode('/',$request->invoice_date);
		$invoice_date = $explode[2].'-'.$explode[0].'-'.$explode[1]; 


		DB::table("return_purchase_ledger")->insert([
			'invoice_no'       => $invoice_no,
			'voucher_no'       => $request->voucher_no,
			'voucher_date'     => $invoice_date,
			'invoice_date'     => $invoice_date,
			'suplier_id'       => $request->supplier_id,
			'total'            => $request->grandtotal,
			'paid'             => 0.00,
			'discount'         => $request->discount,
			'transaction_type' => $request->transaction_type,
			'entry_date'       => date('Y-m-d'),
			'admin_id'         => Auth('admin')->user()->id,
			'branch_id'        => Auth('admin')->user()->branch,


		]);


		DB::table("supplier_payment")->insert([
			'invoice_no'       => $invoice_no,
			'payment_date'     => $invoice_date,
			'entry_date'	   => date('Y-m-d'),
			'suplier_id'       => $request->supplier_id,
			'return_amount'    => $request->grandtotal,
			'returnpaid'       => $request->returnpaid,
			'payment'          => 0.00,
			'payment_type'     => $request->transaction_type,
			'comment'          => "ReturnAmount",
			'admin_id'         => Auth('admin')->user()->id,
			'branch_id'        => Auth('admin')->user()->branch,


		]);


		DB::table('return_purchase_current')->where('session_id',$session_id)->delete();
		Session::regenerate();



		return redirect('returninvoicepurchase/'.$invoice_no);
	}



	public function returninvoicepurchase($id){

		$data = DB::table('return_purchase_ledger')
		->where("return_purchase_ledger.invoice_no",$id)
		->join("supplier_info",'supplier_info.supplier_id','return_purchase_ledger.suplier_id')
		->join("admins",'admins.id','return_purchase_ledger.admin_id')
		->select("return_purchase_ledger.*",'supplier_info.supplier_company_name','supplier_info.supplier_company_phone','admins.name')
		->first();

		$product = DB::table("return_purchase_entry")
		->where("return_purchase_entry.invoice_no",$data->invoice_no)
		->join("pdt_productinfo",'pdt_productinfo.pdt_id','return_purchase_entry.product_id')
		->get();

		return view("Admin.purchase.returninvoicepurchase",compact('data','product'));
	}



	public function allreturnpurchaseledger(){

		$data = DB::table('return_purchase_ledger')
		->join("supplier_info",'supplier_info.supplier_id','return_purchase_ledger.suplier_id')
		->join("admins",'admins.id','return_purchase_ledger.admin_id')
		->select("return_purchase_ledger.*",'supplier_info.supplier_company_name','supplier_info.supplier_company_phone','admins.name')
		->orderBy("return_purchase_ledger.id",'DESC')
		->where("return_purchase_ledger.branch_id",Auth('admin')->user()->branch)
		->get();


		return view("Admin.purchase.allreturnpurchaseledger",compact('data'));
	}

	

	public function deletereturnpurchaseledger($id){

		$data = DB::table('return_purchase_ledger')
		->where("id",$id)
		->first();


		DB::table('return_purchase_ledger')
		->where("id",$id)
		->delete();

		DB::table("return_purchase_entry")
		->where("invoice_no",$data->invoice_no)
		->delete();

		DB::table("supplier_payment")
		->where("invoice_no",$data->invoice_no)
		->delete();


	}


	public function supplier_statement(){


		return view("Admin.purchase.supplier_statement");
	}
}
