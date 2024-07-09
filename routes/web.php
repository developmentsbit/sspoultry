<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

// Admin Routes

Route::get('/', function () {
	return redirect('admin_login');
});
Auth::routes();
Route::get('/home', 'HomeController@index')->name('home');
Route::get('/admin_login', 'Admin\LoginController@index');
Route::post('/adminlogin', 'Admin\LoginController@adminlogin')->name('admin.login');
Route::get('/AdminDashboard', 'AdminController@AdminDashboard');
Route::get('/adminlogout', 'AdminController@adminlogout');




// Software Information Routes

Route::get('/company', 'Admin\SoftwareController@company');
Route::post('/companyinsert', 'Admin\SoftwareController@companyinsert');
Route::get('/deletecompany/{id}', 'Admin\SoftwareController@deletecompany');
Route::get('/getcompany', 'Admin\SoftwareController@getcompany');
Route::get('/editcompany/{id}', 'Admin\SoftwareController@editcompany');
Route::post('/updatecompany/{id}', 'Admin\SoftwareController@updatecompany');


Route::get('/branch', 'Admin\SoftwareController@branch');
Route::post('/branchinsert', 'Admin\SoftwareController@branchinsert');
Route::get('/deletebranch/{id}', 'Admin\SoftwareController@deletebranch');
Route::get('/getbranch', 'Admin\SoftwareController@getbranch');
Route::get('/editbranch/{id}', 'Admin\SoftwareController@editbranch');
Route::post('/updatebranch/{id}', 'Admin\SoftwareController@updatebranch');


// Customer Information Routes

Route::get('/customer', 'Admin\CustomerController@customer');
Route::post('/customerinsert', 'Admin\CustomerController@customerinsert');
Route::post('/customerinsert2', 'Admin\CustomerController@customerinsert2');
Route::get('/deletecustomer/{id}', 'Admin\CustomerController@deletecustomer');
Route::get('/managecustomer', 'Admin\CustomerController@managecustomer');
Route::get('/editcustomer/{id}', 'Admin\CustomerController@editcustomer');
Route::post('/updatecustomer/{id}', 'Admin\CustomerController@updatecustomer');
Route::get('/customerduelist', 'Admin\CustomerController@customerduelist');
Route::get('/editcustomer/{id}', 'Admin\CustomerController@editcustomer');



// Supplier Information Routes

Route::get('/supplier', 'Admin\SupplierController@supplier');
Route::post('/supplierinsert', 'Admin\SupplierController@supplierinsert');
Route::post('/supplierinsert2', 'Admin\SupplierController@supplierinsert2');
Route::get('/deletesupplier/{id}', 'Admin\SupplierController@deletesupplier');
Route::get('/managesupplier', 'Admin\SupplierController@managesupplier');
Route::get('/editsupplier/{id}', 'Admin\SupplierController@editsupplier');
Route::post('/updatesupplier/{id}', 'Admin\SupplierController@updatesupplier');
Route::get('/supplierduelist', 'Admin\SupplierController@supplierduelist');



// Product Setting

Route::get('/item', 'Admin\ProductController@item');
Route::post('/iteminsert', 'Admin\ProductController@iteminsert');
Route::post('/iteminsert2', 'Admin\ProductController@iteminsert2');
Route::get('/getitem', 'Admin\ProductController@getitem');
Route::get('/deleteitem/{id}', 'Admin\ProductController@deleteitem');
Route::get('/edititem/{id}', 'Admin\ProductController@edititem');
Route::post('/updateitem/{id}', 'Admin\ProductController@updateitem');


Route::get('/category', 'Admin\ProductController@category');
Route::post('/categoryinsert', 'Admin\ProductController@categoryinsert');
Route::post('/categoryinsert2', 'Admin\ProductController@categoryinsert2');

Route::get('/getcategory', 'Admin\ProductController@getcategory');
Route::get('/deletecategory/{id}', 'Admin\ProductController@deletecategory');
Route::get('/editcategory/{id}', 'Admin\ProductController@editcategory');
Route::post('/updatecategory/{id}', 'Admin\ProductController@updatecategory');


Route::get('/subcategory', 'Admin\ProductController@subcategory');
Route::post('/subcategoryinsert', 'Admin\ProductController@subcategoryinsert');
Route::get('/getsubcategory', 'Admin\ProductController@getsubcategory');
Route::get('/deletesubcategory/{id}', 'Admin\ProductController@deletesubcategory');
Route::get('/editsubcategory/{id}', 'Admin\ProductController@editsubcategory');
Route::post('/updatesubcategory/{id}', 'Admin\ProductController@updatesubcategory');



Route::get('/brand', 'Admin\ProductController@brand');
Route::post('/brandinsert', 'Admin\ProductController@brandinsert');
Route::post('/brandinsert2', 'Admin\ProductController@brandinsert2');
Route::get('/getbrand', 'Admin\ProductController@getbrand');
Route::get('/deletebrand/{id}', 'Admin\ProductController@deletebrand');
Route::get('/editbrand/{id}', 'Admin\ProductController@editbrand');
Route::post('/updatebrand/{id}', 'Admin\ProductController@updatebrand');



Route::get('/measurement', 'Admin\ProductController@measurement');
Route::post('/measurementinsert', 'Admin\ProductController@measurementinsert');
Route::get('/getmeasurement', 'Admin\ProductController@getmeasurement');
Route::get('/deletemeasurement/{id}', 'Admin\ProductController@deletemeasurement');
Route::get('/editmeasurement/{id}', 'Admin\ProductController@editmeasurement');
Route::post('/updatemeasurement/{id}', 'Admin\ProductController@updatemeasurement');





//  Product info


Route::get('/product', 'Admin\ProductController@product');
Route::post('/productinsert', 'Admin\ProductController@productinsert');
Route::post('/productinsert2', 'Admin\ProductController@productinsert2');
Route::get('/deleteproduct/{id}', 'Admin\ProductController@deleteproduct');
Route::get('/manageproduct', 'Admin\ProductController@manageproduct');
Route::get('/editproduct/{id}', 'Admin\ProductController@editproduct');
Route::post('/updateproduct/{id}', 'Admin\ProductController@updateproduct');
Route::get('/searchproduct', 'Admin\ProductController@searchproduct');




// Ajax get data

Route::get('/getcatajax/{id}', 'Admin\ProductController@getcatajax');
Route::get('/getsubcatajax/{id}', 'Admin\ProductController@getsubcatajax');
Route::get('/getproductajax/{id}', 'Admin\ProductController@getproductajax');
Route::get('/getsupplierphone/{id}', 'Admin\ProductController@getsupplierphone');
Route::get('/getsalesproductajax/{id}', 'Admin\ProductController@getsalesproductajax');




// Purchase

Route::get('/purchase', 'Admin\PurchaseController@purchase');
Route::get('/purchaseproductcart/{id}', 'Admin\PurchaseController@purchaseproductcart');
Route::get('/purchaseproductcart2/{barcode}', 'Admin\PurchaseController@purchaseproductcart2');
Route::get('/showpurchaseproductcart', 'Admin\PurchaseController@showpurchaseproductcart');
Route::post('qtyupdate/{id}', 'Admin\PurchaseController@qtyupdate');
Route::post('salepriceupdate/{id}', 'Admin\PurchaseController@salepriceupdate');
Route::get('deletepurchasecartproduct/{id}', 'Admin\PurchaseController@deletepurchasecartproduct');
Route::post('/purchasepriceupdate/{id}', 'Admin\PurchaseController@purchasepriceupdate');
Route::post('/purchasepricedicount/{id}', 'Admin\PurchaseController@purchasepricedicount');
Route::post('/purchasecost/{id}', 'Admin\PurchaseController@purchasecost');
Route::post('/purchaseledger', 'Admin\PurchaseController@purchaseledger');
Route::get('/invoicepurchase/{id}', 'Admin\PurchaseController@invoicepurchase');
Route::get('/invoicepurchase2/{id}', 'Admin\PurchaseController@invoicepurchase2');


Route::get('/allpurchaseledger', 'Admin\PurchaseController@allpurchaseledger');
Route::get('/deletepurchaseledger/{id}', 'Admin\PurchaseController@deletepurchaseledger');
Route::get('/searchpurchaseinvoice', 'Admin\PurchaseController@searchpurchaseinvoice');
Route::get('/searchpurchaseinvoice2', 'Admin\PurchaseController@searchpurchaseinvoice2');
Route::get('/allpurchaseledgerreports', 'Admin\PurchaseController@allpurchaseledgerreports');
Route::get('/purchaseledgerreports', 'Admin\PurchaseController@purchaseledgerreports');

Route::get('/purchasepayment', 'Admin\PurchaseController@purchasepayment');
Route::post('/purchasepaymententry', 'Admin\PurchaseController@purchasepaymententry');
Route::get('/purchasepaymentlist', 'Admin\PurchaseController@purchasepaymentlist');
Route::get('/deletepurchaseentry/{id}', 'Admin\PurchaseController@deletepurchaseentry');
Route::get('/editpurchasepaymententry/{id}', 'Admin\PurchaseController@editpurchasepaymententry');
Route::post('/updatepurchasepayment/{id}', 'Admin\PurchaseController@updatepurchasepayment');


Route::get('/getsuplierpreviousdue/{id}', 'Admin\PurchaseController@getsuplierpreviousdue');
Route::get('/getpreviousdues/{id}', 'Admin\PurchaseController@getpreviousdues');





Route::get('/purchasepaymentinvoice/{id}', 'Admin\PurchaseController@purchasepaymentinvoice');

Route::get('/alldraftpurchasepayment', 'Admin\PurchaseController@alldraftpurchasepayment');
Route::get('/deletedraftpurchaseentry/{id}', 'Admin\PurchaseController@deletedraftpurchaseentry');
Route::get('/confirmdraftpurchasepayment/{id}', 'Admin\PurchaseController@confirmdraftpurchasepayment');

Route::get('/supplier_statement', 'Admin\PurchaseController@supplier_statement');





// Purchase Return

Route::get('/purchasereturn', 'Admin\PurchaseController@purchasereturn');
Route::get('/returnpurchaseproductcart/{id}', 'Admin\PurchaseController@returnpurchaseproductcart');
Route::get('/returnpurchaseproductcart2/{id}', 'Admin\PurchaseController@returnpurchaseproductcart2');
Route::post('returnpurchaseledger', 'Admin\PurchaseController@returnpurchaseledger');
Route::get('/allreturnpurchaseledger', 'Admin\PurchaseController@allreturnpurchaseledger');
Route::get('/returninvoicepurchase/{id}', 'Admin\PurchaseController@returninvoicepurchase');
Route::get('/deletereturnpurchaseledger/{id}', 'Admin\PurchaseController@deletereturnpurchaseledger');




Route::get('/showreturnpurchaseproductcart', 'Admin\PurchaseController@showreturnpurchaseproductcart');
Route::get('/deletereturnpurchasecartproduct/{id}', 'Admin\PurchaseController@deletereturnpurchasecartproduct');
Route::post('returnqtyupdatepurchase/{id}', 'Admin\PurchaseController@returnqtyupdatepurchase');
Route::post('/returnpurchasepriceupdatesingle/{id}', 'Admin\PurchaseController@returnpurchasepriceupdatesingle');
Route::post('/returnpurchasepricedicount/{id}', 'Admin\PurchaseController@returnpurchasepricedicount');




// Sales

Route::get('/sales', 'Admin\SalesController@sales');
Route::get('/getcustomerphone/{id}', 'Admin\SalesController@getcustomerphone');
Route::get('/getpreviousdue/{id}', 'Admin\SalesController@getpreviousdue');
Route::get('/salesproductcart/{id}', 'Admin\SalesController@salesproductcart');
Route::get('/salesproductcart2/{barcode}', 'Admin\SalesController@salesproductcart2');
Route::get('/showsalesproductcart', 'Admin\SalesController@showsalesproductcart');
Route::get('deletesalescartproduct/{id}', 'Admin\SalesController@deletesalescartproduct');
Route::post('qtyupdatesales/{id}', 'Admin\SalesController@qtyupdatesales');
Route::post('/product_discount_amount/{id}', 'Admin\SalesController@product_discount_amount');
Route::post('salesledger', 'Admin\SalesController@salesledger');
Route::get('/invoicesales/{id}', 'Admin\SalesController@invoicesales');
Route::get('/invoicesalesa4/{id}', 'Admin\SalesController@invoicesalesa4');
Route::get('/invoicesalesa42/{id}', 'Admin\SalesController@invoicesalesa42');

Route::get('/allsalesledger', 'Admin\SalesController@allsalesledger');
Route::get('/deletesalesledger/{id}', 'Admin\SalesController@deletesalesledger');
Route::get('/searchsalesinvoice', 'Admin\SalesController@searchsalesinvoice');
Route::get('/searchsalesinvoice2', 'Admin\SalesController@searchsalesinvoice2');
Route::get('/allsalesledgerreports', 'Admin\SalesController@allsalesledgerreports');
Route::get('/salesledgerreports', 'Admin\SalesController@salesledgerreports');

Route::get('/salespayment', 'Admin\SalesController@salespayment');
Route::post('/salespaymententry', 'Admin\SalesController@salespaymententry');
Route::get('/getcustomerpreviousdue/{id}', 'Admin\SalesController@getcustomerpreviousdue');
Route::get('/salespaymentlist', 'Admin\SalesController@salespaymentlist');
Route::get('/salespaymentinvoice/{id}', 'Admin\SalesController@salespaymentinvoice');
Route::get('/deletesalesentry/{id}', 'Admin\SalesController@deletesalesentry');

Route::get('/editsalespaymententry/{id}', 'Admin\SalesController@editsalespaymententry');
Route::post('/updatesalespayment/{id}', 'Admin\SalesController@updatesalespayment');

Route::get('/salepriceupdatesingle/{id}', 'Admin\SalesController@salepriceupdatesingle');


Route::get('/alldraftsalespayment', 'Admin\SalesController@alldraftsalespayment');
Route::get('/deletedraftsalespayment/{id}', 'Admin\SalesController@deletedraftsalespayment');
Route::get('/confirmdraftsalespayment/{id}', 'Admin\SalesController@confirmdraftsalespayment');

Route::get('/customer_statement', 'Admin\SalesController@customer_statement');



// Sales Return

Route::get('/salesreturn', 'Admin\SalesController@salesreturn');
Route::get('/returnsalesproductcart/{id}', 'Admin\SalesController@returnsalesproductcart');
Route::get('/returnsalesproductcart2/{id}', 'Admin\SalesController@returnsalesproductcart2');
Route::post('returnsalesledger', 'Admin\SalesController@returnsalesledger');
Route::get('/allreturnsalesledger', 'Admin\SalesController@allreturnsalesledger');
Route::get('/salesreturninvoice/{id}', 'Admin\SalesController@salesreturninvoice');
Route::get('/deletereturnsalesledger/{id}', 'Admin\SalesController@deletereturnsalesledger');




Route::get('/showreturnsalesproductcart', 'Admin\SalesController@showreturnsalesproductcart');
Route::get('/deletereturnsalescartproduct/{id}', 'Admin\SalesController@deletereturnsalescartproduct');
Route::post('returnqtyupdatesales/{id}', 'Admin\SalesController@returnqtyupdatesales');
Route::get('/returnsalepriceupdatesingle/{id}', 'Admin\SalesController@returnsalepriceupdatesingle');
Route::post('/returnsalesproductdiscount/{id}', 'Admin\SalesController@returnsalesproductdiscount');

// Purchase With Sales

Route::get('/purchasewithsales', 'Admin\SalesController@purchasewithsales');
Route::get('/purchasesalesproductcart/{id}', 'Admin\SalesController@purchasesalesproductcart');
Route::get('/purchasesalesproductcart2/{barcode}', 'Admin\SalesController@purchasesalesproductcart2');


Route::get('/showpurchasesalesproductcart', 'Admin\SalesController@showpurchasesalesproductcart');
Route::get('/deletepurchasesalescartproduct/{id}', 'Admin\SalesController@deletepurchasesalescartproduct');
Route::post('qtyupdatesalespurchase/{id}', 'Admin\SalesController@qtyupdatesalespurchase');
Route::get('purchasepriceupdatesingle/{id}', 'Admin\SalesController@purchasepriceupdatesingle');
Route::get('purchasesalepriceupdatesingle/{id}', 'Admin\SalesController@purchasesalepriceupdatesingle');
Route::post('purchasesalesledger', 'Admin\SalesController@purchasesalesledger');


// Draft Sales
Route::get('/alldraftsales', 'Admin\SalesController@alldraftsales');
Route::get('/deletedraftsalesledger/{id}', 'Admin\SalesController@deletedraftsalesledger');
Route::get('/confirmdraftsales/{id}', 'Admin\SalesController@confirmdraftsales');
Route::get('/editdraftsales/{invoice_no}', 'Admin\SalesController@editdraftsales');


// Draft Purchase

Route::get('/alldraftpurchase', 'Admin\PurchaseController@alldraftpurchase');
Route::get('/deletedraftpurchaseledger/{id}', 'Admin\PurchaseController@deletedraftpurchaseledger');
Route::get('/confirmdraftpurchase/{id}', 'Admin\PurchaseController@confirmdraftpurchase');
Route::get('/editdraftpurchase/{invoice_no}', 'Admin\PurchaseController@editdraftpurchase');





// Income Expense Title

Route::get('/income_expensetitle', 'Admin\IncomeExpenseController@income_expensetitle');
Route::post('/income_expensetitleinsert', 'Admin\IncomeExpenseController@income_expensetitleinsert');
Route::get('/getincome_expensetitle', 'Admin\IncomeExpenseController@getincome_expensetitle');
Route::get('/deleteincome_expensetitle/{id}', 'Admin\IncomeExpenseController@deleteincome_expensetitle');
Route::get('/editincome_expensetitle/{id}', 'Admin\IncomeExpenseController@editincome_expensetitle');
Route::post('/updateincome_expensetitle/{id}', 'Admin\IncomeExpenseController@updateincome_expensetitle');


// Income Entry


Route::get('/incomeentry', 'Admin\IncomeExpenseController@incomeentry');
Route::post('/incomeentryinsert', 'Admin\IncomeExpenseController@incomeentryinsert');
Route::get('/getincomeentry', 'Admin\IncomeExpenseController@getincomeentry');
Route::get('/deleteincomeentry/{id}', 'Admin\IncomeExpenseController@deleteincomeentry');
Route::get('/editincomeentry/{id}', 'Admin\IncomeExpenseController@editincomeentry');
Route::post('/updateincomeentry/{id}', 'Admin\IncomeExpenseController@updateincomeentry');




// Expense Entry


Route::get('/expenseentry', 'Admin\IncomeExpenseController@expenseentry');
Route::post('/expenseentryinsert', 'Admin\IncomeExpenseController@expenseentryinsert');
Route::get('/getexpenseentry', 'Admin\IncomeExpenseController@getexpenseentry');
Route::get('/deleteexpenseentry/{id}', 'Admin\IncomeExpenseController@deleteexpenseentry');
Route::get('/editexpenseentry/{id}', 'Admin\IncomeExpenseController@editexpenseentry');
Route::post('/updateexpenseentry/{id}', 'Admin\IncomeExpenseController@updateexpenseentry');



// Stocks
Route::get('/stocks', 'Admin\StockController@stocks');
Route::get('/searchproductstock', 'Admin\StockController@searchproductstock');
Route::get('/stockreports', 'Admin\StockController@stockreports');



// Bank

Route::get('/bankinformation', 'Admin\BankController@bankinformation');
Route::post('/bankinformationinsert', 'Admin\BankController@bankinformationinsert');
Route::get('/getbankinformation', 'Admin\BankController@getbankinformation');
Route::get('/deletebankinformation/{id}', 'Admin\BankController@deletebankinformation');
Route::get('/editbankinformation/{id}', 'Admin\BankController@editbankinformation');
Route::post('/updatebankinformation/{id}', 'Admin\BankController@updatebankinformation');



// Bank Transaction


Route::get('/banktransaction', 'Admin\BankController@banktransaction');
Route::post('/banktransactioninsert', 'Admin\BankController@banktransactioninsert');
Route::get('/managebanktransaction', 'Admin\BankController@managebanktransaction');
Route::get('/deletebanktransaction/{id}', 'Admin\BankController@deletebanktransaction');
Route::get('/editbanktransaction/{id}', 'Admin\BankController@editbanktransaction');
Route::post('/updatebanktransaction/{id}', 'Admin\BankController@updatebanktransaction');
Route::get('/gettotalamount/{id}', 'Admin\BankController@gettotalamount');
Route::get('/banktransactionreports', 'Admin\BankController@banktransactionreports');
Route::get('/bankvoucher/{id}', 'Admin\BankController@bankvoucher');
Route::get('/bankstatement', 'Admin\BankController@bankstatement');
Route::get('/bankstatementreports', 'Admin\BankController@bankstatementreports');



// Employee

Route::get('/employee', 'Admin\EmployeeController@employee');
Route::post('/employeeinsert', 'Admin\EmployeeController@employeeinsert');
Route::get('/deleteemployee/{id}', 'Admin\EmployeeController@deleteemployee');
Route::get('/manageemployee', 'Admin\EmployeeController@manageemployee');
Route::get('/editemployee/{id}', 'Admin\EmployeeController@editemployee');
Route::post('/updateemployee/{id}', 'Admin\EmployeeController@updateemployee');



Route::get('/employeesalarysetup', 'Admin\EmployeeController@employeesalarysetup');
Route::post('/employeesalarysetupinsert', 'Admin\EmployeeController@employeesalarysetupinsert');
Route::get('/getemployeesalarysetup', 'Admin\EmployeeController@getemployeesalarysetup');
Route::get('/deleteemployeesalarysetup/{id}', 'Admin\EmployeeController@deleteemployeesalarysetup');
Route::get('/editemployeesalarysetup/{id}', 'Admin\EmployeeController@editemployeesalarysetup');
Route::post('/updateemployeesalarysetup/{id}', 'Admin\EmployeeController@updateemployeesalarysetup');



Route::get('/employeesalary', 'Admin\EmployeeController@employeesalary');
Route::post('/employeesalaryinsert', 'Admin\EmployeeController@employeesalaryinsert');
Route::get('/deleteemployeesalary/{id}', 'Admin\EmployeeController@deleteemployeesalary');
Route::get('/manageemployeesalary', 'Admin\EmployeeController@manageemployeesalary');
Route::get('/editemployeesalary/{id}', 'Admin\EmployeeController@editemployeesalary');
Route::post('/updateemployeesalary/{id}', 'Admin\EmployeeController@updateemployeesalary');

Route::post('/depositeemployeesalary', 'Admin\EmployeeController@depositeemployeesalary');
Route::get('/getemployeebalance/{id}', 'Admin\EmployeeController@getemployeebalance');



// Barcode

Route::get('/barcode', 'Admin\BarcodeController@barcode');
Route::get('/searchproduct2', 'Admin\BarcodeController@searchproduct2');
Route::get('/generatebarcode', 'Admin\BarcodeController@generatebarcode');


// Damage Products

Route::get('/damageproducts', 'Admin\ProductController@damageproducts');
Route::post('/damageproductsinsert', 'Admin\ProductController@damageproductsinsert');
Route::get('/getdamageproducts', 'Admin\ProductController@getdamageproducts');
Route::get('/deletedamageproducts/{id}', 'Admin\ProductController@deletedamageproducts');
Route::get('/editdamageproducts/{id}', 'Admin\ProductController@editdamageproducts');
Route::post('/updatedamageproducts/{id}', 'Admin\ProductController@updatedamageproducts');


// Cash Close



Route::get('/cashclose', 'Admin\CashcloseController@cashclose');
Route::post('CashCloseSubmit','Admin\CashcloseController@CashCloseSubmit');
Route::post('RecloseCash','Admin\CashcloseController@RecloseCash');



Route::get('CashReport','Admin\CashcloseController@CashReport');
Route::post('CashinexReportView','Admin\CashcloseController@CashinexReportView');


Route::get('/sale_info_view', 'Admin\CashcloseController@sale_info_view');







// loan


Route::get('/loanregister', 'Admin\LoanController@loanregister');
Route::post('/loanregisterinsert', 'Admin\LoanController@loanregisterinsert');
Route::get('/getloanregister', 'Admin\LoanController@getloanregister');
Route::get('/deleteloanregister/{id}', 'Admin\LoanController@deleteloanregister');
Route::get('/editloanregister/{id}', 'Admin\LoanController@editloanregister');
Route::post('/updateloanregister/{id}', 'Admin\LoanController@updateloanregister');


// loanprovide

Route::get('/loanprovide', 'Admin\LoanController@loanprovide');
Route::post('/loanprovideinsert', 'Admin\LoanController@loanprovideinsert');
Route::get('/getloanprovide', 'Admin\LoanController@getloanprovide');
Route::get('/deleteloanprovide/{id}', 'Admin\LoanController@deleteloanprovide');
Route::get('/editloanprovide/{id}', 'Admin\LoanController@editloanprovide');
Route::post('/updateloanprovide/{id}', 'Admin\LoanController@updateloanprovide');
Route::get('/gettotalloan/{register_id}', 'Admin\LoanController@gettotalloan');
Route::get('/loanstatement', 'Admin\LoanController@loanstatement');



// loanprovide

Route::get('/loanreceived', 'Admin\LoanController@loanreceived');
Route::post('/loanreceivedinsert', 'Admin\LoanController@loanreceivedinsert');
Route::get('/getloanreceived', 'Admin\LoanController@getloanreceived');
Route::get('/deleteloanreceived/{id}', 'Admin\LoanController@deleteloanreceived');
Route::get('/editloanreceived/{id}', 'Admin\LoanController@editloanreceived');
Route::post('/updateloanreceived/{id}', 'Admin\LoanController@updateloanreceived');






//internal loan


Route::get('/internalloanregister', 'Admin\LoanController@internalloanregister');
Route::post('/internalloanregisterinsert', 'Admin\LoanController@internalloanregisterinsert');
Route::get('/internalgetloanregister', 'Admin\LoanController@internalgetloanregister');
Route::get('/deleteinternalloanregister/{id}', 'Admin\LoanController@deleteinternalloanregister');
Route::get('/editinternalloanregister/{id}', 'Admin\LoanController@editinternalloanregister');
Route::post('/updateinternalloanregister/{id}', 'Admin\LoanController@updateinternalloanregister');


//internal loanprovide

Route::get('/internalloanprovide', 'Admin\LoanController@internalloanprovide');
Route::post('/internalloanprovideinsert', 'Admin\LoanController@internalloanprovideinsert');
Route::get('/internalgetloanprovide', 'Admin\LoanController@internalgetloanprovide');
Route::get('/deleteinternalloanprovide/{id}', 'Admin\LoanController@deleteinternalloanprovide');
Route::get('/editinternalloanprovide/{id}', 'Admin\LoanController@editinternalloanprovide');
Route::post('/updateinternalloanprovide/{id}', 'Admin\LoanController@updateinternalloanprovide');
Route::get('/gettotalinternalloan/{register_id}', 'Admin\LoanController@gettotalinternalloan');
Route::get('/internalloanstatement', 'Admin\LoanController@internalloanstatement');




//internal loanReceived

Route::get('/internalloanreceived', 'Admin\LoanController@internalloanreceived');
Route::post('/internalloanreceivedinsert', 'Admin\LoanController@internalloanreceivedinsert');
Route::get('/internalgetloanreceived', 'Admin\LoanController@internalgetloanreceived');
Route::get('/deleteinternalloanreceived/{id}', 'Admin\LoanController@deleteinternalloanreceived');
Route::get('/editinternalloanreceived/{id}', 'Admin\LoanController@editinternalloanreceived');
Route::post('/updateinternalloanreceived/{id}', 'Admin\LoanController@updateinternalloanreceived');




// assetcategory


Route::get('/assetcategory', 'Admin\LoanController@assetcategory');
Route::post('/assetcategoryinsert', 'Admin\LoanController@assetcategoryinsert');
Route::get('/deleteassetcategory/{id}', 'Admin\LoanController@deleteassetcategory');
Route::get('/editassetcategory/{id}', 'Admin\LoanController@editassetcategory');
Route::post('/updateassetcategory/{id}', 'Admin\LoanController@updateassetcategory');


// assetcostentry


Route::get('/assetcostentry', 'Admin\LoanController@assetcostentry');
Route::post('/assetcostentryinsert', 'Admin\LoanController@assetcostentryinsert');
Route::get('/deleteassetcostentry/{id}', 'Admin\LoanController@deleteassetcostentry');
Route::get('/editassetcostentry/{id}', 'Admin\LoanController@editassetcostentry');
Route::post('/updateassetcostentry/{id}', 'Admin\LoanController@updateassetcostentry');




// assetdepreciation


Route::get('/assetdepreciation', 'Admin\LoanController@assetdepreciation');
Route::post('/assetdepreciationinsert', 'Admin\LoanController@assetdepreciationinsert');
Route::get('/deleteassetdepreciation/{id}', 'Admin\LoanController@deleteassetdepreciation');
Route::get('/editassetdepreciation/{id}', 'Admin\LoanController@editassetdepreciation');
Route::post('/updateassetdepreciation/{id}', 'Admin\LoanController@updateassetdepreciation');


// librality


Route::get('/librality', 'Admin\IncomeExpenseController@librality');
Route::post('/libralityinsert', 'Admin\IncomeExpenseController@libralityinsert');
Route::get('/deletelibrality/{id}', 'Admin\IncomeExpenseController@deletelibrality');
Route::get('/editlibrality/{id}', 'Admin\IncomeExpenseController@editlibrality');
Route::post('/updatelibrality/{id}', 'Admin\IncomeExpenseController@updatelibrality');





