<?php

include('connection.php');
$db=new database();

//print $_POST['fromDate'];
function dateformate($x)
{
  $d=explode('-', $x);
  return $d[2].'-'.$d[1].'-'.$d[0];
}

$CashCloseDate=$_GET['CashCloseDate'];

$fromDate=dateformate($_GET['fromDate']);
$toDate=dateformate($_GET['toDate']);

date_default_timezone_set("Asia/Dhaka");
//$actual_link = 'http://'.$_SERVER['HTTP_HOST'].$_SERVER['PHP_SELF'];
//echo $actual_link;

$netTotalCollection=0;
$netTotalExpense=0;
?>

<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Daily Cash Book</title>
    
    <style type="text/css">
      *{
        padding: 0px; margin: 0px;
        margin: auto;
      }
      @media print{
        .print{
          display: none;
        }
      }
    </style>
  </head>
  <body>
  <form method="post"> 
  <div class="col-12 " >
      <table width="100%"  cellspacing="0" cellspacing="0" align="center" style="padding: 10px;" >
            <tr>
                    <td colspan="5" align="center" style="max-height: 150px;" >
                   <center> <img src="banner.jpg" id="header_image" style="max-height: 150px;"> </center>   
                  </td>
            </tr>           
            <tr>
                    <td colspan="5" align="center" >
                     <h3 style="background: #999; color: #fff; font-size: 24px; font-weight: bold;"> 
                    Daily Cash Report</h3>
                    </td>
            </tr>    
            <tr>
                    <td colspan="5" align="left" height="30" ><p style="padding: 5px;">
                      <span > Report Duration : <?php print dateformate($fromDate); ?> To <?php print dateformate($toDate); ?> </span><br>
                      <span > Print Date & Time:    <?php echo date("d-m-Y h:i:sa")?></span></p>
                      <hr>
                      <br>
                  </td>
            </tr>    
            <tr>
                <td colspan="2" align="center" style="border-left:1px #000 solid;border-top:1px #000 solid; border-right:1px #000 solid; border-bottom:1px #000 solid; padding: 3px; font-size: 18px;" width="46%"> <b> Debit</b></td>
                <td  width="4%"></td>
                <td colspan="2" align="center"  style="border-left:1px #000 solid;border-top:1px #000 solid; border-right:1px #000 solid;border-bottom:1px #000 solid;  padding: 3px;font-size: 18px;" width="46%"> <b> Credit</b></td>
            </tr>


     

<tr>
<!--   ..........................................Debit..................................... -->
       <td colspan="2" style="border-left:1px #000 solid; border-bottom:1px #000 solid; font-size: 18px; width: 30%;border-right:1px #000 solid; " valign="top" >

          <table cellspacing="0" cellspacing="0" width="100%" align="center">
            
      <tr>
                <td style=" border-bottom:1px #000 solid;  font-size: 16px; width: 90%; padding: 3px;" >Title</td>


                <td style="border-left:1px #000 solid;  border-bottom:1px #000 solid; padding: 3px; font-size: 16px;width: 10%;text-align: right;" >Amount</td>
                
        </tr>        


      <tr>
                <td style=" border-bottom:1px #000 solid;  font-size: 16px; width: 90%;" >Opening Balance (<?php echo dateformate($CashCloseDate);?>)</td>


                <td style="border-left:1px #000 solid;  border-bottom:1px #000 solid;  font-size: 16px;width: 10%;text-align: right;" >
                  <br>
                    <?php 
$selectOpeningBalance=$db->link->query("SELECT * FROM `cash_close` WHERE `cash_date`='$CashCloseDate'");
if($selectOpeningBalance)
{
    $fetchOpeningBalance=$selectOpeningBalance->fetch_array();
    echo $fetchOpeningBalance['cash'];
    $netTotalCollection+=$fetchOpeningBalance['cash'];
}
                    ?> &nbsp;

                </td>
                
        </tr>


     <tr>
                <td style="  font-size: 15px; width: 80%;" >
                  

<table width="100%" cellpadding="0" cellspacing="0" align="center" style="font-size: 15px;">
  <tr>
      <td colspan="7" align="left"style="border-left: 1px #000 dotted; border-bottom: 1px #000 dotted ; font-size: 16px; " > Sales Info</td>
  </tr>
  <tr>
        <td style="border-bottom: 1px #000 dotted">SL</td>
        <td style="border-left: 1px #000 dotted; border-bottom: 1px #000 dotted ; ">Date</td>
        <td style="border-left: 1px #000 dotted; border-bottom: 1px #000 dotted ; ">Customer Name</td>
        <td style="border-left: 1px #000 dotted; border-bottom: 1px #000 dotted ; ">Invoice No</td>
        <td style="border-left: 1px #000 dotted; border-bottom: 1px #000 dotted ;  text-align: right;">Total</td>
        <td style="border-left: 1px #000 dotted; border-bottom: 1px #000 dotted ; text-align: right; ">Paid</td>
        <td style="border-left: 1px #000 dotted; border-bottom: 1px #000 dotted ; text-align: right; ">Due</td>
  </tr>
  
  <?php
  $totalAmount=0;
  $totalPaid=0;
  $i=1;
    $selectSales=$db->link->query("SELECT `sales_ledger`.`invoice_no`,`sales_ledger`.`invoice_date`,`sales_ledger`.`total`,`sales_ledger`.`final_discount`,`sales_payment`.`payment_amount`,`customer_info`.`customer_name_en` FROM `sales_ledger`
INNER JOIN `sales_payment` ON `sales_payment`.`invoice_no`=`sales_ledger`.`invoice_no`
INNER JOIN `customer_info` ON `customer_info`.`customer_id`=`sales_ledger`.`customer_id`
WHERE `sales_ledger`.`branch_id`='1' AND `sales_ledger`.`entry_date`  BETWEEN '$fromDate' AND '$toDate'  ORDER BY `sales_ledger`.`invoice_no` ASC ");
while($fetch_sales=$selectSales->fetch_object())
{
$totalAmount+=$fetch_sales->total;
$totalPaid+=$fetch_sales->payment_amount;

    ?>

  <tr>
        <td style="border-bottom: 1px #000 dotted; text-align: center;"><?php print $i++; ?></td>
            <td style="border-left: 1px #000 dotted; border-bottom: 1px #000 dotted ; "><?php print dateformate($fetch_sales->invoice_date); ?></td>  

        <td style="border-left: 1px #000 dotted; border-bottom: 1px #000 dotted ; "><?php print $fetch_sales->customer_name_en; ?></td>  

         <td style="border-left: 1px #000 dotted; border-bottom: 1px #000 dotted ; "><a href="../invoicesalesa4/<?php print $fetch_sales->invoice_no ?>" target="_blank" style='text-decoration: none;'> <?php print $fetch_sales->invoice_no; ?></a>&nbsp;</td>  

          <td style="border-left: 1px #000 dotted; border-bottom: 1px #000 dotted ; text-align: right;"><?php print round($fetch_sales->total-$fetch_sales->final_discount,2); ?>&nbsp;</td>   


          <td style="border-left: 1px #000 dotted; border-bottom: 1px #000 dotted ; text-align: right; "><?php print $fetch_sales->payment_amount; ?>&nbsp;</td>  

           <td style="border-left: 1px #000 dotted; border-bottom: 1px #000 dotted ;  text-align: right;"><?php print round($fetch_sales->total - $fetch_sales->payment_amount,2) ; ?> &nbsp;</td>

        
  <td>



</tr>

    <?php
}

  ?>

  <tr>
        <td colspan="4" align="right"> Total: </td>
      

          <td style="border-left: 1px #000 dotted; text-align: right; "><?php print $totalAmount; ?> &nbsp;</td>   


          <td style="border-left: 1px #000 dotted;  text-align: right; "><?php print $totalPaid; ?> &nbsp;</td>  

           <td style="border-left: 1px #000 dotted;  text-align: right; "><?php print round($totalAmount-$totalPaid,2) ; ?> &nbsp;</td>

        
  <td>

</table>


                </td>


                <td style="border-left:1px #000 solid;   font-size: 16px;width: 10%;text-align: right;" >

                    <?php print $totalPaid;

                    $netTotalCollection+=$totalPaid;
                     ?> &nbsp;
                </td>
                
     </tr>


          <tr>
                <td style=" border-top:1px #000 solid;  font-size: 15px; width: 90%;" >
          <!-- ///////////////////////////////////////////////Due Collection////////////////////////// -->
<table width="100%" cellpadding="0" cellspacing="0" align="center" style="font-size: 15px;">
  <tr>
      <td colspan="7" align="left"style="border-left: 1px #000 dotted; border-bottom: 1px #000 dotted ; font-size: 16px; " >Customer Dues Collection</td>
  </tr>
  <tr>
        <td style="border-bottom: 1px #000 dotted">SL</td>
        <td style="border-left: 1px #000 dotted; border-bottom: 1px #000 dotted ; ">Date</td>
        <td style="border-left: 1px #000 dotted; border-bottom: 1px #000 dotted ; ">Customer Name</td>
        <td style="border-left: 1px #000 dotted; border-bottom: 1px #000 dotted ; text-align: right; ">Paid</td>
  </tr>
  
  <?php

  $totalDuePaid=0;
  $i=1;
    $selectDueCollection=$db->link->query("SELECT `sales_payment`.`entry_date`,`sales_payment`.`payment_amount`,`customer_info`.`customer_name_en` FROM `sales_payment` 
INNER JOIN `customer_info` ON `customer_info`.`customer_id`=`sales_payment`.`customer_id`
WHERE `transaction_type`='DueCollection' AND `sales_payment`.`branch_id`='1'  AND `sales_payment`.`entry_date`  BETWEEN '$fromDate' AND '$toDate'");
while($fetch_dueCollection=$selectDueCollection->fetch_object())
{
$totalDuePaid+=$fetch_dueCollection->payment_amount;


    ?>

  <tr>
        <td style="border-bottom: 1px #000 dotted; text-align: center;"><?php print $i++; ?></td>
            <td style="border-left: 1px #000 dotted; border-bottom: 1px #000 dotted ; "><?php print dateformate($fetch_dueCollection->entry_date); ?></td>  

        <td style="border-left: 1px #000 dotted; border-bottom: 1px #000 dotted ; "><?php print $fetch_dueCollection->customer_name_en; ?></td>  

       

          <td style="border-left: 1px #000 dotted; border-bottom: 1px #000 dotted ; text-align: right;"><?php print $fetch_dueCollection->payment_amount; ?>&nbsp;</td>   


       

        
  <td>



</tr>

    <?php
}

  ?>

  <tr>
        <td colspan="3" align="right"> Total: </td>
      

         

           <td style="border-left: 1px #000 dotted;  text-align: right; "><?php print $totalDuePaid ; ?> &nbsp;</td>

        
  <td>

</table>







             </td>


                <td style="border-left:1px #000 solid;  border-top:1px #000 solid; font-size: 16px;width: 10%;text-align: right;" ><?php print $totalDuePaid ;

                $netTotalCollection+=$totalDuePaid;
                 ?>&nbsp;</td>
                
        </tr>  
<!-- /////////////////////////////////////////////End Due Paid////////////////////////////////////////// -->

   


        <tr>
                <td style=" border-top:1px #000 solid;  font-size: 16px; width: 90%;" >
                  
<!-- //////////////////// Others Income////////////////////////////////////// -->
<table width="100%" cellpadding="0" cellspacing="0" align="center" style="font-size: 15px;">
  <tr>
      <td colspan="7" align="left"style="border-left: 1px #000 dotted; border-bottom: 1px #000 dotted ; font-size: 16px; " >Others Income/Collection</td>
  </tr>
  <tr>
        <td style="border-bottom: 1px #000 dotted">SL</td>
        <td style="border-left: 1px #000 dotted; border-bottom: 1px #000 dotted ; ">Date</td>
        <td style="border-left: 1px #000 dotted; border-bottom: 1px #000 dotted ; ">Title</td>
        <td style="border-left: 1px #000 dotted; border-bottom: 1px #000 dotted ; text-align: right; ">Amount</td>
  </tr>
  
  <?php

  $totalOthersIncome=0;
  $i=1;
    $selectOthersIncome=$db->link->query("SELECT `income_entry`.`entry_date`,`income_entry`.`amount`,`income_expense_title`.`title` FROM `income_entry`
INNER JOIN `income_expense_title` ON `income_expense_title`.`id`=`income_entry`.`income_id`
WHERE `income_entry`.`branch`='1' AND `income_entry`.`entry_date` BETWEEN '$fromDate' AND '$toDate'");
while($fetch_OthersIncome=$selectOthersIncome->fetch_object())
{
$totalOthersIncome+=$fetch_OthersIncome->amount;


    ?>

  <tr>
        <td style="border-bottom: 1px #000 dotted; text-align: center;"><?php print $i++; ?></td>
            <td style="border-left: 1px #000 dotted; border-bottom: 1px #000 dotted ; "><?php print dateformate($fetch_OthersIncome->entry_date); ?></td>  

        <td style="border-left: 1px #000 dotted; border-bottom: 1px #000 dotted ; "><?php print $fetch_OthersIncome->title; ?></td>  

       

          <td style="border-left: 1px #000 dotted; border-bottom: 1px #000 dotted ; text-align: right;"><?php print $fetch_OthersIncome->amount; ?>&nbsp;</td>   


       

        
  <td>



</tr>

    <?php
}

  ?>

  <tr>
        <td colspan="3" align="right"> Total: </td>
      

         

           <td style="border-left: 1px #000 dotted;  text-align: right; "><?php print $totalOthersIncome ; ?> &nbsp;</td>

        
  <td>

</table>




                </td>


                <td style="border-left:1px #000 solid;  border-top:1px #000 solid; font-size: 16px;width: 10%;text-align: right;" ><?php print $totalOthersIncome ;
                $netTotalCollection+=$totalOthersIncome;

                 ?> &nbsp; </td>

                
        </tr>       

        <!-- //////////////////////////////////// End Others Income//////////////////////  -->
        <tr>
                <td valign="top" style=" border-top:1px #000 solid;  font-size: 16px;border-bottom:1px #000 solid;   text-align: right;" ><br>Total &nbsp;: &nbsp; </td>


                <td style="border-left:1px #000 solid; border-bottom:1px #000 solid; border-top:1px #000 solid; font-size: 16px; text-align: right;" ><br><?php print $netTotalCollection;?> &nbsp;</td>
                
        </tr>        
           



          </table>


       </td>

<!--   ..........................................End Debit..................................... -->       


   <td width="3%"></td>


   <td colspan="2" style="border-left:1px #000 solid; border-right:1px #000 solid;   border-bottom:1px #000 solid; padding: 3px; font-size: 18px; width: 20%;" valign="top" >
      <table cellspacing="0" cellspacing="0" width="100%" align="center">
            
      <tr>
                <td style=" border-bottom:1px #000 solid;  font-size: 16px; width: 90%; padding: 3px;" >Title</td>


                <td style="border-left:1px #000 solid;  border-bottom:1px #000 solid; padding: 3px; font-size: 16px;width: 10%;text-align: right;" >Amount</td>
                
        </tr>     


    <tr>
                <td style="  font-size: 16px; width: 90%; " >
<!-- ////////////////////////////////////Purchase ///////////////////////////////// -->

  <tr>
                <td style=" border-bottom: 1px #000 solid;  font-size: 15px; width: 80%;" >
                  

<table width="100%" cellpadding="0" cellspacing="0" align="center" style="font-size: 15px;">
  <tr>
      <td colspan="7" align="left"style="border-left: 1px #000 dotted; border-bottom: 1px #000 dotted ; font-size: 16px; " > Purchase Info</td>
  </tr>
  <tr>
        <td style="border-bottom: 1px #000 dotted">SL</td>
        <td style="border-left: 1px #000 dotted; border-bottom: 1px #000 dotted ; ">Date</td>
        <td style="border-left: 1px #000 dotted; border-bottom: 1px #000 dotted ; ">Supplier Name</td>
        <td style="border-left: 1px #000 dotted; border-bottom: 1px #000 dotted ; ">Invoice No</td>
        <td style="border-left: 1px #000 dotted; border-bottom: 1px #000 dotted ;  text-align: right;">Total</td>
        <td style="border-left: 1px #000 dotted; border-bottom: 1px #000 dotted ; text-align: right; ">Paid</td>
        <td style="border-left: 1px #000 dotted; border-bottom: 1px #000 dotted ; text-align: right; ">Due</td>
  </tr>
  
  <?php
  $totalpurchaseAmount=0;
  $totalPurchasePaid=0;
  $i=1;
    $selectpurchase=$db->link->query("SELECT `purchase_ledger`.`invoice_no`,`purchase_ledger`.`entry_date`,`purchase_ledger`.`total`,`purchase_ledger`.`discount`,`supplier_payment`.`payment`,`supplier_info`.`supplier_name_en` FROM `purchase_ledger`
INNER JOIN `supplier_payment` ON `supplier_payment`.`invoice_no`=`purchase_ledger`.`invoice_no`
INNER JOIN `supplier_info` ON `supplier_info`.`supplier_id`=`purchase_ledger`.`suplier_id`
WHERE `purchase_ledger`.`branch_id`='1' AND `purchase_ledger`.`entry_date`  BETWEEN '$fromDate' AND '$toDate'  ORDER BY `purchase_ledger`.`invoice_no` ASC ");
while($fetch_purchase=$selectpurchase->fetch_object())
{
$totalpurchaseAmount+=$fetch_purchase->total;
$totalPurchasePaid+=$fetch_purchase->payment;

    ?>

  <tr>
        <td style="border-bottom: 1px #000 dotted; text-align: center;"><?php print $i++; ?></td>
            <td style="border-left: 1px #000 dotted; border-bottom: 1px #000 dotted ; "><?php print dateformate($fetch_purchase->entry_date); ?></td>  

        <td style="border-left: 1px #000 dotted; border-bottom: 1px #000 dotted ; "><?php print $fetch_purchase->supplier_name_en; ?></td>  

         <td style="border-left: 1px #000 dotted; border-bottom: 1px #000 dotted ; ">
          <a href="../invoicepurchase/<?php print $fetch_purchase->invoice_no ?>" target="_blank" style='text-decoration: none;'> <?php print $fetch_purchase->invoice_no; ?></a>&nbsp;</td>  

          <td style="border-left: 1px #000 dotted; border-bottom: 1px #000 dotted ; text-align: right;"><?php print round($fetch_purchase->total- $fetch_purchase->discount,2); ?>&nbsp;</td>   


          <td style="border-left: 1px #000 dotted; border-bottom: 1px #000 dotted ; text-align: right; "><?php print $fetch_purchase->payment; ?>&nbsp;</td>  

           <td style="border-left: 1px #000 dotted; border-bottom: 1px #000 dotted ;  text-align: right;"><?php print round($fetch_purchase->total - $fetch_purchase->payment,2) ; ?> &nbsp;</td>

        
  <td>



</tr>

    <?php
}

  ?>

  <tr>
        <td colspan="4" align="right"> Total: </td>
      

          <td style="border-left: 1px #000 dotted; text-align: right; "><?php print $totalpurchaseAmount; ?> &nbsp;</td>   


          <td style="border-left: 1px #000 dotted;  text-align: right; "><?php print $totalPurchasePaid; ?> &nbsp;</td>  

           <td style="border-left: 1px #000 dotted;  text-align: right; "><?php print round($totalpurchaseAmount-$totalPurchasePaid,2) ; ?> &nbsp;</td>

        
  <td>

</table>


                </td>


                <td style="border-left:1px #000 solid;   border-bottom: 1px #000 solid;   font-size: 16px;width: 10%;text-align: right;" >

                    <?php print $totalPurchasePaid;

                    $netTotalExpense+=$totalPurchasePaid;

                     ?> &nbsp;
                </td>
                
     </tr>

<!-- ////////////////////////////////////////End Purchase///////////////////////////////// -->

                  
      <tr>
                <td style=" border-bottom:1px #000 solid;  font-size: 16px; width: 90%; padding: 3px;" >
                  
                  <table width="100%" cellpadding="0" cellspacing="0" align="center" style="font-size: 15px;">
  <tr>
      <td colspan="7" align="left"style="border-left: 1px #000 dotted; border-bottom: 1px #000 dotted ; font-size: 16px; " >Supplier Dues Paid</td>
  </tr>
  <tr>
        <td style="border-bottom: 1px #000 dotted">SL</td>
        <td style="border-left: 1px #000 dotted; border-bottom: 1px #000 dotted ; ">Date</td>
        <td style="border-left: 1px #000 dotted; border-bottom: 1px #000 dotted ; ">Supplier Name</td>
        <td style="border-left: 1px #000 dotted; border-bottom: 1px #000 dotted ; text-align: right; ">Paid</td>
  </tr>
  
  <?php

  $totalDuePaidSupplier=0;
  $i=1;
    $selectDuePaid=$db->link->query("SELECT `supplier_payment`.`entry_date`,`supplier_payment`.`payment`,`supplier_info`.`supplier_name_en` FROM `supplier_payment` 
INNER JOIN `supplier_info` ON `supplier_info`.`supplier_id`=`supplier_payment`.`suplier_id`
WHERE `supplier_payment`.`transaction_type`='DuePaid' AND `supplier_payment`.`branch_id`='1'  AND `supplier_payment`.`entry_date`  BETWEEN '$fromDate' AND '$toDate'");
while($fetch_duePaid=$selectDuePaid->fetch_object())
{
$totalDuePaidSupplier+=$fetch_duePaid->payment;


    ?>

  <tr>
        <td style="border-bottom: 1px #000 dotted; text-align: center;"><?php print $i++; ?></td>
            <td style="border-left: 1px #000 dotted; border-bottom: 1px #000 dotted ; "><?php print dateformate($fetch_duePaid->entry_date); ?></td>  

        <td style="border-left: 1px #000 dotted; border-bottom: 1px #000 dotted ; "><?php print $fetch_duePaid->supplier_name_en; ?></td>  

       

          <td style="border-left: 1px #000 dotted; border-bottom: 1px #000 dotted ; text-align: right;"><?php print $fetch_duePaid->payment; ?>&nbsp;</td>   


       

        
  <td>



</tr>

    <?php
}

  ?>

  <tr>
        <td colspan="3" align="right"> Total: </td>
      

         

           <td style="border-left: 1px #000 dotted;  text-align: right; "><?php print $totalDuePaidSupplier ; ?> &nbsp;</td>

        
  <td>

</table>


                </td>


                <td style="border-left:1px #000 solid;  border-bottom:1px #000 solid; padding: 3px; font-size: 16px;width: 10%;text-align: right;" ><?php print $totalDuePaidSupplier ; 

$netTotalExpense+=$totalDuePaidSupplier;
                ?> &nbsp;</td>
                
        </tr>   
<!-- //////////////////////////////////////Suppier Dues Paid///////////////////////////// -->


      <tr>
                <td style=" border-bottom:1px #000 solid;  font-size: 16px; width: 90%; padding: 3px;" >
                  

                  <table width="100%" cellpadding="0" cellspacing="0" align="center" style="font-size: 15px;">
  <tr>
      <td colspan="7" align="left"style="border-left: 1px #000 dotted; border-bottom: 1px #000 dotted ; font-size: 16px; " >Others Expense</td>
  </tr>
  <tr>
        <td style="border-bottom: 1px #000 dotted">SL</td>
        <td style="border-left: 1px #000 dotted; border-bottom: 1px #000 dotted ; ">Date</td>
        <td style="border-left: 1px #000 dotted; border-bottom: 1px #000 dotted ; ">Title</td>
        <td style="border-left: 1px #000 dotted; border-bottom: 1px #000 dotted ; text-align: right; ">Amount</td>
  </tr>
  
  <?php

  $totalOthersExpense=0;
  $i=1;
    $selectOthersExpense=$db->link->query("SELECT `expense_entry`.`entry_date`,`expense_entry`.`amount`,`income_expense_title`.`title` FROM `expense_entry`
INNER JOIN `income_expense_title` ON `income_expense_title`.`id`=`expense_entry`.`expense_id`
WHERE `expense_entry`.`branch`='1' AND `expense_entry`.`entry_date` BETWEEN '$fromDate' AND '$toDate'");
while($fetch_OthersExpense=$selectOthersExpense->fetch_object())
{
$totalOthersExpense+=$fetch_OthersExpense->amount;


    ?>

  <tr>
        <td style="border-bottom: 1px #000 dotted; text-align: center;"><?php print $i++; ?></td>
            <td style="border-left: 1px #000 dotted; border-bottom: 1px #000 dotted ; "><?php print dateformate($fetch_OthersExpense->entry_date); ?></td>  

        <td style="border-left: 1px #000 dotted; border-bottom: 1px #000 dotted ; "><?php print $fetch_OthersExpense->title; ?></td>  

       

          <td style="border-left: 1px #000 dotted; border-bottom: 1px #000 dotted ; text-align: right;"><?php print $fetch_OthersExpense->amount; ?>&nbsp;</td>   


       

        
  <td>



</tr>

    <?php
}

  ?>

  <tr>
        <td colspan="3" align="right"> Total: </td>
      

         

           <td style="border-left: 1px #000 dotted;  text-align: right; "><?php print $totalOthersExpense ; ?> &nbsp;</td>

        
  <td>

</table>

                </td>


                <td style="border-left:1px #000 solid;  border-bottom:1px #000 solid; padding: 3px; font-size: 16px;width: 10%;text-align: right;" ><?php print $totalOthersExpense ; 
$netTotalExpense+=$totalOthersExpense;
                ?> &nbsp;</td>
                
        </tr>                
      <tr>
                <td style=" border-bottom:1px #000 solid;  font-size: 16px; width: 90%;  text-align: right;" >Total &nbsp;: &nbsp;</td>


                <td style="border-left:1px #000 solid;  border-bottom:1px #000 solid; padding: 3px; font-size: 16px;width: 10%;text-align: right;" ><br><?php print $netTotalExpense;?> &nbsp;</td>
                
        </tr>     

      

</table>


   </td>


             
</tr>







<tr>
  <td colspan="5"><br></td>
</tr>

            <tr>
                <td colspan="4" style="border-left:1px #000 solid; border-top:1px #000 solid;  border-bottom:1px #000 solid; padding: 3px; font-size: 18px; width: 40%; min-height: 300px;text-align: right;" >

Total : 

                </td>

               
                <td style="border-left:1px #000 solid;border-right:1px #000 solid;border-top:1px #000 solid;  border-bottom:1px #000 solid; padding: 3px; font-size: 18px;width: 10%;text-align: right;" >
<?php print $netTotalCollection;?>
                </td>
            </tr>    



             <tr>
                <td colspan="4" style="border-left:1px #000 solid;  border-bottom:1px #000 solid; padding: 3px; font-size: 18px; width: 40%; min-height: 300px;text-align: right;" >

Total Expense : 

                </td>

               
                <td style="border-left:1px #000 solid;border-right:1px #000 solid;border-bottom:1px #000 solid; padding: 3px; font-size: 18px;width: 10%;text-align: right;" >
<?php print $netTotalExpense;?>
                </td>
            </tr>
           <tr>
                <td colspan="4" style="border-left:1px #000 solid;   border-bottom:1px #000 solid; padding: 3px; font-size: 18px; width: 40%; min-height: 300px;text-align: right;" >

Cash in Hend : 

                </td>

               
                <td style="border-left:1px #000 solid;border-right:1px #000 solid; border-bottom:1px #000 solid; padding: 3px; font-size: 18px;width: 10%;text-align: right;" >
<?php print round($netTotalCollection-$netTotalExpense,2);?>
                </td>
            </tr>
    

                    
<tr>

  <td colspan="5"> 
<br><br>
<table width="100%" cellspacing="0" cellpadding="0">

  <tr>
      <td  align="left" width="30%">
        <br>
        ---------------------------------------<br>
       &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Prepared By

      </td>
      <td align="center"><b>Developed By: SBIT (01840241895)</b></td>

      <td align="right" width="30%">
      <br>
        ---------------------------------------<br>
          Authorized  Signature &nbsp;&nbsp;&nbsp;&nbsp; 

      </td>
     
  </tr>
  
</table>

  </td>
</tr>

       </table>
  </div>

   <center><input type="button" name="Print" value="Print" onclick="window.print();" style="width: 120px; height: 30px; background: #ff0000; color: #fff; border-radius: 5px;" class="print"></center>

</form>
  </body>
</html>