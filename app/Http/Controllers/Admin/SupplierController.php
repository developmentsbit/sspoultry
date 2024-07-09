<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Haruncpi\LaravelIdGenerator\IdGenerator;
use DB;

class SupplierController extends Controller
{

	public function __construct()
	{
		$this->middleware('auth:admin');
		
	}



	public function supplier(){
		return view('Admin.supplier.supplier');
	}

	public function supplierinsert(Request $r){

		$id = IdGenerator::generate(['table' => 'supplier_info', 'field'=>'supplier_id','length' => 7, 'prefix' =>'S-']);


		if ($r->previous_due > 0 && $r->previous_due != Null) {


			$data = array(
				'supplier_id'              => $id,
				'supplier_branch_id'       => $r->supplier_branch_id, 
				'supplier_name_en'         => $r->supplier_name_en, 
				'supplier_name_bn'         => $r->supplier_name_bn, 
				'supplier_email'           => $r->supplier_email, 
				'supplier_phone'           => $r->supplier_phone, 
				'supplier_address'         => $r->supplier_address,
				'supplier_company_name'    => $r->supplier_company_name,
				'supplier_company_phone'   => $r->supplier_company_phone,
				'supplier_company_address' => $r->supplier_company_address,
				'supplier_admin_id'        => Auth('admin')->user()->id,

			);

			DB::table('supplier_info')->insert($data);


			$data2 = array([

				'payment_date' => date('Y-m-d'),
				'entry_date'   => date('Y-m-d'),
				'previous_due' => $r->previous_due,
				'suplier_id'   => $id,
				'comment'      => "PD",
				'branch_id'    => Auth('admin')->user()->branch,
				'admin_id'     => Auth('admin')->user()->id,


			]);

			DB::table('supplier_payment')->insert($data2);




		}else{


			$data = array(
				'supplier_id'              => $id,
				'supplier_branch_id'       => $r->supplier_branch_id, 
				'supplier_name_en'         => $r->supplier_name_en, 
				'supplier_name_bn'         => $r->supplier_name_bn, 
				'supplier_email'           => $r->supplier_email, 
				'supplier_phone'           => $r->supplier_phone, 
				'supplier_address'         => $r->supplier_address,
				'supplier_company_name'    => $r->supplier_company_name,
				'supplier_company_phone'   => $r->supplier_company_phone,
				'supplier_company_address' => $r->supplier_company_address,
				'supplier_admin_id'        => Auth('admin')->user()->id,

			);

			DB::table('supplier_info')->insert($data);




		}


	}




	public function supplierinsert2(Request $r){

		$id = IdGenerator::generate(['table' => 'supplier_info', 'field'=>'supplier_id','length' => 7, 'prefix' =>'S-']);

		$data = array(
			'supplier_id'              => $id,
			'supplier_branch_id'       => $r->supplier_branch_id, 
			'supplier_name_en'         => $r->supplier_name_en,  
			'supplier_phone'           => $r->supplier_phone, 
			'supplier_address'         => $r->supplier_address,
			'supplier_company_name'    => $r->supplier_company_name,
			'supplier_company_address' => $r->supplier_company_address,
			'supplier_company_phone'   => $r->supplier_company_phone,
			'supplier_admin_id'        => Auth('admin')->user()->id,
			'supplier_branch_id' => Auth('admin')->user()->branch, 
		);

		DB::table('supplier_info')->insert($data);
		return redirect()->back();
	}




	public function deletesupplier($id){

		DB::table('supplier_info')->where('supplier_id',$id)->delete();
	}

	public function managesupplier(){
		$data = DB::table('supplier_info')
		->leftjoin('branch_info','branch_info.branch_id','supplier_info.supplier_branch_id')
		->select('supplier_info.*','branch_info.branch_name_en','branch_info.branch_name_bn')
		->where("supplier_info.supplier_branch_id",Auth('admin')->user()->branch)
		->get();
		return view('Admin.supplier.managesupplier',compact('data'));
	}


	public function editsupplier($id){

		$data = DB::table('supplier_info')->where('supplier_id',$id)->first();
		return view('Admin.supplier.editsupplier',compact('data'));
	}


	public function updatesupplier(Request $r,$id){

		$data = array(
			'supplier_branch_id' => $r->supplier_branch_id, 
			'supplier_name_en'   => $r->supplier_name_en, 
			'supplier_name_bn'   => $r->supplier_name_bn, 
			'supplier_email'     => $r->supplier_email, 
			'supplier_phone'     => $r->supplier_phone, 
			'supplier_address'   => $r->supplier_address,
			'supplier_company_name'    => $r->supplier_company_name,
			'supplier_company_address' => $r->supplier_company_address,
			'supplier_company_phone'   => $r->supplier_company_phone,
			'supplier_admin_id'  => Auth('admin')->user()->id, 
			'supplier_branch_id' => Auth('admin')->user()->branch, 
		);
		DB::table('supplier_info')->where('supplier_id',$id)->update($data);
	}

// End Supplier Methods

	public function supplierduelist(){
		$data = DB::table("supplier_info")->where("supplier_branch_id",Auth('admin')->user()->branch)->get();
		return view("Admin.supplier.supplierduelist",compact('data'));
	}
}
