@extends('layouts.app')
@section('content')
    <div class="content-wrapper" style="min-height: 1200.88px;">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>قائمة الطلبات</h1>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12 col-sm-6 col-md-3">
                        <div class="info-box">
                            <span class="info-box-icon bg-info elevation-1"><i class="nav-icon fa fa-user-circle"></i></span>

                            <div class="info-box-content">
                                <span class="info-box-text">إجمالي الطلبات</span>
                                <span class="info-box-number">
                  10
                  <small>%</small>
                </span>
                            </div>
                            <!-- /.info-box-content -->
                        </div>
                        <!-- /.info-box -->
                    </div>
                    <!-- /.col -->
                    <div class="col-12 col-sm-6 col-md-3">
                        <div class="info-box mb-3">
                            <span class="info-box-icon bg-danger elevation-1"><i class="nav-icon fa fa-money"></i></span>

                            <div class="info-box-content">
                                <span class="info-box-text">إجمالي المبالغ</span>
                                <span class="info-box-number">41,410</span>
                            </div>
                            <!-- /.info-box-content -->
                        </div>
                        <!-- /.info-box -->
                    </div>
                    <!-- /.col -->

                    <!-- fix for small devices only -->
                    <div class="clearfix hidden-md-up"></div>

                    <div class="col-12 col-sm-6 col-md-3">
                        <div class="info-box mb-3">
                            <span class="info-box-icon bg-success elevation-1"><i class="nav-icon fa fa-shopping-basket"></i></span>

                            <div class="info-box-content">
                                <span class="info-box-text">نسبة الأصناف المتوفرة</span>
                                <span class="info-box-number">760</span>
                            </div>
                            <!-- /.info-box-content -->
                        </div>
                        <!-- /.info-box -->
                    </div>
                    <!-- /.col -->
                    <div class="col-12 col-sm-6 col-md-3">
                        <div class="info-box mb-3">
                            <span class="info-box-icon bg-warning elevation-1"><i class="nav-icon fa fa-shopping-bag"></i></span>

                            <div class="info-box-content">
                                <span class="info-box-text">نسبة الأصناف الغير متوفرة</span>
                                <span class="info-box-number">2,000</span>
                            </div>
                            <!-- /.info-box-content -->
                        </div>
                        <!-- /.info-box -->
                    </div>
                    <!-- /.col -->
                </div>
            </div><!-- /.container-fluid -->
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="container-fluid">
                <!-- /.row -->
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <a href="{{url('orders')}}" class="btn btn-primary"><i class="nav-icon fa fa-send"></i> انتظار </a>
                                <a href="{{url('orders/1')}}" class="btn btn-primary"><i class="nav-icon fa fa-warning"></i> قيد التجهيز </a>
                                <a href="{{url('orders/2')}}" class="btn btn-primary"><i class="nav-icon fa fa-warning"></i> قيد التوصيل </a>
                                <a href="{{url('orders/3')}}" class="btn btn-primary"><i class="nav-icon fa fa-warning"></i> تم التسليم </a>

                                <div class="card-tools">
                                    <div class="input-group input-group-sm" style="width: 150px;">
                                        <input type="text" name="table_search" class="form-control float-right" placeholder="Search">

                                        <div class="input-group-append">
                                            <button type="submit" class="btn btn-default"><i class="nav-icon fa fa-search"></i></button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body table-responsive p-0">
                                <table class="table table-hover text-nowrap">
                                    <thead>
                                    <tr>
                                        <th>رقم الطلب</th>
                                        <th>الزبون</th>
                                        <th>وقت الطلب</th>
                                        <th>فترة التوصيل</th>
                                        <th>اجمالي الطلب</th>
                                        <th>الاتصال قبل الارسال</th>
                                        <th>أصناف الطلبية</th>
                                        <th>تغيير الحالة</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    @foreach($orders as $order)
                                    <tr id="order_{{$order->id}}">
                                        <td>#{{$order->id}}</td>
                                        <td>{{$order->user->name}}</td>
                                        <td>{{$order->created_at }}</td>
                                        <td>{{$order->day . ' - ' . $order->time }}</td>
                                        <td>{{$order->total_price }}</td>
                                        <td>@if($order->callme == 1)نعم @else لا @endif</td>

                                        <td>
                                            @foreach($order->details as $item)
                                                {{'المنتج : ' . $item->product_name . ' الكمية : ' . $item->quantity. ' السعر : ' . $item->price }}
                                                <br>
                                                @endforeach
                                        </td>
                                        <td>
                                            <form id="status_form_{{$order->id}}">
                                                <div class="input-group input-group-sm" style="width: 150px;">
                                                    <input type="text" hidden name="order_id" value="{{$order->id}}">
                                                    <select name="status" class="form-control float-right" placeholder="Search">
                                                        <option @if($order->status == 'انتظار') selected @endif value="0">انتظار</option>
                                                        <option @if($order->status == 'قيد التجهيز') selected @endif value="1">قيد التجهيز</option>
                                                        <option @if($order->status == 'قيد التوصيل') selected @endif value="2">قيد التوصيل</option>
                                                        <option @if($order->status == 'تم الاتسليم') selected @endif value="3">تم الاتسليم</option>
                                                    </select>

                                                    <div class="input-group-append">
                                                        <button type="button" onclick="change_status({{$order->id}})" class="btn btn-default">حفظ</button>
                                                    </div>
                                                </div>
                                            </form>

                                        </td>
                                    </tr>
                                        @endforeach
                                    </tbody>
                                </table>
                            </div>
                            <!-- /.card-body -->
                        </div>
                        <!-- /.card -->
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>
        <!-- /.content -->
    </div>
<script>
    function  change_status(id)
    {
        $.ajax({
            url:'{{url("api/v1/order/status/")}}',
            method:'post',
            data:  new FormData(document.getElementById('status_form_' + id)),
            // dataType:'json',
            contentType: false,
            cache: false,
            processData:false,
            beforeSend:function(){

            },
            success:function(data)
            {
                alert(data.message)
                $('#order_' + data.order_id).hide('slow')
            },
        })
    }

</script>
@endsection
