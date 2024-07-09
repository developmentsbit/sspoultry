<?php

include('connection.php');
$db=new database();

if(isset($_POST["show"]))
{

$todate=$_POST['todate'];
$fromdate=$_POST['fromdate'];

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
                    Profit Report</h3>
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

                <td colspan="2">
                  <form method="post"> 
                      <label> To Date</label><label>  <input type="date" name="todate" 
                        value="<?php print $todate; ?>"> </label>
                       <label> From Date</label><label>  <input type="date" name="fromdate" value="<?php print $fromdate; ?>"> </label>
                       <label>  <input type="submit" name="show" value="Show" > </label>
                   


                  </form>
                </td>
            
            </tr>        


              <tr>

                <td colspan="2" >
                        <?php 
                          if(isset($_POST["show"]))
                              {
                              $todate=$_POST['todate'];
                              $fromdate=$_POST['fromdate'];

                        ?>
                        <table width="100%" border="1" bordercolor="#ccc" cellspacing="0"  cellpadding="0"> 
                              <tr>
                                    <td>SL</td>
                                    <td>Invoise No</td>
                                    <td>Date</td>
                                    <td align="right">Sales</td>
                                    <td align="right">Discount</td>
                                    <td align="right">Net Sales</td>
                                    <td align="right">Purchase Price</td>
                                   
                                    <td align="right">Profit</td>
                                    <td align="right">%</td>

                              </tr>
                                <?php
                                $totalsaleprice=0;
                                $totalpurchase=0;
                                $totalProfit=0;

                                $i=1;

                $sales=$db->link->query("SELECT * FROM `sales_ledger` WHERE `invoice_date` BETWEEN '$todate' AND '$fromdate'");
                       //   echo "SELECT * FROM `sales_ledger` WHERE `invoice_date` BETWEEN '$todate' AND '$fromdate'";
                                     if($sales)
                                     {
                                        while($fetch_sales=$sales->fetch_array())
                                        {

                                          $salesAmount=round($fetch_sales['total']-$fetch_sales['final_discount'],2);


                                    $purchase=$db->link->query("SELECT * FROM `sales_entry` WHERE `invoice_no`='$fetch_sales[1]'");
                                     if($purchase)
                                     {
                                      $purchaseamount=0;
                                        while($fetch_purchase=$purchase->fetch_array())
                                        {
                                            $pp=$fetch_purchase['product_purchase_price']*$fetch_purchase['product_quantity'];
                                            $purchaseamount+=$pp;
                                        }

                                        
                                     }
                                       

                                       $totalProfit=$totalProfit+$salesAmount-$purchaseamount; 

                                  $totalsaleprice= $totalsaleprice+$salesAmount;
                                $totalpurchase=$totalpurchase+$purchaseamount;
                                  $profit=$salesAmount-$purchaseamount;
                                ?>
                            <tr>
                                    <td><?php print $i++ ?></td>
                                    <td><?php print $fetch_sales['invoice_no']?></td>
                                    <td align="center"><?php print $fetch_sales['invoice_date']?></td>
                                    <td align="right"><?php print $fetch_sales['total']?></td>
                                    <td align="right"><?php print $fetch_sales['final_discount'];?></td>
                                    <td align="right"><?php print $salesAmount?></td>
                                    <td align="right"><?php print $purchaseamount?></td>
                                    <td align="right"><?php print $profit ?></td>
                                    <td align="right"><?php print @round($profit/$purchaseamount*100,2) ?>%</td>
                                    
                               

                              </tr>
                                  <?php
                                }
                              }

                              ?>
<tr>
<td colspan="5"  align="right">Total :</td>
<td  align="center">  <?php echo $totalsaleprice ?></td>
<td  align="center"> <?php echo $totalpurchase ?></td>
<td><?php print $totalProfit ?></td>
<td><?php print @round(($totalProfit/$totalpurchase)*100,2) ?>%</td>
</tr>



                        </table>


                  <?php
                    }

                      ?>
                </td>
            
            </tr>




<tr>
  <td colspan="5"> 

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