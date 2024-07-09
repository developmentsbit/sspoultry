<?php
error_reporting(0);
include('connection.php');
$db=new database();
date_default_timezone_set("Asia/Dhaka");

$customer_id=$_GET['customer_id'];

$selectCustomer=$db->link->query("SELECT * FROM `customer_info` WHERE `customer_id`='$customer_id'");
//echo "SELECT * FROM `customer_info` WHERE `customer_id`='$customer_id'";

if($selectCustomer)
{
  $fetch_cus_info=$selectCustomer->fetch_array();
}

function dateformate($x)
{
  $d=explode('-', $x);
  return $d[2].'-'.$d[1].'-'.$d[0];
}

$from_date=$_GET['from_date'];
$to_date=$_GET['to_date'];

$d = new DateTime($from_date);
$d->sub(new DateInterval('P1D'));
$previousDate=$d->format('Y-m-d'); 



?>

<!DOCTYPE html>
<html>
<head>
  <title>Balance sheet</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

 

  <div class="invoice border mt-4">
      <!-- <center>
    <img src="https://alaminagro.com/public/setting/040622_08_45_59.png" class="img-fluid" style="width:100px;height: 100px;"><br>
    <strong>Al Amin Fids</strong><br>
    Main Road, Dak Bangla Road, Boktarmunshi, Sonagazi, Feni<br>
    01837879722<br>
  </center> -->
  <img src="banner.jpg" id="header_image">

    <table class="table table-bordered mt-4">

       <tr>
         <td colspan="2" style="text-align:center;font-size: 16px;font-weight: bold;text-transform: uppercase;">
          Customer Balance  Sheet 
        </td>
       </tr>

       <tr>
         <td  style="text-align:left; border: 0">

          Customer Name : <?php print $fetch_cus_info['customer_name_en']?><br>
         Phone : <?php print $fetch_cus_info['customer_phone']?><br>
          Customer Address : <?php print $fetch_cus_info['customer_address']?><br>
         
                      </td>
          <td style="text-align:right" >Print Date & time : <?php print date("d-m-Y h:i:sa"); ?>
          <br>
            
            Report Duration: <?php echo $from_date?> To <?php echo $to_date?>



          </td>
       </tr>


</table>
<table width="100%" cellpadding="0" cellspacing="0">
      <!-- <thead> -->
       <tr>
                   <th style="border-top:1px #000 solid;border-left:1px #000 solid; border-right:1px #000 solid; max-width: 80px; ">SL.</th>
                    <th style="border-top:1px #000 solid; border-right:1px #000 solid;max-width: 100px;  ">Order Date</th>
                    <th style="text-align:center; border-top:1px #000 solid; border-right:1px #000 solid;max-width: 150px;  ">Sales/Sales <br>Return Invoice No.</th>

                    <th style="text-align:center; border-top:1px #000 solid; border-right:1px #000 solid; ">Invoice Details</th>


                 
                       <th style="text-align:right; padding-right:5px;border-top:1px #000 solid; border-right:1px #000 solid; max-width: 80px; ">Sales Return Amount</th>
                    <th style="text-align:right; padding-right:5px;border-top:1px #000 solid; border-right:1px #000 solid; max-width: 100px; ">Discount</th>
                    <th style="text-align:right; padding-right:5px;border-top:1px #000 solid; border-right:1px #000 solid; max-width: 100px; ">Debit</th>
                    <th style="text-align:right; padding-right:5px;border-top:1px #000 solid; border-right:1px #000 solid; max-width: 100px; ">Credit</th>
                 
                    <th style="text-align:right; padding-right:5px;border-top:1px #000 solid; border-right:1px #000 solid;max-width: 100px;  ">Balance</th>
                   
       </tr>
     <!-- </thead> -->
<?php
$previoussalesamount=0;

$previoussales=$db->link->query("SELECT SUM(`total`) FROM `sales_ledger`  WHERE `customer_id`='$customer_id' AND `invoice_date` BETWEEN '2022-01-01' AND '$previousDate' ");


if($previoussales)
{
  $fetchsales=$previoussales->fetch_array();
  $previoussalesamount=$previoussalesamount+$fetchsales[0];
}

$previousduesum=$db->link->query("SELECT SUM(`previous_due`) FROM `sales_payment`  WHERE `customer_id`='$customer_id'");

if($previousduesum)
{
  $previousdue=$previousduesum->fetch_array();
  $previoussalesamount=$previoussalesamount+$previousdue[0];
}




$previousPurchasesales=$db->link->query("SELECT SUM(`total`) FROM `purchase_ledger`  WHERE `suplier_id`='$customer_id' AND `invoice_date` BETWEEN '2022-01-01' AND '$previousDate'");


if($previousPurchasesales)
{
  $fetchpurchasesales=$previousPurchasesales->fetch_array();
  $previoussalesamount=$previoussalesamount+$fetchpurchasesales[0];
}
 

$previousPayment=$db->link->query("SELECT SUM(`payment_amount`) AS 'payment', SUM(`return_amount`) AS 'return', SUM(`discount`) AS 'discount' FROM `sales_payment`  WHERE `customer_id`='$customer_id' AND `entry_date` BETWEEN '2022-01-01' AND '$previousDate' ");

if($previousPayment)
{

  $fetchpayment=$previousPayment->fetch_array();

  $previoussalesamount=round(($previoussalesamount)-($fetchpayment['payment']+$fetchpayment['discount']+$fetchpayment['return']),2);
}




?>
    <tr>
      <td style="height: 10px; border: 1px #000 dotted;">1</td>
      <td style="height: 10px; border: 1px #000 dotted; text-align: center;"><?php echo dateformate($previousDate);?></td>
      <td style="height: 10px; border: 1px #000 dotted;">Opening Balance</td>
      <td style="height: 10px; border: 1px #000 dotted;" colspan="5"></td>
      <td style="height: 10px; border: 1px #000 dotted;"  align="right">
     <?php  print intval($previoussalesamount);?>
   &nbsp;&nbsp;&nbsp;</td>
    </tr>

  
<?php

$totalPreviousBalance=$previoussalesamount;
$totalReturn=0;
$totaldiscount=0;
$totalDebit=0;
$totalCredit=0;
$totalBalance=0;



$balance=$previoussalesamount;
$i=1;
$customerStatement=$db->link->query("SELECT * FROM `sales_payment` WHERE  `customer_id`='$customer_id' AND `entry_date` BETWEEN '$from_date' AND '$to_date'");


while($fetch_data=$customerStatement->fetch_array())
{
  $i++;
$totalsalesamount=0;

$selectsalesamount=$db->link->query("SELECT `total` as 'Total',`final_discount` FROM `sales_ledger`  WHERE `customer_id`='$customer_id' AND  `invoice_no`='$fetch_data[1]'");

if($selectsalesamount)
{
  $salesamount=$selectsalesamount->fetch_array();
  $totalsalesamount=round($salesamount['Total']-$salesamount['final_discount'],2);

}

$previousPurchasesalesAmount=$db->link->query("SELECT `total` as 'Total',`discount`  FROM `purchase_ledger`  WHERE `suplier_id`='$customer_id' AND `invoice_no`='$fetch_data[1]'");



if($previousPurchasesalesAmount->num_rows>0)
{
  @$fetchpurchasesalesAmount=$previousPurchasesalesAmount->fetch_array();

  $totalsalesamount=round($totalsalesamount+$fetchpurchasesalesAmount[0]-$fetchpurchasesalesAmount[1],2);
}






 
 $balance=round(($balance+$totalsalesamount)-($fetch_data['discount']+$fetch_data['payment_amount']+$fetch_data['return_amount']),2);


$totalPreviousBalance=$totalPreviousBalance;
$totalReturn=$totalReturn+$fetch_data['return_amount'];
$totaldiscount=$totaldiscount+$fetch_data['discount'];
$totalDebit=$totalDebit+$totalsalesamount;
$totalCredit=$totalCredit+$fetch_data['payment_amount'];



?>

                  <tr>
                    <td  style="height: 10px; border: 1px #000 dotted;">
                      <?php print $i;?></td>
                    <td style="text-align: center;height: 10px; border: 1px #000 dotted;">
                      <?php print dateformate($fetch_data['entry_date'])?> &nbsp;
                        
                      </td>
                    <td style="height: 10px; border: 1px #000 dotted;">
                      <?php print $fetch_data['invoice_no']?>
                        &nbsp;
                      </td>
 <td style="height: 10px; border: 1px #000 dotted;">
                 <?php
                   
$selectInvoice=$db->link->query("SELECT `pdt_productinfo`.`pdt_name_en`,`sales_entry`.`product_quantity`,`sales_entry`.`product_sales_price` FROM `sales_entry` INNER JOIN `pdt_productinfo` ON `pdt_productinfo`.`pdt_id`=`sales_entry`.`product_id` WHERE `invoice_no`='$fetch_data[invoice_no]'");
if($selectInvoice->num_rows>0)
{



?>     
<table width="100%"   cellpadding="0" cellspacing="0" >
  <tr>
      <td style="border-bottom: 1px #000 dotted; border-right: 1px #000 dotted;">Product</td>
      <td style="border-bottom: 1px #000 dotted; border-right: 1px #000 dotted;text-align: center;">Quantity</td>
      <td style="border-bottom: 1px #000 dotted; border-right: 1px #000 dotted;text-align: right;">Price</td>
      <td style="border-bottom: 1px #000 dotted; text-align: right;">Total</td>
  </tr>  
  <?php


$pptotal=0;
while($fetch_product=$selectInvoice->fetch_array())
{


  $pptotal=$pptotal+$fetch_product[1]*$fetch_product[2];
  ?>

  <tr>
      <td style="border-bottom: 1px #000 dotted; border-right: 1px #000 dotted;"><?php print $fetch_product[0]?></td>
      <td style="border-bottom: 1px #000 dotted; border-right: 1px #000 dotted; width: 60px;text-align: right;"><?php print $fetch_product[1]?></td>
      <td style="border-bottom: 1px #000 dotted; border-right: 1px #000 dotted; width: 60px;text-align: right;"><?php print $fetch_product[2]?></td>
      <td style="border-bottom: 1px #000 dotted; width: 70px; text-align: right; "><?php print $fetch_product[1]*$fetch_product[2]?></td>
      
  </tr>



  <?php
}
?>
<tr>
  <td colspan="3" align="right" style="border-right: 1px #000 dotted;"><b> Total:</b></td>
  <td align="right"><b><?php print $pptotal;?></b></td>
  </tr>
  <tr>
  <td colspan="3" align="right" style="border-right: 1px #000 dotted;"><b> Discount:</b></td>
  <td align="right"><b><?php print $salesamount['final_discount'];?></b></td>
  </tr>
</table>
<?php
}

if($fetch_data['note']!="firstpayment")
{

  print $fetch_data['note'];
}


?>
                       
</td>



                  

                       <td style="text-align: right; height: 10px; border: 1px #000 dotted;"><?php if( $fetch_data['return_amount']>0) print $fetch_data['return_amount']?>&nbsp;</td>
                    <td style="text-align: right; height: 10px; border: 1px #000 dotted;"><?php if($fetch_data['discount']>0) print $fetch_data['discount']?>&nbsp;</td>

                    <td style="text-align: right; height: 10px; border: 1px #000 dotted;">

                      <?php if($totalsalesamount>0)
                      print $totalsalesamount?>&nbsp;
                        

                      </td>
                    <td style="text-align: right; height: 10px; border: 1px #000 dotted;"><?php if($fetch_data['payment_amount']>0)print $fetch_data['payment_amount']?>&nbsp;</td>
                   
                 
                    <td style="height: 10px; border: 1px #000 dotted; text-align: right;">
                      <?php print $balance;?>&nbsp;&nbsp;&nbsp;

                    </td>
                   

                                          
                  </tr>

  <?php
}
?>

                                    

      


  
       <tr>
        <th colspan="3" style="text-align: right; border-right: 1px solid #000;border-bottom: 1px solid #000;border-left: 1px solid #000; ">Total : </th>
        <th  style="text-align: right; border-right: 1px solid #000;border-bottom: 1px solid #000; "><?php print $totalPreviousBalance; ?>/-</th>
        <th  style="text-align: right; border-right: 1px solid #000;border-bottom: 1px solid #000; "><?php print $totalReturn; ?>/-</th>
        <th  style="text-align: right; border-right: 1px solid #000;border-bottom: 1px solid #000; "><?php print $totaldiscount; ?>/-</th>
        <th  style="text-align: right; border-right: 1px solid #000;border-bottom: 1px solid #000; "><?php print $totalDebit; ?>/-</th>
        <th  style="text-align: right; border-right: 1px solid #000;border-bottom: 1px solid #000; "><?php print $totalCredit; ?>/-</th>
        <th  style="text-align: right; border-right: 1px solid #000;border-bottom: 1px solid #000; "><?php print  round($balance,2); ?>/-&nbsp;&nbsp;</th>
      

       </tr>

 </table>


<br><br>

<div class="row" style="margin-top:50px;">
    <div class="col-3">
        &nbsp;&nbsp;&nbsp;&nbsp;<br>
        --------------------<br>
        Customer's Signature
    </div>
    <div class="col-3" style="text-align:center">
          &nbsp;&nbsp;&nbsp;&nbsp;<br>
        --------------------<br>
        Prepared By
    </div>
    <div class="col-3" style="text-align:center">
        &nbsp;&nbsp;&nbsp;&nbsp;<br>
        --------------------<br>
        Accountant's Signature
    </div>
    <div class="col-3" style="text-align:right;">
        &nbsp;&nbsp;&nbsp;&nbsp;<br>
        --------------------<br>
        Authorized  Signature
    </div>
</div>
<br><br>

 <center><a href="#" class="btn btn-info btn-sm print w-10" onclick="window.print();">Print</a></center>




</div>

<center><a style="font-size: 12px;">Software Developed by SBIT. For query: 01840241895</a></center>



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


  @media  print
  {

    .table-bordered tr{
      border: 1px solid black !important;
    }

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


</body>
</html>