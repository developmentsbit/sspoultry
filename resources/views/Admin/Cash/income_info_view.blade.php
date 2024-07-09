
    <div class="card">
      <div class="card-body">
        <h4 class="card-title">Collection Info</h4>

          <div class="form-group row">
            <label for="exampleInputUsername2" class="col-sm-6 col-form-label">Previous Cash</label>
            <div class="col-sm-6">
               {{$cash}}
      <input type="hidden" name="hidden_cash" value="{{$cash}}">
            </div>
          </div>
          <div class="form-group row">
            <label for="exampleInputEmail2" class="col-sm-6 col-form-label"><a href="{{url('sale_info_view')}}" target="_blank" style="text-decoration: none;">Sales</a></label>
            <div class="col-sm-6">
             <a href="{{url('sale_info_view')}}" target="_blank" style="text-decoration: none;">{{$sale}}</a>  
      <input type="hidden" name="saless" value="{{$sale}}">
            </div>
          </div>
          <div class="form-group row">
            <label for="exampleInputMobile" class="col-sm-6 col-form-label"><a href="{{url('others_info_view')}}" target="_blank" style="text-decoration: none;">Others</a></label>
            <div class="col-sm-6">
                 <a href="{{url('others_info_view')}}" target="_blank" style="text-decoration: none;">{{$others}}</a>
      <input type="hidden" name="otherss" value="{{$others}}">
            </div>
          </div>
          <div class="form-group row">
            <label for="exampleInputPassword2" class="col-sm-6 col-form-label"><a href="{{url('banks_info_view')}}" target="_blank" style="text-decoration: none;">Bank Withdraw</a></label>
            <div class="col-sm-6">
                <a href="{{url('banks_info_view')}}" target="_blank" style="text-decoration: none;">{{$bank_withdraw}}</a>
      <input type="hidden" name="bank_withdraws" value="{{$bank_withdraw}}">
            </div>
          </div>
          <div class="form-group row">
            <label for="exampleInputPassword2" class="col-sm-6 col-form-label">Purchase Return</label>
            <div class="col-sm-6">
                 <a href="{{url('return_info_view')}}" target="_blank" style="text-decoration: none;">{{$pur_return_amount}}</a>
      <input type="hidden" name="pur_return_amount" value="{{$pur_return_amount}}">
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
