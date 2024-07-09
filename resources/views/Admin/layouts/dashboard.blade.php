 @extends('Admin.layouts.index')
 @section('content')

 <div class="content-wrapper">
 	<!-- START PAGE CONTENT-->
 	<div class="page-content fade-in-up">
 		<div class="row">
 			<div class="col-lg-3 col-md-6">
 				<div class="ibox bg-success color-white widget-stat">
 					<div class="ibox-body">
 						<h2 class="m-b-5 font-strong">{{ $finalsales }}</h2>
 						<div class="m-b-5">Total Sales</div><i class="fa fa-money widget-stat-icon"></i>
 					</div>
 				</div>
 			</div>
 			<div class="col-lg-3 col-md-6">
 				<div class="ibox bg-info color-white widget-stat">
 					<div class="ibox-body">
 						<h2 class="m-b-5 font-strong">{{ $finalpurchase }}</h2>
 						<div class="m-b-5">Total Purchase</div><i class="fa fa-money widget-stat-icon"></i>
 					</div>
 				</div>
 			</div>
 			<div class="col-lg-3 col-md-6">
 				<div class="ibox bg-warning color-white widget-stat">
 					<div class="ibox-body">
 						<h2 class="m-b-5 font-strong">{{ $duetotal }}</h2>
 						<div class="m-b-5">Total Sales Due</div><i class="fa fa-money widget-stat-icon"></i>
 					</div>
 				</div>
 			</div>
 			<div class="col-lg-3 col-md-6">
 				<div class="ibox bg-danger color-white widget-stat">
 					<div class="ibox-body">
 						<h2 class="m-b-5 font-strong">{{ $employee_info }}</h2>
 						<div class="m-b-5">Total Employee</div><i class="fa fa-users widget-stat-icon"></i>
 					</div>
 				</div>
 			</div>
 		</div>

<div class="row">

<div class="col-2 p-1"> 

	<a href="{{ url('salespayment') }}" class="btn btn-success" style="height: 30px; min-width: 120px; font-size: 28px;"> Customer Payment </a>
</div>

<div class="col-2 p-1"> <a href="{{ url('customer_statement') }}" class="btn btn-warning" style="height: 30px; min-width: 120px; font-size: 28px;"> Customer Statement </a></div><div class="col-2 p-1"> 

	<a href="{{ url('purchasepayment') }}" class="btn btn-info" style="height: 30px; min-width: 120px; font-size: 28px;"> Purchase Payment </a>
</div>

<div class="col-2 p-1"> <a href="{{ url('supplier_statement') }}" class="btn btn-warning" style="height: 30px; min-width: 120px; font-size: 28px;"> Supplier Statement </a></div>

<div class="col-2 p-1"> <a href="{{ url('expenseentry') }}" class="btn btn-danger" style="height: 30px; min-width: 120px; font-size: 28px;"> Expense Entry </a></div>

<div class="col-2 p-1"> <a href="{{ url('cashclose') }}" class="btn btn-secondary" style="height: 30px; min-width: 120px; font-size: 28px;"> Cash Close</a></div>




<br>
</div>
<br><br>


 		{{-- <div class="row">
 			<div class="col-lg-8">
 				<div class="ibox">
 					<div class="ibox-body">
 						<div class="flexbox mb-4">
 							<div>
 								<h3 class="m-0">Statistics</h3>
 								<div>Your shop sales analytics</div>
 							</div>
 							<div class="d-inline-flex">
 								<div class="px-3" style="border-right: 1px solid rgba(0,0,0,.1);">
 									<div class="text-muted">WEEKLY INCOME</div>
 									<div>
 										<span class="h2 m-0">$850</span>
 										<span class="text-success ml-2"><i class="fa fa-level-up"></i> +25%</span>
 									</div>
 								</div>
 								<div class="px-3">
 									<div class="text-muted">WEEKLY SALES</div>
 									<div>
 										<span class="h2 m-0">240</span>
 										<span class="text-warning ml-2"><i class="fa fa-level-down"></i> -12%</span>
 									</div>
 								</div>
 							</div>
 						</div>
 						<div>
 							<canvas id="bar_chart" style="height:260px;"></canvas>
 						</div>
 					</div>
 				</div>
 			</div>
 			<div class="col-lg-4">
 				<div class="ibox">
 					<div class="ibox-head">
 						<div class="ibox-title">Statistics</div>
 					</div>
 					<div class="ibox-body">
 						<div class="row align-items-center">
 							<div class="col-md-6">
 								<canvas id="doughnut_chart" style="height:160px;"></canvas>
 							</div>
 							<div class="col-md-6">
 								<div class="m-b-20 text-success"><i class="fa fa-circle-o m-r-10"></i>Desktop 52%</div>
 								<div class="m-b-20 text-info"><i class="fa fa-circle-o m-r-10"></i>Tablet 27%</div>
 								<div class="m-b-20 text-warning"><i class="fa fa-circle-o m-r-10"></i>Mobile 21%</div>
 							</div>
 						</div>
 						<ul class="list-group list-group-divider list-group-full">
 							<li class="list-group-item">Chrome
 								<span class="float-right text-success"><i class="fa fa-caret-up"></i> 24%</span>
 							</li>
 							<li class="list-group-item">Firefox
 								<span class="float-right text-success"><i class="fa fa-caret-up"></i> 12%</span>
 							</li>
 							<li class="list-group-item">Opera
 								<span class="float-right text-danger"><i class="fa fa-caret-down"></i> 4%</span>
 							</li>
 						</ul>
 					</div>
 				</div>
 			</div>
 		</div>
 		--}}
 		<div class="row">
 			<div class="col-lg-6">
 				<div class="ibox">
 					<div class="ibox-head">
 						<div class="ibox-title">Latest Sales</div>
 						<div class="ibox-tools">
 							<a class="ibox-collapse"><i class="fa fa-minus"></i></a>
 							
 						</div>
 					</div>
 					<div class="ibox-body">
 						<table class="table table-striped table-hover">
 							<thead>
 								<tr>
 									<th>SL</th>
 									<th>Date</th>
 									<th>Invoice No.</th>
 									<th>Transaction</th>
 									<th>Action</th>
 								</tr>
 							</thead>
 							<tbody>

 								@php $i=1;  @endphp
 								@if(isset($salesledger))
 								@foreach($salesledger as $d)
 								<tr id="tr{{ $d->id }}">
 									<td>{{ $i++ }}</td>
 									<td>{{ $d->invoice_date }}</td>
 									<td>{{ $d->invoice_no }}</td>
 									<td>{{ $d->transaction_type }}</td>

 									<td>
 										
 										<a href="{{ url('invoicesalesa4/'.$d->invoice_no) }}" target="_blank"  class="btn btn-info  border-0 text-light"><i class="fa fa-eye"></i></a>
 										<a href="{{ url('invoicesales/'.$d->invoice_no) }}" target="_blank"  class="btn btn-success  border-0 text-light"><i class="fa fa-print"></i></a>
 									</td>

 								</tr>

 								@endforeach
 								@endif


 							</tbody>
 						</table>
 					</div>
 				</div>
 			</div>



 			<div class="col-lg-6">
 				<div class="ibox">
 					<div class="ibox-head">
 						<div class="ibox-title">Latest Purchase</div>
 						<div class="ibox-tools">
 							<a class="ibox-collapse"><i class="fa fa-minus"></i></a>
 							
 						</div>
 					</div>
 					<div class="ibox-body">
 						<table class="table table-striped table-hover">
 							<thead>
 								<tr>
 									<th>SL</th>
 									<th>Date</th>
 									<th>Invoice No.</th>
 									<th>Transaction</th>
 									<th>Action</th>
 								</tr>
 							</thead>
 							<tbody>
 								@php $i=1;  @endphp
 								@if(isset($purchaseledger))
 								@foreach($purchaseledger as $d)
 								<tr id="tr{{ $d->id }}">
 									<td>{{ $i++ }}</td>
 									<td>{{ $d->invoice_date }}</td>
 									<td>{{ $d->invoice_no }}</td>
 									<td>{{ $d->transaction_type }}</td>


 									<td>
 										<a href="{{ url('invoicepurchase/'.$d->invoice_no) }}" target="_blank"  class="btn btn-info  border-0 text-light"><i class="fa fa-eye"></i></a>
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
 		<style>
 			.visitors-table tbody tr td:last-child {
 				display: flex;
 				align-items: center;
 			}

 			.visitors-table .progress {
 				flex: 1;
 			}

 			.visitors-table .progress-parcent {
 				text-align: right;
 				margin-left: 10px;
 			}
 		</style>

 	</div>
 	<!-- END PAGE CONTENT-->
 	<footer class="page-footer">
 		<div class="font-13">2023 © <b>AdminCAST</b> - All rights reserved.</div>
 		<div class="to-top"><i class="fa fa-angle-double-up"></i></div>
 	</footer>
 </div>


 @endsection