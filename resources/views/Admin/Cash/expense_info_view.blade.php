
    <div class="card">
      <div class="card-body">
        <h4 class="card-title">Expense Info</h4>
       
          <div class="form-group row">
            <label for="exampleInputUsername2" class="col-sm-6 col-form-label"><a href="{{url('expense_single_info_view')}}" target="_blank" style="text-decoration: none;">Purchase</a></label>
            <div class="col-sm-6">
             <a href="{{url('expense_single_info_view')}}" target="_blank" style="text-decoration: none;"> {{$purchase}}</a>
      <input type="hidden" name="purchases" value="{{$purchase}}">
            </div>
          </div>
          <div class="form-group row">
            <label for="exampleInputEmail2" class="col-sm-6 col-form-label"><a href="{{url('salary_single_info_view')}}" target="_blank" style="text-decoration: none;">Salary</a></label>
            <div class="col-sm-6">
              <a href="{{url('salary_single_info_view')}}" target="_blank" style="text-decoration: none;">{{$salary}}</a>
      <input type="hidden" name="salarys" value="{{$salary}}">
            </div>
          </div>
          <div class="form-group row">
            <label for="exampleInputMobile" class="col-sm-6 col-form-label"> <a href="{{url('otherexpense_single_info_view')}}" target="_blank" style="text-decoration: none;">Expenses</a></label>
            <div class="col-sm-6">
                 <a href="{{url('otherexpense_single_info_view')}}" target="_blank" style="text-decoration: none;">{{$expense}}</a>
      <input type="hidden" name="expenses" value="{{$expense}}">
            </div>
          </div>
          <div class="form-group row">
            <label for="exampleInputPassword2" class="col-sm-6 col-form-label"><a href="{{url('bank_single_info_view')}}" target="_blank" style="text-decoration: none;">Bank Deposit</a></label>
            <div class="col-sm-6">
              <a href="{{url('bank_single_info_view')}}" target="_blank" style="text-decoration: none;">{{$bank_deposit}}</a>
      <input type="hidden" name="bank_deposits" value="{{$bank_deposit}}">
            </div>
          </div>
          <div class="form-group row">
            <label for="exampleInputPassword2" class="col-sm-6 col-form-label">Sale Return</label>
            <div class="col-sm-6">
              <a href="{{url('return_single_info_view')}}" target="_blank" style="text-decoration: none;">{{$sell_return_amount}}</a>
      <input type="hidden" name="sell_return_amount" value="{{$sell_return_amount}}">
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
  
