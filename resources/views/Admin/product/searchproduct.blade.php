@php $i=1;  @endphp
@if(isset($data))
@foreach($data as $d)
<tr id="tr{{ $d->pdt_id }}">
	<td>{{ $i++ }}</td>
	<td><b>Code:</b> {{ $d->pdt_id }}<br> <b>Barcode:</b>{{ $d->barcode }}</td>
	<td>{{ $d->item_name_en }}<br>{{ $d->item_name_bn }}</td>
	<td>{{ $d->pdt_name_en }}<br>{{ $d->pdt_name_bn }}</td>
	<td>{{ $d->pdt_purchase_price }} </td>
	<td>{{ $d->pdt_sale_price }} </td>
	<td>{{ $d->measurement_unit }}</td>
	<td>{{ $d->pdt_over_stock }}</td>
	<td>
		@if($d->pdt_status == 1)
		<span class="btn btn-success btn-sm border-0">Active</span>
		@else
		<span class="btn btn-warning btn-sm border-0">Inactive</span>
		@endif
	</td>
	
	
	<td>
		<a href="{{ url('editproduct/'.$d->pdt_id) }}"  class="btn btn-info border-0 edit text-light" ><i class="fa fa-pencil-square-o"></i></a>
		<a class="delete btn btn-danger  border-0 text-light" data-id="{{ $d->pdt_id }}"><i class="fa fa-trash-o"></i></a>
	</td>

</tr>
@endforeach
@endif

<script type="text/javascript">
	$(".delete").click(function(){
		let id = $(this).data('id');


		swal({
			title: "Product Delete Confirm?",
			icon: "info",
			buttons: true,
			dangerMode: true,

		})
		.then((willDelete) => {
			if (willDelete) {

				$.ajax(
				{
					url: "{{ url('deleteproduct') }}/"+id,
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


					},
					errors:function(){
						Command:toastr["danger"]("Data Delete Unsuccessfully")


					}
				});

			} else {

			}
		});


	});

	// End Delete Data

</script>