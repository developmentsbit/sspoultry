 @extends('Admin.layouts.index')
 @section('content')


 <div class="content-wrapper">
  <div class="page-heading">
    <h3 class="page-title">Cash Close Information</h3>
  </div>



  <div class="page-content fade-in">
    <div class="ibox">
      <div class="ibox-head myhead">
        <div class="ibox-title"><i class="fa fa-list-ul" aria-hidden="true"></i>&nbsp;&nbsp;Cash Close</div>

      </div>


      <div class="container-fluid">
        <div class="card mb-4 border-0">

          <div class="card-body">
            <form class="form-horizontal" method="post" action="{{URL::to('CashCloseSubmit')}}" name="basic_validate" id="basic_validate" novalidate="novalidate" enctype="multipart/form-data">
             @csrf
             <div id="tab1" class="tab-pane active">

              <div class="widget-box">

                <div class="span12">
                  <br>

                  <div class="row">
                    <div class="col-md-6 grid-margin stretch-card" id="income_info_view">
                      <div class="card">
                        <div class="card-header bg-success text-light pt-3">
                         <h4 class="card-title"><b>Income Info</b></h4>
                       </div>
                       <div class="card-body">


                        <div class="form-group row">
                          <label for="exampleInputUsername2" class="col-sm-6 col-form-label">Previous Cash</label>
                          <div class="col-sm-6">
                           {{$cash}} <input type="hidden" name="hidden_cash" value="{{$cash}}">
                         </div>
                       </div>
                       <div class="form-group row">
                        <label for="exampleInputEmail2" class="col-sm-6 col-form-label">Sales/Collection</label>
                        <div class="col-sm-6">
                         <a href="{{url('sale_info_view')}}" target="_blank" style="text-decoration: none;">{{$sale}}</a>  
                         <input type="hidden" name="saless" value="{{$sale}}">
                       </div>
                     </div>
                     <div class="form-group row">
                      <label for="exampleInputMobile" class="col-sm-6 col-form-label">Others Income</label>
                      <div class="col-sm-6">
                       <a href="{{url('others_info_view')}}" target="_blank" style="text-decoration: none;">{{$others}}</a>
                       <input type="hidden" name="otherss" value="{{$others}}">
                     </div>
                   </div>
                   
                  <div class="form-group row">
                    <label for="exampleInputPassword2" class="col-sm-6 col-form-label">Purchase Return</label>
                    <div class="col-sm-6">
                      <a href="{{url('return_info_view')}}" target="_blank" style="text-decoration: none;">{{$pur_return_amount}}</a>
                      <input type="hidden" name="pur_return_amount" value="{{$pur_return_amount}}">
                    </div>
                  </div>


                  <div class="form-group row d-none">
                    <label for="exampleInputPassword2" class="col-sm-6 col-form-label">Bank Withdraw/Interest</label>
                    <div class="col-sm-6">
                      <a href="{{url('banks_info_view')}}" target="_blank" style="text-decoration: none;">{{$bank_withdraw}}</a>
                      <input type="hidden" name="bank_withdraws" value="{{$bank_withdraw}}">
                    </div>
                  </div>

                  <div class="form-group row">
                    <label for="exampleInputPassword2" class="col-sm-6 col-form-label"> <b>Total Collection</b></label>
                    <div class="col-sm-6">
                     <b>

                      {{$cash+$sale+$others+$bank_withdraw+$pur_return_amount}} 
                      <input type="hidden" name="totalincomes" value="{{$sale+$others+$bank_withdraw+$pur_return_amount}}">
                    </b>
                  </div>
                </div>


              </div>
            </div>
          </div>
          <div class="col-md-6 grid-margin stretch-card" id="expense_info_view">
            <div class="card">

              <div class="card-header bg-danger text-light pt-3">
               <h4 class="card-title"><b>Expense Info</b></h4>
             </div>


             <div class="card-body">


              <div class="form-group row">
                <label for="exampleInputUsername2" class="col-sm-6 col-form-label">Purchase</label>
                <div class="col-sm-6">
                  <a href="{{url('expense_single_info_view')}}" target="_blank" style="text-decoration: none;"> {{$purchase}}</a>
                  <input type="hidden" name="purchases" value="{{$purchase}}">
                </div>
              </div>
              <div class="form-group row">
                <label for="exampleInputEmail2" class="col-sm-6 col-form-label">Salary</label>
                <div class="col-sm-6">
                 <a href="{{url('salary_single_info_view')}}" target="_blank" style="text-decoration: none;">{{$salary}}</a>
                 <input type="hidden" name="salarys" value="{{$salary}}">
               </div>
             </div>
             <div class="form-group row">
              <label for="exampleInputMobile" class="col-sm-6 col-form-label">Expenses</label>
              <div class="col-sm-6">
               <a href="{{url('otherexpense_single_info_view')}}" target="_blank" style="text-decoration: none;">{{$expense}}</a>
               <input type="hidden" name="expenses" value="{{$expense}}">
             </div>
           </div>
           
          <div class="form-group row">
            <label for="exampleInputPassword2" class="col-sm-6 col-form-label">Sales Return</label>
            <div class="col-sm-6">
              <a href="{{url('return_single_info_view')}}" target="_blank" style="text-decoration: none;">{{$sell_return_amount}}</a>
              <input type="hidden" name="sell_return_amount" value="{{$sell_return_amount}}">
            </div>
          </div>

          <div class="form-group row d-none">
            <label for="exampleInputPassword2" class="col-sm-6 col-form-label">Bank Deposit</label>
            <div class="col-sm-6">
              <a href="{{url('bank_single_info_view')}}" target="_blank" style="text-decoration: none;">{{$bank_deposit}}</a>
              <input type="hidden" name="bank_deposits" value="{{$bank_deposit}}">
            </div>
          </div>


          <div class="form-group row">
            <label for="exampleInputConfirmPassword2" class="col-sm-6 col-form-label"><b>Total Expense </b></label>
            <div class="col-sm-6">
             <b>{{$purchase+$salary+$expense+$bank_deposit+$sell_return_amount}}</b>
             <input type="hidden" name="totalexpenses" value="{{$purchase+$salary+$expense+$bank_deposit+$sell_return_amount}}">

           </div>
         </div>


       </div>
     </div>
   </div>
 </div>






</div>

</div>



<div class="span12 mt-5">


  <div class="card">

    <div class="card-header bg-success text-light pt-3">
     <center><h4 class="card-title "><b>Cash Calculation</b></h4></center>
   </div>


   <div class="card-body">

    <div class="form-group">

      <div id="cash_calculation_view" >
        <table class="table table-bordered table-striped">
          <thead>
            <tr>
              <th>Collection</th>
              <th>Expense</th>
              <th>Current Cash</th>
            </tr>
          </thead>
          <tbody>
            <td>
              {{$cash+$sale+$others+$pur_return_amount}}
            </td>
            <td>{{$purchase+$salary+$expense+$sell_return_amount}}</td>
            <td>{!!($cash+$sale+$others+$pur_return_amount)-($purchase+$salary+$expense+$sell_return_amount) !!}</td>
          </tbody>
        </table>

      </div>


      <div>




        @php
        $bankinfo = DB::table("bank_transaction")
        ->leftjoin("bank_information",'bank_information.id',"bank_transaction.account_id")
        ->select("bank_transaction.*",'bank_information.bank_name')
        ->get();
        @endphp

        <div class="row">

          @php
          $grandtotal = 0;
          $bankinfoo="";
          @endphp

          @if(isset($bankinfo))
          @foreach($bankinfo as $bank)

          @php
          $savingammount = DB::table("bank_transaction")->where('account_id',$bank->id)->where("transaction_type","Deposit")->sum("deposit_withdraw_amount");
          $withdrawammount = DB::table("bank_transaction")->where('account_id',$bank->id)->where("transaction_type","Withdraw")->sum("deposit_withdraw_amount");

          $total = $savingammount-$withdrawammount;

          $grandtotal = $grandtotal+ $total;
          @endphp


          <div class="col-md-3 mb-4 d-none">
            <div class="border p-4">
              <b>{{ $bank->bank_name }}</b><br>
              {{ $total }}
              @php
              $bankinfoo=$bankinfoo.$bank->bank_name.' : <br>'.$total.'Tk.<br>';
              @endphp
            </div>
          </div>
          @endforeach
          @endif


          <div class="col-md-6">
            <div class="border p-4">
              <b>Total Bank Balance</b><br>
              {{ $grandtotal }}

              @php
              $bankinfoo=$bankinfoo.'Total Bank Balance: <br>'.$grandtotal.'Tk.';
              @endphp
            </div>
          </div>


          <div class="col-md-6">
            <div class="border p-4">
              <b>Cash in hand</b><br>
              {{ ($cash+$sale+$others+$bank_withdraw+$pur_return_amount)-($purchase+$salary+$expense+$bank_deposit+$sell_return_amount)-$grandtotal }}

              @php
              $hc=($cash+$sale+$others+$bank_withdraw+$pur_return_amount)-($purchase+$salary+$expense+$bank_deposit+$sell_return_amount)-$grandtotal;
              $bankinfoo=$bankinfoo.' <br> Cash in Hand :  <br> '.$hc.'Tk.';
              @endphp
            </div>
          </div>



          <input type="hidden" value="{{ $bankinfoo }}" name="bankbalance">



        </div>



      </div>



    </div>
  </div>
</div>




<div class="widget-content nopadding span8 mt-5" id="cash_entry_view">


  <div class="card-header bg-success text-light pt-3">
   <center><h4 class="card-title"><b>Current Cash</b></h4></center>
 </div>


 <table class="table table-bordered table-striped">
  <thead>
    <tr>
      <th>Date</th>
      <th>Cash Amount</th>
      <th>Comment</th>
    </tr>
  </thead>
  <tbody>
    <td>{{date('d-m-Y')}}<input type="hidden" name="date" value="{{date('Y-m-d')}}"></td>
    <td>

      {!! ($cash+$sale+$others+$pur_return_amount)-($purchase+$salary+$expense+$sell_return_amount) !!}
      <input type="hidden" name="cash" value="{!! ($cash+$sale+$others+$pur_return_amount)-($purchase+$salary+$expense+$sell_return_amount) !!}">

    </td>
    <td><input type="text" name="comment"></td>
  </tbody>
</table>

</div>















</div>

<div class="form-actions mt-5" id="cash_submit_view" align="center">
  @if($cashdate==date('Y-m-d'))
  <center><font style="color: green;font-weight:bold;float: right;">You can <a class="btn btn-success" onclick="re_close_cash();" style="margin-top:2px ">Re-Close</a> Today's Cash.</font><font style="color: red;font-weight:bold;float: left;margin-top: 4px">N.B: You have already Closed today's Cash.</font></center>

  @else
  <center><font style="color: red;font-weight:bold;float: left;">N.B: Cash Can be Closed Only Once A Day.</font>
    <input type="submit"  class="btn btn-success" style="float: right;margin:5px" value="Submit Cash Close" /></center>
    @endif


  </div>


</form>
</div>
</div>






</div>
</div>
</div>


<script type="text/javascript">



  function GetCashSubmit() {

    $.ajax({
      url: "{{URl::to('GetCashSubmit')}}",
      type: 'GET',
      data: {},
      success:function(data) {
        $('#cash_submit_view').html(data);
      }
    });

  };

  function re_close_cash() {


    $.ajax({
      headers: { 'X-CSRF-TOKEN': "{{ csrf_token() }}" },
      url: '{{ url("RecloseCash") }}',
      type: 'POST',
      data: {},
      success:function(data){
        if(data=="done"){
          location.reload();
        }
      }
    });

  }
</script>
@endsection