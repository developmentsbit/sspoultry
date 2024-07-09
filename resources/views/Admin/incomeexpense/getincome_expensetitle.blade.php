	@php $i=1;  @endphp
	@if(isset($data))
	@foreach($data as $d)
	<tr id="tr{{ $d->id }}">
		<td>{{ $i++ }}</td>
		<td>{{ $d->title }}</td>
		<td>{{ $d->details }}</td>
		<td>{{ $d->type }}</td>
		<td>
			<a  class="btn btn-info border-0 edit text-light" data-toggle="modal" data-target="#exampleModalCenters" data-id="{{ $d->id }}"><i class="fa fa-pencil-square-o"></i></a>
			<a  class="delete btn btn-danger  border-0 text-light" data-id="{{ $d->id }}"><i class="fa fa-trash-o"></i></a>
		</td>

	</tr>
	@endforeach
	@endif





	<script type="text/javascript">




		function showdata(){
			$.ajax(
			{
				url: "{{ url('getincome_expensetitle') }}",
				type: 'get',
				data:{},
				success: function(data)
				{
					$("#showtdata").html(data);
				}
			});

		}



</script>
