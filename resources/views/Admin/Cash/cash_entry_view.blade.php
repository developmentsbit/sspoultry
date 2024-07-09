
  <table class="table table-bordered table-striped">
    <thead>
      <tr>
        <th>Date</th>
        <th>Cash Ammount</th>
        <th>Comment</th>
      </tr>
    </thead>
    <tbody>
        <td>{{date('Y-m-d')}}<input type="hidden" name="date" value="{{date('Y-m-d')}}"></td>
        <td>
            {!! ($cash+$sale+$others+$bank_withdraw+$assets)-($purchase+$salary+$expense+$bank_deposit+$assetswithdraw) !!}<input type="hidden" name="cash" value="{!! ($cash+$sale+$others+$bank_withdraw+$assets)-($purchase+$salary+$expense+$bank_deposit+$assetswithdraw) !!}">
        </td>
        <td><input type="text" name="comment"></td>
    </tbody>
  </table>