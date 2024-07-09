@extends('Admin.layouts.index')
@section('content')



<div class="content-wrapper">
	<div class="page-heading">
		<h3 class="page-title">Return Sales Information</h3>
	</div>



	<div class="page-content fade-in">
		<div class="ibox">
			<div class="ibox-head mb-3 myhead">
				<div class="ibox-title"><i class="fa fa-list-ul" aria-hidden="true"></i>&nbsp;&nbsp;Add Return Sales</div>
				<div><a href="{{ url('allreturnsalesledger') }}" class="btn btn-dark rounded addbutton"><i class="fa fa-plus"></i>&nbsp;All Return Sales</a></div>
			</div>
			<div class="ibox-body">


				<div class="col-md-12 p-0">
					<div class="form-group col-md-12 p-0">
						<label><b>Product Barcode:</b> </label>
						<div class="input-group" style="height: 45px;">
							<input type="text" name="barcode" id="barcode" class="form-control" placeholder="Product Barcode" onchange="returnproductbarcodeadd()">
							<button type="button" class="border text-success" style="cursor: pointer;" onclick="returnproductbarcodeadd()" title="Add Product"><i class="fa fa-refresh"></i></button>
						</div>
					</div>
				</div>


				<form method="post" action="{{ url("returnsalesledger") }}" class="reloadform myinput" target="_blank">
					@csrf

					<div class="col-md-12 p-0 row">
						
						<div class="form-group col-md-6">
							<label>Customer Name: <span class="text-danger" style="font-size: 15px;">*</span></label>
							<div class="input-group">
								<div class="input-group-addon"><i class="fa fa-user"></i></div>
								<select class="form-control select2_demo_1" name="customer_id" id=
								"customer_id" required="" onchange="getcustomerphone();">
								<option value="">Select Customer</option>
								@php
								$customer = DB::table('customer_info')->where("Customer_branch_id",Auth('admin')->user()->branch)->get();		
								@endphp 
								@foreach($customer as $i)
								<option value="{{ $i->customer_id  }}">{{ $i->customer_id }} - {{ $i->customer_name_en }}</option>
								@endforeach
							</select>
							<div class="input-group-addon border border-left-0" data-toggle="modal" data-target="#exampleModalCenters"><i class="fa fa-plus-circle text-primary"></i></div>
						</div>
					</div>


					<div class="form-group col-md-3">
						<label>Mobile Number:</label>
						<div class="input-group">
							<div class="input-group-addon"><i class="fa fa-phone"></i></div>
							<input type='number'  name='customer_phone' id='customer_phone' class='form-control' placeholder='Mobile' readonly="">
						</div>
					</div>


					<!--<div class="form-group col-md-3">-->
						<!--	<label>Cash No:</label>-->
						<!--	<div class="input-group">-->
							<!--		<div class="input-group-addon"><i class="fa fa-envelope"></i></div>-->
							<!--		<input type="text"  name="cash_no" id="cash_no" class="form-control" value="" placeholder="Cash No">-->
							
							<!--	</div>-->
							<!--</div>-->


							<div class="form-group col-md-3">
								<label>Invoice Date:<span class="text-danger" style="font-size: 15px;">*</span></label>
								<div class="input-group">
									<div class="input-group-addon"><i class="fa fa-calendar"></i></div>
									<input type="date" name="invoice_date" placeholder="Invoice Date" class="form-control" required="" autocomplete="off" value="{{ date('d-m-Y') }}">

								</div>
							</div>



							<div class="col-md-9">
								<div class="row">
									<div class="col-md-4">

						{{-- 		<div class="form-group">
									<label>Item Name:</label>
									<div class="input-group">

										<select class="form-control" name="item_id" id=
										"item_id" onchange="getsalesproduct()">
										<option value="">Select Item</option>
										@php
										$item = DB::table('pdt_item')->where('item_status',1)->get();		
										@endphp 
										@foreach($item as $i)
										<option value="{{ $i->item_id  }}">{{ $i->item_name_en }} {{ $i->item_name_bn }} </option>
										@endforeach
									</select>
									
								</div>
							</div> --}}

						</div>

						<div class="col-md-12">


							<div class="row">
								<div class="form-group col-md-12">
									<label>Product Name: </label>
									<div class="input-group">

										<select class="form-control select2_demo_1" name="pdt_id" id=
										"pdt_id"  onchange="return returnsalesproductcart()">
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







						</div>





					</div>
				</div>


				<div class="col-md-12 p-0 mt-2">
					<table class="table table-bordered table-responsive purchase">
						<thead class="bg-dark text-light">
							<tr>
								<th>SL</th>
								<th>Name</th>
								<th>Qty</th>
								<th>S. Price (Unit)</th>
								<th>Discount (Unit)</th>
								<th>Sub Total</th>
								<th>Action</th>

							</tr>
						</thead>

						<tbody id="showdata">
							
						</tbody>
					</table>
				</div>




			</div>




			<div class="col-md-3">
				<div class="ibox-head myhead2 p-0">
					<div class="ibox-title2"><i class="fa fa-plus" aria-hidden="true"></i>&nbsp;&nbsp;Account</div>
				</div>




					

				<div class="col-md-12 bg-light p-3">


				
					<div class="form-group">
						<label>Previous Due:</label>
						<div class="input-group">
							<div class="input-group-addon"><i class="fa fa-money"></i></div>
							<input type="text" id="stotaldue" name="stotaldue" class="form-control" readonly="">
							
						</div>
					</div>


					<div class="form-group">
						<label>Total Amount:</label>
						<div class="input-group">
							<div class="input-group-addon"><i class="fa fa-money"></i></div>
							<input type="text" id="totalamount" name="totalamount" class="form-control"  readonly="">
							
						</div>
					</div>






					<!--<div class="form-group">-->
					<!--	<label>Discount:</label>-->
					<!--	<div class="input-group">-->
					<!--		<div class="input-group-addon"><i class="fa fa-money"></i></div>-->
							
							
					<!--	</div>-->
					<!--</div>-->

                <input type="hidden" id="discount" name="discount" class="form-control" placeholder="Discount" value="0" autocomplete="off">
                
                
						<div class="form-group">
						<label>Paid:</label>
						<div class="input-group">
							<div class="input-group-addon"><i class="fa fa-money"></i></div>
							<input type="text" id="returnpaid" name="returnpaid" class="form-control" placeholder="Paid" value="0" autocomplete="off">
							
						</div>
					</div>



					<div class="form-group">
						<label>Grand Total:</label>
						<div class="input-group">
							<div class="input-group-addon"><i class="fa fa-money"></i></div>
							<input type="text" id="grandtotal" name="grandtotal" class="form-control"  readonly="">
							
						</div>
					</div>


				</div>

			</div>






		</div>


		<div class="col-12 border p-4 mt-4">
			<center>

				<input type="submit" name="submitbutton" onclick="createinvoice()" value="Submit Now" class="btn btn-success" style="width: 150px; font-weight: bold; border-radius: 30px;">&nbsp;
			{{-- 	
				<input type="submit" name="draftsales" onclick="createinvoice()"  value="Draft Sales" class="btn btn-dark" style="width: 150px; font-weight: bold; border-radius: 30px;"> --}}

			</center>
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





	function getsalesproduct(){
		let item_id = $("#item_id").val();
		$.ajax({
			url: "{{ url('getsalesproductajax') }}/"+item_id,
			type: 'get',
			data:{},
			success: function (data)
			{
				$("#pdt_id").html(data);
			},
			error:function(errors){
				alert("Select Item")
			}
		});

	}

	function getcustomerphone(){
		let customer_id = $("#customer_id").val();
		$.ajax({
			url: "{{ url('getcustomerphone') }}/"+customer_id,
			type: 'get',
			success: function (response)
			{
				$("#customer_phone").val(response);
			},
			error:function(errors){
				alert("Select Customer")
			}
		});


		getpreviousdue();

	}

	function getpreviousdue(){
		let customer_id = $("#customer_id").val();
		$.ajax({
			url: "{{ url('getpreviousdue') }}/"+customer_id,
			type: 'get',
			success: function (response)
			{
				$("#stotaldue").val(response);
			},
			error:function(errors){
				alert("Select Customer")
			}
		});


	}




	showreturnsalesproductcart();


	function returnsalesproductcart(){
		let pdt_id = $("#pdt_id").val();

		$.ajax({
			url: "{{ url('returnsalesproductcart') }}/"+pdt_id,
			type: 'GET',
			success: function (data)
			{
				Command:toastr["success"]("Product Added Successfully Done")
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



				showreturnsalesproductcart();

				$("#pdt_id").val('');
				


			},
			error:function(errors){
				alert("Select Products");
			}
		});

	}





	function showreturnsalesproductcart(){
		$.ajax({
			url: "{{ url('showreturnsalesproductcart') }}",
			type: 'get',
			data:{},
			success: function (data)
			{
				$("#showdata").html(data);

				let totalsalesamount = parseFloat($("#totalsalesamount").val());
				$("#totalamount").val(totalsalesamount.toFixed(2));
				$("#grandtotal").val((totalsalesamount).toFixed(2));

				
				
			},
			error:function(errors){
				alert("errors")
			}
		});

	}






	function returnsalepriceupdatesingle(id){

		$.ajaxSetup({
			headers: {
				'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
			}
		});

		let sale_price_per_unit = $("#sale_price_per_unit"+id).val();


		$.ajax({
			url: "{{ url('returnsalepriceupdatesingle') }}/"+id,
			type: 'GET',
			data:{sale_price_per_unit:sale_price_per_unit},
			success: function (data)
			{
				Command:toastr["success"]("Product Quentity Update")
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

				showreturnsalesproductcart();
			},
			error:function(errors){
				alert("errors")
			}
		});

	}






	function returnqtyupdatesales(id){

		$.ajaxSetup({
			headers: {
				'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
			}
		});

		let product_quantity = $("#product_quantity"+id).val();


		$.ajax({
			url: "{{ url('returnqtyupdatesales') }}/"+id,
			type: 'POST',
			data:{product_quantity:product_quantity},
			success: function (data)
			{
				Command:toastr["success"]("Product Quentity Update")
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

				showreturnsalesproductcart();
			},
			error:function(errors){
				alert("errors")
			}
		});

	}




	function returnsalesproductdiscount(id){

		$.ajaxSetup({
			headers: {
				'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
			}
		});

		let product_discount_amount = $("#product_discount_amount"+id).val();

		$.ajax({
			url: "{{ url('returnsalesproductdiscount') }}/"+id,
			type: 'POST',
			data:{product_discount_amount:product_discount_amount},
			success: function (data)
			{
				Command:toastr["success"]("Product Discount Update")
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

				showreturnsalesproductcart();
			},
			error:function(errors){
				alert("errors")
			}
		});

	}


	



	
	


	function calculatediscount(){
		let total     = $("#totalamount").val();
		let discount  = $("#discount").val();
		



		if (discount != "" && discount>0) {
			let totaldiscount         = (parseFloat(total)-parseFloat(discount));
			$("#grandtotal").val(totaldiscount);
			$("#grandtotal").val((totaldiscount).toFixed(2));


		}


		


		calculatedue();
		$("#due").val(0);
	}

	function calculatedue(){
		let grandtotal = $("#grandtotal").val();
		let paid       = $("#paid").val()

		let due = (parseFloat(grandtotal)-parseFloat(paid));
		$("#due").val(due.toFixed(2));

		calculatediscount();

	}



	function returnproductbarcodeadd(){

		var barcode = $("#barcode").val();

		$.ajax({
			url: "{{ url('returnsalesproductcart2') }}/"+barcode,
			type: 'GET',
			success: function (data)
			{
				Command:toastr["success"]("Product Added Successfully Done")
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



				showreturnsalesproductcart();

				$("#barcode").val('');
				


			},
			error:function(errors){
				alert("Select Products");
			}
		});


	}



</script>









<!-- Supplier Modal -->
<div class="modal fade" id="exampleModalCenters" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitles" aria-hidden="true">
	<div class="modal-dialog modal-lg modal-dialog-centered" role="document">

		<div class="modal-content rounded">
			<div class="modal-header bg-dark text-light">
				<h5 class="modal-title" id="exampleModalCenterTitles"><i class="fa fa-plus"></i>&nbsp;&nbsp;Add New Customer</h5>
				<button type="button" class="close text-light" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body editdata myinput">

				<form method="post" action="{{ url("customerinsert2") }}">
					@csrf

					<div class="row myinput">
						

						<input type="hidden" name="customer_branch_id" id="customer_branch_id" value="{{ Auth("admin")->user()->branch }}">



						<div class="form-group col-md-6">
							<label>Customer Name(EN):</label>
							<div class="input-group">
								<div class="input-group-addon"><i class="fa fa-text-width"></i></div>
								<input class="form-control" type="text" name="customer_name_en" id="customer_name_en"  required="" placeholder="Customer Name EN">
							</div>
						</div>



						<div class="form-group col-md-6">
							<label>Customer Name(BN):</label>
							<div class="input-group">
								<div class="input-group-addon"><i class="fa fa-text-width"></i></div>
								<input class="form-control" type="text" name="customer_name_bn" id="customer_name_bn"  placeholder="Customer Name BN">
							</div>
						</div>


						<div class="form-group col-md-6">
							<label>Customer Mobile:</label>
							<div class="input-group">
								<div class="input-group-addon"><i class="fa fa-phone"></i></div>
								<input class="form-control" type="number" name="customer_phone" id="customer_phone"  placeholder="Customer Mobile">
							</div>
						</div>

						<div class="form-group col-md-6">
							<label>Email:</label>
							<div class="input-group">
								<div class="input-group-addon"><i class="fa fa-envelope"></i></div>
								<input class="form-control" type="text"  name="customer_email" id="customer_email" placeholder="Customer Email">
							</div>
						</div>


						<div class="form-group col-md-12">
							<label>Address:</label>
							<div class="input-group">
								<div class="input-group-addon"><i class="fa fa-location-arrow"></i></div>
								<textarea class="form-control" rows="3" name="customer_address" id="customer_address"  placeholder="Customer Address"></textarea>
							</div>
						</div>



						<div class="modal-footer border-0 col-12">
							<button type="button" class="btn btn-secondary border-0" onClick="window.location.reload();">Close</button>
							<button type="submit" class="btn btn-success button border-0">Save</button>

						</div>





					</div>
				</form>



			</div>


		</div>
	</div>
</div>
<!--End Supplier Modal -->








@endsection