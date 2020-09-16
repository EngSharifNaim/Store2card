<form method="post" action="{{url('import')}}">
    @csrf
    <input type="file" name="bank">
    <button type="submit"> import</button>

</form>
