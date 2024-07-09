<!DOCTYPE>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Cash Close Expense Report</title>
</head>

<body>

<table class="table" style="width: 100%;margin-bottom: 10px;border:none;">
    <tr>
       <img src="{{asset('/Admin')}}/assets/img/banner.jpg" style="" id="header_image">
    </tr>

    <tr style="text-align: center; font-weight: bold;">
        <td colspan="6" style="text-align: center;">
            <a style="text-decoration:none;color: black;border-bottom:2px dotted #ccc">Cash Close Expense {{$type}} Report
          </a>
        </td>
    </tr>

    <tr  style="width: 100%;margin:auto;">

          <td colspan="7"><span  style=" font-size: 14px; ">Date :&nbsp;&nbsp;{{$cash_date}} To {{date('Y-m-d')}} </span></td>




    </tr>

</table>



@if($type === 'Purchase')
        <table class="table" style="float:left;position: relative;border:1px solid #999;width: 98%;float: left;margin:10px" align="center" cellpadding="0" cellspacing="0">

            <tr style="height: 40px;text-align: center;"><td colspan="7" style="font-weight: bold;border-bottom: 2px solid #999">{{$type}} Info</td></tr>

            <tr style="height: 30px">

              <td style="border-bottom: 1px solid #999;border-right: 1px solid #999;padding-left: 5px;">SL</td>
              <td style="border-bottom: 1px solid #999;border-right: 1px solid #999;padding-left: 5px;">Entry Date</td>
              <td style="border-bottom: 1px solid #999;border-right: 1px solid #999;padding-left: 5px;">Supplier Name</td>
              <td style="border-bottom: 1px solid #999;border-right: 1px solid #999;padding-left: 5px;font-weight: bold;">Total Paid</td>
            </tr>
            @php
            $grandtotalpaid=0;
            $sl=0;
            @endphp
    @foreach($data as $showdata)
    @php

    $grandtotalpaid+=$showdata->payment;
    @endphp
            <tr style="height: 30px">
              <td style="border: 1px solid #999;padding-left: 5px;">{{$sl++}}</td>
                <td style="border: 1px solid #999;padding-left: 5px;">{{$showdata->entry_date}}</td>
              <td style="border: 1px solid #999;padding-left: 5px;">{{$showdata->company_name}}</td>

              <td style="border: 1px solid #999;padding-left: 5px;">{{$showdata->payment}}</td>

            </tr>


@endforeach

<tr>
  <td colspan="3" style="font-weight: bold;text-align: right;">Total Purchase:&nbsp;</td>
  <td colspan="2" style="border: 1px solid #999;padding-left: 5px;font-weight: bold;">{{number_format($grandtotalpaid,2)}}/-</td>
</tr>




</table>
@elseif($type === 'Return')
        <table class="table" style="float:left;position: relative;border:1px solid #999;width: 98%;float: left;margin:10px" align="center" cellpadding="0" cellspacing="0">

            <tr style="height: 40px;text-align: center;"><td colspan="7" style="font-weight: bold;border-bottom: 2px solid #999">{{$type}} Info</td></tr>

            <tr style="height: 30px">

              <td style="border-bottom: 1px solid #999;border-right: 1px solid #999;padding-left: 5px;">SL</td>
              <td style="border-bottom: 1px solid #999;border-right: 1px solid #999;padding-left: 5px;">Return Date</td>
              <td style="border-bottom: 1px solid #999;border-right: 1px solid #999;padding-left: 5px;">Customer Name</td>
              <td style="border-bottom: 1px solid #999;border-right: 1px solid #999;padding-left: 5px;">Product Name</td>
              <td style="border-bottom: 1px solid #999;border-right: 1px solid #999;padding-left: 5px;font-weight: bold;">Return Amount</td>
            </tr>
            @php
            $grandtotalpaid=0;
            $sl=0;
            @endphp
    @foreach($data as $showdata)
    @php

    $grandtotalpaid+=$showdata->return_amount;
    @endphp
            <tr style="height: 30px">
              <td style="border: 1px solid #999;padding-left: 5px;">{{$sl++}}</td>
                <td style="border: 1px solid #999;padding-left: 5px;">{{$showdata->return_date}}</td>
              <td style="border: 1px solid #999;padding-left: 5px;">{{$showdata->customer_name}} ({{$showdata->customer_phone}})</td>
              <td style="border: 1px solid #999;padding-left: 5px;">{{$showdata->product_name}} ({{$showdata->product_id}})</td>

              <td style="border: 1px solid #999;padding-left: 5px;">{{$showdata->return_amount}}</td>

            </tr>


@endforeach

<tr>
  <td colspan="4" style="font-weight: bold;text-align: right;">Total Return:&nbsp;</td>
  <td colspan="2" style="border: 1px solid #999;padding-left: 5px;font-weight: bold;">{{number_format($grandtotalpaid,2)}}/-</td>
</tr>




</table>

@elseif($type === 'Salary')
        <table class="table" style="float:left;position: relative;border:1px solid #999;width: 98%;float: left;margin:10px" align="center" cellpadding="0" cellspacing="0">

            <tr style="height: 40px;text-align: center;"><td colspan="7" style="font-weight: bold;border-bottom: 2px solid #999">{{$type}} Info</td></tr>

            <tr style="height: 30px">
              <td style="border-bottom: 1px solid #999;border-right: 1px solid #999;padding-left: 5px;">ID</td>
              <td style="border-bottom: 1px solid #999;border-right: 1px solid #999;padding-left: 5px;">Date</td>
              <td style="border-bottom: 1px solid #999;border-right: 1px solid #999;padding-left: 5px;">Employee Name</td>
              <td style="border-bottom: 1px solid #999;border-right: 1px solid #999;padding-left: 5px;">Month</td>
              <td style="border-bottom: 1px solid #999;border-right: 1px solid #999;padding-left: 5px;font-weight: bold;">Year</td>
              <td style="border-bottom: 1px solid #999;border-right: 1px solid #999;padding-left: 5px;">Total Paid</td>
            </tr>
            @php
            $grandtotalincome=0;
            @endphp
    @foreach($data as $showdata)
    @php
    $grandtotalincome+=$showdata->paid_ammount;
    @endphp
            <tr style="height: 30px">
              <td style="border: 1px solid #999;padding-left: 5px;">{{$showdata->id}}</td>
              <td style="border: 1px solid #999;padding-left: 5px;">{{$showdata->date}}</td>
              <td style="border: 1px solid #999;padding-left: 5px;">{{$showdata->Name}}</td>
              <td style="border: 1px solid #999;padding-left: 5px;">
    @if($showdata->month ==='01')
                        (January)                 @endif
                        @if($showdata->month ==='02')
                        (February)                  @endif
                        @if($showdata->month ==='03')
                        (March)



                        @endif

                        @if($showdata->month ==='04')
                        (April)                @endif
                        @if($showdata->month ==='05')
                        (May)
                        @endif
                        @if($showdata->month ==='06')
                        (June)                @endif
                        @if($showdata->month ==='07')
                        (July)
                        @endif
                        @if($showdata->month ==='08')
                        (August)                @endif
                        @if($showdata->month ==='09')
                        (September)                @endif
                        @if($showdata->month ==='10')
                        (October)
                        @endif
                        @if($showdata->month ==='11')
                        (November)                @endif

                        @if($showdata->month ==='12')
                        (December)                @endif
              </td>
              <td style="border: 1px solid #999;padding-left: 5px;">{{$showdata->year}}</td>
              <td style="border: 1px solid #999;padding-left: 5px;">{{$showdata->paid_ammount}}</td>
            </tr>


@endforeach

<tr>
  <td colspan="5" style="font-weight: bold;text-align: right;">Total Paid:&nbsp;</td>
  <td colspan="1" style="border: 1px solid #999;padding-left: 5px;font-weight: bold;">{{number_format($grandtotalincome,2)}}/-</td>
</tr>




</table>
@elseif($type === 'Bank Deposit')

<table class="table" style="float:left;position: relative;border:1px solid #999;width: 98%;float: left;margin:10px" align="center" cellpadding="0" cellspacing="0">

            <tr style="height: 40px;text-align: center;"><td colspan="9" style="font-weight: bold;border-bottom: 2px solid #999">{{$type}} Info</td></tr>

            <tr style="height: 30px">
              <td style="border-bottom: 1px solid #999;border-right: 1px solid #999;padding-left: 5px;">ID</td>
              <td style="border-bottom: 1px solid #999;border-right: 1px solid #999;padding-left: 5px;">Date</td>
              <td style="border-bottom: 1px solid #999;border-right: 1px solid #999;padding-left: 5px;">Bank Name</td>
              <td style="border-bottom: 1px solid #999;border-right: 1px solid #999;padding-left: 5px;">Account No.</td>
              <td style="border-bottom: 1px solid #999;border-right: 1px solid #999;padding-left: 5px;">Types</td>
              <td style="border-bottom: 1px solid #999;border-right: 1px solid #999;padding-left: 5px;">Voucher No.</td>
              <td style="border-bottom: 1px solid #999;border-right: 1px solid #999;padding-left: 5px;font-weight: bold;">Deposit Amount</td>
              <td style="border-bottom: 1px solid #999;border-right: 1px solid #999;padding-left: 5px;">Comment</td>
            </tr>
            @php
            $grandtotalincome=0;
            $grandtotalpaid=0;
            @endphp
    @foreach($data as $showdata)
    @php
    $grandtotalincome+=$showdata->ammount;
    @endphp
            <tr style="height: 30px">
              <td style="border: 1px solid #999;padding-left: 5px;">{{$showdata->id}}</td>
              <td style="border: 1px solid #999;padding-left: 5px;">{{$showdata->date}}</td>
              <td style="border: 1px solid #999;padding-left: 5px;">{{$showdata->bank_name}}</td>
              <td style="border: 1px solid #999;padding-left: 5px;">{{$showdata->ac_no}}</td>
              <td style="border: 1px solid #999;padding-left: 5px;">{{$showdata->transaction_type}}</td>
              <td style="border: 1px solid #999;padding-left: 5px;">{{$showdata->voucherNo}}</td>
              <td style="border: 1px solid #999;padding-left: 5px;">{{$showdata->ammount}}</td>
              <td style="border: 1px solid #999;padding-left: 5px;">{{$showdata->naration}}</td>
            </tr>


@endforeach


<tr>
  <td colspan="6" style="font-weight: bold;text-align: right;">Total Sales:&nbsp;</td>
  <td colspan="2" style="border: 1px solid #999;padding-left: 5px;font-weight: bold;">{{number_format($grandtotalincome,2)}}/-</td>
</tr>

</table>
@elseif($type === 'Others Expense')
       <table class="table" style="float:left;position: relative;border:1px solid #999;width: 98%;float: left;margin:10px" align="center" cellpadding="0" cellspacing="0">

            <tr style="height: 40px;text-align: center;"><td colspan="4" style="font-weight: bold;border-bottom: 2px solid #999">{{$type}} Info</td></tr>

            <tr style="height: 30px">
              <td style="border-bottom: 1px solid #999;border-right: 1px solid #999;padding-left: 5px;">Date</td>
              <td style="border-bottom: 1px solid #999;border-right: 1px solid #999;padding-left: 5px;">Title</td>
              <td style="border-bottom: 1px solid #999;border-right: 1px solid #999;padding-left: 5px;">Total ammount</td>
              <td style="border-bottom: 1px solid #999;border-right: 1px solid #999;padding-left: 5px;">Comment</td>
            </tr>
            @php
            $grandtotalincome=0;
            $grandtotalpaid=0;
            @endphp
    @foreach($data as $showdata)
    @php
    $grandtotalincome+=$showdata->ammount;
    @endphp
            <tr style="height: 30px">
              <td style="border: 1px solid #999;padding-left: 5px;">{{$showdata->date}}</td>
              <td style="border: 1px solid #999;padding-left: 5px;">{{$showdata->title}}</td>
              <td style="border: 1px solid #999;padding-left: 5px;">{{$showdata->ammount}}</td>
              <td style="border: 1px solid #999;padding-left: 5px;">{{$showdata->comments}}</td>
            </tr>


@endforeach


<tr>
  <td colspan="2" style="font-weight: bold;text-align: right;">Total Sales:&nbsp;</td>
  <td colspan="2" style="border: 1px solid #999;padding-left: 5px;font-weight: bold;">{{number_format($grandtotalincome,2)}}/-</td>
</tr>

</table>
@endif
 <center><a style="font-size: 12px;">Software Developed by SBIT. For query: 01840241895</a></center>
<br>
<br>
<center><a href="#" class="btn btn-info btn-sm print w-10" onclick="window.print();">Print</a></center>

</body>

</html>
<style type="text/css">
#header_image
  {
    width:100%;height:180px;
  }
  @media print
  {
   .print{
    display: none;
    background: green;
    color: white;
    padding: 20px;
     }
  }

  .print{
    background: green;
    color: white;
    padding: 10px;
    margin: 10px;
    text-decoration: none;
    border-radius: 10px;
     }
</style>
