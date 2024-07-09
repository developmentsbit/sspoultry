<!DOCTYPE>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Cash Close Report</title>
</head>
<style>
    #header_image
  {
    width:100%;height:180px;
  }
</style>
<body>

<table class="table" style="width: 100%;margin-bottom: 10px;border:none;">
    <tr>
        <img src="{{asset('/Admin')}}/assets/img/banner.jpg" id="header_image">
    </tr>

    <tr style="text-align: center; font-weight: bold;">
        <td colspan="2" style="text-align: center;">
            <a style="text-decoration:none;color: black;border-bottom:2px dotted #ccc">Cash Close Report</a>
        </td>
    </tr>

     <tr style="text-align: center;width: 95%;margin:auto;">
        <td align='center'>
          <a style="text-decoration: none;font-size: 14px; margin:auto;color: black;padding-left: 50px">
            Date : {{$cash_date}}
          </a>
        </td>
        <td>
          <a style="text-decoration: none;font-size: 14px; margin:auto;color: black">
            Branch Name :  {{$branch->name}}
          </a>
        </td>
    </tr>

</table>

<img src="{{URL::to('/')}}/public/imageHeader/background.png"  height="650" style="width: 100%" />

<table class="table"  align="center" cellpadding="0" cellspacing="0" style='width: 100%;border:1px solid #999; margin-top:-650px; float:left;position: relative;'>

  <tr style="text-align: center; font-size: 14px">
    <td style="width: 50%">
        <table class="table" style="float:left;position: relative;border:1px solid #999;width: 90%;float: left;margin:10px" align="center" cellpadding="0" cellspacing="0">
            <tr style="height: 40px;text-align: center;"><td colspan="2" style="font-weight: bold;border-bottom: 2px solid #999">Collection Info</td></tr>

            <tr style="height: 30px">
              <td style="border-bottom: 1px solid #999;border-right: 1px solid #999;padding-left: 5px;">Previous Cash</td>
              <td style="border-bottom: 1px solid #999;padding-left: 5px;">{{$cash}}</td>
             </tr>
            <tr style="height: 30px">
              <td style="border-bottom: 1px solid #999;border-right: 1px solid #999;padding-left: 5px;">Sales</td>
              <td style="border-bottom: 1px solid #999;padding-left: 5px;">{{$sale}}</td>
            </tr>
            <tr style="height: 30px">
              <td style="border-bottom: 1px solid #999;border-right: 1px solid #999;padding-left: 5px;">Others</td>
              <td style="border-bottom: 1px solid #999;padding-left: 5px;">{{$others}}</td>
            </tr>
            <tr style="height: 30px">
              <td style="border-bottom: 1px solid #999;border-right: 1px solid #999;padding-left: 5px;">Bank Withdraw</td>
              <td style="border-bottom: 1px solid #999;padding-left: 5px;">{{$bank_withdraw}}</td>
            </tr>
            <tr style="height: 30px">
              <td style="border-bottom: 1px solid #999;;border-right: 1px solid #999;font-weight: bold;;padding-left: 5px;">Total Collection</td>
              <td style="border-bottom: 1px solid #999;font-weight: bold;;padding-left: 5px;">{{$cash+$sale+$others+$bank_withdraw}}</td>
            </tr>
        </table>
    </td>
    <td style="width: 50%">
      <table class="table" style="float:left;position: relative;border:1px solid #999;width: 90%;float: right;margin:10px" align="center" cellpadding="0" cellspacing="0">
           <tr style="height: 40px;text-align:center"><td colspan="2"  style="font-weight: bold;border-bottom: 2px solid #999">Expense Info</td></tr>

            <tr style="height: 30px">
              <td style="border-bottom: 1px solid #999;border-right: 1px solid #999;padding-left: 5px;">Purchases</td>
              <td style="border-bottom: 1px solid #999;padding-left: 5px;">{{$purchase}}</td>
            </tr>
            <tr style="height: 30px">
              <td style="border-bottom: 1px solid #999;border-right: 1px solid #999;padding-left: 5px;">Salary</td>
              <td style="border-bottom: 1px solid #999;padding-left: 5px;">{{$salary}}</td>
            </tr>
            <tr style="height: 30px">
              <td style="border-bottom: 1px solid #999;border-right: 1px solid #999;padding-left: 5px;">Expenses</td>
              <td style="border-bottom: 1px solid #999;padding-left: 5px;">{{$expense}}</td>
            </tr>
            <tr style="height: 30px">
              <td style="border-bottom: 1px solid #999;border-right: 1px solid #999;padding-left: 5px;">Bank Deposit</td>
              <td style="border-bottom: 1px solid #999;padding-left: 5px;">{{$bank_deposit}}</td>
            </tr>
            <tr style="height: 30px">
              <td  style="border-bottom: 1px solid #999;border-right: 1px solid #999;font-weight: bold;padding-left: 5px;">Total Expense</td>
              <td  style="border-bottom: 1px solid #999;font-weight: bold;padding-left: 5px;">{{$purchase+$salary+$expense+$bank_deposit}}</td>
            </tr>
        </table>
    </td>
  </tr>
<tr>
  <td colspan="2">
      <table class="table" style="width: 30%;float: right;position: relative;border:1px solid #999;margin: 10px" align="center" cellpadding="0" cellspacing="0">
           <tr style="height: 40px;text-align:center"><td colspan="2" style="font-weight: bold;border-bottom: 2px solid #999">Cash Calculation</td></tr>
            <tr style="height: 30px">
              <td style="border-bottom: 1px solid #999;border-right: 1px solid #999;padding-left: 5px;">Total Collection</td>
              <td style="border-bottom: 1px solid #999;padding-left: 5px;">{{$cash+$sale+$others+$bank_withdraw}}</td>
            </tr>
            <tr style="height: 30px">
              <td style="border-bottom: 1px solid #999;border-right: 1px solid #999;padding-left: 5px;">Total Expense</td>
              <td style="border-bottom: 1px solid #999;padding-left: 5px;">{{$purchase+$salary+$expense+$bank_deposit}}</td>
            </tr>
            <tr style="height: 30px">
              <td style="border-bottom: 1px solid #999;border-right: 1px solid #999;font-weight: bold;padding-left: 5px;">Current Cash</td>
              <td style="border-bottom: 1px solid #999;font-weight: bold;padding-left: 5px;">{!! ($cash+$sale+$others+$bank_withdraw)-($purchase+$salary+$expense+$bank_deposit) !!}</td>
            </tr>
        </table>
    </td>
  </tr>

</table>
<p style="font-size: 10px;font-weight: bold;text-align: center;">Developed By Skill Based IT (http://sbit.com.bd)</p>
</body>

</html>
