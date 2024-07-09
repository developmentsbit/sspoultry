

@extends('Admin.layouts.index')
@section('content')


<div class="content-wrapper">
	<div class="page-heading">
		<h3 class="page-title">Barcode Generate</h3>
	</div>



	<div class="page-content fade-in">
		<div class="ibox">
			<div class="ibox-head mb-3 myhead">
				<div class="ibox-title"><i class="fa fa-list-ul" aria-hidden="true"></i>&nbsp;&nbsp;Product Barcode Generate</div>
				
			</div>

			<div class="col-md-12">
				<form method="get" class="btn-submit" action="{{ url("searchproduct2") }}">
					<div class="form-group">
						<div class="input-group">
							<input type="text"  name="searchproduct" id="searchproduct" class="form-control" placeholder="Search Products..." style="height: 40px;">
							<button type="submit" class="border-0 text-light bg-success button" style="cursor: pointer; width: 50px;"><i class="fa fa-search"></i></button>
						</div>
					</div>
				</form>

				<div>
					<form method="get" action="{{ url("generatebarcode") }}" target="blank">
						@csrf
						<input type="number" name="number" placeholder="Number Of Barcode" value="1" required="">&nbsp;<button type="submit" class="btn btn-success btn-sm">Generate Barcode</button>
					</div>
				</div>

				<div class="ibox-body table-responsive overflow">
					<table class="table table-striped table-bordered" id="example-tabless" cellspacing="0" width="100%">
						<thead class="mythead">
							<tr>
								<th><input type="checkbox" id="checkAll"> Select All</th>
								<th>Product Barcode</th>
								<th>Product Name</th>
								<th>Purchase</th>
								<th>Sale</th>
							</tr>
						</thead>

						<tbody class="tbody" id="showdata">

							@php $i=1;  @endphp
							@if(isset($data))
							@foreach($data as $d)
							<tr id="tr{{ $d->pdt_id }}">
								<td><input name='product_id[]' type="checkbox" id="product_id" value="{{ $d->pdt_id }}"> {{ $i++ }}</td>
								<td>{{ $d->pdt_barcode }}</td>
								<td>{{ $d->pdt_name_en }}<br>{{ $d->pdt_name_bn }}</td>
								<td>{{ $d->pdt_purchase_price }} </td>
								<td>{{ $d->pdt_sale_price }} </td>



							</tr>
							@endforeach
							@endif


						</tbody>
					</table>

					{{ $data->links() }}

				</div>
			</form>
		</div>

	</div>
</div>

<!-------End Table--------->





<script language="javascript">
	$("#checkAll").click(function () {
		$('input:checkbox').not(this).prop('checked', this.checked);
	});
</script>



@endsection








