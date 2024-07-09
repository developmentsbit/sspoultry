
<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Tiro+Bangla:ital@0;1&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400&display=swap" rel="stylesheet">
    <title>Loan Statement Reports</title>
</head>
<body style="font-family: 'Montserrat','Tiro Bangla', serif; font-size: 14px;">

      @php
  $company_info = DB::table("company_info")->first();

  @endphp

    <div class="container mt-4">


        <div class="card">
            <div class="card-header">
                <center>
                      <center><img src="{{ url($company_info->banner) }}" id="header_image" class="img-fluid"></center>
                </center>
            </div>

            <div class="card-body">

               
                <table class="table-bordered w-100 text-center">

                    <tr>
                        <th colspan="8"><h5 class="p-1">Loan Statement Reports</h5></th>
                    </tr>

                </table>


                <table class="table-bordered w-100 text-center mt-3">

                    <thead>
                        <tr>
                            <th>SL.</th>
                            <th>Loan Source Name</th>
                            <th>Loan Received</th>
                            <th>Loan Provide</th>
                            <th>Due Loan</th>
                        

                        </tr>
                    </thead>

                    <tbody>

                        @php $i = 1; $trecieved = 0; $tprovide = 0; $tdue = 0;  @endphp
                        @if(isset($data))
                        @foreach($data as $d)
                        
                        @php
                            $recieved = DB::table("loanreceived")->where('register_id',$d->id)->sum("amount");
                            $provide  = DB::table("loanprovide")->where('register_id',$d->id)->sum("amount");
                            
                            $trecieved = $trecieved + $recieved;
                            $tprovide = $tprovide + $provide;
                            
                            $due =  $recieved - $provide ;
                            
                            $tdue = $tdue + $due;
                            
                        @endphp

                        <tr>
                          <td>{{ $i++ }}</td>
                          <td>{{ $d->name }}</td>
                          <td>{{ $recieved }}/-</td>
                          <td>{{ $provide }}/-</td>
                          <td>{{ $due }}/-</td>
                     
                      </tr>

                      @endforeach
                      @endif
                      
                      <tr>
                          <th colspan="2">Total</th>
                          <th>{{ number_format($trecieved,2) }}/-</th>
                          <th>{{ number_format($tprovide,2) }}/-</th>
                          <th>{{ number_format($tdue,2)}}/-</th>
                          
                      </tr>

                  </tbody>

              </table>

          </div>

      </div>



  </div>
  <br>
  <center><a href="#" class="btn btn-danger btn-sm print w-40" onclick="window.print();">Print Now</a></center><br>
</div>


</div>



<style type="text/css">
  @media  print
  {


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


<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>



