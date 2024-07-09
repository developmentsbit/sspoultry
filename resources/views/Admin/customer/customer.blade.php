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
				<form method="post" class="" action="{{url('customerinsert')}}" enctype="multipart/form-data" data-id=>
					@csrf

					<div class="row myinput">
						@php
						$branch = DB::table('branch_info')->get();
						@endphp

						{{-- <div class="form-group col-md-4">
							<label>Branch Name:</label>
							<div class="input-group">
								<div class="input-group-addon"><i class="fa fa-check-square-o"></i></div>
								<select class="form-control" name="customer_branch_id" id="customer_branch_id">
									<option value="">Select Branch</option>
									@if(isset($branch))
									@foreach($branch as $c)
									<option value="{{ $c->branch_id }}">{{ $c->branch_name_en }}</option>
									@endforeach
									@endif

								</select>
							</div>
						</div>
						--}}

						<input type="hidden" name="customer_branch_id" id="customer_branch_id" value="{{ Auth("admin")->user()->id }}">


						<div class="form-group col-md-4">
							<label>Customer Name: <span class="text-danger" style="font-size: 15px;">*</span></label>
							<div class="input-group">
								<div class="input-group-addon"><i class="fa fa-text-width"></i></div>
								<input class="form-control" type="text" name="customer_name_en" id="customer_name_en"  required="" placeholder="Customer Name">
							</div>
						</div>




						<div class="form-group col-md-4">
							<label>Customer Mobile:</label>
							<div class="input-group">
								<div class="input-group-addon"><i class="fa fa-phone"></i></div>
								<input class="form-control" type="number" name="customer_phone" id="customer_phone"  placeholder="Customer Mobile">
							</div>
						</div>

						<div class="form-group col-md-4">
							<label>Email:</label>
							<div class="input-group">
								<div class="input-group-addon"><i class="fa fa-envelope"></i></div>
								<input class="form-control" type="text"  name="customer_email" id="customer_email" placeholder="Customer Email">
							</div>
						</div>

						<div class="form-group col-md-4">
							<label>Type:</label>
							<div class="input-group">
								<select class="form-control" name="type" id="type">
									<option value="1">General Customer</option>
									<option value="2">Retails Customer</option>
									<option value="3">3rd Party Customer</option>
								</select>
							</div>
						</div>


						<div class="form-group col-md-4">
							<label>Address:</label>
							<div class="input-group">
								<div class="input-group-addon"><i class="fa fa-location-arrow"></i></div>
								<textarea class="form-control" rows="2" name="customer_address" id="customer_address"  placeholder="Customer Address"></textarea>
							</div>
						</div>



						<div class="form-group col-md-4">
							<label>Previous Due:</label>
							<div class="input-group">
								<div class="input-group-addon"><i class="fa fa-money"></i></div>
								<input class="form-control" type="number" name="previous_due" id="previous_due"  placeholder="Previous Due" value="0">
							</div>
						</div>
						
						<div class="form-group col-md-4">
							<label>Image:</label>
							<div class="input-group">
								<div class="input-group-addon"><i class="fa fa-file"></i></div>
								<input class="form-control" type="file" name="image" id="image">
							</div>
						</div>
						
						<div class="form-group col-md-4">
							<label>NID:</label>
							<div class="input-group">
								<div class="input-group-addon"><i class="fa fa-file"></i></div>
								<input class="form-control" type="file" name="nid" id="nid">
							</div>
						</div>




						<div class="modal-footer border-0 col-12">
							<button type="button" class="btn btn-secondary border-0" onClick="window.location.reload();">Close</button>
							<button type="submit" class="btn btn-success button border-0">Save</button>
							<button type="button" class="btn btn-success loading border-0">Loading...</button>
						</div>





					</div>
				</form>

			</div>
		</div>

	</div>
</div>

<!-------End Table--------->




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

		$.ajax({
			url:'{{ url('customerinsert') }}',
			method:'POST',
			data:data,
			beforeSend:function(response) { 
				$('.loading').show();
				$('.button').hide();

			},
			success:function(response){
			    
			 //console.log(response);

				Command:toastr["success"]("Data Save Successfully Done")
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

				$('#customer_name_en').val('');
				$('#customer_name_bn').val('');
				$('#customer_email').val('');
				$('#customer_phone').val('');
				$('#customer_address').val('');
				$('#previous_due').val('');
				
				$('#type').val('');

				
				$('.loading').hide();
				$('.button').show();


			},

			error:function(error){
				console.log(error)
			}
		});
	});

	// End Add Data


</script>





@endsection