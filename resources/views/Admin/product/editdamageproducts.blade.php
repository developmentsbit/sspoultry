
<form method="post" class="btn-submit row" data-id="{{ $data->id }}">



  <div class="form-group col-md-12">
    <label>Product Name:</label>
    <div class="input-group">

      <select class="form-control select2_demo_1" name="product_id" id=
      "product_id" style="width: 100%!important;" required="">
      <option value="">Select Product</option>
      @php
      $product = DB::table('pdt_productinfo')->where('pdt_status',1)->get();    
      @endphp 
      @foreach($product as $i)
      <option value="{{ $i->pdt_id  }}" <?php if ($i->pdt_id == $data->product_id) {
       echo "selected";
      } ?>>{{ $i->pdt_id  }} - {{ $i->pdt_name_en }} {{ $i->pdt_name_bn }}</option>
      @endforeach
    </select>

  </div>
</div>

<div class="form-group col-md-12">
  <label>Quantity: <span class="text-danger" style="font-size: 15px;">*</span></label>
  <div class="input-group">
    <input type="text" name="qty" id="qty" placeholder="Product QTY" class="form-control" required="" value="{{ $data->qty }}" autocomplete="off">

  </div>
</div>





<div class="modal-footer border-0 ml-auto">
  <button type="button" class="btn btn-secondary border-0" data-dismiss="modal">Close</button>
  <button type="submit" class="btn btn-success button border-0">Update</button>
  <button type="button" class="btn btn-success loading border-0">Loading...</button>
</div>
</form>






<script type="text/javascript">

  $.ajaxSetup({
    headers: {
      'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
    }
  });


  $('.loading').hide();
  $(".btn-submit").submit(function(e){
    e.preventDefault();

    var data = $(this).serialize();
    var id = $(this).data("id");

    $.ajax({
      url:"{{ url('updatedamageproducts') }}/"+id,
      method:'POST',
      data:data,

      beforeSend:function(response) { 

        $('.loading').show();
        $('.button').hide();

      },


      success:function(response){

       Command:toastr["info"]("Data Update Successfully Done")
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

      $('.loading').hide();
      $('.button').show();
      $('#exampleModalCenters').modal('hide');



    window.location.href=""

    },

    error:function(error){
      console.log(error)
    }
  });
  });






</script>