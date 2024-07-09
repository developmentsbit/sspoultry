@extends('Admin.layouts.index')
@section('content')


<div class="content-wrapper">
	<div class="page-heading">
		<h3 class="page-title">Damage Product Information</h3>
	</div>



	<div class="page-content fade-in">
		<div class="ibox">
			<div class="ibox-head mb-3 myhead">
				<div class="ibox-title"><i class="fa fa-list-ul" aria-hidden="true"></i>&nbsp;&nbsp;Damage Product List</div>
				<div><a data-toggle="modal" data-target="#exampleModalCenter" class="btn btn-dark rounded addbutton"><i class="fa fa-plus"></i>&nbsp;Add New</a></div>
			</div>
			<div class="ibox-body table-responsive overflow">
				<table class="table table-striped table-bordered" id="example-table" cellspacing="0" width="100%">
					<thead class="mythead">
						<tr>
							<th>SL</th>
							<th>Date</th>
							<th>Product Name</th>
							<th>Quantity</th>
							<th>Action</th>
						</tr>
					</thead>
					
					<tbody class="tbody" id="showtdata">
						@php $i=1;  @endphp
						@if(isset($data))
						@foreach($data as $d)
						<tr id="tr{{ $d->id }}">
							<td>{{ $i++ }}</td>
							<td>{{ $d->date }}</td>
							<td>{{ $d->product_id }} - {{ $d->pdt_name_en }}</td>
							<td>{{ $d->qty }}</td>
							
							<td>
								<a  class="btn btn-info border-0 edit text-light" data-toggle="modal" data-target="#exampleModalCenters" data-id="{{ $d->id }}"><i class="fa fa-pencil-square-o"></i></a>
								<a  class="delete btn btn-danger  border-0 text-light" data-id="{{ $d->id }}"><i class="fa fa-trash-o"></i></a>
							</td>

						</tr>
						@endforeach
						@endif

						
					</tbody>
				</table>
			</div>
		</div>

	</div>
</div>

<!-------End Table--------->





<!-- Add Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	<div class="modal-dialog modal-lg modal-dialog-centered" role="document">
		<form method="post" class="btn-submit">
			@csrf
			<div class="modal-content rounded">
				<div class="modal-header bg-dark text-light">
					<h5 class="modal-title" id="exampleModalCenterTitle"><i class="fa fa-plus"></i>&nbsp;&nbsp;Add Damage Product</h5>
					<button type="button" class="close text-light" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body myinput">

					<div class="row">


						<div class="form-group col-md-12">
							<label>Product Name:</label>
							<div class="input-group">

								<select class="form-control select2_demo_1" name="product_id" id=
								"product_id" style="width: 100%!important;" required="">
								<option value="">Select Product</option>
								@php
								$product = DB::table('pdt_productinfo')->where('pdt_status',1)->get();		
								@endphp 
								@foreach($product as $i)
								<option value="{{ $i->pdt_id  }}">{{ $i->pdt_id  }} - {{ $i->pdt_name_en }} {{ $i->pdt_name_bn }}</option>
								@endforeach
							</select>
							
						</div>
					</div>

					<div class="form-group col-md-12">
						<label>Quantity: <span class="text-danger" style="font-size: 15px;">*</span></label>
						<div class="input-group">
							<input type="text" name="qty" id="qty" placeholder="Product QTY" class="form-control" required="" autocomplete="off">
							
						</div>
					</div>



					
				</div>

			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary border-0" data-dismiss="modal">Close</button>
				<button type="submit" class="btn btn-success button border-0">Save</button>
				<button type="button" class="btn btn-success loading border-0">Loading...</button>
			</div>
		</form>
	</div>
</div>
</div>

<!-- End Add Modal -->





<!-- Edit Modal -->
<div class="modal fade" id="exampleModalCenters" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitles" aria-hidden="true">
	<div class="modal-dialog modal-lg modal-dialog-centered" role="document">

		<div class="modal-content rounded">
			<div class="modal-header bg-dark text-light">
				<h5 class="modal-title" id="exampleModalCenterTitles"><i class="fa fa-plus"></i>&nbsp;&nbsp;Update Damage Product</h5>
				<button type="button" class="close text-light" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body editdata myinput">

				
			</div>


		</div>
	</div>
</div>
<!--End Edit Modal -->



<script type="text/javascript">
	$.ajaxSetup({
		headers: {
			'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
		}
	});




	function showdata(){
		$.ajax(
		{
			url: "{{ url('getdamageproducts') }}",
			type: 'get',
			data:{},
			success: function(data)
			{
				$("#showtdata").html(data);
			}
		});

	}

	// End Get Data


	$('.loading').hide();
	$(".btn-submit").submit(function(e){
		e.preventDefault();
		var data = $(this).serialize();

		$.ajax({
			url:'{{ url('damageproductsinsert') }}',
			method:'POST',
			data:data,
			beforeSend:function(response) { 
				$('.loading').show();
				$('.button').hide();

			},
			success:function(response){

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

				$('#product_id').val('');
				$('#qty').val('');
				$('.loading').hide();
				$('.button').show();
				$('#exampleModalCenter').modal('hide');

				window.location.href=""
				

			},

			error:function(error){
				console.log(error)
			}
		});
	});

	// End Add Data


	$(".delete").click(function(){
		let id = $(this).data('id');


		swal({
			title: "Are you sure?",
			icon: "info",
			buttons: true,
			dangerMode: true,

		})
		.then((willDelete) => {
			if (willDelete) {


				$.ajax(
				{
					url: "{{ url('deletedamageproducts') }}/"+id,
					type: 'get',
					success: function()
					{
						$('#tr'+id).hide();

						Command:toastr["warning"]("Data Delete Successfully Done")
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

						window.location.href=""

					},
					errors:function(){
						Command:toastr["danger"]("Data Delete Unsuccessfully")
						window.location.href=""

					}
				});

			} else {

			}
		});


	});



		$(".edit").click(function(){
			var id = $(this).data("id");
			$.ajax(
			{
				url: "{{ url('editdamageproducts') }}/"+id,
				type: 'get',
				data:{},
				success: function (data)
				{
					$(".editdata").html(data);
				}
			});


		});



</script>





@endsection