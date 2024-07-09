<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Haruncpi\LaravelIdGenerator\IdGenerator;
use DB;

class CustomerController extends Controller
{


	public function __construct()
	{
		$this->middleware('auth:admin');
		
	}



	public function customer(){
		return view('Admin.customer.customer');
	}

	public function customerinsert(Request $r){
	    
	   // dd($r->all());

		$id = IdGenerator::generate(['table' => 'customer_info', 'field'=>'customer_id','length' => 7, 'prefix' =>'C-']);
		
// 		return $id;


		if ($r->previous_due > 0 && $r->previous_due != Null) {

			$data = array(
				'customer_id'        => $id,
				'customer_branch_id' => $r->customer_branch_id, 
				'customer_name_en'   => $r->customer_name_en, 
				'customer_name_bn'   => $r->customer_name_bn, 
				'customer_email'     => $r->customer_email, 
				'customer_phone'     => $r->customer_phone, 
				'customer_address'   => $r->customer_address,
				'type'               => $r->type,
				'customer_admin_id'  => Auth('admin')->user()->id,
			);
            // dd($data);
			DB::table('customer_info')->insert($data);
			
			

			$data2 = array([

				'entry_date'   => date('Y-m-d'),
				'previous_due' => $r->previous_due,
				'customer_id'  => $id,
				'note'         => "PD",
				'branch_id'    => Auth('admin')->user()->branch,
				'admin_id'     => Auth('admin')->user()->id,


			]);

			DB::table('sales_payment')->insert($data2);
			
			
			
		}
		else{

			$data = array(
				'customer_id'        => $id,
				'customer_branch_id' => $r->customer_branch_id, 
				'customer_name_en'   => $r->customer_name_en, 
				'customer_name_bn'   => $r->customer_name_bn, 
				'customer_email'     => $r->customer_email, 
				'customer_phone'     => $r->customer_phone, 
				'customer_address'   => $r->customer_address,
				'type'               => $r->type,
				'customer_admin_id'  => Auth('admin')->user()->id,
			);

			DB::table('customer_info')->insert($data);

		}
    
    
        $image = $r->file('image');
			
			$nid = $r->file('nid');
			
			if($image)
    		{
    		    $imageName = rand().'.'.$image->getClientOriginalExtension();
    		    
    		    $image->move(base_path().'/public/Admin/CustomerImage/',$imageName);
    		    
    		    DB::table('customer_info')->where('customer_id',$id)->update(['image'=>$imageName]);
    		}
    		
			if($nid)
    		{
    		    $imageName = rand().'.'.$nid->getClientOriginalExtension();
    		    
    		    $nid->move(base_path().'/public/Admin/CustomerNid/',$imageName);
    		    
    		    DB::table('customer_info')->where('customer_id',$id)->update(['nid'=>$imageName]);
    		}
		

    return redirect('/managecustomer');


	}

	public function deletecustomer($id){
	    
	    
	    $pathImage = DB::table('customer_info')->where('customer_id',$id)->first();
	    
	    $path1 = base_path().'/public/Admin/CustomerNid/'.$pathImage->image;
	    
	    if(file_exists($path1))
	    {
	        unlink($path1);
	    }
	    
	    $path2 = base_path().'/public/Admin/CustomerNid/'.$pathImage->nid;
	    
	    if(file_exists($path2))
	    {
	        unlink($path2);
	    }

		DB::table('customer_info')->where('customer_id',$id)->delete();
		
		
	}

	public function managecustomer(){
		$data = DB::table('customer_info')
		->leftjoin('branch_info','branch_info.branch_id','customer_info.customer_branch_id')
		->select('customer_info.*','branch_info.branch_name_en','branch_info.branch_name_bn')
		->where("customer_info.Customer_branch_id",Auth('admin')->user()->branch)
		->get();
		return view('Admin.customer.managecustomer',compact('data'));
	}


	public function editcustomer($id){

		$data = DB::table('customer_info')->where('customer_id',$id)->first();
		return view('Admin.customer.editcustomer',compact('data'));
	}


	public function updatecustomer(Request $r,$id){
	    
	    
	   

		$data = array(
			'customer_branch_id' => $r->customer_branch_id, 
			'customer_name_en'   => $r->customer_name_en, 
			'customer_name_bn'   => $r->customer_name_bn, 
			'customer_email'     => $r->customer_email, 
			'customer_phone'     => $r->customer_phone, 
			'customer_address'   => $r->customer_address,
			'type'               => $r->type,
			'customer_admin_id'  => Auth('admin')->user()->id, 
		);
		
		
		DB::table('customer_info')->where('customer_id',$id)->update($data);
		
		
		$image = $r->file('image');
			
		$nid = $r->file('nid');
		
		if($image)
		{
		    $pathImage = DB::table('customer_info')->where('customer_id',$id)->first();
		    
		    $path = base_path().'/public/Admin/CustomerImage/'.$pathImage->image;
		    
		    if(file_exists($path))
		    {
		        unlink($path);
		    }
		    
		}
		
		if($image)
		{
		    $imageName = rand().'.'.$image->getClientOriginalExtension();
		    
		    $image->move(base_path().'/public/Admin/CustomerImage/',$imageName);
		    
		    DB::table('customer_info')->where('customer_id',$id)->update(['image'=>$imageName]);
		}
		
		if($nid)
		{
		    $pathImage = DB::table('customer_info')->where('customer_id',$id)->first();
		    
		    $path = base_path().'/public/Admin/CustomerNid/'.$pathImage->nid;
		    
		    if(file_exists($path))
		    {
		        unlink($path);
		    }
		    
		}
		
		if($nid)
		{
		    $imageName = rand().'.'.$nid->getClientOriginalExtension();
		    
		    $nid->move(base_path().'/public/Admin/CustomerNid/',$imageName);
		    
		    DB::table('customer_info')->where('customer_id',$id)->update(['nid'=>$imageName]);
		}
		
		
		 $pdcustomer = DB::table("sales_payment")->where('customer_id',$id)->where('note',"PD")->first();
		 
		 if($pdcustomer){
		    

			DB::table('sales_payment')->where("customer_id",$id)->where("note",'PD')->update([
			     'previous_due' => $r->previous_due
			    ]);
		     
		 }
		 else{
		     
		     
		     	$data2 = array([

				'entry_date'   => date('Y-m-d'),
				'previous_due' => $r->previous_due,
				'customer_id'  => $id,
				'note'         => "PD",
				'branch_id'    => Auth('admin')->user()->branch,
				'admin_id'     => Auth('admin')->user()->id,


			]);

			DB::table('sales_payment')->insert($data2);
		     
		 }
		
		
		
		

		
		

	
        return redirect('/managecustomer');



		
	}

// End Customer Methods



	public function customerinsert2(Request $r){

		$id = IdGenerator::generate(['table' => 'customer_info', 'field'=>'customer_id','length' => 7, 'prefix' =>'C-']);


		$data = array(
			'customer_id'        => $id,
			'customer_branch_id' => $r->customer_branch_id, 
			'customer_name_en'   => $r->customer_name_en, 
			'customer_name_bn'   => $r->customer_name_bn, 
			'customer_email'     => $r->customer_email, 
			'customer_phone'     => $r->customer_phone, 
			'customer_address'   => $r->customer_address,
			'type'               => 1,
			'customer_admin_id'  => Auth('admin')->user()->id,
		);

		DB::table('customer_info')->insert($data);
		return redirect()->back();

	}



	public function customerduelist(){
		$data = DB::table("customer_info")->where("Customer_branch_id",Auth('admin')->user()->branch)->get();
		return view("Admin.customer.customerduelist",compact('data'));
	}



}
