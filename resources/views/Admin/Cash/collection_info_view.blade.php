<!DOCTYPE>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Cash Close Collection Expense Report</title>
</head>

<body>

<table class="table" style="width: 100%;margin-bottom: 10px;border:none;">
    <tr>
        <td align="center" colspan="2">
           <img src="{{asset('/public/Admin')}}/assets/img/banner.jpg" style="" id="header_image">
        </td>
    </tr>

    <tr style="text-align: center; font-weight: bold;">
        <td colspan="7" style="text-align: center;">
            <a style="text-decoration:none;color: black;border-bottom:2px dotted #ccc">Cash Close Collection {{$type}} Report
          </a>
        </td>
    </tr>

    <tr  style="width: 100%;margin:auto;">

          <td colspan="6"><span  style=" font-size: 14px; padding-left: 50px;">Date :&nbsp;&nbsp;{{$cash_date}} To {{date('Y-m-d')}} </span></td>




    </tr>

</table>

<!-- <img src="{{URL::to('/')}}/public/imageHeader/background.png"  height="650" style="width: 100%" /> -->

@if($type === 'Sale')
        <table class="table" style="float:left;position: relative;border:1px solid #999;width: 98%;float: left;margin:10px" align="center" cellpadding="0" cellspacing="0">

            <tr style="height: 40px;text-align: center;"><td colspan="9" style="font-weight: bold;border-bottom: 2px solid #999">{{$type}} Info</td></tr>

            <tr style="height: 30px">
              <td style="border-bottom: 1px solid #999;border-right: 1px solid #999;padding-left: 5px;">Customer</td>
              <td style="border-bottom: 1px solid #999;border-right: 1px solid #999;padding-left: 5px;">Invoice Date</td>
              <td style="border-bottom: 1px solid #999;border-right: 1px solid #999;padding-left: 5px;">Invoice No</td>
              <td style="border-bottom: 1px solid #999;border-right: 1px solid #999;padding-left: 5px;font-weight: bold;">Collection Sale</td>
              <td style="border-bottom: 1px solid #999;border-right: 1px solid #999;padding-left: 5px;">Comment</td>
            </tr>
            @php
            $grandtotalpaid=0;
            @endphp
    @foreach($data as $showdata)
    @php
    $grandtotalpaid+=$showdata->payment_amount;
    @endphp
            <tr style="height: 30px">
              <td style="border: 1px solid #999;padding-left: 5px;">{{$showdata->customer_name_en}}({{$showdata->customer_phone}})</td>
              <td style="border: 1px solid #999;padding-left: 5px;">{{$showdata->entry_date}}</td>
              <td style="border: 1px solid #999;padding-left: 5px;">{{$showdata->invoice_no}}</td>
              <td style="border: 1px solid #999;padding-left: 5px;">{{$showdata->payment_amount}}</td>
              <td style="border: 1px solid #999;padding-left: 5px;">{{$showdata->note}}</td>
            </tr>


@endforeach


<tr>
  <td colspan="3" style="font-weight: bold;text-align: right;">Total Collection:&nbsp;</td>
  <td colspan="3" style="border: 1px solid #999;padding-left: 5px;font-weight: bold;">{{number_format($grandtotalpaid,2)}}/-</td>
</tr>

</table>
@elseif($type === 'Return')
        <table class="table" style="float:left;position: relative;border:1px solid #999;width: 98%;float: left;margin:10px" align="center" cellpadding="0" cellspacing="0">

            <tr style="height: 40px;text-align: center;"><td colspan="9" style="font-weight: bold;border-bottom: 2px solid #999">{{$type}} Info</td></tr>

            <tr style="height: 30px">
              <td style="border-bottom: 1px solid #999;border-right: 1px solid #999;padding-left: 5px;">Supplier</td>
              <td style="border-bottom: 1px solid #999;border-right: 1px solid #999;padding-left: 5px;">Return Date</td>
              <td style="border-bottom: 1px solid #999;border-right: 1px solid #999;padding-left: 5px;font-weight: bold;">Product</td>
              <td style="border-bottom: 1px solid #999;border-right: 1px solid #999;padding-left: 5px;font-weight: bold;">Return Amount </td>
            </tr>
            @php
            $grandtotalpaid=0;
            @endphp
    @foreach($data as $showdata)
    @php
    $grandtotalpaid+=$showdata->return_amount;
    @endphp
            <tr style="height: 30px">
              <td style="border: 1px solid #999;padding-left: 5px;">{{$showdata->company_name}}({{$showdata->company_phone}})</td>
              <td style="border: 1px solid #999;padding-left: 5px;">{{$showdata->return_date}}</td>
              <td style="border: 1px solid #999;padding-left: 5px;">{{$showdata->product_name}} ({{$showdata->product_id}})</td>
              <td style="border: 1px solid #999;padding-left: 5px;">{{$showdata->return_amount}}</td>
            </tr>


@endforeach


<tr>
  <td colspan="3" style="font-weight: bold;text-align: right;">Total Return:&nbsp;</td>
  <td colspan="3" style="border: 1px solid #999;padding-left: 5px;font-weight: bold;">{{number_format($grandtotalpaid,2)}}/-</td>
</tr>

</table>

@elseif($type === 'Others')

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
@elseif($type === 'Bank Withdraw')
        <table class="table" style="float:left;position: relative;border:1px solid #999;width: 98%;float: left;margin:10px" align="center" cellpadding="0" cellspacing="0">

            <tr style="height: 40px;text-align: center;"><td colspan="9" style="font-weight: bold;border-bottom: 2px solid #999">{{$type}} Info</td></tr>

            <tr style="height: 30px">
              <td style="border-bottom: 1px solid #999;border-right: 1px solid #999;padding-left: 5px;">ID</td>
              <td style="border-bottom: 1px solid #999;border-right: 1px solid #999;padding-left: 5px;">Date</td>
              <td style="border-bottom: 1px solid #999;border-right: 1px solid #999;padding-left: 5px;">Bank Name</td>
              <td style="border-bottom: 1px solid #999;border-right: 1px solid #999;padding-left: 5px;">Account No.</td>
              <td style="border-bottom: 1px solid #999;border-right: 1px solid #999;padding-left: 5px;">Types</td>
              <td style="border-bottom: 1px solid #999;border-right: 1px solid #999;padding-left: 5px;">Voucher No.</td>
              <td style="border-bottom: 1px solid #999;border-right: 1px solid #999;padding-left: 5px;font-weight: bold;">Withdraw Amount</td>
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
@endif



<br>
<br>

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
