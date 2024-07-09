<?php

include('connection.php');
$db=new database();

//print $_POST['fromDate'];
$CashCloseDate='2022-01-01';
$fromDate='2022-12-01';
$toDate='2023-12-01';
date_default_timezone_set("Asia/Dhaka");
//$actual_link = 'http://'.$_SERVER['HTTP_HOST'].$_SERVER['PHP_SELF'];
//echo $actual_link;
$netTotalCollection=0;
$netTotalExpense=0;


$purchase=$db->link->query("SELECT SUM(`product_quantity`) AS 'Total_purchase',`product_id` FROM `purchase_entry` GROUP BY `product_id` limit 2,2");

   if($purchase)
   {
      while($fetch_purchase=$purchase->fetch_array())
      {

          $sales_qun[0]=0;
          $sales_return[0]=0;
          $pdt_damage[0]=0;
          $purchaseReturn[0]=0;

          $sales=$db->link->query("SELECT SUM(`product_quantity`) AS 'Total_sales',`product_id` FROM `sales_entry` WHERE `product_id`='$fetch_purchase[1]'");
         if($sales)
          {
            $sales_qun=$sales->fetch_array();
          }
          


          $sale_return=$db->link->query("SELECT SUM(`return_quantity`) AS 'Total_sales_return',`product_id` FROM `sales_return_entry` WHERE `product_id`='$fetch_purchase[1]'");
          if($sale_return)
          {
            $sales_return=$sale_return->fetch_array();
          }
                    

          $damage=$db->link->query("SELECT SUM(`qty`) AS 'Total_damage',`product_id` FROM `damageproducts` WHERE `product_id`='$fetch_purchase[1]'");
          if($damage)
          {
            $pdt_damage=$damage->fetch_array();
          }
                     


          $purchaseReturn=$db->link->query("SELECT SUM(`product_quantity`) AS 'Total_purchase_return',`product_id` FROM `return_purchase_entry` WHERE `product_id`='$fetch_purchase[1]'");
          if($purchaseReturn)
          {
            $purchaseReturn=$purchaseReturn->fetch_array();
          }
          
          $salespdt=$sales_qun['Total_sales']-$sales_return[0];
          $purchasepdt=$fetch_purchase['Total_purchase']-$purchaseReturn[0];

          $pdtstock=$purchasepdt-($salespdt+$pdt_damage[0]);

       

          $db->link->query("UPDATE `stock_products` set `quantity`='$purchasepdt',`sales_qty`='$salespdt',`stock_qun`='$pdtstock',`damage`='$pdt_damage[0]' WHERE `product_id`='$fetch_purchase[1]'");

        
            
      }
   }

?>

<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Balance Sheet</title>
    
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
  <div >
      <table width="100%"  cellspacing="0" cellspacing="0" align="center" style="padding: 10px;" >
            <tr>
                    <td colspan="5" align="center" style="max-height: 150px;" >
                   <center> <img src="banner.jpg" id="header_image" style="max-height: 150px;"> </center>   
                  </td>
            </tr>           
            <tr>
                    <td colspan="5" align="center" >
                     <h3 style="background: #999; color: #fff; font-size: 24px; font-weight: bold;"> 
                    Balance Sheet</h3>
                    </td>
            </tr>    
            <tr>
                    <td colspan="5" align="left" height="30" ><p style="padding: 5px;">
                      
                      <span > Print Date & Time:    <?php echo date("d-m-Y h:i:sa")?></span></p>
                      <hr>
                      <br>
                  </td>
            </tr>    
            <tr>
                <td colspan="2" align="center" style="border-left:1px #000 solid;border-top:1px #000 solid; border-right:1px #000 solid; border-bottom:1px #000 solid; padding: 3px; font-size: 18px;" width="46%"> <b> Owners Liabilites</b></td>
                <td  width="4%"></td>
                <td colspan="2" align="center"  style="border-left:1px #000 solid;border-top:1px #000 solid; border-right:1px #000 solid;border-bottom:1px #000 solid;  padding: 3px;font-size: 18px;" width="46%"> <b> Assets</b></td>
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

 <?php
 $totalLiabilities=0;
	 $selectOpeningBalance=$db->link->query("SELECT * FROM `cash_close`  ORDER BY id ASC LIMIT 1");
	 if($selectOpeningBalance)
	 {
	    $fetchOpeningBalance=$selectOpeningBalance->fetch_array();
	 }
?>
                <td style=" border-bottom:1px #000 solid;  font-size: 16px; width: 90%;"> Opening Balance (<?php echo $fetchOpeningBalance['cash_date'];?>)</td>


                <td style="border-left:1px #000 solid;  border-bottom:1px #000 solid;  font-size: 16px;width: 10%;text-align: right;" >
          
                    <?php     
    					echo $fetchOpeningBalance['cash'];
    					$totalLiabilities+=$fetchOpeningBalance['cash'];
                    ?> &nbsp;

                </td>
                
        </tr>


     <tr>
                <td style="  font-size: 15px; width: 80%;" >
                  

<table width="100%" cellpadding="0" cellspacing="0" align="center" style="font-size: 15px;">
  <tr>
      <td colspan="7" align="left"style="border-left: 1px #000 dotted; border-bottom: 1px #000 dotted ; font-size: 16px; " > Supplier's Dues</td>
  </tr>
  <tr>
        <td style="border-bottom: 1px #000 dotted" width="5%" align="center">SL</td>
        <td style="border-left: 1px #000 dotted; border-bottom: 1px #000 dotted ; ">Name</td>
        
        <td style="border-left: 1px #000 dotted; border-bottom: 1px #000 dotted ; text-align: right; " width="20%">Due &nbsp;</td>
  </tr>
  
  <?php
  $totalAmount=0;
  $total_dues=0;
  $i=1;
    $selectPurchase=$db->link->query("SELECT SUM(`purchase_ledger`.`total` - `purchase_ledger`.`discount`),`purchase_ledger`.`suplier_id`,`supplier_info`.`supplier_name_en` FROM  `purchase_ledger` 
INNER JOIN `supplier_info` ON `supplier_info`.`supplier_id`=`purchase_ledger`.`suplier_id`
GROUP BY `purchase_ledger`.`suplier_id`");
while($fetch_purchase=$selectPurchase->fetch_array())
{

	$purchasePayment=$db->link->query("SELECT SUM(`supplier_payment`.`payment`) as 'payment', SUM(`supplier_payment`.`previous_due`) as 'Previous Balance'  FROM  `supplier_payment` WHERE `suplier_id`='$fetch_purchase[1]'");

	$fetch_payment=$purchasePayment->fetch_array();

$totalPurchase=$fetch_purchase[0]+$fetch_payment[1];

$total_supplier_dues=round($totalPurchase-$fetch_payment[0],2);
if($total_supplier_dues>0)
{

    $total_dues=$total_dues+$total_supplier_dues;

    ?>

  <tr>
        <td style="border-bottom: 1px #000 dotted; text-align: center;"><?php print $i++; ?></td>
            <td style="border-left: 1px #000 dotted; border-bottom: 1px #000 dotted ; ">
            	            	<?php print $fetch_purchase['supplier_name_en']; ?></td>  

        <td style="border-left: 1px #000 dotted; border-bottom: 1px #000 dotted ;  text-align: right;">&nbsp;<?php print $total_supplier_dues; ?> &nbsp;</td>  


     
  <td>
</tr>

    <?php
}
}

  ?>

  <tr>
        <td align="right" colspan="2"> Total: </td>
   <td style="border-left: 1px #000 dotted; text-align: right; "><?php 

   print $total_dues;
   $totalLiabilities+=$total_dues;

    ?> &nbsp;</td>      
  <td>

</table>
                </td>
                <td style="border-left:1px #000 solid;   font-size: 16px;width: 10%;text-align: right;" >
                   <?php print $total_dues; ?> &nbsp;
                </td>
                
     </tr>
          <tr>
                <td style=" border-top:1px #000 solid;  font-size: 15px; width: 90%;" >
          <!-- ///////////////////////////////////////////////Due Collection////////////////////////// -->
<table width="100%" cellpadding="0" cellspacing="0" align="center" style="font-size: 15px;">
  <tr>
      <td colspan="7" align="left"style="border-left: 1px #000 dotted; border-bottom: 1px #000 dotted ; font-size: 16px; " >Customer's Advance</td>
  </tr>

  <tr>
        <td style="border-bottom: 1px #000 dotted" width="5%" align="center">SL</td>
        <td style="border-left: 1px #000 dotted; border-bottom: 1px #000 dotted ; ">Customer Name</td>
        <td style="border-left: 1px #000 dotted; border-bottom: 1px #000 dotted ; text-align: right; "width="20%">Amount</td>
  </tr>
  
  <?php


// SELECT SUM(`sales_ledger`.`total`),`customer_info`.`customer_id`,`customer_info`.`customer_name_en` FROM  `sales_ledger` 
// INNER JOIN `customer_info` ON `supplier_info`.`customer_id`=`purchase_ledger`.`suplier_id`
// GROUP BY `purchase_ledger`.`suplier_id`

  $totaladvance=0;
  $advance=0;
  $i=1;
    $selectCustomerLedger=$db->link->query("SELECT SUM(`sales_ledger`.`total` - `sales_ledger`.`final_discount` ),`customer_info`.`customer_id`,`customer_info`.`customer_name_en` FROM  `sales_ledger` 
INNER JOIN `customer_info` ON `customer_info`.`customer_id`=`sales_ledger`.`customer_id`
GROUP BY `sales_ledger`.`customer_id`");
while($fetch_customer_Ledger=$selectCustomerLedger->fetch_array())
{

$customerPaymentPayment=$db->link->query("SELECT SUM(`sales_payment`.`payment_amount`) FROM  `sales_payment` WHERE `customer_id`='$fetch_customer_Ledger[1]'");
$fetch_customer_payment=$customerPaymentPayment->fetch_array();

if($fetch_customer_payment[0]>$fetch_customer_Ledger[0])
{
	$advance=round($fetch_customer_payment[0]-$fetch_customer_Ledger[0],2);
$totaladvance=$totaladvance+$advance;

		// $totalDuePaid+=$fetch_dueCollection->payment_amount;

?>

  <tr>
        <td style="border-bottom: 1px #000 dotted; text-align: center;"><?php print $i++; ?></td>

        <td style="border-left: 1px #000 dotted; border-bottom: 1px #000 dotted ; " >
            	<?php print $fetch_customer_Ledger[2]; ?></td>  
        <td style="border-left: 1px #000 dotted; border-bottom: 1px #000 dotted ; text-align: right; "><?php print $advance; ?>&nbsp;</td>  


       

        
  <td>



</tr>

    <?php
}
}

  ?>

  <tr>
        <td colspan="2" align="right"> Total: </td>
      

         

           <td style="border-left: 1px #000 dotted;  text-align: right; "><?php print $totaladvance ; 
            $totalLiabilities+=$totaladvance;

?> &nbsp;</td>
   
  <td>
</table>

             </td>


                <td style="border-left:1px #000 solid;  border-top:1px #000 solid; font-size: 16px;width: 10%;text-align: right;" ><?php print $totaladvance ;

                
                 ?>&nbsp;</td>
                
        </tr>  
<!-- /////////////////////////////////////////////End Due Paid////////////////////////////////////////// -->

   


        <tr>
                <td style=" border-top:1px #000 solid;  font-size: 16px; width: 90%;" >
                  
<!-- //////////////////// Loan ////////////////////////////////////// -->
<table width="100%" cellpadding="0" cellspacing="0" align="center" style="font-size: 15px;">
  <tr>
      <td colspan="7" align="left" style="border-left: 1px #000 dotted; border-bottom: 1px #000 dotted ; font-size: 16px; " >Company Loan</td>
  </tr>
  <tr>
        <td style="border-bottom: 1px #000 dotted" width="5%" align="center">SL</td>
        <td style="border-left: 1px #000 dotted; border-bottom: 1px #000 dotted ; " colspan="2">Title</td>

        <td style="border-left: 1px #000 dotted; border-bottom: 1px #000 dotted ; text-align: right; "width="20%">Amount</td>
  </tr>
  
  <?php

  $totalloan=0;
  $i=1;
    $loanselect=$db->link->query("SELECT SUM(`loanprovide`.`amount`),`loanregister`.`id`,`loanregister`.`name` FROM `loanprovide`
INNER JOIN `loanregister` ON `loanregister`.`id`=`loanprovide`.`register_id`
GROUP BY `loanprovide`.`register_id` ASC");
while($fetch_loan=$loanselect->fetch_array())
{

$selectLoadPaid=$db->link->query(" SELECT SUM(`amount`) FROM `loanreceived` WHERE `register_id`='$fetch_loan[1]'");
$fetch_paid=$selectLoadPaid->fetch_array();
$loanDue=round($fetch_loan[0]-$fetch_paid[0],2);
if($loanDue>0)
{
	$totalloan=$totalloan+$loanDue;




    ?>

  <tr>
        <td style="border-bottom: 1px #000 dotted; text-align: center;"><?php print $i++; ?></td>
            <td style="border-left: 1px #000 dotted; border-bottom: 1px #000 dotted ; " colspan="2"><?php print $fetch_loan[2]; ?></td>  

      
       

          <td style="border-left: 1px #000 dotted; border-bottom: 1px #000 dotted ; text-align: right;"><?php print $loanDue; ?>&nbsp;</td>   


       

        
  <td>



</tr>

    <?php
}
}

  ?>

  <tr>
        <td colspan="3" align="right"> Total: </td>
      

         

           <td style="border-left: 1px #000 dotted;  text-align: right; "><?php print $totalloan; 
           $totalLiabilities+=$totalloan;
           ?> &nbsp;</td>

        
  <td>

</table>




                </td>


                <td style="border-left:1px #000 solid;  border-top:1px #000 solid; font-size: 16px;width: 10%;text-align: right;" ><?php print $totalloan ;
              

                 ?> &nbsp; </td>

                
        </tr>       

        <!-- ////////////////////////////////////Others Loan  //////////////////////  -->

        

        <tr>
                <td style=" border-top:1px #000 solid;  font-size: 16px; width: 90%;" >
                  
<!-- //////////////////// Loan ////////////////////////////////////// -->
<table width="100%" cellpadding="0" cellspacing="0" align="center" style="font-size: 15px;">
  <tr>
      <td colspan="7" align="left"style="border-left: 1px #000 dotted; border-bottom: 1px #000 dotted ; font-size: 16px; " >Others Liabilities </td>
  </tr>
  <tr>
        <td style="border-bottom: 1px #000 dotted"  align="center" width="5%">SL</td>
        <td style="border-left: 1px #000 dotted; border-bottom: 1px #000 dotted ; " colspan="2">Title</td>

        <td style="border-left: 1px #000 dotted; border-bottom: 1px #000 dotted ; text-align: right; "width="20%">Amount</td>
  </tr>
  
  <?php

  $totalothersLiabalities=0;
  $i=1;
    $SelectLiabilities=$db->link->query("SELECT SUM(`librality`.`amount`),`librality`.`id`,`income_expense_title`.`title` FROM `librality`
INNER JOIN `income_expense_title` ON `income_expense_title`.`id`=`librality`.`expense_id`
GROUP BY `librality`.`expense_id` ASC");
while($fetch_liabilities=$SelectLiabilities->fetch_array())
{


if($fetch_liabilities[0]>0)
{
	$totalothersLiabalities=$totalothersLiabalities+$fetch_liabilities[0];

?>

  <tr>
        <td style="border-bottom: 1px #000 dotted; text-align: center;"><?php print $i++; ?></td>
            <td style="border-left: 1px #000 dotted; border-bottom: 1px #000 dotted ; " colspan="2"><?php print $fetch_liabilities[2]; ?></td>  

      
       

          <td style="border-left: 1px #000 dotted; border-bottom: 1px #000 dotted ; text-align: right;" width="20%"><?php print $fetch_liabilities[0]; ?>&nbsp;</td>   


       

        
  <td>



</tr>

    <?php
}
}

  ?>

  <tr>
        <td colspan="3" align="right"> Total: </td>
      

         

           <td style="border-left: 1px #000 dotted;  text-align: right; "><?php print $totalothersLiabalities; ?> &nbsp;</td>

        
  <td>

</table>




                </td>


                <td style="border-left:1px #000 solid;  border-top:1px #000 solid; font-size: 16px;width: 10%;text-align: right;" ><?php print $totalothersLiabalities ;
              $totalLiabilities+=$totalothersLiabalities;

                 ?> &nbsp; </td>

                
        </tr>       

        <tr>
                <td valign="top" style=" border-top:1px #000 solid; border-bottom: 1px #000 solid;  font-size: 16px;  text-align: right;" ><br>Total &nbsp;: &nbsp; </td>


                <td style="border-left:1px #000 solid; border-bottom: 1px #000 solid;  border-top:1px #000 solid; font-size: 16px; text-align: right;" ><br><?php print $totalLiabilities;?> &nbsp;</td>
                
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

 <?php
 $totalAssetsAmount=0;
	 $selectCashinHand=$db->link->query("SELECT * FROM `cash_close`  ORDER BY id desc LIMIT 1");
	 if($selectCashinHand)
	 {
	    $fetchCash=$selectCashinHand->fetch_array();
	 }
?>
        <td style=" border-bottom:1px #000 solid;  font-size: 16px; width: 90%;"> Cash in Hand (<?php echo $fetchCash['cash_date'];?>)</td>


        <td style="border-left:1px #000 solid;  border-bottom:1px #000 solid;  font-size: 16px;width: 10%;text-align: right;" >
          
                    <?php     
    					echo $fetchCash['cash'];
    					$totalAssetsAmount+=$fetchCash['cash'];
                    ?> &nbsp;

        </td>
                
    </tr>


    <tr>
          <td>
          <!--   ..................Stock ............................. -->
          <table width="100%" cellpadding="0" cellspacing="0" align="center" style="font-size: 15px;">
  <tr>
      <td colspan="7" align="left"style="border-left: 1px #000 dotted; border-bottom: 1px #000 dotted ; font-size: 16px; " > Stock Product</td>
  </tr>
  <tr>
        <td style="border-bottom: 1px #000 dotted" width="5%" align="center">SL</td>
        <td style="border-left: 1px #000 dotted; border-bottom: 1px #000 dotted ; ">Name</td>
        
        <td style="border-left: 1px #000 dotted; border-bottom: 1px #000 dotted ; text-align: right; " width="20%">Amount &nbsp;</td>
  </tr>
  
  <?php
  $totalstockPrice=0;
  
  $i=1;
    $itemName=$db->link->query("SELECT `brand_id`,`brand_name_en` FROM `pdt_brand`");
while($fetch_itemName=$itemName->fetch_array())
{
$stockPrice=0;

   $productQun=$db->link->query("SELECT `stock_products`.`product_id`,`stock_qun`,`purchase_price_withcost`,`sale_price` FROM `pdt_productinfo`
INNER JOIN `stock_products` ON `stock_products`.`product_id`=`pdt_productinfo`.`pdt_id`
WHERE `pdt_brand_id`='$fetch_itemName[0]'");

  while($fetch_qun=$productQun->fetch_array())
  {
        $stockPrice=$fetch_qun[1]*$fetch_qun[2]; 
  }
  $totalstockPrice+=$stockPrice;

if($stockPrice>0)
{

    ?>

  <tr>
        <td style="border-bottom: 1px #000 dotted; text-align: center;"><?php print $i++; ?></td>
            <td style="border-left: 1px #000 dotted; border-bottom: 1px #000 dotted ; text-transform: uppercase;  ">
                            <?php print $fetch_itemName['brand_name_en']; ?></td>  

        <td style="border-left: 1px #000 dotted; border-bottom: 1px #000 dotted ;  text-align: right;">&nbsp;<?php print $stockPrice; ?> &nbsp;</td>  


     
  <td>
</tr>

    <?php
}
}

  ?>

  <tr>
        <td align="right" colspan="2" style="border-bottom: 1px #000 solid;"> Total: </td>
   <td style="border-left: 1px #000 dotted; text-align: right;border-bottom: 1px #000 solid; " ><?php 

   print $totalstockPrice;
   $totalAssetsAmount+=$totalstockPrice;

    ?> &nbsp;</td>      
  <td>

</table>
         <!--    ...................Stock............................. -->
          </td>
          <td style="border-bottom: 1px #000 solid;border-left: 1px #000 solid;" ><?php print $totalstockPrice;?></td>
    </tr>




     <tr>
                <td style="  font-size: 15px; width: 80%;" >
                  

<table width="100%" cellpadding="0" cellspacing="0" align="center" style="font-size: 15px;">
  <tr>
      <td colspan="7" align="left"style="border-left: 1px #000 dotted; border-bottom: 1px #000 dotted ; font-size: 16px; " > Supplier's Advance</td>
  </tr>
  <tr>
        <td style="border-bottom: 1px #000 dotted" width="5%" align="center">SL</td>
        <td style="border-left: 1px #000 dotted; border-bottom: 1px #000 dotted ; ">Name</td>
        
        <td style="border-left: 1px #000 dotted; border-bottom: 1px #000 dotted ; text-align: right; " width="20%">Amount &nbsp;</td>
  </tr>
  
  <?php
  $totalAmount=0;
  $total_Advance=0;
  $i=1;
    $selectProductPurchase=$db->link->query("SELECT SUM(`purchase_ledger`.`total` - `purchase_ledger`.`discount`),`purchase_ledger`.`suplier_id`,`supplier_info`.`supplier_name_en` FROM  `purchase_ledger` 
INNER JOIN `supplier_info` ON `supplier_info`.`supplier_id`=`purchase_ledger`.`suplier_id`
GROUP BY `purchase_ledger`.`suplier_id`");
while($fetch_purchase_amount=$selectProductPurchase->fetch_array())
{

	$purchasePayment=$db->link->query("SELECT SUM(`supplier_payment`.`payment`) FROM  `supplier_payment` WHERE `suplier_id`='$fetch_purchase_amount[1]'");
	$fetch_payment=$purchasePayment->fetch_array();
$total_supplier_dues=round($fetch_payment[0]-$fetch_purchase_amount[0],2);
if($total_supplier_dues>1)
{
$total_Advance=$total_Advance+$total_supplier_dues;

    ?>

  <tr>
        <td style="border-bottom: 1px #000 dotted; text-align: center;"><?php print $i++; ?></td>
            <td style="border-left: 1px #000 dotted; border-bottom: 1px #000 dotted ; ">
            	            	<?php print $fetch_purchase_amount['supplier_name_en']; ?></td>  

        <td style="border-left: 1px #000 dotted; border-bottom: 1px #000 dotted ;  text-align: right;">&nbsp;<?php print $total_supplier_dues; ?> &nbsp;</td>  


     
  <td>
</tr>

    <?php
}
}

  ?>

  <tr>
        <td align="right" colspan="2"> Total: </td>
   <td style="border-left: 1px #000 dotted; text-align: right; "><?php 

   print $total_Advance;
   $totalAssetsAmount+=$total_Advance;

    ?> &nbsp;</td>      
  <td>

</table>
                </td>
                <td style="border-left:1px #000 solid;   font-size: 16px;width: 10%;text-align: right;" >
                   <?php print $total_Advance; ?> &nbsp;
                </td>
                
     </tr>
          <tr>
                <td style=" border-top:1px #000 solid;  font-size: 15px; width: 90%;" >
          <!-- ///////////////////////////////////////////////Due Collection////////////////////////// -->
<table width="100%" cellpadding="0" cellspacing="0" align="center" style="font-size: 15px;">
  <tr>
      <td colspan="7" align="left"style="border-left: 1px #000 dotted; border-bottom: 1px #000 dotted ; font-size: 16px; " >Customer's Dues</td>
  </tr>

  <tr>
        <td style="border-bottom: 1px #000 dotted" width="5%" align="center">SL</td>
        <td style="border-left: 1px #000 dotted; border-bottom: 1px #000 dotted ; ">Customer Name</td>
        <td style="border-left: 1px #000 dotted; border-bottom: 1px #000 dotted ; text-align: right; "width="20%">Amount</td>
  </tr>
  
  <?php


// SELECT SUM(`sales_ledger`.`total`),`customer_info`.`customer_id`,`customer_info`.`customer_name_en` FROM  `sales_ledger` 
// INNER JOIN `customer_info` ON `supplier_info`.`customer_id`=`purchase_ledger`.`suplier_id`
// GROUP BY `purchase_ledger`.`suplier_id`

  $totalaDues=0;
  $dues=0;
  $i=1;
    $selectCustomerLedger=$db->link->query("SELECT SUM(`sales_ledger`.`total` - `sales_ledger`.`final_discount` ),`customer_info`.`customer_id`,`customer_info`.`customer_name_en`,`customer_phone` FROM  `sales_ledger` 
INNER JOIN `customer_info` ON `customer_info`.`customer_id`=`sales_ledger`.`customer_id`
GROUP BY `sales_ledger`.`customer_id`");
while($fetch_customer_Ledger=$selectCustomerLedger->fetch_array())
{

$customerPaymentPayment=$db->link->query("SELECT SUM(`sales_payment`.`payment_amount`) as 'payment', SUM(`sales_payment`.`previous_due`)  as 'previous_due' FROM  `sales_payment` WHERE `customer_id`='$fetch_customer_Ledger[1]'");
$fetch_customer_payment=$customerPaymentPayment->fetch_array();
  $totalSalesAmount=$fetch_customer_Ledger[0]+$fetch_customer_payment[1];
if($totalSalesAmount>$fetch_customer_payment[0])
{



	$dues=round($totalSalesAmount-$fetch_customer_payment[0],2);
	$totalaDues=$totalaDues+$dues;

		// $totalDuePaid+=$fetch_dueCollection->payment_amount;

?>

  <tr>
        <td style="border-bottom: 1px #000 dotted; text-align: center;"><?php print $i++; ?></td>

        <td style="border-left: 1px #000 dotted; border-bottom: 1px #000 dotted ; " >
            	<?php print $fetch_customer_Ledger[2]; ?> (<?php print $fetch_customer_Ledger[3]; ?>)</td>  
        <td style="border-left: 1px #000 dotted; border-bottom: 1px #000 dotted ; text-align: right; "><?php print $dues; ?>&nbsp;</td>  


       

        
  <td>



</tr>

    <?php
}
}

  ?>

  <tr>
        <td colspan="2" align="right"> Total: </td>
      

         

           <td style="border-left: 1px #000 dotted;  text-align: right; "><?php print $totalaDues ; 
            $totalAssetsAmount+=$totalaDues;

?> &nbsp;</td>

        
  <td>

</table>







             </td>


                <td style="border-left:1px #000 solid;  border-top:1px #000 solid; font-size: 16px;width: 10%;text-align: right;" ><?php print $totalaDues ;

                
                 ?>&nbsp;</td>
                
        </tr>  
<!-- /////////////////////////////////////////////End Due Paid////////////////////////////////////////// -->

   


        <tr>
                <td style=" border-top:1px #000 solid;  font-size: 16px; width: 90%;" >
                  
<!-- //////////////////// Loan ////////////////////////////////////// -->
<table width="100%" cellpadding="0" cellspacing="0" align="center" style="font-size: 15px;">
  <tr>
      <td colspan="7" align="left" style="border-left: 1px #000 dotted; border-bottom: 1px #000 dotted ; font-size: 16px; " >Internal Loan</td>
  </tr>
  <tr>
        <td style="border-bottom: 1px #000 dotted" width="5%" align="center">SL</td>
        <td style="border-left: 1px #000 dotted; border-bottom: 1px #000 dotted ; " colspan="2">Title</td>

        <td style="border-left: 1px #000 dotted; border-bottom: 1px #000 dotted ; text-align: right; "width="20%">Amount</td>
  </tr>
  
  <?php

  $totalloan=0;
  $i=1;
    $loanselect=$db->link->query("SELECT SUM(`internalloanprovide`.`amount`),`internalloanregister`.`id`,`internalloanregister`.`name` FROM `internalloanprovide`
INNER JOIN `internalloanregister` ON `internalloanregister`.`id`=`internalloanprovide`.`register_id`
GROUP BY `internalloanprovide`.`register_id` ");
while($fetch_loan=$loanselect->fetch_array())
{

$selectLoadPaid=$db->link->query(" SELECT SUM(`amount`) FROM `internalloanreceived` WHERE `register_id`='$fetch_loan[1]'");

$fetch_paid=$selectLoadPaid->fetch_array();
$loanDue=round($fetch_loan[0]-$fetch_paid[0],2);
if($loanDue>0)
{
	$totalloan=$totalloan+$loanDue;




    ?>

  <tr>
        <td style="border-bottom: 1px #000 dotted; text-align: center;"><?php print $i++; ?>   </td>
            <td style="border-left: 1px #000 dotted; border-bottom: 1px #000 dotted ; " colspan="2"><?php print $fetch_loan[2]; ?></td>  

      
       

          <td style="border-left: 1px #000 dotted; border-bottom: 1px #000 dotted ; text-align: right;"><?php print $loanDue; ?>&nbsp;</td>   


       

        
  <td>



</tr>

    <?php
}
}

  ?>

  <tr>
        <td colspan="3" align="right"> Total: </td>
      

         

           <td style="border-left: 1px #000 dotted;  text-align: right; "><?php print $totalloan; 
           $totalAssetsAmount+=$totalloan;
           ?> &nbsp;</td>

        
  <td>

</table>




                </td>


                <td style="border-left:1px #000 solid;  border-top:1px #000 solid; font-size: 16px;width: 10%;text-align: right;" ><?php print $totalloan ;
              

                 ?> &nbsp; </td>

                
        </tr>       

        <!-- ////////////////////////////////////Others Loan  //////////////////////  -->

        

        <tr>
                <td style=" border-top:1px #000 solid;  font-size: 16px; width: 90%;" >
                  
<!-- //////////////////// Loan ////////////////////////////////////// -->
<table width="100%" cellpadding="0" cellspacing="0" align="center" style="font-size: 15px;">
  <tr>
      <td colspan="7" align="left"style="border-left: 1px #000 dotted; border-bottom: 1px #000 dotted ; font-size: 16px; " >Office Accessories</td>
  </tr>
  <tr>
        <td style="border-bottom: 1px #000 dotted"  align="center" width="5%">SL</td>
        <td style="border-left: 1px #000 dotted; border-bottom: 1px #000 dotted ; " colspan="2">Title</td>

        <td style="border-left: 1px #000 dotted; border-bottom: 1px #000 dotted ; text-align: right; "width="20%">Amount</td>
  </tr>
  
  <?php

  $totalAsset=0;
  $i=1;
    $asset_expenses=$db->link->query("SELECT SUM(`asset_expenses`.`taka_ammount`), `asset_categoreys`.`asset_title` FROM `asset_expenses`
INNER JOIN `asset_categoreys` ON `asset_categoreys`.`id`=`asset_expenses`.`asset_title_id`
GROUP BY `asset_expenses`.`asset_title_id` ");


while($fetch_asset=$asset_expenses->fetch_array())
{



	$totalAsset=$totalAsset+$fetch_asset[0];

?>

  <tr>
        <td style="border-bottom: 1px #000 dotted; text-align: center;"><?php print $i++; ?></td>
            <td style="border-left: 1px #000 dotted; border-bottom: 1px #000 dotted ; " colspan="2"><?php print $fetch_asset[1]; ?></td>  

          <td style="border-left: 1px #000 dotted; border-bottom: 1px #000 dotted ; text-align: right;" width="20%"><?php print $fetch_asset[0]; ?>&nbsp;</td>   
        
  <td>



</tr>

    <?php

}

  ?>

  <tr>
        <td colspan="3" align="right"> Total: </td>
      
      <td style="border-left: 1px #000 dotted;  text-align: right; "><?php print $totalAsset; ?> &nbsp;</td>

        
  <td>

</table>




                </td>


                <td style="border-left:1px #000 solid;  border-top:1px #000 solid; font-size: 16px;width: 10%;text-align: right;" ><?php print $totalAsset ; $totalAssetsAmount+=$totalAsset;?> &nbsp; </td>

                
        </tr>       

        <tr>
                <td valign="top" style=" border-top:1px #000 solid;  border-bottom: 1px #000 solid;  font-size: 16px;  text-align: right;" ><br>Total &nbsp;: &nbsp; </td>


                <td style="border-left:1px #000 solid;  border-bottom: 1px #000 solid;  border-top:1px #000 solid; font-size: 16px; text-align: right;" ><br><?php print $totalAssetsAmount;?> &nbsp;</td>
                
        </tr>        
           



          </table>
<br>

   </td>


             
</tr>







<tr>
  <td colspan="5"><br></td>
</tr>

            <tr>
                <td colspan="4" style="border-left:1px #000 solid; border-top:1px #000 solid;  border-bottom:1px #000 solid; padding: 3px; font-size: 18px; width: 40%; min-height: 300px;text-align: right;" >

Total Asset: 

                </td>

               
                <td style="border-left:1px #000 solid;border-right:1px #000 solid;border-top:1px #000 solid;  border-bottom:1px #000 solid; padding: 3px; font-size: 18px;width: 10%;text-align: right;" >
<?php print $totalAssetsAmount;?>
                </td>
            </tr>    



             <tr>
                <td colspan="4" style="border-left:1px #000 solid;  border-bottom:1px #000 solid; padding: 3px; font-size: 18px; width: 40%; min-height: 300px;text-align: right;" >

Total Liabilities : 

                </td>

               
                <td style="border-left:1px #000 solid;border-right:1px #000 solid;border-bottom:1px #000 solid; padding: 3px; font-size: 18px;width: 10%;text-align: right;" >
<?php print $totalLiabilities;?>
                </td>
            </tr>
           <tr>
                <td colspan="4" style="border-left:1px #000 solid;   border-bottom:1px #000 solid; padding: 3px; font-size: 18px; width: 40%; min-height: 300px;text-align: right;" >

Business Profit

                </td>

               
                <td style="border-left:1px #000 solid;border-right:1px #000 solid; border-bottom:1px #000 solid; padding: 3px; font-size: 18px;width: 10%;text-align: right;" >
<?php print $totalAssetsAmount-$totalLiabilities;?>
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