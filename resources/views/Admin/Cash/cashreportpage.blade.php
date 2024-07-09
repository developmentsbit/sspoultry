@extends('Admin.layouts.index')
@section('content')


<div class="content-wrapper">
  <div class="page-heading">
    <h3 class="page-title">Cash Close Reports</h3>
  </div>



  <div class="page-content fade-in">
    <div class="ibox">
      <div class="ibox-head mb-3 myhead">
        <div class="ibox-title"><i class="fa fa-list-ul" aria-hidden="true"></i>&nbsp;&nbsp;Cash Close Reports</div>

      </div>



<div class="app-body">
  <main class="main-content">
    <div class="container-fluid p-0">

      <div class="container-fluid mt-4">
        <div class="card mb-4 border-0">

          <div class="card-body">
            @if (\Session::has('error'))
                <div class="alert alert-danger">
                    <ul>
                        <li>{!! \Session::get('error') !!}</li>
                    </ul>
                </div>
            @endif
            <form class="form-horizontal row" method="post" action="{{URL::to('CashinexReportView')}}" name="basic_validate" id="basic_validate" novalidate="novalidate">
             {{ csrf_field() }}



             <div class="form-group col-md-12">
              <label >Report Type</label>

              <select  name ="Type"  id="Type" class="form-control textfill" onchange="showReport()" required="">
                <option value="10">Select One</option>
                <option value="1">Daily</option>
            {{--     <option value="2">Date To Date</option>
                <option value="3">Monthly</option>
                <option value="4">Yearly</option> --}}

              </select>

            </div>

            <div class="form-group col-md-6" id="first">

            </div>


            <div class="form-group col-md-6"  id="second">

            </div>


            <div class="form-actions col-12">
              <input type="submit"  formtarget="_blank" value="Show Cash Report" class="btn btn-success">
            </div>
          </form>
        </div>
      </div>
    </div>


  </div>
</div>

</main>
</div>
</div>
</div>
</div>


<meta name="_token" content="{!! csrf_token() !!}" />



<script type="text/javascript">
 function showReport(){

  $('#second').html('');
  $('#first').html('');
  var type = $('#Type').val();
  if(type=='10'){
    $('#second').html('');
    $('#first').html('');
  }
  else{


    if(type==='1'){

     $('#second').html('');
     $('#first').html('');
     $('#first').append('<label class="control-label">Start Date</label> <div class="controls"> <input type="text" class="form-control date-picker-input" placeholder="Start Date" value="{{date('d-m-Y')}}" name="date" id="date"></div>');

   }
   else if(type==='3'){
    $('#second').html('');
    $('#first').html('');
    $('#first').append('<label class="control-label">Select Month</label> <div class="controls"> <select  name="month"  id="month" class="form-control"><option value="01">January</option><option value="02">February</option><option value="03">March</option> <option value="04">April</option> <option value="05">May</option> <option value="06">June</option> <option value="07">July</option><option value="08">August </option> <option value="09">September </option> <option value="10">October </option> <option value="11">November </option>  <option value="12">December </option></select></div>');

    $('#second').append('<label class="control-label">Year</label><div class="controls"><input type="text" name="year" id="year"  placeholder="2018" class=" form-control" value="{{date('Y')}}"> </div>');
  }else if(type==='4')
  {
   $('#second').html('');
   $('#first').html('');
   $('#first').append('<label class="control-label">Year</label><div class="controls"><input type="text" name="year"  id="year"  placeholder="2021" class=" form-control" value="{{date('Y')}}"> </div>');

 }else if(type==='2')
 {
  $('#first').html('');
  $('#second').html('');
  $('#first').append('<label class="control-label">Start Date</label> <div class="controls"> <input type="text" class="form-control date-picker-input" placeholder="Start Date" value="{{date('d-m-Y')}}" name="date1" id="date1"></div>');

  $('#second').append('<label class="control-label">End Date</label> <div class="controls"> <input type="text" class="form-control date-picker-input" placeholder="End Date" value="{{date('d-m-Y')}}" name="date2" id="date2"></div>');

}



else{

  $('#second').html('');
  $('#first').html('');
}



}



}


</script>




@endsection
