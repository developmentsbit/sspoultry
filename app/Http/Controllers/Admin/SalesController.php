<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Haruncpi\LaravelIdGenerator\IdGenerator;
use DB;
use Session;


class SalesController extends Controller
{

	public function __construct()
	{
		$this->middleware('auth:admin');
		
	}



	public function sales(){
		return view('Admin.sales.sales');
	}

	public function getcustomerphone($id){
		$data = DB::table("customer_info")->where("customer_id",$id)->first();
		return response()->json($data->customer_phone);
	}
	
	
		public function getcustomerpreviousdue($id){

		$total          = DB::table("sales_ledger")->where("customer_id",$id)->sum('total');
		$discount       = DB::table("sales_ledger")->where("customer_id",$id)->sum('final_discount');
		$grandtotal     = $total-$discount;
		$paid           = DB::table("sales_payment")->where("customer_id",$id)->sum('payment_amount');
		$finaldiscount  = DB::table("sales_payment")->where("customer_id",$id)->sum('discount');
		$salesreturn    = DB::table("sales_payment")->where("customer_id",$id)->sum('return_amount');
		$pd             = DB::table("sales_payment")->where("customer_id",$id)->where("note","PD")->sum('previous_due');

		$totaldue       = ($grandtotal-$paid)-$finaldiscount;
		$stotaldue      = ($totaldue+$pd)-$salesreturn;

		return response()->json(intval($stotaldue));

	}
	
	


	public function salesproductcart($id){

		$session_id   = Session::getId();
		$checkproduct = DB::table('stock_products')
		->where('stock_products.product_id',$id)
		->leftjoin("pdt_productinfo","pdt_productinfo.pdt_id","stock_products.product_id")
		->select("stock_products.*","pdt_productinfo.pdt_measurement")
		->first();


		$checkaddproduct = DB::table('sales_current')->where('sales_current.session_id',$session_id)->where('sales_current.product_id',$id)->first();

		if ($checkaddproduct) 
		{

			DB::table('sales_current')->where('product_id',$id)
			->update([
				'product_quantity'=>$checkaddproduct->product_quantity+1
			]);


		}
		else
		{

			DB::table('sales_current')->insert([
				'product_id'              => $id,
				'sub_unit_id'             => $checkproduct->pdt_measurement,
				'product_quantity'        => '1',
				'product_purchase_price'  => $checkproduct->purchase_price_withcost,
				'product_sales_price'     => $checkproduct->sale_price,
				'product_discount_amount' => 0.00,
				'session_id'              => $session_id,
				'admin_id'                => Auth('admin')->user()->id,
			]);

		}


	}





	public function salesproductcart2($varcode){

		$checkbarproduct = DB::table("pdt_productinfo")->where("barcode",$varcode)->first();

		

		$session_id   = Session::getId();
		$checkproduct = DB::table('stock_products')
		->where('stock_products.product_id',$checkbarproduct->pdt_id)
		->leftjoin("pdt_productinfo","pdt_productinfo.pdt_id","stock_products.product_id")
		->select("stock_products.*","pdt_productinfo.pdt_measurement")
		->first();


		$checkaddproduct = DB::table('sales_current')->where('sales_current.session_id',$session_id)->where('sales_current.product_id',$checkbarproduct->pdt_id)->first();

		if ($checkaddproduct) 
		{

			DB::table('sales_current')->where('product_id',$checkbarproduct->pdt_id)
			->update([
				'product_quantity'=>$checkaddproduct->product_quantity+1
			]);


		}
		else
		{

			DB::table('sales_current')->insert([
				'product_id'              => $checkbarproduct->pdt_id,
				'sub_unit_id'             => $checkproduct->pdt_measurement,
				'product_quantity'        => '1',
				'product_purchase_price'  => $checkproduct->purchase_price_withcost,
				'product_sales_price'     => $checkproduct->sale_price,
				'product_discount_amount' => 0.00,
				'session_id'              => $session_id,
				'admin_id'                => Auth('admin')->user()->id,
			]);

		}


	}







	public function showsalesproductcart(){
		$session_id   = Session::getId();
		$data = DB::table('sales_current')
		->where('sales_current.session_id',$session_id)
		->join('pdt_productinfo','pdt_productinfo.pdt_id','sales_current.product_id')
		->select('sales_current.*','pdt_productinfo.pdt_name_en','pdt_productinfo.pdt_name_bn','pdt_productinfo.pdt_sale_price')
		->get();

		return view('Admin.sales.showsalesproductcart',compact('data'));
	}




	public function deletesalescartproduct($id){
		$session_id   = Session::getId();
		$data = DB::table('sales_current')
		->where('sales_current.session_id',$session_id)
		->where('sales_current.id',$id)
		->delete();

	}




	public function qtyupdatesales(Request $request,$id){
		$session_id   = Session::getId();
		$data = DB::table('sales_current')
		->where('sales_current.session_id',$session_id)
		->where('sales_current.id',$id)
		->update([

			'product_quantity' => $request->product_quantity

		]);

	}





	public function salepriceupdatesingle(Request $request,$id){
		$session_id   = Session::getId();
		$data = DB::table('sales_current')
		->where('sales_current.session_id',$session_id)
		->where('sales_current.id',$id)
		->update([

			'product_sales_price' => $request->sale_price_per_unit

		]);

	}


	


	public function product_discount_amount(Request $request,$id){
		$session_id   = Session::getId();
		$data = DB::table('sales_current')
		->where('sales_current.session_id',$session_id)
		->where('sales_current.id',$id)
		->update([

			'product_discount_amount' => $request->product_discount_amount

		]);

	}



	public function salesledger(Request $request){

		if ($request->typesales == 3) {


			$session_id   = Session::getId();
			$data = DB::table('sales_current')
			->where('sales_current.session_id',$session_id)
			->get();

			$invoice_no = IdGenerator::generate(['table' => 'draft_sales_ledger', 'field'=>'invoice_no','length' => 12, 'prefix' =>'DS-']);


			foreach ($data as $d) {
				DB::table("draft_sales_entry")->insert([
					'invoice_no'                 => $invoice_no,
					'product_id'                 => $d->product_id,
					'sub_unit_id'                => $d->sub_unit_id,
					'product_quantity'           => $d->product_quantity,
					'product_purchase_price'     => $d->product_purchase_price,
					'product_sales_price'        => $d->product_sales_price,
					'product_discount_amount'    => $d->product_discount_amount,
					'entry_date'                 => date('Y-m-d'),
					'admin_id'                   => Auth('admin')->user()->id,
					'branch_id'                  => Auth('admin')->user()->branch,


				]);


			}  



			$explode = explode('/',$request->invoice_date);
			$invoice_date = $explode[2].'-'.$explode[0].'-'.$explode[1]; 


			DB::table("draft_sales_ledger")->insert([
				'invoice_no'       => $invoice_no,
				'invoice_date'     => $invoice_date,
				'customer_id'      => $request->customer_id,
				'total'            => $request->totalamount,
				'vat'              => $request->vat,
				'paid_amount'      => $request->paid,
				'final_discount'   => $request->discount,
				'transaction_type' => $request->transaction_type,
				'entry_date'       => date('Y-m-d'),
				'admin_id'         => Auth('admin')->user()->id,
				'branch_id'        => Auth('admin')->user()->branch,

			]);


			DB::table("draft_sales_payment")->insert([
				'invoice_no'       => $invoice_no,
				'entry_date'	   => date('Y-m-d'),
				'customer_id'      => $request->customer_id,
				'payment_amount'   => $request->paid,
				'payment_type'     => $request->transaction_type,
				'note'             => "firstpayment",
				'admin_id'         => Auth('admin')->user()->id,
				'branch_id'        => Auth('admin')->user()->branch,


			]);


			DB::table('sales_current')->where('session_id',$session_id)->delete();
			Session::regenerate();

			// return redirect('invoicesalesa42/'.$invoice_no);

			return response()->json($invoice_no);


		}
		else{
			$session_id   = Session::getId();
			$data = DB::table('sales_current')
			->where('sales_current.session_id',$session_id)
			->get();

			$invoice_no = IdGenerator::generate(['table' => 'sales_ledger', 'field'=>'invoice_no','length' => 10, 'prefix' =>'SI-']);



			foreach ($data as $d) {
				DB::table("sales_entry")->insert([
					'invoice_no'                 => $invoice_no,
					'product_id'                 => $d->product_id,
					'sub_unit_id'                => $d->sub_unit_id,
					'product_quantity'           => $d->product_quantity,
					'product_purchase_price'     => $d->product_purchase_price,
					'product_sales_price'        => $d->product_sales_price,
					'product_discount_amount'    => $d->product_discount_amount,
					'entry_date'                 => date('Y-m-d'),
					'admin_id'                   => Auth('admin')->user()->id,
					'branch_id'                  => Auth('admin')->user()->branch,


				]);

				$checkstockproduct =  DB::table("stock_products")->where("product_id",$d->product_id)->where("branch_id",Auth('admin')->user()->branch)->first();
				$qtysum            =  DB::table("stock_products")->where("product_id",$d->product_id)->where("branch_id",Auth('admin')->user()->branch)->sum("sales_qty");

				DB::table("stock_products")
				->where("product_id",$d->product_id)
				->where("branch_id",Auth('admin')->user()->branch)
				->update([
					"sales_qty" => $qtysum + $d->product_quantity
				]);

			}  



			$explode = explode('/',$request->invoice_date);
			$invoice_date = $explode[2].'-'.$explode[0].'-'.$explode[1]; 


			DB::table("sales_ledger")->insert([
				'invoice_no'       => $invoice_no,
				'invoice_date'     => $invoice_date,
				'customer_id'      => $request->customer_id,
				'total'            => $request->totalamount,
				'vat'              => $request->vat,
				'paid_amount'      => $request->paid,
				'final_discount'   => $request->discount,
				'transaction_type' => $request->transaction_type,
				'entry_date'       => date('Y-m-d'),
				'admin_id'         => Auth('admin')->user()->id,
				'branch_id'        => Auth('admin')->user()->branch,

			]);


			DB::table("sales_payment")->insert([
				'invoice_no'       => $invoice_no,
				'entry_date'	   => date('Y-m-d'),
				'customer_id'      => $request->customer_id,
				'payment_amount'   => $request->paid,
				'payment_type'     => $request->transaction_type,
				'note'             => "firstpayment",
				'admin_id'         => Auth('admin')->user()->id,
				'branch_id'        => Auth('admin')->user()->branch,


			]);


			DB::table('sales_current')->where('session_id',$session_id)->delete();
			Session::regenerate();


			
		return response()->json($invoice_no);

		}
		
		

		// if(isset($request->posbutton)){
		// 	return redirect('invoicesales/'.$invoice_no);
		// }
		// else{
		// 	return redirect('invoicesalesa4/'.$invoice_no);
		// }




		


	}


	public function invoicesales($id){

		$data = DB::table('sales_ledger')
		->where("sales_ledger.invoice_no",$id)
		->join("customer_info",'customer_info.customer_id','sales_ledger.customer_id')
		->join("admins",'admins.id','sales_ledger.admin_id')
		->select("sales_ledger.*",'customer_info.customer_name_en','customer_info.customer_phone','customer_info.customer_address','admins.name')
		->first();

		$product = DB::table("sales_entry")
		->where("sales_entry.invoice_no",$data->invoice_no)
		->join("pdt_productinfo",'pdt_productinfo.pdt_id','sales_entry.product_id')
		->get();

		return view("Admin.sales.invoicesales",compact('data','product'));
	}


	public function invoicesalesa4($id){

		$data = DB::table('sales_ledger')
		->where("sales_ledger.invoice_no",$id)
		->join("customer_info",'customer_info.customer_id','sales_ledger.customer_id')
		->join("admins",'admins.id','sales_ledger.admin_id')
		->select("sales_ledger.*",'customer_info.customer_name_en','customer_info.customer_phone','admins.name')
		->first();

		$product = DB::table("sales_entry")
		->where("sales_entry.invoice_no",$data->invoice_no)
		->join("pdt_productinfo",'pdt_productinfo.pdt_id','sales_entry.product_id')
		->get();

		return view("Admin.sales.invoicesalesa4",compact('data','product'));
	}


	public function invoicesalesa42($id){

		$data = DB::table('draft_sales_ledger')
		->where("draft_sales_ledger.invoice_no",$id)
		->join("customer_info",'customer_info.customer_id','draft_sales_ledger.customer_id')
		->join("admins",'admins.id','draft_sales_ledger.admin_id')
		->select("draft_sales_ledger.*",'customer_info.customer_name_en','customer_info.customer_phone','admins.name')
		->first();

		$product = DB::table("draft_sales_entry")
		->where("draft_sales_entry.invoice_no",$data->invoice_no)
		->join("pdt_productinfo",'pdt_productinfo.pdt_id','draft_sales_entry.product_id')
		->get();

		return view("Admin.sales.invoicesalesa4",compact('data','product'));
	}





	public function allsalesledger(){
		$data = DB::table('sales_ledger')
		->join("customer_info",'customer_info.customer_id','sales_ledger.customer_id')
		->join("admins",'admins.id','sales_ledger.admin_id')
		->select("sales_ledger.*",'customer_info.customer_name_en','customer_info.customer_phone','admins.name')
		->orderBy("sales_ledger.id",'DESC')
		->where("sales_ledger.branch_id",Auth('admin')->user()->branch)
		->limit(25)
		->get();


		return view("Admin.sales.allsalesledger",compact('data'));
	}


	public function alldraftsales(){
		$data = DB::table('draft_sales_ledger')
		->join("customer_info",'customer_info.customer_id','draft_sales_ledger.customer_id')
		->join("admins",'admins.id','draft_sales_ledger.admin_id')
		->select("draft_sales_ledger.*",'customer_info.customer_name_en','customer_info.customer_phone','admins.name')
		->orderBy("draft_sales_ledger.id",'DESC')
		->where("draft_sales_ledger.branch_id",Auth('admin')->user()->branch)
		->get();


		return view("Admin.sales.alldraftsales",compact('data'));
	}



	public function deletedraftsalesledger($id){

		$data = DB::table('draft_sales_ledger')
		->where("id",$id)
		->first();


		DB::table('draft_sales_ledger')
		->where("id",$id)
		->delete();

		DB::table("draft_sales_entry")
		->where("invoice_no",$data->invoice_no)
		->delete();

		DB::table("draft_sales_payment")
		->where("invoice_no",$data->invoice_no)
		->delete();
		


	}


	public function confirmdraftsales($id){

		$invoice_no = IdGenerator::generate(['table' => 'sales_ledger', 'field'=>'invoice_no','length' => 10, 'prefix' =>'S-']);

		$salesentry = DB::table("draft_sales_entry")->where("invoice_no",$id)->where("branch_id",Auth("admin")->user()->branch)->get();

		$salesledger = DB::table("draft_sales_ledger")->where("invoice_no",$id)->where("branch_id",Auth("admin")->user()->branch)->first();

		foreach ($salesentry as $d) {
			DB::table("sales_entry")->insert([
				'invoice_no'                 => $invoice_no,
				'product_id'                 => $d->product_id,
				'sub_unit_id'                => $d->sub_unit_id,
				'product_quantity'           => $d->product_quantity,
				'product_purchase_price'     => $d->product_purchase_price,
				'product_sales_price'        => $d->product_sales_price,
				'product_discount_amount'    => $d->product_discount_amount,
				'entry_date'                 => date('Y-m-d'),
				'admin_id'                   => Auth('admin')->user()->id,
				'branch_id'                  => Auth('admin')->user()->branch,


			]);

			$checkstockproduct =  DB::table("stock_products")->where("product_id",$d->product_id)->where("branch_id",Auth('admin')->user()->branch)->first();
			$qtysum            =  DB::table("stock_products")->where("product_id",$d->product_id)->where("branch_id",Auth('admin')->user()->branch)->sum("sales_qty");

			DB::table("stock_products")
			->where("product_id",$d->product_id)
			->where("branch_id",Auth('admin')->user()->branch)
			->update([
				"sales_qty" => $qtysum + $d->product_quantity
			]);

		}  


		DB::table("sales_ledger")->insert([
			'invoice_no'       => $invoice_no,
			'invoice_date'     => $salesledger->invoice_date,
			'customer_id'      => $salesledger->customer_id,
			'total'            => $salesledger->total,
			'vat'              => $salesledger->vat,
			'paid_amount'      => $salesledger->paid_amount,
			'final_discount'   => $salesledger->final_discount,
			'transaction_type' => $salesledger->transaction_type,
			'entry_date'       => date('Y-m-d'),
			'admin_id'         => Auth('admin')->user()->id,
			'branch_id'        => Auth('admin')->user()->branch,

		]);


		DB::table("sales_payment")->insert([
			'invoice_no'       => $invoice_no,
			'entry_date'	   => $salesledger->entry_date,
			'customer_id'      => $salesledger->customer_id,
			'payment_amount'   => $salesledger->paid_amount,
			'payment_type'     => $salesledger->transaction_type,
			'note'             => "firstpayment",
			'admin_id'         => Auth('admin')->user()->id,
			'branch_id'        => Auth('admin')->user()->branch,


		]);

		DB::table("draft_sales_entry")->where("invoice_no",$id)->delete();
		DB::table("draft_sales_ledger")->where("invoice_no",$id)->delete();
		DB::table("draft_sales_payment")->where("invoice_no",$id)->delete();

		return redirect()->back();
		
	}






	public function deletesalesledger($id){

		$data = DB::table('sales_ledger')
		->where("id",$id)
		->first();


		$stock = DB::table("sales_entry")->where("invoice_no",$data->invoice_no)->get();

		foreach ($stock as $s) {
			
			$totalqty = DB::table('stock_products')->where("product_id",$s->product_id)->sum("sales_qty");
			DB::table('stock_products')->where("product_id",$s->product_id)->update([

				"sales_qty" => $totalqty - $s->product_quantity
			]);
		}


		DB::table('sales_ledger')
		->where("id",$id)
		->delete();

		DB::table("sales_entry")
		->where("invoice_no",$data->invoice_no)
		->delete();

		DB::table("sales_payment")
		->where("invoice_no",$data->invoice_no)
		->delete();
		


	}




	public function searchsalesinvoice(Request $r){

		$fromdate   = $r->fromdate;
		$todate     = $r->todate;

		$explode = explode('/',$r->fromdate);
		$fromdates = $explode[2].'-'.$explode[0].'-'.$explode[1]; 

		$explode = explode('/',$r->todate);
		$todates = $explode[2].'-'.$explode[0].'-'.$explode[1]; 

		if($fromdates != "" && $todates != ""){
			$data = DB::table('sales_ledger')
			->whereBetween("sales_ledger.invoice_date",array($fromdates,$todates))
			->join("customer_info",'customer_info.customer_id','sales_ledger.customer_id')
			->select("sales_ledger.*",'customer_info.customer_name_en','customer_info.customer_phone')
			->where("sales_ledger.branch_id",Auth('admin')->user()->branch)
			->get();

		}



		return view("Admin.sales.searchsalesinvoice",compact('data'));

	}





	public function searchsalesinvoice2(Request $r){


		$invoice_no = $r->invoice_no;


		if ($invoice_no) {
			$data = DB::table('sales_ledger')
			->where("sales_ledger.invoice_no",$invoice_no)
			->join("customer_info",'customer_info.customer_id','sales_ledger.customer_id')
			->select("sales_ledger.*",'customer_info.customer_name_en','customer_info.customer_phone')
			->where("sales_ledger.branch_id",Auth('admin')->user()->branch)
			->get();
		}
		else{

			$data = DB::table('sales_ledger')
			->join("customer_info",'customer_info.customer_id','sales_ledger.customer_id')
			->join("admins",'admins.id','sales_ledger.admin_id')
			->select("sales_ledger.*",'customer_info.customer_name_en','customer_info.customer_phone','admins.name')
			->orderBy("sales_ledger.id",'DESC')
			->where("sales_ledger.branch_id",Auth('admin')->user()->branch)
			->limit(25)
			->get();

		}


		return view("Admin.sales.searchsalesinvoice",compact('data'));

	}




	public function allsalesledgerreports(){

		return view("Admin.sales.allsalesledgerreports");

	}




	public function salesledgerreports(Request $request){

		$customer_id = $request->customer_id;
		$type        = $request->Type;
		$date1       = $request->start_date;
		$date2       = $request->end_date;
		$month       = $request->month;
		$year        = $request->year;



		if ($request->customer_id == "All") {
			
			if ($type == 1) {

				$data = DB::table('sales_ledger')
				->leftjoin("customer_info",'customer_info.customer_id','sales_ledger.customer_id')
				->select("sales_ledger.*",'customer_info.customer_name_en','customer_info.customer_phone')
				->where("sales_ledger.invoice_date",$date1)
				->where("sales_ledger.branch_id",Auth('admin')->user()->branch)
				->get();
			}

			elseif($type == 2){
				$data = DB::table('sales_ledger')
				->leftjoin("customer_info",'customer_info.customer_id','sales_ledger.customer_id')
				->select("sales_ledger.*",'customer_info.customer_name_en','customer_info.customer_phone')
				->whereBetween("sales_ledger.invoice_date",array($date1,$date2))
				->where("sales_ledger.branch_id",Auth('admin')->user()->branch)
				->get();
			}


			elseif($type == 3){
				$data = DB::table('sales_ledger')
				->leftjoin("customer_info",'customer_info.customer_id','sales_ledger.customer_id')
				->select("sales_ledger.*",'customer_info.customer_name_en','customer_info.customer_phone')
				->whereMonth("sales_ledger.invoice_date",$month)
				->whereYear("sales_ledger.invoice_date",$year)
				->where("sales_ledger.branch_id",Auth('admin')->user()->branch)
				->get();
			}


			elseif($type == 4){
				$data = DB::table('sales_ledger')
				->leftjoin("customer_info",'customer_info.customer_id','sales_ledger.customer_id')
				->select("sales_ledger.*",'customer_info.customer_name_en','customer_info.customer_phone')
				->whereYear("sales_ledger.invoice_date",$year)
				->where("sales_ledger.branch_id",Auth('admin')->user()->branch)
				->get();


			}



		}
		else{


			if ($type == 1) {

				$data = DB::table('sales_ledger')
				->leftjoin("customer_info",'customer_info.customer_id','sales_ledger.customer_id')
				->select("sales_ledger.*",'customer_info.customer_name_en','customer_info.customer_phone')
				->where("sales_ledger.invoice_date",$date1)
				->where("sales_ledger.customer_id",$customer_id)
				->where("sales_ledger.branch_id",Auth('admin')->user()->branch)
				->get();
			}

			elseif($type == 2){
				$data = DB::table('sales_ledger')
				->leftjoin("customer_info",'customer_info.customer_id','sales_ledger.customer_id')
				->select("sales_ledger.*",'customer_info.customer_name_en','customer_info.customer_phone')
				->whereBetween("sales_ledger.invoice_date",array($date1,$date2))
				->where("sales_ledger.customer_id",$customer_id)
				->where("sales_ledger.branch_id",Auth('admin')->user()->branch)
				->get();
			}


			elseif($type == 3){
				$data = DB::table('sales_ledger')
				->leftjoin("customer_info",'customer_info.customer_id','sales_ledger.customer_id')
				->select("sales_ledger.*",'customer_info.customer_name_en','customer_info.customer_phone')
				->whereMonth("sales_ledger.invoice_date",$month)
				->whereYear("sales_ledger.invoice_date",$year)
				->where("sales_ledger.customer_id",$customer_id)
				->where("sales_ledger.branch_id",Auth('admin')->user()->branch)
				->get();
			}


			elseif($type == 4){
				$data = DB::table('sales_ledger')
				->leftjoin("customer_info",'customer_info.customer_id','sales_ledger.customer_id')
				->select("sales_ledger.*",'customer_info.customer_name_en','customer_info.customer_phone')
				->whereYear("sales_ledger.invoice_date",$year)
				->where("sales_ledger.customer_id",$customer_id)
				->where("sales_ledger.branch_id",Auth('admin')->user()->branch)
				->get();


			}


		}




		return view("Admin.sales.salesledgerreports",compact('data','type','date1','date2','month','year'));

	}
	



	public function salespayment(){
		return view('Admin.sales.salespayment');
	}


	public function salespaymententry(Request $r){

		$explode = explode('/',$r->payment_date);
		$payment_date = $explode[2].'-'.$explode[0].'-'.$explode[1]; 


		DB::table("sales_payment")->insert([

			'entry_date'     => $payment_date,
			'customer_id'    => $r->customer_id,
			'payment_amount' => $r->payment,
			'discount'       => $r->discount,
			'payment_type'   => $r->payment_type,
			'return_amount'  => 0.00,
			'note'           => $r->comment,
			'admin_id'       => Auth('admin')->user()->id,
			'branch_id'      => Auth('admin')->user()->branch,
			'transaction_type'      =>'DueCollection',

		]);
	}



	public function getpreviousdue($id){

		$total          = DB::table("sales_ledger")->where("customer_id",$id)->sum('total');
		$discount       = DB::table("sales_ledger")->where("customer_id",$id)->sum('final_discount');
		$grandtotal     = $total-$discount;
		$paid           = DB::table("sales_payment")->where("customer_id",$id)->sum('payment_amount');
		$finaldiscount  = DB::table("sales_payment")->where("customer_id",$id)->sum('discount');
		$salesreturn    = DB::table("sales_payment")->where("customer_id",$id)->sum('return_amount');
		$pd             = DB::table("sales_payment")->where("customer_id",$id)->where("note","PD")->sum('previous_due');

		$totaldue       = ($grandtotal-$paid)-$finaldiscount;
		$stotaldue      = ($totaldue+$pd)-$salesreturn;

		return response()->json(intval($stotaldue));

	}



	public function salespaymentlist(){
		$data = DB::table("sales_payment")
		->join('customer_info','customer_info.customer_id','sales_payment.customer_id')
		->select("sales_payment.*",'customer_info.customer_name_en','customer_info.customer_phone')
		->where("sales_payment.branch_id",Auth('admin')->user()->branch)
		->get();
		return view("Admin.sales.salespaymentlist", compact('data'));
	}



	public function salespaymentinvoice($id){
		$data = DB::table("sales_payment")
		->where("sales_payment.id",$id)
		->join('customer_info','customer_info.customer_id','sales_payment.customer_id')
		->select("sales_payment.*",'customer_info.customer_name_en','customer_info.customer_phone')
		->first();


		return view('Admin.sales.salespaymentinvoice', compact('data'));
	}


	public function deletesalesentry($id){
		DB::table("sales_payment")->where("id",$id)->delete();
	}





	public function editsalespaymententry($id){

		$data = DB::table("sales_payment")->where("id",$id)->first();

		$total      = DB::table("sales_ledger")->where("customer_id",$data->customer_id)->sum('total');
		$discount   = DB::table("sales_ledger")->where("customer_id",$data->customer_id)->sum('final_discount');
		$grandtotal = $total-$discount;
		

		$paid           = DB::table("sales_payment")->where("customer_id",$data->customer_id)->sum('payment_amount');
		$finaldiscount  = DB::table("sales_payment")->where("customer_id",$data->customer_id)->sum('discount');
		$salesreturn    = DB::table("sales_payment")->where("customer_id",$data->customer_id)->sum('return_amount');
		$PD             = DB::table("sales_payment")->where("customer_id",$data->customer_id)->where("note","PD")->sum('previous_due');

		$stotaldue       = ($grandtotal-$paid)-$finaldiscount;
		$totaldue        = ($stotaldue+$PD)-$salesreturn;


		$customer_phone   = DB::table("customer_info")->where("customer_id",$data->customer_id)->first();

		return view("Admin.sales.editsalespaymententry",compact('data','totaldue','customer_phone'));
	}



	public function updatesalespayment(Request $r,$id){

		$explode = explode('/',$r->payment_date);
		$payment_date = $explode[2].'-'.$explode[0].'-'.$explode[1];


		DB::table("sales_payment")->where("id",$id)->update([

			'entry_date'     => $payment_date,
			'customer_id'    => $r->customer_id,
			'payment_amount' => $r->payment,
			'discount'       => $r->discount,
			'payment_type'   => $r->payment_type,
			'return_amount'  => 0.00,
			'note'           => $r->comment,
			'admin_id'       => Auth('admin')->user()->id,
			'branch_id'      => Auth('admin')->user()->branch,

		]);
	}



	public function editdraftsales($invoice_no){

		$draftdata = DB::table("draft_sales_entry")->where("invoice_no",$invoice_no)->get();

		$session_id   = Session::getId();

		foreach ($draftdata as $data) {

			DB::table('sales_current')->insert([
				'product_id'              => $data->product_id,
				'sub_unit_id'             => $data->sub_unit_id,
				'product_quantity'        => $data->product_quantity,
				'product_purchase_price'  => $data->product_purchase_price,
				'product_sales_price'     => $data->product_sales_price,
				'product_discount_amount' => $data->product_discount_amount,
				'session_id'              => $session_id,
				'admin_id'                => Auth('admin')->user()->id,
			]);
			
		}

		return redirect('/sales');
	}


	public function purchasewithsales(){
		return view("Admin.purchasewithsales.purchasewithsales");
	}



	public function purchasesalesproductcart($id){

		$session_id   = Session::getId();
		$checkproduct = DB::table("pdt_productinfo")->where('pdt_status',1)->where('pdt_id',$id)->first();



		$checkaddproduct = DB::table('purchase_sales_current')->where('purchase_sales_current.session_id',$session_id)->where('purchase_sales_current.product_id',$checkproduct->pdt_id)->first();

		if ($checkaddproduct) 
		{

			DB::table('purchase_sales_current')->where('product_id',$checkproduct->pdt_id)
			->update([
				'product_quantity'=>$checkaddproduct->product_quantity+1
			]);


		}
		else{


			DB::table('purchase_sales_current')->insert([
				'product_id'              => $id,
				'sub_unit_id'             => $checkproduct->pdt_measurement,
				'product_quantity'        => '1',
				'product_purchase_price'  => $checkproduct->pdt_purchase_price,
				'product_sales_price'     => $checkproduct->pdt_sale_price,
				'product_discount_amount' => 0.00,
				'session_id'              => $session_id,
				'admin_id'                => Auth('admin')->user()->id,
			]);




		}



	}




	public function purchasesalesproductcart2(Request $request,$barcode){

		$session_id   = Session::getId();
		$checkproduct = DB::table("pdt_productinfo")->where('barcode',$barcode)->first();



		$checkaddproduct = DB::table('purchase_sales_current')->where('purchase_sales_current.session_id',$session_id)->where('purchase_sales_current.product_id',$checkproduct->pdt_id)->first();

		if ($checkaddproduct) 
		{

			DB::table('purchase_sales_current')->where('product_id',$checkproduct->pdt_id)
			->update([
				'product_quantity'=>$checkaddproduct->product_quantity+1
			]);


		}
		else{


			DB::table('purchase_sales_current')->insert([
				'product_id'              => $checkproduct->pdt_id,
				'sub_unit_id'             => $checkproduct->pdt_measurement,
				'product_quantity'        => '1',
				'product_purchase_price'  => $checkproduct->pdt_purchase_price,
				'product_sales_price'     => $checkproduct->pdt_sale_price,
				'product_discount_amount' => 0.00,
				'session_id'              => $session_id,
				'admin_id'                => Auth('admin')->user()->id,
			]);




		}



	}





	public function showpurchasesalesproductcart(){
		$session_id   = Session::getId();
		$data = DB::table('purchase_sales_current')
		->where('purchase_sales_current.session_id',$session_id)
		->join('pdt_productinfo','pdt_productinfo.pdt_id','purchase_sales_current.product_id')
		->select('purchase_sales_current.*','pdt_productinfo.pdt_name_en')
		->get();

		return view('Admin.purchasewithsales.showpurchasesalesproductcart',compact('data'));
	}



	public function deletepurchasesalescartproduct($id){
		$session_id   = Session::getId();
		$data = DB::table('purchase_sales_current')
		->where('purchase_sales_current.session_id',$session_id)
		->where('purchase_sales_current.id',$id)
		->delete();

	}

	public function qtyupdatesalespurchase(Request $request,$id){
		$session_id   = Session::getId();
		$data = DB::table('purchase_sales_current')
		->where('purchase_sales_current.session_id',$session_id)
		->where('purchase_sales_current.id',$id)
		->update([

			'product_quantity' => $request->product_quantity

		]);

	}

	public function purchasepriceupdatesingle(Request $request,$id){
		$session_id   = Session::getId();
		$data = DB::table('purchase_sales_current')
		->where('purchase_sales_current.session_id',$session_id)
		->where('purchase_sales_current.id',$id)
		->update([

			'product_purchase_price' => $request->purchase_price_per_unit

		]);

	}



	public function purchasesalepriceupdatesingle(Request $request,$id){
		$session_id   = Session::getId();
		$data = DB::table('purchase_sales_current')
		->where('purchase_sales_current.session_id',$session_id)
		->where('purchase_sales_current.id',$id)
		->update([

			'product_sales_price' => $request->sale_price_per_unit

		]);

	}
	
	
	
	public function purchasesalesledger(Request $request){

		$session_id   = Session::getId();
		$data = DB::table('purchase_sales_current')
		->where('purchase_sales_current.session_id',$session_id)
		->get();

		


		$invoice_no = IdGenerator::generate(['table' => 'sales_ledger', 'field'=>'invoice_no','length' => 10, 'prefix' =>'SI-']);

		foreach ($data as $d) {
			DB::table("sales_entry")->insert([
				'invoice_no'                 => $invoice_no,
				'product_id'                 => $d->product_id,
				'sub_unit_id'                => $d->sub_unit_id,
				'product_quantity'           => $d->product_quantity,
				'product_purchase_price'     => $d->product_purchase_price,
				'product_sales_price'        => $d->product_sales_price,
				'product_discount_amount'    => $d->product_discount_amount,
				'entry_date'                 => date('Y-m-d'),
				'admin_id'                   => Auth('admin')->user()->id,
				'branch_id'                  => Auth('admin')->user()->branch,


			]);

		}  


		DB::table("sales_ledger")->insert([
			'invoice_no'       => $invoice_no,
			'invoice_date'     => $request->invoice_date,
			'customer_id'      => $request->customer_id,
			'total'            => $request->totalamount,
			'paid_amount'      => 0,
			'transaction_type' => $request->transaction_type,
			'entry_date'       => date('Y-m-d'),
			'admin_id'         => Auth('admin')->user()->id,
			'branch_id'        => Auth('admin')->user()->branch,

		]);


		DB::table("sales_payment")->insert([
			'invoice_no'       => $invoice_no,
			'entry_date'	   => date('Y-m-d'),
			'customer_id'      => $request->customer_id,
			'payment_amount'   => 0,
			'payment_type'     => $request->transaction_type,
			'note'             => "purchasewithsalepayment",
			'admin_id'         => Auth('admin')->user()->id,
			'branch_id'        => Auth('admin')->user()->branch,


		]);




		$invoice_no2 = IdGenerator::generate(['table' => 'purchase_ledger', 'field'=>'invoice_no','length' => 10, 'prefix' =>'PI-']);



		foreach ($data as $d) {
			DB::table("purchase_entry")->insert([
				'invoice_no'        => $invoice_no2,
				'product_id'        => $d->product_id,
				'sub_unit_id'       => $d->sub_unit_id,
				'product_quantity'  => $d->product_quantity,
				'purchase_price'    => $d->product_purchase_price,
				'per_unit_cost'     => 0,
				'admin_id'          => Auth('admin')->user()->id,
				'branch_id'         => Auth('admin')->user()->branch,


			]);


		}  


		DB::table("purchase_ledger")->insert([
			'invoice_no'       => $invoice_no2,
			'voucher_date'     => $request->invoice_date,
			'invoice_date'     => $request->invoice_date,
			'suplier_id'       => $request->tcustomer_id,
			'total'            => $request->totalpurchaseamounts-$request->discount_amount,
			'paid'             => 0,
			'transaction_type' => $request->transaction_type,
			'entry_date'       => date('Y-m-d'),
			'admin_id'         => Auth('admin')->user()->id,
			'branch_id'        => Auth('admin')->user()->branch,


		]);


			DB::table("sales_payment")->insert([
			'invoice_no'       => $invoice_no,
			'entry_date'	   => date('Y-m-d'),
			'customer_id'      => $request->tcustomer_id,
			'payment_amount'   => $request->totalamount,
			'payment_type'     => $request->transaction_type,
			'note'             => "purchasewithsalepayment",
			'admin_id'         => Auth('admin')->user()->id,
			'branch_id'        => Auth('admin')->user()->branch,


		]);





		DB::table('purchase_sales_current')->where('session_id',$session_id)->delete();
		Session::regenerate();


		return redirect()->back();


	}





	public function alldraftsalespayment(){
		$data = DB::table("draft_sales_payment")
		->join('customer_info','customer_info.customer_id','draft_sales_payment.customer_id')
		->select("draft_sales_payment.*",'customer_info.customer_name_en','customer_info.customer_phone')
		->where("draft_sales_payment.branch_id",Auth('admin')->user()->branch)
		->where("draft_sales_payment.invoice_no",Null)
		->get();
		return view("Admin.sales.alldraftsalespayment", compact('data'));
	}



	public function deletedraftsalespayment($id){
		DB::table("draft_sales_payment")->where("id",$id)->delete();
	}


	public function confirmdraftsalespayment($id){

		$data = DB::table("draft_sales_payment")->where("id",$id)->first();


		DB::table("sales_payment")->insert([

			'entry_date'     => $data->entry_date,
			'customer_id'    => $data->customer_id,
			'payment_amount' => $data->payment_amount,
			'discount'       => $data->discount,
			'payment_type'   => $data->payment_type,
			'return_amount'  => 0.00,
			'note'           => $data->note,
			'admin_id'       => $data->admin_id,
			'branch_id'      => $data->branch_id,

		]);


		DB::table("draft_sales_payment")->where("id",$id)->delete();

		return redirect()->back();
	}


	public function salesreturn(){

		return view("Admin.sales.salesreturn");

	}



	public function returnsalesproductcart($id){

		$session_id   = Session::getId();
		$checkproduct = DB::table('pdt_productinfo')->where('pdt_id',$id)->first();


		$checkaddproduct = DB::table('sales_return_current')->where('sales_return_current.session_id',$session_id)->where('sales_return_current.product_id',$id)->first();

		if ($checkaddproduct) 
		{

			DB::table('sales_return_current')->where('product_id',$id)
			->update([
				'product_quantity'=>$checkaddproduct->product_quantity+1
			]);


		}
		else
		{

			DB::table('sales_return_current')->insert([
				'product_id'               => $id,
				'sub_unit_id'              => $checkproduct->pdt_measurement,
				'product_quantity'         => '1',
				'product_sales_price'      => $checkproduct->pdt_sale_price,
				'product_discount_amount'  => 0.00,
				'session_id'               => $session_id,
				'admin_id'                 => Auth('admin')->user()->id,
				'branch_id'                => Auth('admin')->user()->branch,
			]);

		}

		


	}




	public function returnsalesproductcart2($varcode){

		$checkbarproduct = DB::table("pdt_productinfo")->where("barcode",$varcode)->first();
		$session_id   = Session::getId();


		$checkaddproduct = DB::table('sales_return_current')->where('sales_return_current.session_id',$session_id)->where('sales_return_current.product_id',$checkbarproduct->pdt_id)->first();

		if ($checkaddproduct) 
		{

			DB::table('sales_return_current')->where('product_id',$checkbarproduct->pdt_id)
			->update([
				'product_quantity'=>$checkaddproduct->product_quantity+1
			]);


		}
		else
		{

			DB::table('sales_return_current')->insert([
				'product_id'               => $checkbarproduct->pdt_id,
				'sub_unit_id'              => $checkbarproduct->pdt_measurement,
				'product_quantity'         => '1',
				'product_sales_price'      => $checkbarproduct->pdt_sale_price,
				'product_discount_amount'  => 0.00,
				'session_id'               => $session_id,
				'admin_id'                 => Auth('admin')->user()->id,
				'branch_id'                => Auth('admin')->user()->branch,
			]);


		}


	}





	public function showreturnsalesproductcart(){
		$session_id   = Session::getId();
		$data = DB::table('sales_return_current')
		->where('sales_return_current.session_id',$session_id)
		->join('pdt_productinfo','pdt_productinfo.pdt_id','sales_return_current.product_id')
		->select('sales_return_current.*','pdt_productinfo.pdt_name_en','pdt_productinfo.pdt_name_bn','pdt_productinfo.pdt_sale_price')
		->get();

		return view('Admin.sales.showreturnsalesproductcart',compact('data'));
	}




	public function deletereturnsalescartproduct($id){
		$session_id   = Session::getId();
		$data = DB::table('sales_return_current')
		->where('sales_return_current.session_id',$session_id)
		->where('sales_return_current.id',$id)
		->delete();

	}




	public function returnqtyupdatesales(Request $request,$id){
		$session_id   = Session::getId();
		$data = DB::table('sales_return_current')
		->where('sales_return_current.session_id',$session_id)
		->where('sales_return_current.id',$id)
		->update([

			'product_quantity' => $request->product_quantity

		]);

	}



	public function returnsalepriceupdatesingle(Request $request,$id){
		$session_id   = Session::getId();
		$data = DB::table('sales_return_current')
		->where('sales_return_current.session_id',$session_id)
		->where('sales_return_current.id',$id)
		->update([

			'product_sales_price' => $request->sale_price_per_unit

		]);

	}




	public function returnsalesproductdiscount(Request $request,$id){
		$session_id   = Session::getId();
		$data = DB::table('sales_return_current')
		->where('sales_return_current.session_id',$session_id)
		->where('sales_return_current.id',$id)
		->update([

			'product_discount_amount' => $request->product_discount_amount

		]);

	}



	public function returnsalesledger(Request $request){


		$session_id   = Session::getId();
		$data = DB::table('sales_return_current')
		->where('sales_return_current.session_id',$session_id)
		->get();

		$invoice_no = IdGenerator::generate(['table' => 'sales_return_ledger', 'field'=>'invoice_no','length' => 12, 'prefix' =>'SR-']);



		foreach ($data as $d) {
			DB::table("sales_return_entry")->insert([
				'invoice_no'                 => $invoice_no,
				'product_id'                 => $d->product_id,
				'sub_unit_id'                => $d->sub_unit_id,
				'return_quantity'            => $d->product_quantity,
				'product_return_price'       => $d->product_sales_price,
				'return_discount_amount'     => $d->product_discount_amount,
				'entry_date'                 => date('Y-m-d'),
				'admin_id'                   => Auth('admin')->user()->id,
				'branch_id'                  => Auth('admin')->user()->branch,


			]);

		}  



		DB::table("sales_return_ledger")->insert([
			'invoice_no'       => $invoice_no,
			'invoice_date'     => $request->invoice_date,
			'customer_id'      => $request->customer_id,
			'total_amount'     => $request->totalamount,
			'final_discount'   => $request->discount,
			'entry_date'       => date('Y-m-d'),
			'admin_id'         => Auth('admin')->user()->id,
			'branch_id'        => Auth('admin')->user()->branch,

		]);


		DB::table("sales_payment")->insert([
			'invoice_no'       => $invoice_no,
			'entry_date'	   => date('Y-m-d'),
			'customer_id'      => $request->customer_id,
			'return_amount'    => $request->grandtotal,
			'returnpaid'       => $request->returnpaid,
			'admin_id'         => Auth('admin')->user()->id,
			'branch_id'        => Auth('admin')->user()->branch,


		]);


		DB::table('sales_return_current')->where('session_id',$session_id)->delete();
		Session::regenerate();


		return redirect('salesreturninvoice/'.$invoice_no);


	}



	public function allreturnsalesledger(){
		$data = DB::table('sales_return_ledger')
		->join("customer_info",'customer_info.customer_id','sales_return_ledger.customer_id')
		->join("admins",'admins.id','sales_return_ledger.admin_id')
		->select("sales_return_ledger.*",'customer_info.customer_name_en','customer_info.customer_phone','admins.name')
		->orderBy("sales_return_ledger.id",'DESC')
		->where("sales_return_ledger.branch_id",Auth('admin')->user()->branch)
		->get();


		return view("Admin.sales.allreturnsalesledger",compact('data'));
	}





	public function salesreturninvoice($id){

		$data = DB::table('sales_return_ledger')
		->where("sales_return_ledger.invoice_no",$id)
		->join("customer_info",'customer_info.customer_id','sales_return_ledger.customer_id')
		->join("admins",'admins.id','sales_return_ledger.admin_id')
		->select("sales_return_ledger.*",'customer_info.customer_name_en','customer_info.customer_phone','admins.name')
		->first();

		$product = DB::table("sales_return_entry")
		->where("sales_return_entry.invoice_no",$data->invoice_no)
		->join("pdt_productinfo",'pdt_productinfo.pdt_id','sales_return_entry.product_id')
		->get();

		return view("Admin.sales.salesreturninvoice",compact('data','product'));
	}





	public function deletereturnsalesledger($id){

		$data = DB::table('sales_return_ledger')
		->where("id",$id)
		->first();


		DB::table('sales_return_ledger')
		->where("id",$id)
		->delete();

		DB::table("sales_return_entry")
		->where("invoice_no",$data->invoice_no)
		->delete();

		DB::table("sales_payment")
		->where("invoice_no",$data->invoice_no)
		->delete();
		


	}


	public function customer_statement(){
		return view("Admin.sales.customer_statement");
	}


}
