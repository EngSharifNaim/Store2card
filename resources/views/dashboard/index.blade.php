@extends('layouts.app')

@section('content')
    <div class="content-wrapper" style="min-height: 645px;">
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0 text-dark">إحصائات عامة</h1>
                    </div><!-- /.col -->
                </div><!-- /.row -->
            </div><!-- /.container-fluid -->
        </div>
        <!-- /.content-header -->

        <!-- Main content -->
        <section class="content">
            <div class="container-fluid">
                <!-- Info boxes -->
                <div class="row">
                    <div class="col-12 col-sm-6 col-md-3">
                        <div class="info-box">
                            <span class="info-box-icon bg-info elevation-1"><i class="fa fa-user"></i></span>

                            <div class="info-box-content">
                                <span class="info-box-text">إجمالي الزباين</span>
                                <span class="info-box-number">
                                    {{App\User::all()->count()}}
                                <small>زبون</small>
                </span>
                            </div>
                            <!-- /.info-box-content -->
                        </div>
                        <!-- /.info-box -->
                    </div>
                    <!-- /.col -->
                    <div class="col-12 col-sm-6 col-md-3">
                        <div class="info-box mb-3">
                            <span class="info-box-icon bg-danger elevation-1"><i class="fa fa-cart-plus"></i></span>

                            <div class="info-box-content">
                                <span class="info-box-text">إجمالي الأصناف</span>
                                <span class="info-box-number">{{App\Product::all()->count()}}
                                                                <small>صنف</small>
                                </span>
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
                            <span class="info-box-icon bg-success elevation-1"><i class="fa fa-money"></i></span>

                            <div class="info-box-content">
                                <span class="info-box-text">إجمالي المبيعات</span>
                                <span class="info-box-number">{{App\Order::all()->sum('total_price')}}
                                <small>ج.م.</small>
                                </span>

                            </div>
                            <!-- /.info-box-content -->
                        </div>
                        <!-- /.info-box -->
                    </div>
                    <!-- /.col -->
                    <div class="col-12 col-sm-6 col-md-3">
                        <div class="info-box mb-3">
                            <span class="info-box-icon bg-warning elevation-1"><i class="fa fa-shopping-cart"></i></span>

                            <div class="info-box-content">
                                <span class="info-box-text">إجمالي الكلبيات</span>
                                <span class="info-box-number">{{App\Order::all()->count()}}</span>
                                <small>طلبية</small>
                            </div>
                            <!-- /.info-box-content -->
                        </div>
                        <!-- /.info-box -->
                    </div>
                    <!-- /.col -->
                </div>
            </div><!--/. container-fluid -->
        </section>
        <!-- /.content -->
    </div>
    <script>
        var myRequest = new XMLHttpRequest();

        myRequest.onreadystatechange = function () {
            console.log(this.status)

            if(this.readyState === 4 && this.status === 200)
            {
                data = this.responseText
                console.log(JSON.parse(data).code)
            }

        }

        myRequest.open('GET','https://joodya.com/hesab/public/api/customer_orders/2',true)
        myRequest.send()
    </script>
@endsection
