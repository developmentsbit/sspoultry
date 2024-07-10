
<!DOCTYPE>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Cash Close Report</title>
</head>
<style type="text/css">
  #header_image
  {
    width:100%;height:180px;
  }

  body{
    font-family: 'Poppins', sans-serif;
    color: black;
  }
  .invoice{
    background: #f8f8f8;
    padding: 10px;
    margin: 0 auto;
  }
  .invoice img{
    height: 80px;
  }
  .invoice span{
    font-size: 15px;
  }

  thead{
    font-size: 16px;
  }

  tbody{
    font-size: 14px;
  }

.table-bordered td, .table-bordered th{
    border: 1px solid black !important;
    box-shadow: none;
    border-bottom: 1px solid black;
}

.table-bordered tr{
  border: 1px solid black !important;
}


tbody {
    border: none !important;
}


  @media print
  {

    .table-bordered tr{
      border: 1px solid black !important;
    }

    @page {
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
    /*@page { size: 10cm 20cm landscape; }*/

  }
</style>

<body>

<table class="table" style="width: 100%;margin-bottom: 10px;border:none;">
    <tr>
        <!-- <td align="center" colspan="2">
            <span style="font-size: 28px; font-family:Nueva Std; ">
                <img style="width: 100%; height: 100px;" src="{{URL::to('/')}}/public/imageHeader/14.jpg">
            </span>
        </td> -->
        <img src="{{asset('/public/Admin')}}/assets/img/banner.jpg" id="header_image">
    </tr>

    <tr style="text-align: center; font-weight: bold;">
        <td colspan="2" style="text-align: center;">

            <a style="text-decoration:none;color: black;border-bottom:2px dotted #ccc">Cash Close Report</a>
        </td>
    </tr>

     <tr style="text-align: center;width: 95%;margin:auto;">
         @if($month != "")
          <td>
            <span  style=" font-size: 14px; padding-left: 20px;">Month :&nbsp;&nbsp;
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
          </td>
        @endif

          @if($year != "")
            <td align="right">
              <span  style=" font-size: 14px; ">Year :&nbsp;&nbsp;{{$year}}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              </span>
            </td>
          @endif

    </tr>

</table>

<img src="{{asset('/public/Admin')}}/assets/img/banner.jpg" id="header_image">

<table class="table"  align="center" cellpadding="0" cellspacing="0" style='width: 100%;border:1px solid #999; margin-top:-650px; float:left;position: relative;'>

  <tr style="text-align: center; font-size: 14px">
    <td style="width: 50%">
        <table class="table" style="float:left;position: relative;border:1px solid #999;width: 90%;margin:20px;margin-top: 55px;" align="center" cellpadding="0" cellspacing="0">
            <tr style="height: 40px;text-align: center;"><td colspan="8" style="font-weight: bold;border-bottom: 2px solid #999">Collection Info</td></tr>
@php
$saleincome =0;
$otherincome =0;
$bankwithdraw =0;
$assets =0;

@endphp

    @foreach($dataincome as $showdata)
    @php
    $saleincome +=$showdata->sales;
    $bankwithdraw +=$showdata->bank_withdraw;
    $assets +=$showdata->assets;

    @endphp

@endforeach
            <tr style="height: 30px">
              <td style="border-bottom: 1px solid #999;border-right: 1px solid #999;padding-left: 5px;">Previous Cash</td>
              <td colspan="2" style="border-bottom: 1px solid #999;padding-left: 5px;">{{$dataincome[0]->previous_cash}}</td>
             </tr>


            <tr style="height: 30px">
              <td  style="border-bottom: 1px solid #999;border-right: 1px solid #999;padding-left: 5px;">Sale Pay Info</td>
              <td colspan="2" style="border-bottom: 1px solid #999;border-right: 1px solid #999;padding-left: 5px;">{{$saleincome}}</td>
            </tr>




            <tr style="height: 30px">
              <td  style="border-bottom: 1px solid #999;border-right: 1px solid #999;padding-left: 5px">Bank Withdraw</td>
               <td colspan="2" style="border-bottom: 1px solid #999;border-right: 1px solid #999;padding-left: 5px;">{{$bankwithdraw}}</td>
            </tr>


            <tr style="height: 30px">
              <td  style="border-bottom: 1px solid #999;border-right: 1px solid #999;padding-left: 5px">Assets Invest</td>
               <td colspan="2" style="border-bottom: 1px solid #999;border-right: 1px solid #999;padding-left: 5px;">{{$assets}}</td>
            </tr>




               @if(count($others)>0)
            <tr style="height: 30px">
              <td colspan="3" style="border-bottom: 1px solid #999;border-right: 1px solid #999;padding-left: 5px;text-align:center;font-weight:bold">Others Incomes</td>
            </tr>


            @foreach($others as $others)
               @php
$otherincome +=$others->ammount;
@endphp
            <tr style="height: 30px">
              <td style="border-bottom: 1px solid #999;border-right: 1px solid #999;padding-left: 5px;">{{$others->title}}</td>
              <td style="border-bottom: 1px solid #999;border-right: 1px solid #999;padding-left: 5px;">{{$others->ammount}}</td>
            </tr>
            @endforeach
            @endif

            <tr style="height: 30px">
              <td style="border-bottom: 1px solid #999;;border-right: 1px solid #999;font-weight: bold;;padding-left: 5px;">Total Collection</td>
              <td style="border-bottom: 1px solid #999;font-weight: bold;;padding-left: 5px;">

              {{$dataincome[0]->previous_cash+$saleincome+$bankwithdraw+$otherincome+$assets}}
              </td>
            </tr>
        </table>
    </td>
    <td style="width: 50%">
    <table class="table" style="float:right;position: relative;border:1px solid #999;width: 90%;margin:10px" align="center" cellpadding="0" cellspacing="0">
          <tr style="height: 40px;text-align:center"><td colspan="3"  style="font-weight: bold;border-bottom: 2px solid #999">Expense Info</td></tr>
@php
$purchaseex =0;
$bankex =0;
$otherex =0;
$assetwith =0;
$salaryex =0;

@endphp

   @foreach($dataexpense as $showdata)
     @php
    $purchaseex +=$showdata->purchase;
    $salaryex +=$showdata->salary;
    $bankex +=$showdata->bank_deposit;
    $assetwith +=$showdata->assetswithdraw;
    @endphp
    @endforeach

            <tr style="height: 30px">
              <td style="border-bottom: 1px solid #999;border-right: 1px solid #999;padding-left: 5px;">Purchase Pay Info</td>
                 <td colspan="2" style="border-bottom: 1px solid #999;border-right: 1px solid #999;padding-left: 5px;">{{$purchaseex}}</td>
            </tr>




            <tr style="height: 30px">
              <td style="border-bottom: 1px solid #999;border-right: 1px solid #999;padding-left: 5px;">Bank Deposite</td>
                 <td colspan="2" style="border-bottom: 1px solid #999;border-right: 1px solid #999;padding-left: 5px;">{{$bankex}}</td>
            </tr>

             <tr style="height: 30px">
              <td style="border-bottom: 1px solid #999;border-right: 1px solid #999;padding-left: 5px;">Salary</td>
                 <td colspan="2" style="border-bottom: 1px solid #999;border-right: 1px solid #999;padding-left: 5px;">{{$salaryex}}</td>
            </tr>

             <tr style="height: 30px">
              <td style="border-bottom: 1px solid #999;border-right: 1px solid #999;padding-left: 5px;">Assets Withdraw</td>
                 <td colspan="2" style="border-bottom: 1px solid #999;border-right: 1px solid #999;padding-left: 5px;">{{$assetwith}}</td>
            </tr>





               @if(count($expense)>0)
            <tr style="height: 30px">
              <td colspan="3" style="border-bottom: 1px solid #999;border-right: 1px solid #999;padding-left: 5px;text-align:center;font-weight:bold">Expense</td>

            </tr>


            @foreach($expense as $expenses)

            @php
           $otherex+=$expenses->ammount;
            @endphp
            <tr style="height: 30px">
              <td style="border-bottom: 1px solid #999;border-right: 1px solid #999;padding-left: 5px;">{{$expenses->title}}</td>
              <td style="border-bottom: 1px solid #999;border-right: 1px solid #999;padding-left: 5px;">{{$expenses->ammount}}</td>
              <td style="border-bottom: 1px solid #999;padding-left: 5px;">{{$expenses->comment}}</td>
            </tr>
            @endforeach
            @endif






            <tr style="height: 30px">
              <td  style="border-bottom: 1px solid #999;border-right: 1px solid #999;font-weight: bold;padding-left: 5px;">Total Expense</td>
              <td  style="border-bottom: 1px solid #999;font-weight: bold;padding-left: 5px;">
                {{$bankex+$purchaseex+$otherex+$salaryex+$assetwith}}
              </td>
            </tr>
        </table>
    </td>
  </tr>
<tr>
  <td colspan="2">

      <table class="table" style="width: 30%;float: right;position: relative;border:1px solid #999;margin: 10px" align="center" cellpadding="0" cellspacing="0">
           <tr style="height: 40px;text-align:center"><td colspan="3" style="font-weight: bold;border-bottom: 2px solid #999">Cash Calculation</td></tr>
            <tr style="height: 30px">
              <td style="border-bottom: 1px solid #999;border-right: 1px solid #999;padding-left: 5px;">Total Collection</td>
          <td style="border-bottom: 1px solid #999;padding-left: 5px;">{{$dataincome[0]->previous_cash+$saleincome+$bankwithdraw+$otherincome+$assets}}</td>
            </tr>
            <tr style="height: 30px">
              <td style="border-bottom: 1px solid #999;border-right: 1px solid #999;padding-left: 5px;">Total Expense</td>
              <td style="border-bottom: 1px solid #999;padding-left: 5px;">{{$bankex+$purchaseex+$otherex+$salaryex+$assetwith}}</td>
            </tr>
            <tr style="height: 30px">
              <td style="border-bottom: 1px solid #999;border-right: 1px solid #999;font-weight: bold;padding-left: 5px;">Current Cash</td>
              <td style="border-bottom: 1px solid #999;font-weight: bold;padding-left: 5px;">{{($dataincome[0]->previous_cash+$saleincome+$bankwithdraw+$otherincome+$assets) - ($bankex+$purchaseex+$otherex+$salaryex+$assetwith)}}</td>
            </tr>
        </table>
    </td>
  </tr>

</table>
<p style="font-size: 10px;font-weight: bold;text-align: center;">Developed By Skill Based IT (http://sbit.com.bd)</p>
</body>

</html>
