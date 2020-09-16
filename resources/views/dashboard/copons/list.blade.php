@extends('layouts.app')
@section('content')
    <div class="content-wrapper" style="min-height: 1200.88px;">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>قائمة كوبونات الخصم </h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-left">
                            <li class="breadcrumb-item"><a href="{{url('copons')}}">قائمة الكوتات</a></li>
                            <li class="breadcrumb-item active">مجموعات الكوبونات</li>
                        </ol>
                    </div>

                </div>
                <div class="row">
                    <div class="col-12 col-sm-6 col-md-3">
                        <div class="info-box">
                            <span class="info-box-icon bg-info elevation-1"><i class="nav-icon fa fa-user-circle"></i></span>

                            <div class="info-box-content">
                                <span class="info-box-text">إجمالي عدد المنتجات</span>
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
                                <span class="info-box-text">إجمالي مبيعات الاصناف</span>
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
                                <span class="info-box-text">أقل سعر</span>
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
                                <span class="info-box-text">أعلى سعر</span>
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
                                <a href="{{url('copons/used')}}" class="btn btn-primary"><i class="nav-icon fa fa-archive"></i> كوبونات مستخدمة </a>

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
                                        <th>رقم الكوبون</th>
                                        <th>الكود</th>
                                        <th>الحالة</th>
                                        <th>المستخدم</th>
                                        <th>عمليات</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    @foreach($copons as $copon)
                                    <tr id="category_{{$copon->id}}">
                                        <td>
                                            {{$copon->id}}
                                        </td>
                                        <td>
                                         <h5>   {{$copon->code}}</h5>
                                        </td>

                                        <td>{{$copon->status}}</td>
                                        <td>{{$copon->user_id}}</td>
                                        <td>
{{--                                            <a onclick="delete_category({{$copon->id}})" class="btn btn-danger">--}}
{{--                                                <i class="nav-icon fa fa-trash text-light"></i>--}}
{{--                                            </a>--}}
{{--                                            <a href="{{url('copon_category/edit/' . $copon->id)}}" class="btn btn-primary">--}}
{{--                                                <i class="nav-icon fa fa-edit text-light"></i>--}}
{{--                                            </a>--}}
                                            @if($copon->status == 0)
                                            <a class="btn btn-warning">
                                                <i class="nav-icon fa fa-stop text-light"></i>
                                                فعال
                                            </a>
                                                @else
                                                <a class="btn btn-dark text-white">
                                                    <i class="nav-icon fa fa-play"></i>
                                                    غير فعال
                                                </a>
                                            @endif
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
    function delete_product(id) {
        var check = confirm('هل أنت متأكد من عملية الحذف؟');
        if(check == true)
        {
            $.ajax({
                url:'{{url("api/v1/product/delete/")}}' + '/' + id,
                method:'get',
                // data:  new FormData(document.getElementById('status_form_' + id)),
                // dataType:'json',
                contentType: false,
                cache: false,
                processData:false,
                beforeSend:function(){

                },
                success:function(data)
                {
                    $('#product_' + data.product_id).hide('slow')
                },
            })

        }


    }

</script>
@endsection
