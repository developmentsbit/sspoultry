<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Auth;
use Session;
use DB;

class CashcloseController extends Controller
{

	public function __construct()
	{
		$this->middleware('auth:admin');

	}



	public function cashclose()
	{


		$id =   Auth('admin')->user()->id;


		$admin =   Auth('admin')->user()->id;

		$previous_cash=DB::table('cash_close')
		->orderBy('cash_close.id','DESC','LIMIT','1')
		->first();



		if($previous_cash)
		{
			$cashdate=$previous_cash->cash_date;
			if($previous_cash->cash_date==date('Y-m-d')){
				$cash_date=strftime("%Y-%m-%d", strtotime("$previous_cash->cash_date +1 day"));
				$cash=$previous_cash->cash;
			}else{
				$cash_date=strftime("%Y-%m-%d", strtotime("$previous_cash->cash_date +1 day"));
				$cash=$previous_cash->cash;
			}

		}
		else
		{
			$cashdate='2010-01-01';
			$cash_date='2010-01-01';
			$cash=0;
		}

//============ Income=========

		$sale=DB::table('sales_payment')
		->whereBetween('sales_payment.entry_date',[$cash_date,date('Y-m-d')])
		->where("sales_payment.note","!=",'purchasewithsalepayment')
		->where('sales_payment.payment_amount','>','0')
		->sum('sales_payment.payment_amount');






		$pur_return_amount=DB::table('supplier_payment')
		->whereBetween('entry_date',[$cash_date,date('Y-m-d')])
		->sum('returnpaid');

		$others=DB::table('income_entry')
		->whereBetween('income_entry.entry_date',[$cash_date,date('Y-m-d')])
		->sum('income_entry.amount');






// ======Expense=========
		$purchase=DB::table('supplier_payment')
		->whereBetween('supplier_payment.entry_date',[$cash_date,date('Y-m-d')])
		->sum('payment');

		$sell_return_amount=DB::table('sales_payment')
		->whereBetween('entry_date',[$cash_date,date('Y-m-d')])
		->sum('returnpaid');

		$salary=DB::table('employee_salary_payment')
		->whereBetween('employee_salary_payment.date',[$cash_date,date('Y-m-d')])
		->sum('employee_salary_payment.salary_withdraw');


		$expense=DB::table('expense_entry')
		->whereBetween('expense_entry.entry_date',[$cash_date,date('Y-m-d')])
		->sum('expense_entry.amount');

		$bank_withdraw = 0;
		$bank_deposit = 0;



		return view('Admin.Cash.cashclose',compact('id','cash','cash_date','sale','others','bank_withdraw','purchase','salary','expense','bank_deposit','sell_return_amount','pur_return_amount','cashdate'));


	}




	public function CashCloseSubmit(Request $request)
	{
		$admin =   Auth('admin')->user();

		$insert=DB::table('cash_close')
		->insert([
			'cash_date'=>date('Y-m-d'),
			'cash'=>$request->cash,
			'bankbalance'=>$request->bankbalance,
			'comment'=>$request->comment,
			'admin_id'=>$admin->id,
			'created_at'=>date('Y-m-d'),
		]);


		$insertincome=DB::table('cash_close_income')
		->insert([
			'cash_date'=>date('Y-m-d'),
			'sales'=>$request->saless,
			'return'=>$request->pur_return_amount,
			'others'=>$request->otherss,
			'bank_withdraw'=>$request->bank_withdraws,
			'total'=>$request->totalincomes,
			'previous_cash'=>$request->hidden_cash,
			'admin_id'=>$admin->id,
			'created_at'=>date('Y-m-d'),
		]);

		$insertexpens=DB::table('cash_close_expense')
		->insert([
			'cash_date'=>date('Y-m-d'),
			'purchase'=>$request->purchases,
			'return'=>$request->sell_return_amount,
			'salary'=>$request->salarys,
			'expenses'=>$request->expenses,
			'bank_deposit'=>$request->bank_deposits,
			'total'=>$request->totalexpenses,
			'admin_id'=>$admin->id,
			'created_at'=>date('Y-m-d'),
		]);


		$notify = array('messege'=>'Cash Close Successfully done','alert-type'=>'success');
		return redirect()->back()->with($notify);
	}



	public function RecloseCash(Request $request)
	{
		$id =   Auth('admin')->user();

		$delete=DB::table('cash_close')->where('cash_date',date('Y-m-d'))->delete();

		$deleteincome=DB::table('cash_close_income')->where('cash_date',date('Y-m-d'))->delete();

		$deleteexpense=DB::table('cash_close_expense')->where('cash_date',date('Y-m-d'))->delete();


		if($delete)
		{
			return 'done';
		}


	}


	public function CashReport()
	{
		$id =   Auth('admin')->user();
		return view('Admin.Cash.cashreportpage',compact('id'));
	}



	public function CashinexReportView(Request $request)
	{

        // dd($request->all());
		$admin =   Auth('admin')->user();

		$Type = $request->Type;
		if($Type!="10")
		{

			$date = $request->date;
			$date1 = $request->date1;
			$date2 = $request->date2;
			$month = $request->month;
			$year = $request->year;




			if ($Type == '1') {

				$explode = explode('-',$request->date);
				$newdate = $explode[2].'-'.$explode[1].'-'.$explode[0];

				$dataincome = DB::table('cash_close')
				->where('cash_date',$newdate)
				->first();
				if ($dataincome)
				{

					$lastdate = DB::table('cash_close')
					->where('cash_date','<',$newdate)
					->orderby('cash_date','DESC')
					->first();
					if ($lastdate) {
                        // code...
						$cash_date=strftime("%Y-%m-%d", strtotime("$lastdate->cash_date +1 day"));
					}
					else
					{
						$cash_date='2020-01-01';

					}


        // ====Income=========

					$sale=DB::table('sales_payment')
					->leftjoin('customer_info','customer_info.customer_id','sales_payment.customer_id')
					->whereBetween('sales_payment.entry_date',[$cash_date,$newdate])
					->select('customer_info.customer_phone','customer_info.customer_name_en as customer_name','sales_payment.*')
					->where('sales_payment.payment_amount','>','0')
					->get();


					$others=DB::table('income_entry')
					->join('income_expense_title','income_expense_title.id','income_entry.income_id')
					->whereBetween('income_entry.entry_date',[$cash_date,$newdate])
					->Select('income_entry.*','income_expense_title.title')
					->get();

					$pur_return=DB::table('return_purchase_entry')
					->whereBetween('return_purchase_entry.entry_date',[$cash_date,$newdate])
					->get();


					$bank_withdraw=DB::table('bank_transaction')
					->join('bank_information','bank_information.id','bank_transaction.account_id')
					->where('bank_transaction.transaction_type','Withdraw')
					->whereBetween('bank_transaction.deposit_withdraw_entryDate',[$cash_date,$newdate])
					->select('bank_transaction.*','bank_information.bank_name')
					->get();


        // ===Expnese====
					$sell_return=DB::table('sales_return_entry')
					->leftjoin('customer_info','customer_info.customer_id','sales_return_entry.customer_id')
					->whereBetween('sales_return_entry.entry_date',[$cash_date,$newdate])
					->select("sales_return_entry.*","customer_info.customer_name_en")
					->get();


					$purchase=DB::table('supplier_payment')
					->leftjoin('supplier_info','supplier_info.supplier_id','supplier_payment.suplier_id')
					->whereBetween('supplier_payment.entry_date',[$cash_date,$newdate])
					->where('supplier_payment.payment','>','0')
					->select('supplier_info.supplier_company_name as company_name','supplier_payment.*')
					->get();


					$salary=DB::table('employee_salary_payment')
					->leftjoin('employee_info','employee_info.id','employee_salary_payment.employee_id')
					->whereBetween('employee_salary_payment.update_date',[$cash_date,$newdate])
					->select('employee_info.employee_name as Name','employee_salary_payment.*')
					->get();

					$expense=DB::table('expense_entry')
					->leftjoin('income_expense_title','income_expense_title.id','expense_entry.expense_id')
					->whereBetween('expense_entry.entry_date',[$cash_date,$newdate])
					->Select('expense_entry.*','income_expense_title.title')
					->get();

					$bank_deposit=DB::table('bank_transaction')
					->leftjoin('bank_information','bank_information.id','bank_transaction.account_id')
					->where('bank_transaction.transaction_type','Deposite')
					->whereBetween('bank_transaction.deposit_withdraw_entryDate',[$cash_date,$newdate])
					->select('bank_transaction.*','bank_information.bank_name')
					->get();


					$p_cash = DB::table('cash_close_income')
					->where('cash_date',$newdate)
					->first();

					$dataincome = DB::table('cash_close_income')
					->whereBetween('cash_date',[$cash_date,$newdate])
					->get();

					$dataexpense = DB::table('cash_close_expense')
					->whereBetween('cash_date',[$cash_date,$newdate])
					->get();

					$data=DB::table('sales_payment')
					->leftjoin('customer_info','sales_payment.customer_id','customer_info.customer_id')
					->whereBetween('sales_payment.entry_date',[$cash_date,$newdate])
					->Select('sales_payment.*','customer_info.customer_name_en as customer_name')
					->get();


					return view('Admin.Cash.inexclosereportview',compact('month','year','date','date1','date2','Type','admin','dataexpense','dataincome','sale','others','bank_withdraw','purchase','salary','expense','bank_deposit','p_cash','pur_return','sell_return','data'));
				}
				else
				{
					return redirect()->back()->with('error','Cash Date Not Found!');
				}


			}

		}
	}







public function sale_info_view()
{
    $admin =   Auth('admin')->user();

    $previous_cash=DB::table('cash_close')
    ->orderBy('cash_close.id','DESC','LIMIT','1')
    ->first();
    if($previous_cash){

        if($previous_cash->cash_date==date('Y-m-d')){
            $cash_date=strftime("%Y-%m-%d", strtotime("$previous_cash->cash_date +1 day"));
            $cash=$previous_cash->cash;
        }else{
            $cash_date=strftime("%Y-%m-%d", strtotime("$previous_cash->cash_date +1 day"));
            $cash=$previous_cash->cash;
        }

    }else{
        $cash_date='2010-01-01';
        $cash=0;
    }


    $data=DB::table('sales_payment')
    ->leftjoin('customer_info','customer_info.customer_id','sales_payment.customer_id')
    ->where('sales_payment.payment_amount','>','0')
    ->where("sales_payment.note","!=",'purchasewithsalepayment')
    ->whereBetween('sales_payment.entry_date',[$cash_date,date('Y-m-d')])
    ->Select('customer_info.customer_phone','customer_info.customer_name_en','sales_payment.*')
    ->get();




    $type= 'Sale';

    return view('Admin.Cash.collection_info_view',compact('admin','cash_date','data','type'));
}







	}
