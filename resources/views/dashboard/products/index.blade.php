@extends('layouts.app')
@section('content')
    <div class="content-wrapper" style="min-height: 1200.88px;">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>قائمة المنتجات @if(isset($market))  - {{$market}} @endif</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-left">
                            <li class="breadcrumb-item"><a href="{{url('markets')}}">قائمة المتاجر</a></li>
                            <li class="breadcrumb-item active">قائمة اصناف متجر</li>
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
                                <a href="{{url('product/create')}}" class="btn btn-primary"><i class="nav-icon fa fa-plus"></i> ضافة منتج جديد </a>
                                @foreach($categories as $category)
                                    <a href="{{url('products/category/' . $category->name)}}" class="btn btn-success"><i class="nav-icon fa fa-search"></i> {{$category->name}} </a>
                                @endforeach

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
                                        <th>الصورة</th>
                                        <th>الاسم</th>
                                        <th>التصنيف</th>
                                        <th>السعر</th>
                                        <th>الحالة</th>
                                        <th></th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    @foreach($products as $product)
                                    <tr id="product_{{$product->id}}">
                                        <td>
                                            <img class="profile-user-img img-fluid img-circle" @if($product->image != NULL) src="{{url('images/products/' . $product->image)}}" @else src="{{url('images/noimage.png')}}" @endif alt="User profile picture"></td>
                                        <td>
                                         <h5>   {{$product->name}}</h5>
                                            <small>{{$product->description}}</small>
                                        </td>
                                        <td>{{$product->category_id }}</td>
                                        <td>{{$product->price }} ر.س.</td>
                                        <td>{{$product->state }}</td>
                                        <td>
                                            <a onclick="delete_product({{$product->id}})" class="btn btn-danger">
                                                <i class="nav-icon fa fa-trash text-light"></i>
                                            </a>
                                            <a href="{{url('products/edit/' . $product->id)}}" class="btn btn-primary">
                                                <i class="nav-icon fa fa-edit text-light"></i>
                                            </a>
                                            @if($product->offer == 1)
                                            <span class="badge badge-danger">عرض خاص</span>
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
