@extends('layouts.app')
@section('content')
    <div class="content-wrapper" style="min-height: 1200.88px;">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>قائمة الدفعات المالية</h1>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12 col-sm-6 col-md-3">
                        <div class="info-box">
                            <span class="info-box-icon bg-info elevation-1"><i class="nav-icon fa fa-user-circle"></i></span>

                            <div class="info-box-content">
                                <span class="info-box-text">عدد الدفعالت</span>
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
                                <span class="info-box-text">عدد الزبائن</span>
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
                                <span class="info-box-text">عدد المتاجر</span>
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
            <div class="card card-info">
                <div class="card-header">
                    <h3 class="card-title">إعدادات النظام</h3>
                </div>
                <!-- /.card-header -->
                <!-- form start -->
                <form class="form-horizontal">
                    <div class="card-body">
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-2 control-label">عناون التطبيق</label>

                            <div class="col-sm-10">
                                <input type="text" name="title" class="form-control" id="inputEmail3" placeholder="عنوان التطبيق">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-2 control-label">عن كابوتشا</label>

                            <div class="col-sm-10">
                                <textarea class="form-control" rows="5" placeholder="عن كابوتشا"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-2 control-label">ضمان الجودة</label>

                            <div class="col-sm-10">
                                <textarea class="form-control" rows="5" placeholder="ضمان الجودية"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-2 control-label">رؤيتنا</label>

                            <div class="col-sm-10">
                                <textarea class="form-control" rows="5" placeholder="رؤيتنا"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-2 control-label">شعار التطبيق</label>

                            <div class="col-sm-10">
                                <input type="file" class="form-control">
                            </div>
                        </div>
                    </div>
                    <!-- /.card-body -->
                    <div class="card-footer">
                        <button type="submit" class="btn btn-info">حفظ التغييرات</button>
                    </div>
                    <!-- /.card-footer -->
                </form>
            </div>
        </section>
        <!-- /.content -->
    </div>    @endsection
