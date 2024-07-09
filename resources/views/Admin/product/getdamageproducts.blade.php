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
			<a onclick="return confirm('Are you sure?')" class="delete btn btn-danger  border-0 text-light" data-id="{{ $d->id }}"><i class="fa fa-trash-o"></i></a>
		</td>

	</tr>
	@endforeach
	@endif


	<script type="text/javascript">
		
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


		$(".delete").click(function(){
			let id = $(this).data('id');

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

					showdata();

				},
				errors:function(){
					Command:toastr["danger"]("Data Delete Unsuccessfully")
					showdata();

				}
			});


		});


  // End Edit Data

</script>