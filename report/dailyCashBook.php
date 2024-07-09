<?php

include('connection.php');
$db=new database();

//print $_POST['fromDate'];

function dateformate($x)
{
  $d=explode('-', $x);
  return $d[2].'-'.$d[1].'-'.$d[0];
}



?>

<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Daily Cash Report</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
  </head>
  <body>
  <form method="get" action="dailyCashReport.php"> 
  <div class="col-6 offset-3" >
      <table class="table table-bordered">
            <tr>
                    <td colspan="3" align="center" > <h3 class="alert alert-primary" role="alert"> Daily Cash Book</h3></td>
            </tr>    

            <tr>
                    <td>Select Cash Close Date</td>
                    <td>:</td>
                    <td>
                        <select class="form-control" name="CashCloseDate" > 
<?php
$lastCashclose=date('Y-m-d');
    $selectCashClose=$db->link->query("SELECT * FROM `cash_close` ORDER BY `id` DESC ");
    if($selectCashClose)
    {
      $flag=0;
      while($fetchCloseDate=$selectCashClose->fetch_array())
      {

        if($fetchCloseDate[1]!=date('Y-m-d'))
        {
          if($flag==0)
          {
                  $lastCashclose=$fetchCloseDate[1];
          }

              print "<option value='$fetchCloseDate[1]'>".dateformate($fetchCloseDate[1])."</option>";
        }
        $flag++;
      }

    }

                          ?>
                        </select>
                        <?php
       //echo  $lastCashclose;
      $lastdate = new DateTime($lastCashclose);
      $lastdate->add(new DateInterval('P1D'));
      $fromdate=$lastdate->format('Y-m-d');


                        ?>
                </td>
            </tr>         

            <tr>
                    <td>From Date</td>
                    <td>:</td>
                    <td>
                         <input type="text" name="fromDate" class="form-control"  value="<?php print dateformate($fromdate); ?>">
                    </td>
            </tr>

            <tr>
                    <td>To Date</td>
                    <td>:</td>
                    <td>
                         <input type="text" name="toDate" class="form-control" value="<?php print date('d-m-Y')?>">
                    </td>
            </tr>           

             <tr>
                   
                    <td colspan="3" align="center">
                         <input type="submit" name="show" class="btn btn-success" value="Show Report" formtarget="_blank">
                    </td>
            </tr>

       </table>
  </div>

</form>
    <script src="js/bootstrap.bundle.min.js" ></script>
  </body>
</html>