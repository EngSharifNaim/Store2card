@extends('layouts.app')
@section('content')
    <div class="content-wrapper" style="min-height: 1200.88px;">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>قائمة المتاجر</h1>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12 col-sm-6 col-md-3">
                        <div class="info-box">
                            <span class="info-box-icon bg-info elevation-1"><i class="nav-icon fa fa-user-circle"></i></span>

                            <div class="info-box-content">
                                <span class="info-box-text">إجمالي المتاجر</span>
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
                                <span class="info-box-text">إجمالي المبيعات</span>
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
                                <span class="info-box-text">إجمالي الديونية</span>
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
                                <span class="info-box-text">إجمالي المدفوعات</span>
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
                                <a href="{{url('add_market')}}" class="btn btn-primary"><i class="nav-icon fa fa-plus"></i> ضافة متجر جديد </a>

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
                                        <th>المالك</th>
                                        <th>الهاتف</th>
                                        <th>العنوان</th>
                                        <th>اجمالي الرصيد</th>
                                        <th>عمليات</th>
                                        <th>تفعيل / الغاء تفعيل</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    @foreach($markets as $market)
                                    <tr id="market_{{$market->id}}">
                                        <td><img class=" img-circle " width="100px" src="{{url('images/' . $market->image)}}" alt="User profile picture"></td>
                                        <td>{{$market->name}}</td>
                                        <td>{{$market->user->name}}</td>
                                        <td><span class="tag tag-success">{{$market->phone}}</span></td>
                                        <td>{{$market->address }}</td>
                                        <td>{{$market->total_balance }} ر.س.</td>
                                        <td>
                                            <button onclick="delete_market({{$market->id}})" class="btn btn-danger" title="حذف زبون">
                                                <i class="nav-icon fa fa-trash text-light"></i>
                                            </button>
                                            <a href="{{url('edit_market/' . $market->id)}}" class="btn btn-primary" title="تعديل بيانات زبون">
                                                <i class="nav-icon fa fa-edit text-light"></i>
                                            </a>
                                            <a href="{{url('market_products/' . $market->id)}}" class="btn btn-warning" title="قائمة الأصناف">
                                                <i class="nav-icon fa fa-shopping-basket text-light"></i>
                                            </a>
                                            <a href="{{url('market_users/' . $market->id)}}" class="btn btn-outline-danger" title="قائمة الزبائن">
                                                <i class="nav-icon fa fa-users"></i>
                                            </a>
                                        </td>
                                        <td>
                                            <form id="activate_form_{{$market->id}}" method="post">
                                                <div class="input-group input-group-sm" style="width: 150px;">
                                                    <select name="state" class="form-control float-right" placeholder="Search">
                                                        <option @if($market->state == 'فعال') selected class="text-success" @endif value="فعال">فعال</option>
                                                        <option @if($market->state == 'غير فعال') selected class="bg-danger" @endif value="غير فعال">غير فعال</option>
                                                    </select>

                                                    <div class="input-group-append">
                                                        <input hidden name="id" value="{{$market->id}}">
                                                        <button type="button" onclick="activate_market({{$market->id}})" class="btn btn-default">حفظ</button>
                                                    </div>
                                                </div>
                                            </form>

                                        </td>
                                    </tr>
                                    <div class="modal fade" id="modal-secondary" style="padding-right: 15px;" aria-modal="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content bg-secondary">
                                                <div class="modal-header">
                                                    <h4 class="modal-title">ارسال اشعار</h4>
                                                </div>
                                                <div class="modal-body">
                                                    <textarea class="form-control">محتوى الاشار</textarea>
                                                </div>
                                                <div class="modal-footer justify-content-between">
                                                    <button type="button" class="btn btn-outline-light" data-dismiss="modal">اغلاق</button>
                                                    <button type="button" class="btn btn-outline-light">ارسال الاشعار</button>
                                                </div>
                                            </div>
                                            <!-- /.modal-content -->
                                        </div>
                                        <!-- /.modal-dialog -->
                                    </div>

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
    function delete_market(id) {
        if(confirm('هل أنت متأكد من حذف المتجر ؟', 'تأكيد الحذف'))
        {
            $.ajax({
                url:'{{url("api/v1/market/delete_market/")}}' + '/' + id,
                method:'get',
                data:  '',
                // dataType:'json',
                contentType: false,
                cache: false,
                processData:false,
                beforeSend:function(){

                },
                success:function(data)
                {
                    alert(data.message)
                    $('#market_' + id).hide('slow')
                },
            })

        }


    }
    function activate_market(id) {
        $.ajax({
            url:'{{url("api/activate_market/")}}',
            method:'post',
            data: new FormData(document.getElementById('activate_form_' + id)),
            // dataType:'json',
            contentType: false,
            cache: false,
            processData:false,
            beforeSend:function(){

            },
            success:function(data)
            {
                alert(data)
            },
        })





    }
</script>
@endsection
