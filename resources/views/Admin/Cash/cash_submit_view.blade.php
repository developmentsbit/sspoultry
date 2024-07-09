@if($cash_date==date('Y-m-d'))
<font style="color: green;font-weight:bold;float: right;">You can <a class="btn btn-success" onclick="re_close_cash();"  style="margin-top:2px ">Re-Close</a> Today's Cash.</font><font style="color: red;font-weight:bold;float: right;margin-top: 4px">N.B: You have already Closed today's Cash.</font>

@else
<input type="submit"  class="btn btn-success" style="float: right;margin:5px" value="Submit Cash Close" />
@endif