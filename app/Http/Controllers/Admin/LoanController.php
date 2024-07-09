<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use DB;

class LoanController extends Controller
{
	public function __construct()
	{
		$this->middleware('auth:admin');

	}




	public function loanregister(){

		$data = DB::table('loanregister')->where("branch",Auth('admin')->user()->branch)->get();
		return view("Admin.loan.loanregister",compact('data'));
	}



	public function loanregisterinsert(Request $r){


		$data = array(
			'name'       => $r->name, 
			'phone'      => $r->phone, 
			'address'    => $r->address, 
			'branch'     => Auth('admin')->user()->branch, 

		);

		DB::table('loanregister')->insert($data);
	}

	

	public function deleteloanregister($id){

		DB::table('loanregister')->where('id',$id)->delete();
	}

	public function getloanregister(){
		$data = DB::table('loanregister')->where("branch",Auth('admin')->user()->branch)->get();
		return view('Admin.loan.getloanregister',compact('data'));
	}


	public function editloanregister($id){

		$data = DB::table('loanregister')->where('id',$id)->first();
		return view('Admin.loan.editloanregister',compact('data'));
	}


	public function updateloanregister(Request $r,$id){

		
		$data = array(
			'name'       => $r->name, 
			'phone'      => $r->phone, 
			'address'    => $r->address, 
			'branch'     => Auth('admin')->user()->branch, 

		);


		DB::table('loanregister')->where('id',$id)->update($data);
	}






















	public function loanprovide(){

		$data = DB::table('loanprovide')
		->where("loanprovide.branch",Auth('admin')->user()->branch)
		->join('loanregister','loanregister.id','loanprovide.register_id')
		->select("loanprovide.*",'loanregister.name')
		->get();


		return view("Admin.loan.loanprovide",compact('data'));
	}



	public function loanprovideinsert(Request $r){


		$data = array(
			'register_id' => $r->register_id, 
			'amount'      => $r->amount, 
			'note'        => $r->note, 
			'date'        => date('d-m-Y'), 
			'branch'      => Auth('admin')->user()->branch, 

		);

		DB::table('loanprovide')->insert($data);
	}

	

	public function deleteloanprovide($id){

		DB::table('loanprovide')->where('id',$id)->delete();
	}

	public function getloanprovide(){
		$data = DB::table('loanprovide')->where("branch",Auth('admin')->user()->branch)->get();
		return view('Admin.loan.getloanprovide',compact('data'));
	}


	public function editloanprovide($id){

		$data = DB::table('loanprovide')->where('id',$id)->first();
		return view('Admin.loan.editloanprovide',compact('data'));
	}


	public function updateloanprovide(Request $r,$id){

		
		$data = array(
			'register_id' => $r->register_id, 
			'amount'      => $r->amount, 
			'note'        => $r->note, 
			'date'        => date('d-m-Y'), 
			'branch'      => Auth('admin')->user()->branch, 

		);


		DB::table('loanprovide')->where('id',$id)->update($data);
	}







// loanreceived












	public function loanreceived(){

		$data = DB::table('loanreceived')
		->where("loanreceived.branch",Auth('admin')->user()->branch)
		->join('loanregister','loanregister.id','loanreceived.register_id')
		->select("loanreceived.*",'loanregister.name')
		->get();


		return view("Admin.loan.loanreceived",compact('data'));
	}



	public function loanreceivedinsert(Request $r){


		$data = array(
			'register_id' => $r->register_id, 
			'amount'      => $r->amount, 
			'note'        => $r->note, 
			'date'        => date('d-m-Y'), 
			'branch'      => Auth('admin')->user()->branch, 

		);

		DB::table('loanreceived')->insert($data);
	}

	

	public function deleteloanreceived($id){

		DB::table('loanreceived')->where('id',$id)->delete();
	}

	public function getloanreceived(){
		$data = DB::table('loanreceived')->where("branch",Auth('admin')->user()->branch)->get();
		return view('Admin.loan.getloanreceived',compact('data'));
	}


	public function editloanreceived($id){

		$data = DB::table('loanreceived')->where('id',$id)->first();
		return view('Admin.loan.editloanreceived',compact('data'));
	}


	public function updateloanreceived(Request $r,$id){

		
		$data = array(
			'register_id' => $r->register_id, 
			'amount'      => $r->amount, 
			'note'        => $r->note, 
			'date'        => date('d-m-Y'), 
			'branch'      => Auth('admin')->user()->branch, 

		);


		DB::table('loanreceived')->where('id',$id)->update($data);
	}
































	public function internalloanregister(){

		$data = DB::table('internalloanregister')->where("branch",Auth('admin')->user()->branch)->get();
		return view("Admin.internalloan.internalloanregister",compact('data'));
	}



	public function internalloanregisterinsert(Request $r){


		$data = array(
			'name'       => $r->name, 
			'phone'      => $r->phone, 
			'address'    => $r->address, 
			'branch'     => Auth('admin')->user()->branch, 

		);

		DB::table('internalloanregister')->insert($data);
	}

	

	public function deleteinternalloanregister($id){

		DB::table('internalloanregister')->where('id',$id)->delete();
	}

	public function getinternalloanregister(){
		$data = DB::table('internalloanregister')->where("branch",Auth('admin')->user()->branch)->get();
		return view('Admin.internalloan.getinternalloanregister',compact('data'));
	}


	public function editinternalloanregister($id){

		$data = DB::table('internalloanregister')->where('id',$id)->first();
		return view('Admin.internalloan.editinternalloanregister',compact('data'));
	}


	public function updateinternalloanregister(Request $r,$id){

		
		$data = array(
			'name'       => $r->name, 
			'phone'      => $r->phone, 
			'address'    => $r->address, 
			'branch'     => Auth('admin')->user()->branch, 

		);


		DB::table('internalloanregister')->where('id',$id)->update($data);
	}






















	public function internalloanprovide(){

		$data = DB::table('internalloanprovide')
		->where("internalloanprovide.branch",Auth('admin')->user()->branch)
		->join('internalloanregister','internalloanregister.id','internalloanprovide.register_id')
		->select("internalloanprovide.*",'internalloanregister.name')
		->get();


		return view("Admin.internalloan.internalloanprovide",compact('data'));
	}



	public function internalloanprovideinsert(Request $r){


		$data = array(
			'register_id' => $r->register_id, 
			'amount'      => $r->amount, 
			'note'        => $r->note, 
			'date'        => date('d-m-Y'), 
			'branch'      => Auth('admin')->user()->branch, 

		);

		DB::table('internalloanprovide')->insert($data);
	}

	

	public function deleteinternalloanprovide($id){

		DB::table('internalloanprovide')->where('id',$id)->delete();
	}

	public function getinternalloanprovide(){
		$data = DB::table('internalloanprovide')->where("branch",Auth('admin')->user()->branch)->get();
		return view('Admin.internalloan.getinternalloanprovide',compact('data'));
	}


	public function editinternalloanprovide($id){

		$data = DB::table('internalloanprovide')->where('id',$id)->first();
		return view('Admin.internalloan.editinternalloanprovide',compact('data'));
	}


	public function updateinternalloanprovide(Request $r,$id){

		
		$data = array(
			'register_id' => $r->register_id, 
			'amount'      => $r->amount, 
			'note'        => $r->note, 
			'date'        => date('d-m-Y'), 
			'branch'      => Auth('admin')->user()->branch, 

		);


		DB::table('internalloanprovide')->where('id',$id)->update($data);
	}







// internalloanreceived












	public function internalloanreceived(){

		$data = DB::table('internalloanreceived')
		->where("internalloanreceived.branch",Auth('admin')->user()->branch)
		->join('internalloanregister','internalloanregister.id','internalloanreceived.register_id')
		->select("internalloanreceived.*",'internalloanregister.name')
		->get();


		return view("Admin.internalloan.internalloanreceived",compact('data'));
	}



	public function internalloanreceivedinsert(Request $r){


		$data = array(
			'register_id' => $r->register_id, 
			'amount'      => $r->amount, 
			'note'        => $r->note, 
			'date'        => date('d-m-Y'), 
			'branch'      => Auth('admin')->user()->branch, 

		);

		DB::table('internalloanreceived')->insert($data);
	}

	

	public function deleteinternalloanreceived($id){

		DB::table('internalloanreceived')->where('id',$id)->delete();
	}

	public function getinternalloanreceived(){
		$data = DB::table('internalloanreceived')->where("branch",Auth('admin')->user()->branch)->get();
		return view('Admin.internalloan.getinternalloanreceived',compact('data'));
	}


	public function editinternalloanreceived($id){

		$data = DB::table('internalloanreceived')->where('id',$id)->first();
		return view('Admin.internalloan.editinternalloanreceived',compact('data'));
	}


	public function updateinternalloanreceived(Request $r,$id){

		
		$data = array(
			'register_id' => $r->register_id, 
			'amount'      => $r->amount, 
			'note'        => $r->note, 
			'date'        => date('d-m-Y'), 
			'branch'      => Auth('admin')->user()->branch, 

		);


		DB::table('internalloanreceived')->where('id',$id)->update($data);
	}
















	public function assetcategory(){

		$data = DB::table('asset_categoreys')->get();
		return view("Admin.asset.assetcategory",compact('data'));
	}



	public function assetcategoryinsert(Request $r){


		$data = array(
			'asset_title'      => $r->asset_title, 
			'description'      => $r->description, 
			'status'           => 1, 
			'admin_id'         => Auth('admin')->user()->id, 

		);

		DB::table('asset_categoreys')->insert($data);
	}

	

	public function deleteassetcategory($id){

		DB::table('asset_categoreys')->where('id',$id)->delete();
	}



	public function editassetcategory($id){

		$data = DB::table('asset_categoreys')->where('id',$id)->first();
		return view('Admin.asset.editassetcategory',compact('data'));
	}


	public function updateassetcategory(Request $r,$id){

		
		
		$data = array(
			'asset_title'      => $r->asset_title, 
			'description'      => $r->description, 
			'status'           => 1, 
			'admin_id'         => Auth('admin')->user()->id, 

		);


		DB::table('asset_categoreys')->where('id',$id)->update($data);
	}













public function assetcostentry(){

$data = DB::table('asset_expenses')
->join('asset_categoreys','asset_categoreys.id','asset_expenses.asset_title_id')
->select("asset_expenses.*",'asset_categoreys.asset_title')
->get();
return view("Admin.asset.assetcostentry",compact('data'));
}



public function assetcostentryinsert(Request $r){


$data = array(
'date'      => $r->date, 
'asset_title_id' => $r->asset_title_id,
'description'      => $r->description, 
'taka_ammount'           => $r->taka_ammount, 
'status' => 1,
'description'=>$r->description,
'branch_id' => Auth('admin')->user()->branch,
'admin_id'         => Auth('admin')->user()->id, 

);

DB::table('asset_expenses')->insert($data);
}



public function deleteassetcostentry($id){

DB::table('asset_expenses')->where('id',$id)->delete();
}



public function editassetcostentry($id){

$data = DB::table('asset_expenses')->where('id',$id)->first();
return view('Admin.asset.editassetcostentry',compact('data'));
}


public function updateassetcostentry(Request $r,$id){

$data = array(
'date'      => $r->date, 
'asset_title_id' => $r->asset_title_id,
'description'      => $r->description, 
'taka_ammount'           => $r->taka_ammount, 
'status' => 1,
'description'=>$r->description,
'admin_id'         => Auth('admin')->user()->id, 

);



DB::table('asset_expenses')->where('id',$id)->update($data);
}





	public function assetdepreciation(){

		$data = DB::table('asset_depreciations')
		->join('asset_categoreys','asset_categoreys.id','asset_depreciations.asset_title_id')
        ->select("asset_depreciations.*",'asset_categoreys.asset_title')
		->get();
		return view("Admin.asset.assetdepreciation",compact('data'));
	}



	public function assetdepreciationinsert(Request $r){
	    
	

		$data = array(
			'asset_title_id'        => $r->asset_title_id, 
			'depreciation_value_per'=> $r->depreciation_value_per, 
			'description'           => $r->description, 
			'status'                => 1, 
			'admin_id'              => Auth('admin')->user()->id, 

		);

		DB::table('asset_depreciations')->insert($data);
	}

	

	public function deleteassetdepreciation($id){

		DB::table('asset_depreciations')->where('id',$id)->delete();
	}



	public function editassetdepreciation($id){

		$data = DB::table('asset_depreciations')->where('id',$id)->first();
		return view('Admin.asset.editassetdepreciation',compact('data'));
	}


	public function updateassetdepreciation(Request $r,$id){

		
		
		$data = array(
			'asset_title_id'        => $r->asset_title_id, 
			'depreciation_value_per'=> $r->depreciation_value_per, 
			'description'           => $r->description, 
			'status'                => 1, 
			'admin_id'              => Auth('admin')->user()->id, 

		);

		DB::table('asset_depreciations')->where('id',$id)->update($data);
	}




    public function gettotalloan($register_id){
        
        $recieved = DB::table("loanreceived")->where('register_id',$register_id)->sum("amount");
        $provide  = DB::table("loanprovide")->where('register_id',$register_id)->sum("amount");
        
        return response()->json($recieved-$provide);
        
    }

  public function loanstatement(){
      
      $data = DB::table("loanregister")->get();
      return view("Admin.loan.loanstatement",compact('data'));
  }


    public function gettotalinternalloan($register_id){
        
        $recieved = DB::table("internalloanreceived")->where('register_id',$register_id)->sum("amount");
        $provide  = DB::table("internalloanprovide")->where('register_id',$register_id)->sum("amount");
        
        return response()->json($recieved-$provide);
        
    }

  public function internalloanstatement(){
      
      $data = DB::table("internalloanregister")->get();
      return view("Admin.internalloan.internalloanstatement",compact('data'));
  }



}
