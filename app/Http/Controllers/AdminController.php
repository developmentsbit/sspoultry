<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Auth;
use DB;

class AdminController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
    	$this->middleware('auth:admin');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function AdminDashboard()
    {

        $total      = DB::table("sales_ledger")->where("branch_id",Auth('admin')->user()->branch)->sum('total');
        $discount   = DB::table("sales_ledger")->where("branch_id",Auth('admin')->user()->branch)->sum('final_discount');
        $grandtotal = $total-$discount;
        $paid       = DB::table("sales_payment")->where("branch_id",Auth('admin')->user()->branch)->sum('payment_amount');
        $duetotal        = $grandtotal-$paid;


        $totalsales     = DB::table("sales_ledger")->sum('total');
        $vat            = DB::table("sales_ledger")->sum('vat');
        $final_discount = DB::table("sales_ledger")->sum('final_discount');

        $finalsales = (($totalsales+$vat)-$final_discount);



        $totalpurchase     = DB::table("purchase_ledger")->sum('total');
        $discount           = DB::table("purchase_ledger")->sum('discount');

        $finalpurchase = ($totalpurchase-$discount);



        $totalpurchase = DB::table("supplier_payment")->get();

        $employee_info = DB::table("employee_info")->where("branch",Auth('admin')->user()->branch)->where("status",1)->count();

        $salesledger = DB::table('sales_ledger')
        ->join("customer_info",'customer_info.customer_id','sales_ledger.customer_id')
        ->join("admins",'admins.id','sales_ledger.admin_id')
        ->select("sales_ledger.*",'customer_info.customer_name_en','customer_info.customer_phone','admins.name')
        ->orderBy("sales_ledger.id",'DESC')
        ->where("sales_ledger.branch_id",Auth('admin')->user()->branch)
        ->limit(5)
        ->get();

        $purchaseledger = DB::table('purchase_ledger')
        ->join("supplier_info",'supplier_info.supplier_id','purchase_ledger.suplier_id')
        ->join("admins",'admins.id','purchase_ledger.admin_id')
        ->select("purchase_ledger.*",'supplier_info.supplier_company_name','supplier_info.supplier_company_phone','admins.name')
        ->orderBy("purchase_ledger.id",'DESC')
        ->where("purchase_ledger.branch_id",Auth('admin')->user()->branch)
        ->limit(5)
        ->get();

     


        return view('Admin.layouts.dashboard',compact('salesledger','purchaseledger','employee_info','duetotal','finalsales','finalpurchase'));
    }

    public function adminlogout(){
        Auth::guard('admin')->logout();
        return redirect()->to("/");
    }

}
