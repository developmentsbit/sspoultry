
<form method="post" class="btn-submit row" data-id="{{ $data->id }}">



  <div class="form-group col-md-12">
    <label>Name:<span class="text-danger" style="font-size: 15px;">*</span></label>
    <div class="input-group">
      <div class="input-group-addon"><i class="fa fa-check-square-o"></i></div>
      <select class="form-control" name="register_id" id="register_id" style="width: 100%!important;" required="">

        @php
        $name = DB::table("loanregister")->where("branch",Auth('admin')->user()->branch)->get();
        @endphp

        @if(isset($name))
        @foreach($name as $t)
        <option value="{{ $t->id }}" <?php if ($t->id == $data->register_id) {
          echo "selected";
        } ?>>{{ $t->name }}</option>
        @endforeach
        @endif

      </select>
    </div>
  </div>






  <div class="form-group col-md-12">
    <label>Amount: <span class="text-danger" style="font-size: 15px;">*</span></label>
    <div class="input-group">
      <div class="input-group-addon"><i class="fa fa-text-width"></i></div>
      <input class="form-control" type="number" name="amount" id="amount" placeholder="Amount" required="" value="{{ $data->amount }}">
    </div>
  </div>



  <div class="form-group col-md-12">
    <label>Note: <span class="text-danger" style="font-size: 15px;">*</span></label>
    <div class="input-group">
      <div class="input-group-addon"><i class="fa fa-text-width"></i></div>
      <input class="form-control" type="text" name="note" id="note" placeholder="Note" required="" value="{{ $data->note }}">
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
      url:"{{ url('updateloanprovide') }}/"+id,
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