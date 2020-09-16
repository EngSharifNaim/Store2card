@extends('layouts.app')
@section('content')
    <div class="content-wrapper" style="min-height: 645px;">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>الملف الشخصي</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-left">
                            <li class="breadcrumb-item"><a href="{{url('users')}}">قائمة الزبائن</a></li>
                            <li class="breadcrumb-item active">ملف شخصي</li>
                        </ol>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-3">

                        <!-- Profile Image -->
                        <div class="card card-primary card-outline">
                            <div class="card-body box-profile">
                                <div class="text-center">
                                    <img class="profile-user-img img-fluid img-circle" src="{{url('images/myimg.jpg')}}" alt="User profile picture">
                                </div>

                                <h3 class="profile-username text-center">{{$user->name}}</h3>

                                <p class="text-muted text-center">تاريخ الانضمام</p>
                                <p class="text-muted text-center small">{{$user->created_at}}</p>

                                <div class="card-footer bg-white p-0">
                                    <ul class="nav nav-pills flex-column">
                                        <li class="nav-item">
                                            <a href="#" class="nav-link">
                                                إجمالي المشتريات
                                                <span class="float-left text-danger">
                                                <i class="fa fa-money text-sm"></i>
                                                {{$user->order->sum('total_price')}}</span>
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a href="#" class="nav-link">
                                                عدد الطلبات
                                                <span class="float-left text-danger">
                                                <i class="fa fa-money text-sm"></i>
                                                {{$user->payment->sum('amount')}}</span>
                                            </a>
                                        </li>
                                    </ul>
                                </div>

                                <a href="#" class="btn btn-primary btn-block"><b>إرسال إشعار</b></a>
                            </div>
                            <!-- /.card-body -->
                        </div>
                        <!-- /.card -->

                        <!-- About Me Box -->
                        <div class="card card-primary">
                            <div class="card-header">
                                <h3 class="card-title">أكثر الأصناف طلباً</h3>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                                @foreach($user->contract as $contract)
                                <strong><i class="fa fa-book mr-1"></i> {{$contract->market->name}}</strong>

                                    <li class="nav-item">
                                        <p href="#" class="nav-link">
                                            سقف المديونية
                                            <span class="float-left text-success">
                                            <i class="fa fa-money text-sm"></i> {{$contract->max_amount}} ر.س.
                                            </span>
                                        </p>
                                        <p href="#" class="nav-link">
                                            المديونية الحالية
                                            <span class="float-left text-success">
                                            <i class="fa fa-money text-sm"></i> {{$contract->current_amount}} ر.س.
                                            </span>
                                        </p>
                                    </li>
                                    @endforeach

                            </div>
                            <!-- /.card-body -->
                        </div>
                        <!-- /.card -->
                    </div>
                    <!-- /.col -->
                    <div class="col-md-9">
                        <div class="card">
                            <div class="card-header">
                                <h3 class="card-title">قائمة الطلبيات</h3>

                                <div class="card-tools">
                                    {{$orders->links()}}
                                </div>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body p-0">
                                <table class="table">
                                    <tbody><tr>
                                        <th style="width: 10px">#</th>
                                        <th>الوقت</th>
                                        <th>ألحالة</th>
                                        <th >إجمالي السعر</th>
                                        <th >حالة الطلب</th>
                                    </tr>
                                    @foreach(\App\Order::all() as $order)
                                    <tr>
                                        <td>{{$order->id}}</td>
                                        <td>{{$order->created_at}}</td>
                                        <td id="status_{{$order->id}}">
                                            قيد التجهيز
                                        </td>
                                        <td><span class="badge bg-danger">{{$order->total_price}} ج.م.</span></td>
                                        <td>
                                            <div class="input-group">
                                            <select class="form-control">
                                                <option>انتظار</option>
                                                <option>قيد التجهيز</option>
                                                <option>قيد التوصيل</option>
                                                <option>تم التسليم</option>
                                            </select>
                                            <button class="btn btn-primary">حفظ</button>
                                            </div>
                                        </td>
                                    </tr>
                                        @endforeach
                                    </tbody></table>
                            </div>
                            <!-- /.card-body -->
                        </div>                        <!-- /.nav-tabs-custom -->
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->
            </div><!-- /.container-fluid -->
        </section>
        <!-- /.content -->
    </div>
    <script>
        function pay_order(id) {
            $.ajax({
                url:'{{url("api/pay_order/")}}' + '/' + id,
                method:'get',
                // data: new FormData(document.getElementById('market_form')),
                // dataType:'json',
                contentType: false,
                cache: false,
                processData:false,
                beforeSend:function(){

                },
                success:function(data)
                {
                    $('#pay_' + id).attr('class','btn btn-dark');
                    $('#pay_' + id).html('الغاء التسديد');
                    $('#status_' + id).html(data.order.status);
                },
            })


        }
        function cancel_pay(id) {
            $.ajax({
                url:'{{url("api/cancel_pay/")}}' + '/' + id,
                method:'get',
                // data: new FormData(document.getElementById('market_form')),
                // dataType:'json',
                contentType: false,
                cache: false,
                processData:false,
                beforeSend:function(){

                },
                success:function(data)
                {
                    $('#cancel_' + id).attr('class','btn btn-success');
                    $('#cancel_' + id).html('تسديد');
                    $('#status_' + id).html(data.order.status);
                },
            })


        }
        function process_order(id) {
            $.ajax({
                url:'{{url("api/process_order/")}}' + '/' + id,
                method:'get',
                // data: new FormData(document.getElementById('market_form')),
                // dataType:'json',
                contentType: false,
                cache: false,
                processData:false,
                beforeSend:function(){

                },
                success:function(data)
                {
                    $('#process_' + id).attr('class','btn btn-success');
                    $('#process_' + id).html('تسديد');
                    $('#status_' + id).html(data.order.status);
                },
            })


        }
function change_state(id) {
        if(document.getElementById('state_' + id).html == 'فعال\n' +
            '                                                <i class="nav-icon fa fa-check text-light"></i>')
        {
            document.getElementById('state_' + id).html == 'غير فعال\n' +
            '                                                <i class="nav-icon fa fa-check text-light"></i>'
        }
        else
        {
            document.getElementById('state_' + id).html == 'فعال<i class="nav-icon fa fa-check text-light"></i>'
        }

    }
</script>
@endsection
