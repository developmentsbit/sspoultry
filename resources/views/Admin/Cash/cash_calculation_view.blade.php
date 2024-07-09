
  <table class="table table-bordered table-striped">
    <thead>
      <tr>
        <th>Collection</th>
        <th>Expense</th>
        <th>Current Cash</th>
      </tr>
    </thead>
    <tbody>
        <td>
            {{$cash+$sale+$others+$bank_withdraw+$assets}}
        </td>
        <td>{{$purchase+$salary+$expense+$bank_deposit+$assetswithdraw}}</td>
        <td>{!!($cash+$sale+$others+$bank_withdraw+$assets)-($purchase+$salary+$expense+$bank_deposit+$assetswithdraw) !!}</td>
    </tbody>
  </table>
