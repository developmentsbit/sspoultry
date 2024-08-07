@extends('Admin.layouts.index')
@section('content')


<div class="content-wrapper">
	<div class="page-heading">
		<h3 class="page-title">Customer Information</h3>
	</div>



	<div class="page-content fade-in">
		<div class="ibox">
			<div class="ibox-head mb-3 myhead">
				<div class="ibox-title"><i class="fa fa-list-ul" aria-hidden="true"></i>&nbsp;&nbsp;Customer
				Setup List</div>
				<div><a href="{{ url('managecustomer') }}" class="btn btn-dark rounded addbutton"><i class="fa fa-eye"></i>&nbsp;View Customer</a></div>
			</div>
			<div class="ibox-body">
<form method="post" class="row" data-id="" enctype="multipart/form-data" action="{{url('updatecustomer')}}/{{$data->customer_id}}">

@csrf
  @php
  $branch = DB::table('branch_info')->get();
  @endphp

{{--   <div class="form-group col-md-12">
    <label>Branch Name:</label>
    <div class="input-group">
      <div class="input-group-addon"><i class="fa fa-check-square-o"></i></div>
      <select class="form-control" name="customer_branch_id" id="customer_branch_id">
        <option value="">Select Branch</option>
        @if(isset($branch))
        @foreach($branch as $c)
        <option value="{{ $c->branch_id }}"  <?php if ($c->branch_id == $data->customer_branch_id ) {
       echo "selected";
        } ?>>{{ $c->branch_name_en }}</option>
        @endforeach
        @endif

      </select>
    </div>
  </div> --}}


  <input type="hidden" name="customer_branch_id" id="customer_branch_id" value="{{ Auth("admin")->user()->branch }}">


  <div class="form-group col-md-12">
    <label>Customer Name:</label>
    <div class="input-group">
      <div class="input-group-addon"><i class="fa fa-text-width"></i></div>
      <input class="form-control" type="text" name="customer_name_en" id="customer_name_en" placeholder="Customer Name" required="" value="{{ $data->customer_name_en }}">
    </div>
  </div>




  <div class="form-group col-md-6">
    <label>Customer Mobile:</label>
    <div class="input-group">
      <div class="input-group-addon"><i class="fa fa-phone"></i></div>
      <input class="form-control" type="number" name="customer_phone" id="customer_phone" placeholder="Customer Mobile" required="" value="{{ $data->customer_phone }}">
    </div>
  </div>

  <div class="form-group col-md-6">
    <label>Email:</label>
    <div class="input-group">
      <div class="input-group-addon"><i class="fa fa-envelope"></i></div>
      <input class="form-control" type="text" placeholder="Email" name="customer_email" id="customer_email" value="{{ $data->customer_email }}">
    </div>
  </div>


  <div class="form-group col-md-12">
    <label>Type:</label>
    <div class="input-group">
      <select class="form-control" name="type" id="type">
        <option value="{{ $data->type }}">
          @if($data->type == 1)
          General Customer
          @elseif($data->type == 2)
          Retails Customer
          @else
          3rd Party Customer
          @endif
        </option>
        <option value="1">General Customer</option>
        <option value="2">Retails Customer</option>
        <option value="3">3rd Party Customer</option>
      </select>
    </div>
  </div>



  <div class="form-group col-md-12">
    <label>Address:</label>
    <div class="input-group">
      <div class="input-group-addon"><i class="fa fa-location-arrow"></i></div>
      <textarea class="form-control" rows="3" name="customer_address" id="customer_address" required="">{{ $data->customer_address }}</textarea>
    </div>
  </div>


    <div class="form-group col-md-4">
		<label>Image:</label>
		<div class="input-group">
			<div class="input-group-addon"><i class="fa fa-file"></i></div>
			<input class="form-control" type="file" name="image" id="image">
		</div>
		<img src="{{asset('/public/Admin/CustomerImage')}}/{{$data->image}}" class="img-fluid" style="height:70px;">
	</div>

    <div class="form-group col-md-4">
		<label>NID:</label>
		<div class="input-group">
			<div class="input-group-addon"><i class="fa fa-file"></i></div>
			<input class="form-control" type="file" name="nid" id="nid">
		</div>
		<img src="{{asset('/public/Admin/CustomerNid')}}/{{$data->nid}}" class="img-fluid" style="height:70px;">
	</div>

	@php
	  $pdcustomer = DB::table("sales_payment")->where('customer_id',$data->customer_id)->where('note',"PD")->first();

	@endphp


		<div class="form-group col-md-4">
							<label>Previous Due:</label>
							<div class="input-group">
								<div class="input-group-addon"><i class="fa fa-money"></i></div>
								@if(isset($pdcustomer))
								<input class="form-control" type="text" name="previous_due" id="previous_due"  placeholder="Previous Due" value="{{ $pdcustomer->previous_due }}">
								@else
								<input class="form-control" type="text" name="previous_due" id="previous_due"  placeholder="Previous Due" value="0">
								@endif
							</div>
						</div>




  <div class="modal-footer border-0 ml-auto">
    <button type="submit" class="btn btn-success button border-0">Update</button>
  </div>
</form>

</div>
		</div>

	</div>
</div>

<!-------End Table--------->










@endsection




<script type="text/javascript">

  $.ajaxSetup({
    headers: {
      'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
    }
  });


  $('.loading').hide();
  $(".btn-submit").submit(function(e){
    e.preventDefault();

    var data = $(this).serialize();
    var id = $(this).data("id");

    $.ajax({
      url:"{{ url('updatecustomer') }}/"+id,
      method:'POST',
      data:data,

      beforeSend:function(response) {

        $('.loading').show();
        $('.button').hide();

      },


      success:function(response){

       Command:toastr["info"]("Data Update Successfully Done")
       toastr.options = {
        "closeButton": true,
        "debug": false,
        "newestOnTop": false,
        "progressBar": true,
        "positionClass": "toast-top-right",
        "preventDuplicates": false,
        "onclick": null,
        "showDuration": "300",
        "hideDuration": "1000",
        "timeOut": "3000",
        "extendedTimeOut": "1000",
        "showEasing": "swing",
        "hideEasing": "linear",
        "showMethod": "fadeIn",
        "hideMethod": "fadeOut"
      }

      $('.loading').hide();
      $('.button').show();
      $('#exampleModalCenters').modal('hide');

      window.location.href="";





    },

    error:function(error){
      console.log(error)
    }
  });
  });



</script>
