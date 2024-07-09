
<?php

include('connection.php');
$db=new database();
date_default_timezone_set("Asia/Dhaka");


$purchase=$db->link->query("SELECT SUM(`product_quantity`) AS 'Total_purchase',`product_id` FROM `purchase_entry` GROUP BY `product_id`");




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
          
          $salespdt=$sales_qun['Total_sales']-$sales_return['Total_sales_return'];
          $purchasepdt=$fetch_purchase['Total_purchase']-$purchaseReturn[0];

          $pdtstock=$purchasepdt-($salespdt+$pdt_damage[0]);
  

          $db->link->query("UPDATE `stock_products` set `quantity`='$fetch_purchase[0]',`sales_qty`='$salespdt',`stock_qun`='$pdtstock',`damage`='$pdt_damage[0]' WHERE `product_id`='$fetch_purchase[1]'");


        
            
      }

       // echo "<script>window.close();</script>";


   }

?>