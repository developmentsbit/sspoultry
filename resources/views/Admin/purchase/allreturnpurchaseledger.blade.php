@extends('Admin.layouts.index')
@section('content')


<div class="content-wrapper">
	<div class="page-heading">
		<h3 class="page-title">All Return Purchase Ledger</h3>
	</div>



	<div class="page-content fade-in">
		<div class="ibox">
			<div class="ibox-head mb-3 myhead">
				<div class="ibox-title"><i class="fa fa-list-ul" aria-hidden="true"></i>&nbsp;&nbsp;Return Purchase Ledger</div>
				<div><a href="{{ url('purchasereturn') }}" class="btn btn-dark rounded addbutton"><i class="fa fa-plus"></i>&nbsp;Purchase Return</a></div>
			</div>


			<div class="ibox-body table-responsive overflow">

				<table class="table table-striped table-bordered" id="example-table" cellspacing="0" width="100%">
					<thead class="mythead">
						<tr>
							<th>SL</th>
							<th>Invoice/Voucher Date</th>
							<th>Invoice No.</th>
							<th>Voucher No.</th>
							<th>Suplier Info.</th>
							<th>Transaction</th>
							<th>Action</th>
						</tr>
					</thead>

					<tbody class="tbody" id="showdata">
						
						@php $i=1;  @endphp
						@if(isset($data))
						@foreach($data as $d)
						<tr id="tr{{ $d->id }}">
							<td>{{ $i++ }}</td>
							<td>{{ $d->invoice_date }}</td>
							<td>{{ $d->invoice_no }}</td>
							<td>{{ $d->voucher_no }}</td>
							<td>{{ $d->supplier_company_name }}, {{ $d->supplier_company_phone }}</td>
							<td>{{ $d->transaction_type }}</td>

							
							<td>
								<a class="delete btn btn-danger  border-0 text-light" data-id="{{ $d->id }}"><i class="fa fa-trash-o"></i></a>
								<a href="{{ url('returninvoicepurchase/'.$d->invoice_no) }}" target="_blank"  class="btn btn-info  border-0 text-light"><i class="fa fa-eye"></i></a>
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





<script type="text/javascript">

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
					url: "{{ url('deletereturnpurchaseledger') }}/"+id,
					type: 'get',
					success: function()
					{
						$('#tr'+id).hide();

						Command:toastr["warning"]("Delete Successfully Done")
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

			}
		});

	});

	// End Delete Data


</script>


@endsection