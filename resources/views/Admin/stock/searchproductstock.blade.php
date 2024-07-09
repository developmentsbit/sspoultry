	
	
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
							<td>{{ $d->pdt_name_en }}<br>{{ $d->pdt_name_bn }}</td>
							<td>{{ $d->purchase_price_withcost }} </td>
							<td>{{ $d->sale_price }} </td>
							<td>{{ $d->quantity }}</td>
							<td>{{ $salesreturn }}</td>
							<td>{{ $d->sales_qty }}</td>
							<td>{{ $purchasereturn }}</td>
							
							<td>
					
				<span class="btn btn-success btn-sm">Stock - {{ ($purchaseqty+$salesreturn)-($salesqty+$purchasereturn)  }}</span>
							    
							    
							    
							
							</td>
		

						</tr>
						@endforeach
						@endif
