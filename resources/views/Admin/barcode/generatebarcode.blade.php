<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

<div class="container-fluid mt-3 p-0">
	<center><h5 class="text-uppercase border p-3 bg-success text-light">Product Barcodes</h5></center><br>
	<div class="col-md-12">

		<div class="row">
			@if(isset($data))
			@foreach($data as $d)
			@for($i=0;$i<$total;$i++)
			<div  class="col-md-3 p-2 border text-center">

				{!! DNS1D::getBarcodeSVG($d->barcode, 'C39',0.9,40,'#414141') !!}<br>
				<span style="font-size: 12px;">{{ $d->pdt_name_en }}</span>
			</div>
			@endfor
			@endforeach
			@endif

		</div>


	</div>
</div>