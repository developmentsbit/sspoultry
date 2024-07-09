@extends('Admin.layouts.index')
@section('content')

<script type="text/javascript">
        $(function () {
            $('#from_date').datepicker({
               dateFormat: 'dd/mm/yy'
            });
        });
    </script>

<div class="content-wrapper">
	<div class="page-heading">
		<h3 class="page-title">Supplier Statements</h3>
	</div>



	<div class="page-content fade-in">
		<div class="ibox">
			
			<div class="ibox-body">
				<form method="get" action="{{ url("/") }}/{{ 'report/supplier_statement.php' }}" target="_blank">
		
<div class="row"> 
						<div class="form-group col-md-4">
							<label>Supplier Name: <span class="text-danger" style="font-size: 15px;">*</span></label>
							<div class="input-group">
								<div class="input-group-addon"><i class="fa fa-user"></i></div>
								<select class="form-control select2_demo_1" name="suplier_id" id=
								"suplier_id" required="">
								<option value="">Select Supplier</option>
								@php
								$supplier = DB::table('supplier_info')->where("supplier_branch_id",Auth('admin')->user()->branch)->get();		
								@endphp 
								@foreach($supplier as $i)
								<option value="{{ $i->supplier_id  }}">{{ $i->supplier_id }} - {{ $i->supplier_company_name }}</option>
								@endforeach
							</select>
					
						</div>
					</div>





					<div class="form-group col-md-4">
						<label>From Date:(MM-DD-YY) <span class="text-danger" style="font-size: 15px;">*</span></label>
						<div class="input-group">
							<div class="input-group-addon"><i class="fa fa-calendar"></i></div>
							<input type="date" name="from_date" id="from_date" placeholder="Payment Date" class="form-control" required="" autocomplete="off"  value="<?php echo date('Y-m-d'); ?>">
							
						</div>
					</div>



					<div class="form-group col-md-4">
						<label>To Date:(MM-DD-YY) <span class="text-danger" style="font-size: 15px;">*</span></label>
						<div class="input-group">
							<div class="input-group-addon"><i class="fa fa-calendar"></i></div>
							<input type="date" name="to_date" id="to_date" placeholder="Payment Date" class="form-control" required="" autocomplete="off" value="<?php echo date('Y-m-d'); ?>">
							
						</div>
					</div>

</div>






				</div>


				<div class="col-12 border p-4 mt-4">
					<center><input type="submit" value="Show Report" class="btn btn-success button" style="width: 200px; font-weight: bold; border-radius: 30px;"></center>

		
				</div>


			</form>

		</div>
	</div>

</div>
</div>

<!-------End Table--------->



@endsection