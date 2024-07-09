
<!DOCTYPE html>
<html>
<head>
	<title>Stocks Reports</title>
	<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	<link href="https://fonts.googleapis.com/css2?family=Lato:wght@300;400&display=swap" rel="stylesheet">
</head>
<body>


	@php
	$company_info = DB::table("company_info")->first();

	@endphp


	<div class="invoice border">

		<center><img src="{{ url($company_info->banner) }}" id="header_image" class="img-fluid"></center>

		<table class="table-bordered w-100">

			<!-- <thead> -->
				<tr>
							<th>SL</th>
							<th>Product Name</th>
							<th>Purchase Price</th>
							<th>Sale Price</th>
							<th>Purchase Qty</th>
							<th>Sales Return</th>
							<th>Sales Qty</th>
							<th>Purchase Return</th>
							<th>Available Qty</th>

				</tr>
				<!-- </thead> -->



				<tbody>

				
						@php $i=1;  @endphp
						@if(isset($data))
						@foreach($data as $d)
						
								    	@php
				    $purchaseqty = DB::table("stock_products")->where('product_id',$d->product_id)->sum('quantity');
				    $salesqty    = DB::table("stock_products")->where('product_id',$d->product_id)->sum('sales_qty');
				    
				    $purchasereturn = DB::table('return_purchase_entry')->where('product_id',$d->product_id)->sum('product_quantity');
				    $salesreturn    = DB::table('sales_return_entry')->where('product_id',$d->product_id)->sum('return_quantity');
				@endphp
				
						
						
						<tr id="tr{{ $d->id }}">
							<td>{{ $i++ }}</td>
							<td>{{ $d->pdt_name_en }}<br>{{ $d->pdt_name_bn }} - {{$d->pdt_id}}</td>
							<td>{{ $d->purchase_price_withcost }} </td>
							<td>{{ $d->sale_price }} </td>
							<td>{{ $d->quantity }}</td>
							<td>{{ $salesreturn }}</td>
							<td>{{ $d->sales_qty }}</td>
							<td>{{ $purchasereturn }}</td>
							
							<td>
					
				{{ ($purchaseqty+$salesreturn)-($salesqty+$purchasereturn)  }}
							<!-- {{$d->stock_qun}}     -->
							    
							    
							
							</td>
		

						</tr>
						@endforeach
						@endif



				</tbody>

				


			</table>




			<br>
			<center><a href="#" class="btn btn-danger btn-sm print w-10" onclick="window.print();">Print</a></center>
			<br>


		</div>






		<style type="text/css">

			body{
				font-family: 'Lato';
			}


			.invoice{
				background: #fff;
				border:none!important;
				padding:30px;

			}

			.invoice span{
				font-size: 15px;
			}

			thead{
				font-size: 15px;
			}

			tbody{
				font-size: 13px;
			}

			.table-bordered td, .table-bordered th{
				border: 1px solid #585858 !important;
				box-shadow: none;
				border-bottom: 1px solid #585858;
			}

			.table-bordered tr{
				border: 1px solid #585858 !important;
			}


			tbody {
				border: none !important;
			}


			@media  print
			{

				.table-bordered tr{
					border: 1px solid #585858 !important;
				}

				@page  {
					/*size: 7in 15.00in;*/
					margin: 1mm 1mm 1mm 1mm;
					padding: 10px;
				}

				.print{
					display: none;
				}

				.invoice span{
					font-size: 22px;
				}
				/*@page  { size: 10cm 20cm landscape; }*/

			}


		</style>


	</body>
	</html>