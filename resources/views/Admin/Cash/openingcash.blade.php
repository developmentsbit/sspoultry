@extends('admin.index')
@section('content')

<div class="app-body">
  <main class="main-content">
    <div class="container-fluid p-0">
      <div class="col-sm-12 col-12 bg-white p-0 p-4 border-bottom">
        <h3 class="font-weight-bold head"><img src="{{ asset('/public/Admin') }}/assets/img/logo.png" class="img-fluid" style="height: 40px;">&nbsp;&nbsp;Opening Cash Information</h3>
      </div>
<div class="container-fluid mt-4">
        <div class="card mb-4 border-0">

          <div class="card-body">
                <form class="form-horizontal" method="post" action="{{URL::to('handingcash')}}" name="basic_validate" id="basic_validate" novalidate="novalidate">
                @csrf


<div class="row">
                <div class="form-group col-md-6">
                  <label class="control-label">Date
                  </label>
                  <div class="controls">

                    <input type="text" name="date" value="{{date('d-m-Y')}}" class="form-control date-picker-input" />

                    <span class="help-block" style="font-size: 12px;">Date with Format of  (dd-mm-yyyy)</span>

                  </div>
                  </div>

                  <div class="form-group col-md-6">
                    <label class="control-label">Hand in Cash</label>
                    <div class="controls">
                      <input type="text"  placeholder="Hand in Cash"  class="form-control textfill" value="{{old('opening_cash')}}" name="opening_cash" required="">
                    </div>
                  </div>
</div>

                  <div class="form-actions">
                    <input type="submit" value="Submit" class="btn btn-success">
                  </div>

                </form>
              </div>
            </div>
        </div>

      </main>

    </div>


@endsection
