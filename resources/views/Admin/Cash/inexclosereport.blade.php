@extends('Admin.index')
@section('body')


<div class="col-sm-12 col-12 bg-white p-4 bg">
  <h4 class="font-weight-bold">Show Cash Close Report</h4><hr>
</div>




<div class="row grid-margin ">
  <div class="col-12">
   <div class="card">
    @include('error.msg')
    <div class="card-body "> 

      <div class="widget-content nopadding border p-4">
        <form class="form-horizontal" method="post" action="{{URL::to('CashinexReportView')}}" name="basic_validate" id="basic_validate" novalidate="novalidate">
         {{ csrf_field() }}
         @if($id->fk_brance_id=="1")
         <div class="form-group">
          <label class="control-label">Select A Branch:</label>
          <div class="controls">
            <select class="form-control" name="branch" id="branch">
              @if(count($branch))
              @foreach ($branch as $b)
              @if($b->id!="1")
              <option value="{{$b->id}}">{{$b->name}}</option>
              @endif
              @endforeach
              @endif
            </select>
          </div>
        </div>
        @endif

        <div class="form-group">
          <label class="control-label">Type</label>
          <div class="controls">
            <select  name ="Type"  id="Type" class="form-control" onchange="showReport()">
              <option value="10">Select One</option>
              <option value="1">Daily</option>
              <!--<option value="2">Date To Date</option>-->
              <option value="3">Monthly</option>
              <option value="4">Yearly</option>

            </select>

          </div>
        </div>

<div class="col-6" id="day" style="display: none;">
  
              <div id="datepicker-popup" class="input-group date datepicker" >
                <input type="text" name="date" data-date-format="yyyy-mm-dd" placeholder="yyyy-mm-dd" class="datepicker form-control" value="{{date('Y-m-d')}}">
                <span class="input-group-addon input-group-append border-left">
                  <span class="mdi mdi-calendar input-group-text"></span>
              </span>
              </div>
</div>

<div class="col-12" id="dayto" style="display: none;">
  <div class="row">
    <div class="col-6">
  
              <div id="datepicker-popup1" class="input-group date datepicker" >
                <input type="text" name="date1" data-date-format="yyyy-mm-dd" placeholder="yyyy-mm-dd" class="datepicker11 form-control" value="{{date("Y-m-d")}}">
                <span class="input-group-addon input-group-append border-left">
                  <span class="mdi mdi-calendar input-group-text"></span>
              </span>
              </div>
</div>
<div class="col-6">
  
              <div id="datepicker-popup2" class="input-group date datepicker" >
                <input type="text" name="date2"  data-date-format="yyyy-mm-dd" placeholder="yyyy-mm-dd" class="datepicker22 form-control" value="{{date("Y-m-d")}}">
                <span class="input-group-addon input-group-append border-left">
                  <span class="mdi mdi-calendar input-group-text"></span>
              </span>
              </div>
</div>
  </div>

</div>
          

        


        <div class="form-group" id="group">

        </div>


        <div class="form-group" id="year">

        </div>



        <div class="form-actions">
          <input type="submit"  formtarget="_blank" value="Show Cash Report" class="btn btn-dark ">
        </div>
      </form>
    </div>
  </div> 
</div>


</div>
</div>
</div>


<meta name="_token" content="{!! csrf_token() !!}" />



<script type="text/javascript">
  function showReport(){

    $('#year').html('');
    $('#group').html('');
    var type = $('#Type').val();
    if(type=='10'){
      $('#year').html('');
      $('#group').html('');
    }
    else{


      if(type==='1'){
         $('#dayto').css('display','none');
        $('#day').css('display','block');
        
      }
      else if(type==='3'){
        $('#dayto').css('display','none');
        $('#day').css('display','none');
        $('#year').html('');
        $('#group').html('');
        $('#group').append('<label class="control-label">Select Month</label> <div class="controls"> <select  name="month"  id="month" class="form-control"><option value="01">January</option><option value="02">February</option><option value="03">March</option> <option value="04">April</option> <option value="05">May</option> <option value="06">June</option> <option value="07">July</option><option value="08">August </option> <option value="09">September </option> <option value="10">October </option> <option value="11">November </option>  <option value="12">December </option></select></div>');

        $('#year').append('<label class="control-label">Year</label><div class="controls"><input type="text" name="year"  placeholder="2018" class="datepicker form-control" value="{{date(Y)}}"> </div>');
      }else if(type==='4')
      {
            $('#dayto').css('display','none');
        $('#day').css('display','none');
       $('#year').html('');
       $('#group').html('');
       $('#year').append('<label class="control-label">Year</label><div class="controls"><input type="text" name="year"  placeholder="2021" class="datepicker form-control" value="{{date(Y)}}"> </div>');

     }else if(type==='2')
     {
      $('#day').css('display','none');
      $('#dayto').css('display','block');
     }



     else{

      $('#year').html('');
      $('#group').html('');
    }



  }



}

</script>




@endsection
