<!DOCTYPE>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
  <title>Cash Close Report</title>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
</head>

<body>

  @php

  $settings = DB::table('company_info')->first();
  @endphp

  <div class="container border">
    <table class="table" style="width: 100%;margin-bottom: 10px;border:none;">
      <tr>
        <td align="center" colspan="2">

          <img src="{{ url($settings->banner) }}" id="header_image" class="img-fluid">

        </td>
      </tr>

      <tr style="text-align: center; font-weight: bold;">
        <td colspan="2" style="text-align: center;">
          <span style="text-align:center;font-size: 16px;text-transform: uppercase;font-weight: bold; border: 3px #000 solid; padding: 7px; border-radius:10px; ">
            <a style="text-decoration:none;color: black;border-bottom:2px dotted #ccc">   @if($Type==='1')(Daily)@endif
              @if($Type==='3')(Monthly)@endif
              @if($Type==='4')(Yearly)@endif
              @if($Type==='2')(Date To Date)@endif Cash Close Report

            </a>
          </span>
        </td>
      </tr>

      <tr style="text-align: center;width: 95%;margin:auto;">
        <td align='center'>
          <a style="text-decoration: none;font-size: 14px; margin:auto;color: black;padding-left: 50px">
            @if($Type === '1')
            Date: {{$date}}
            @elseif($Type === '2')
            From Date:{{$date1}} &nbsp; &nbsp; &nbsp; To Date:{{$date2}}
            @elseif($Type === '3')
            <span  style=" font-size: 14px;">Month :&nbsp;&nbsp;
              @if($month ==='01')(January)@endif
              @if($month ==='02')(February)@endif
              @if($month ==='03')(March)@endif
              @if($month ==='04')(April)@endif
              @if($month ==='05')(May)@endif
              @if($month ==='06')(June)@endif
              @if($month ==='07')(July)@endif
              @if($month ==='08')(August)@endif
              @if($month ==='09')(September)@endif
              @if($month ==='10')(October)@endif
              @if($month ==='11')(November)@endif
              @if($month ==='12')(December)@endif 
            </span>

            <span  style=" font-size: 14px;  ">Year :&nbsp;&nbsp;{{$year}}
            </span>

            @elseif($Type === '4')
            <span  style=" font-size: 14px;  ">Year :&nbsp;&nbsp;{{$year}}
            </span>
            @endif
          </a>
        </td>

      </tr>

    </table>

    {{-- <img src="{{URL::to('/')}}/public/imageHeader/background.png"  height="650" style="width: 100%" /> --}}

    <table class="table"  align="center"  >

      <tr style="text-align: center; font-size: 14px">


        <td  valign="top" style="width:400px;">


          <table class="table" style="vertical-align: top; border: 1px solid #000; " align="center" cellpadding="0" cellspacing="0">
            <tr style="height: 20px;text-align: center;">
              <td colspan="8" style="font-weight: bold;border-bottom: 1px solid #000; border-top: 1px solid #000">Income Info</td></tr>
              @php
              $saleincome =0;           
              $otherincome =0;           
              $bankwithdraw =0;           
              $returnamount =0;           

              @endphp
              <tr style="height: 20px;">
                <td style="border-bottom: 1px solid #000;border-right: 1px solid #000;padding-left: 5px;">Previous Cash</td>
                <td colspan="2" style="border-bottom: 1px solid #000;padding-left: 5px;border-right: 1px solid #000;">{{$p_cash->previous_cash}}</td>
              </tr>

              @if(count($sale)>0)
              <tr style="height: 20px;">
                <td colspan="3" style="border-bottom: 1px solid #000;border-right: 1px solid #000;padding-left: 5px;text-align:center;font-weight:bold">Sales Collection</td>
              </tr>
              @foreach($sale as $salesdata)

              @php
              $saleincome +=$salesdata->payment_amount; 
              @endphp
              <tr style="height: 20px;">
                <td style="border-bottom: 1px solid #000;border-right: 1px solid #000;padding-left: 5px;">{{$salesdata->customer_name}}</td>
                <td style="border-bottom: 1px solid #000;border-right: 1px solid #000;padding-left: 5px;">{{$salesdata->payment_amount}}/-</td>
                <td style="border-bottom: 1px solid #000;padding-left: 5px;border-right: 1px solid #000;">{{$salesdata->note}}</td>
              </tr>
              @endforeach
              @endif





              @if(count($others)>0)
              <tr style="height: 20px;">
                <td colspan="3" style="border-bottom: 1px solid #000;border-right: 1px solid #000;padding-left: 5px;text-align:center;font-weight:bold">Others Collection/Income</td>
              </tr>


              @foreach($others as $others)
              @php
              $otherincome +=$others->amount;                      
              @endphp
              <tr style="height: 20px;">
                <td style="border-bottom: 1px solid #000;border-right: 1px solid #000;padding-left: 5px;">{{$others->title}}</td>
                <td style="border-bottom: 1px solid #000;border-right: 1px solid #000;padding-left: 5px;">{{$others->amount}}</td>
                <td style="border-bottom: 1px solid #000;padding-left: 5px;border-right: 1px solid #000;">{{$others->note}}</td>
              </tr>
              @endforeach
              @endif

              @if(count($pur_return)>0)
              <!--<tr style="height: 20px;">-->
                <!--  <td colspan="3" style="border-bottom: 1px solid #000;border-right: 1px solid #000;padding-left: 5px;text-align:center;font-weight:bold">Purchase Returns</td>-->
                <!--</tr>-->


                @foreach($pur_return as $return)
                @php
                $returnamount +=$return->product_quantity*$return->purchase_price;                      
                @endphp
                <!--<tr style="height: 20px;">-->
                  <!--  <td style="border-bottom: 1px solid #000;border-right: 1px solid #000;padding-left: 5px;">{{$return->invoice_no}}</td>-->
                  <!--  <td style="border-bottom: 1px solid #000;border-right: 1px solid #000;padding-left: 5px;">{{$asset->returnamount}}</td>-->
                  <!--  <td style="border-bottom: 1px solid #000;padding-left: 5px;border-right: 1px solid #000;"></td>-->
                  <!--</tr>-->
                  @endforeach
                  @endif

                  <tr style="height: 20px;">
                    <td style="border-bottom: 1px solid #000;;border-right: 1px solid #000;font-weight: bold;;padding-left: 5px;">Total Collection</td>
                    <td colspan="2" style="border-bottom: 1px solid #000;font-weight: bold;;padding-left: 5px;border-right: 1px solid #000;">

                      {{$p_cash->previous_cash+$saleincome+$bankwithdraw+$otherincome+$returnamount}}/-
                    </td>
                  </tr>
                </table>

                <div  style="width:100%;padding:20px;">

                 <div class="row">
                   <div class="col-12" style="border:1px #000 solid; font-size:16px; text-align:center; color:#000;"> Bank Balance & Cash in Hand </div>

                   <div class="col-6" style="border-left:1px #000 solid; border-bottom:1px #000 solid; border-right:1px #000 solid;"> Title</div>
                   <div class="col-6" style=" border-bottom:1px #000 solid; border-right:1px #000 solid;"> Balance</div>



                   @if(isset($explode))
                   @foreach($explode as $e)

                   <div class="col-6" style="border-left:1px #000 solid; border-bottom:1px #000 solid; border-right:1px #000 solid;"> {{ $e }}</div>


                   @endforeach
                   @endif

                 </div>

               </div>

             </td>


             <td style="width: 50%">
              <table class="table" style="border: 1px solid #000;" align="center" cellpadding="0" cellspacing="0">
                <tr style="height: 40px;text-align:center">
                  <td colspan="3"  style="font-weight: bold;border-bottom: 1px solid #000; border-top: 1px solid #000">Expense Info</td></tr>

                  @php
                  $purchaseex =0;                     
                  $bankex =0;                  
                  $otherex =0;                  
                  $salaryex =0;                  
                  $sellreturnamount =0;                  

                  @endphp
                  @if(count($purchase)>0)
                  <tr style="height: 20px;">
                    <td colspan="3" style="border-bottom: 1px solid #000;border-right: 1px solid #000;padding-left: 5px;text-align:center;font-weight:bold">Supplier Payment</td>
                  </tr>

                  @foreach($purchase as $purchasedata)
                  @php
                  $purchaseex+=$purchasedata->payment;
                  @endphp
                  <tr style="height: 20px;">
                    <td style="border-bottom: 1px solid #000;border-right: 1px solid #000;padding-left: 5px;">{{$purchasedata->company_name}}</td>
                    <td style="border-bottom: 1px solid #000;border-right: 1px solid #000;padding-left: 5px;">{{$purchasedata->payment}}/-</td>
                    <td style="border-bottom: 1px solid #000;padding-left: 5px;border-right: 1px solid #000;">{{$purchasedata->comment}}</td>
                  </tr>
                  @endforeach
                  @endif






                  @if(count($expense)>0)
                  <tr style="height: 20px;">
                    <td colspan="3" style="border-bottom: 1px solid #000;border-right: 1px solid #000;padding-left: 5px;text-align:center;font-weight:bold">Expense</td>

                  </tr>


                  @foreach($expense as $expenses)

                  @php
                  $otherex+=$expenses->amount;
                  @endphp
                  <tr style="height: 20px;">
                    <td style="border-bottom: 1px solid #000;border-right: 1px solid #000;padding-left: 5px;">{{$expenses->title}}</td>
                    <td style="border-bottom: 1px solid #000;border-right: 1px solid #000;padding-left: 5px;">{{$expenses->amount}}/-</td>
                    <td style="border-bottom: 1px solid #000;padding-left: 5px;border-right: 1px solid #000;">{{$expenses->note}}</td>
                  </tr>
                  @endforeach
                  @endif


                  @if(count($salary)>0)
                  <tr style="height: 20px;">
                    <td colspan="3" style="border-bottom: 1px solid #000;border-right: 1px solid #000;padding-left: 5px;text-align:center;font-weight:bold">Employee Salary</td>
                  </tr>

                  @foreach($salary as $salarys)
                  @php
                  $salaryex+=$salarys->paid_ammount;
                  @endphp
                  <tr style="height: 20px;">
                    <td style="border-bottom: 1px solid #000;border-right: 1px solid #000;padding-left: 5px;">{{$salarys->Name}}</td>
                    <td colspan="2" style="border-bottom: 1px solid #000;padding-left: 5px;border-right: 1px solid #000;">{{$salarys->paid_ammount}}/-</td>
                  </tr>
                  @endforeach
                  @endif

                  @if(count($sell_return)>0)
                  <!--<tr style="height: 20px;">-->
                    <!--  <td colspan="3" style="border-bottom: 1px solid #000;border-right: 1px solid #000;padding-left: 5px;text-align:center;font-weight:bold">Sells Return</td>-->
                    <!--</tr>-->


                    @foreach($sell_return as $returndata)
                    @php
                    $sellreturnamount +=$returndata->return_quantity*$returndata->product_return_price;                      
                    @endphp
                    <!--<tr style="height: 20px;">-->
                      <!--  <td style="border-bottom: 1px solid #000;border-right: 1px solid #000;padding-left: 5px;">{{$returndata->invoice_no}}</td>-->
                      <!--  <td style="border-bottom: 1px solid #000;border-right: 1px solid #000;padding-left: 5px;">{{$returndata->return_quantity*$returndata->product_return_price}}</td>-->
                      <!--  <td style="border-bottom: 1px solid #000;padding-left: 5px;border-right: 1px solid #000;">{{$returndata->customer_name_en}}</td>-->
                      <!--</tr>-->
                      @endforeach
                      @endif



                      <tr style="height: 20px;">
                        <td  style="border-bottom: 1px solid #000;border-right: 1px solid #000;font-weight: bold;padding-left: 5px;">Total Expense</td>
                        <td colspan="2"  style="border-bottom: 1px solid #000;font-weight: bold;padding-left: 5px;">
                          {{$bankex+$purchaseex+$otherex+$salaryex+$sellreturnamount}}/-
                        </td>
                      </tr>
                    </table>
                  </td>
                </tr>



                <tr>

                 <td>



                 </td>

                 <td>

                  <table class="table" style="width: 50%;float: right;position: relative;border:1px solid #000;margin: 10px" align="center" cellpadding="0" cellspacing="0">
                   <tr style="height: 40px;text-align:center"><td colspan="3" style="font-weight: bold;border-bottom: 1px solid #000; border-top: 1px solid #000">Cash Calculation</td></tr>
                   <tr style="height: 20px;">
                    <td style="border-bottom: 1px solid #000;border-right: 1px solid #000;padding-left: 5px;">Total Collection</td>
                    <td style="border-bottom: 1px solid #000;padding-left: 5px;border-right: 1px solid #000;">{{$p_cash->previous_cash+$saleincome+$bankwithdraw+$otherincome+$returnamount}}/-</td>
                  </tr>
                  <tr style="height: 20px;">
                    <td style="border-bottom: 1px solid #000;border-right: 1px solid #000;padding-left: 5px;">Total Expense</td>
                    <td style="border-bottom: 1px solid #000;padding-left: 5px;border-right: 1px solid #000;">{{$bankex+$purchaseex+$otherex+$salaryex+$sellreturnamount}}/-</td>
                  </tr>
                  <tr style="height: 20px;">
                    <td style="border-bottom: 1px solid #000;border-right: 1px solid #000;font-weight: bold;padding-left: 5px;">Current Cash</td>
                    <td style="border-bottom: 1px solid #000;font-weight: bold;padding-left: 5px;border-right: 1px solid #000;">{{($p_cash->previous_cash+$saleincome+$bankwithdraw+$otherincome+$returnamount) - ($bankex+$purchaseex+$otherex+$salaryex+$sellreturnamount)}}/-</td>
                  </tr>
                </table>
              </td>
            </tr>



            <tr>

            </tr> 

          </table>


          <br>

          <div class="row" style="margin-top:50px;">
            <div class="col-4" style="text-align:left">
              {{Auth()->user()->name}}<br>
              --------------------<br>
              Prepared By
            </div>
            <div class="col-4" style="text-align:center">
              &nbsp;&nbsp;&nbsp;&nbsp;<br>
              --------------------<br>
              Accountant's Signature
            </div>
            <div class="col-4" style="text-align:right;">
              &nbsp;&nbsp;&nbsp;&nbsp;<br>
              --------------------<br>
              Authorized  Signature
            </div>
          </div>

          <br><br>

          <center><a style="font-size: 12px;">Software Developed by SBIT. For query: 01840241895</a></center>
          <br><br>
          <center><a href="#" class="btn btn-info btn-sm print w-10" onclick="window.print();">Print</a></center>


        </div>







        <style type="text/css">
        
          table tr td{
            padding:8px !important;
          }
          body{
            font-family: 'Poppins', sans-serif;
            color: #414141;
          }
          .invoice{
            width: 1000px;
            background: #f8f8f8;
            padding: 10px;
            margin: 0 auto;
          }
          .invoice img{
            height: 80px;
          }
          .invoice span{
            font-size: 13px;
          }

          thead{
            font-size: 13px;
          }

          tbody{
            font-size: 13px;
          }

          @media print
          {
           .print{
            display: none;
          }

        </style>


      </body>
      </html>
