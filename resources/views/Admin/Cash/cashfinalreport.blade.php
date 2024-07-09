@extends('Admin.index')
@section('body')



<div class="container-fluid">
<div class="row-fluid">
<div class="span12">
@include('error.msg')
<div class="widget-box">
        
        <div class="widget-title">
          <ul class="nav nav-tabs">
            <li class="active"><a data-toggle="tab" href="#tab1">Cash Close</a></li>
          </ul>
        </div>

          <div class="widget-content tab-content"  style="overflow: hidden;overflow-y:hidden;overflow-x:hidden;">
            <form class="form-horizontal" method="post" action="{{URL::to('CashCloseSubmit')}}" name="basic_validate" id="basic_validate" novalidate="novalidate" enctype="multipart/form-data">
                   {{ csrf_field() }}
            <div id="tab1" class="tab-pane active">
              <p>
                <div class="widget-box">
                      <div class="widget-title"> <span class="icon"> <i class="icon-info-sign"></i> </span>
                    <h5>Cash Close</h5>
                </div>
              <div class="span12" style="margin-bottom: 20px">
                <div class="widget-content nopadding span5">
                  
                      
                      <div class="control-group">
                        <h5>Collection Info</h5>
                      </div>

                      <div class="control-group">
                        <label class="control-label">Previous Cash </label>
                        <div class="controls">
                          <label style="margin:5px 0;text-align: right;"> {{$cash}}</label>
                        </div>
                      </div>

                      <div class="control-group">
                        <label class="control-label">Sales </label>
                        <div class="controls">
                          <label style="margin:5px 0;text-align: right;"> {{$sale}}</label>
                        </div>
                      </div>
                      
                      <div class="control-group">
                        <label class="control-label">Others </label>
                        <div class="controls">
                          <label style="margin:5px 0;text-align: right;"> {{$others}}</label>
                        </div>
                      </div>
                      
                      <div class="control-group">
                        <label class="control-label">Bank Withdraw </label>
                        <div class="controls">
                          <label style="margin:5px 0;text-align: right;"> {{$bank_withdraw}}</label>
                        </div>
                      </div>
                      <div class="control-group">
                        <label class="control-label"><b>Total Collection </b></label>
                        <div class="controls">
                          <label style="margin:5px 0;text-align: right;"> <b>{{$cash+$sale+$others+$bank_withdraw}}</b></label>
                        </div>
                      </div>
                  
                </div>

                <div class="widget-content nopadding span5" >
                  <form class="form-horizontal" method="post" action="{{URL::to('CashClose')}}" name="basic_validate" id="basic_validate" novalidate="novalidate" enctype="multipart/form-data">
                   {{ csrf_field() }}
                      <div class="control-group">
                        <h5>Expense Info</h5>
                      </div>
                      <div class="control-group">
                        <label class="control-label">Purchase </label>
                        <div class="controls">
                          <label style="margin:5px 0;text-align: right;"> {{$purchase}} </label>
                        </div>
                      </div>

                      <div class="control-group">
                        <label class="control-label">Salary </label>
                        <div class="controls">
                          <label style="margin:5px 0;text-align: right;"> {{$salary}}</label>
                        </div>
                      </div>
                      
                      <div class="control-group">
                        <label class="control-label">Expenses </label>
                        <div class="controls">
                          <label style="margin:5px 0;text-align: right;"> {{$expense}}</label>
                        </div>
                      </div>
                      
                      <div class="control-group">
                        <label class="control-label">Bank Deposit </label>
                        <div class="controls">
                          <label style="margin:5px 0;text-align: right;"> {{$bank_deposit}}</label>
                        </div>
                      </div>
                      <div class="control-group">
                        <label class="control-label"><b>Total Expense </b></label>
                        <div class="controls">
                          <label style="margin:5px 0;text-align: right;"> <b>{{$purchase+$salary+$expense+$bank_deposit}}</b></label>
                        </div>
                      </div>
                  
                </div>
              </div>
              
             </div>
              <div class="widget-box">
                      <div class="widget-title"> <span class="icon"> <i class="icon-info-sign"></i> </span>
                    <h5>Cash Close Entry</h5>
                      </div>
              </div>

              <div class="span12">
                
                <div class="widget-content nopadding span6" >
                  <form class="form-horizontal" method="post" action="{{URL::to('')}}" name="basic_validate" id="basic_validate" novalidate="novalidate" enctype="multipart/form-data">
                   {{ csrf_field() }}
                      <div class="control-group">
                        <h5>Cash Calculation</h5>
                      </div>
                      
                      <div class="control-group">
                        <label class="control-label"><font style="float: left;">Collection </font> <font style="float: right;">{{$cash+$sale+$others+$bank_withdraw}}</font></label>
                      </div>

                      <div class="control-group">
                        <label class="control-label"><font style="float: left;">Expense </font> <font style="float: right;"> {{$purchase+$salary+$expense+$bank_deposit}}</font></label>
                      </div>
                  
                      <div class="control-group">
                        <label class="control-label"><b><font style="float: left;">Current Cash </font> <font style="float: right;">{!!($cash+$sale+$others+$bank_withdraw)-($purchase+$salary+$expense+$bank_deposit) !!}</font></b></label>
                      </div>
                  
                </div>
              </div>
            </div>
             
            </p>
          </div>
          
          </form>

            
                   
        </div>

</div>
</div>
</div>
</div>

<script type="text/javascript">

CKEDITOR.replace('editor1');


 $(function() {
  $('#staticParent').on('keydown', '#child', function(e){-1!==$.inArray(e.keyCode,[46,8,9,27,13,110,190])||/65|67|86|88/.test(e.keyCode)&&(!0===e.ctrlKey||!0===e.metaKey)||35<=e.keyCode&&40>=e.keyCode||(e.shiftKey||48>e.keyCode||57<e.keyCode)&&(96>e.keyCode||105<e.keyCode)&&e.preventDefault()});
})
</script>


{{-- Address editor --}} 
<script type="text/javascript">
         CKEDITOR.replace('editor');

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

{{-- date time --}} 

<script>
$('#datetimepicker').datetimepicker({
dayOfWeekStart : 1,
lang:'en',
timepicker:false,
disabledDates:['1986/01/08','1986/01/09','1986/01/10'],
startDate:  '1986/01/05'
});
// $('#datetimepicker').datetimepicker({theme:'dark'});
</script>
@endsection