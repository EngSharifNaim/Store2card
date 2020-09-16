@extends('layouts.app')
@section('content')
    <div class="content-wrapper" style="min-height: 1200.88px;">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>قائمة التصنيفات</h1>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12 col-sm-6 col-md-3">
                        <div class="info-box">
                            <span class="info-box-icon bg-info elevation-1"><i class="nav-icon fa fa-user-circle"></i></span>

                            <div class="info-box-content">
                                <span class="info-box-text">All USERS</span>
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
                                <span class="info-box-text">TOTAL DEPT</span>
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
                                <span class="info-box-text">TOTAL SALES</span>
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
                                <span class="info-box-text">TOTAL ORDERS</span>
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
                                <a href="{{url('add_category')}}" class="btn btn-primary"><i class="nav-icon fa fa-plus"></i> ضافة تصنيف جديد </a>

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
                                        <th>الشعار</th>
                                        <th>الاسم</th>
                                        <th>الفئة الأم</th>
                                        <th>عدد المنتجات المضافة</th>
                                        <th></th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    @foreach($categories as $category)
                                    <tr id="category_{{$category->id}}">
                                        <td>
                                            <img class="profile-user-img img-fluid img-circle" @if($category->image == NULL) src="{{url('images/products/cat.jpg')}}" @else src="{{url('images/products/' . $category->image)}}" @endif alt="User profile picture"></td>
                                        <td>{{$category->name}}
                                        <p><small>{{$category->description}}</small></p>
                                        </td>
                                        <td>{{$category->parent }}</td>
                                        <td><span class="tag tag-success">{{$category->product->count()}}</span></td>
                                        <td>
                                            <a onclick="delete_category({{$category->id}})" class="btn btn-danger">
                                                <i class="nav-icon fa fa-trash text-light"></i>
                                            </a>
                                            <a class="btn btn-primary" href="{{url('edit_category/' . $category->id)}}">
                                                <i class="nav-icon fa fa-edit text-light"></i>
                                            </a>
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
        function delete_category(id) {
            var check = confirm('هل أنت متأكد من عملية الحذف؟');
            if(check == true)
            {
                $.ajax({
                    url:'{{url("api/v1/category/delete/")}}' + '/' + id,
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
                        $('#category_' + data.category_id).hide('slow')
                        alert(data.message)
                    },
                })

            }


        }

    </script>

@endsection
