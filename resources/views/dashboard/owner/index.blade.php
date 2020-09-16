@extends('layouts.app')
@section('content')
    <div class="content-wrapper" style="min-height: 1200.88px;">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>قائمة الزبائن</h1>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12 col-sm-6 col-md-3">
                        <div class="info-box">
                            <span class="info-box-icon bg-info elevation-1"><i class="nav-icon fa fa-user-circle"></i></span>

                            <div class="info-box-content">
                                <span class="info-box-text">إجمالي الزبائن</span>
                                <span class="info-box-number">
                  {{count($users)}}
                  <small>مستخدم</small>
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
                                <span class="info-box-text">إجمالي المديونية</span>
                                <span class="info-box-number">{{App\Order::all()->sum('total_price') - App\Payment::all()->sum('amount')}}
                                                  <small>ر.س.</small>

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
                            <span class="info-box-icon bg-success elevation-1"><i class="nav-icon fa fa-shopping-basket"></i></span>

                            <div class="info-box-content">
                                <span class="info-box-text">إجمالي المبيعات</span>
                                <span class="info-box-number">{{App\Order::all()->sum('total_price')}}
                                                  <small>ر.س.</small>

                                </span>
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
                                <span class="info-box-text">إجمالي الطلبات</span>
                                <span class="info-box-number">{{App\Order::all()->count()}}
                                                  <small>طلب</small>

                                </span>
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
                                <a href="{{url('add_user')}}" type="button" class="btn btn-primary"><i class="nav-icon fa fa-plus"></i> ضافة زبون جديد </a>

                                <div class="card-tools">
                                    <div class="input-group input-group-sm" style="width: 150px;">
                                        <input type="text" name="table_search" class="form-control float-right" placeholder="Search">

                                        <div class="input-group-append">
                                            <button type="submit" class="btn btn-default"><i class="nav-icon fa fa-search"></i></button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        {{$users->links()}}
                            العدد الكلي : {{count($users)}}
                        <!-- /.card-header -->
                            <div class="card-body table-responsive p-0">
                                <table class="table table-hover text-nowrap">
                                    <thead>
                                    <tr>
                                        <th>الصورة</th>
                                        <th>الاسم</th>
                                        <th>نوع العضوية</th>
                                        <th>رقم الجوال</th>
                                        <th>المديونية</th>
                                        <th>العنوان</th>
                                        <th>عمليات</th>
                                        <th>تفعيل/الغاء تفعيل</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    @foreach($users as $user)
                                        <tr id="user_{{$user->id}}">
                                            <td><img class="profile-user-img img-fluid img-circle" @if($user->image == NULL) src="{{url('images/user.png')}}" @else src="{{url('images/') . '/' . $user->image}}" @endif alt="User profile picture"></td>
                                            <td>{{$user->name}}</td>
                                            <td>{{$user->membership}}</td>
                                            <td>{{$user->mobile ?? 0}}</td>
                                            <td><span class="tag tag-success">{{$user->total_dept ?? 0}}</span></td>
                                            <td>{{$user->address ?? 'غير محدد'}}</td>
                                            <td>
                                                <a class="btn btn-danger" onclick="delete_user({{$user->id}})" title="حذف زبون">
                                                    <i class="nav-icon fa fa-trash text-light"></i>
                                                </a>
                                                {{--                                            <a class="btn btn-primary" href="{{url('edit_user/' . $user->id)}}" title="تعديل بيانات زبون">--}}
                                                {{--                                                <i class="nav-icon fa fa-edit text-light"></i>--}}
                                                {{--                                            </a>--}}
                                                <a href="{{url('user_profile/' . $user->id)}}" class="btn btn-warning" title="الملف الشخصي">
                                                    <i class="nav-icon fa fa-list text-light"></i>
                                                </a>
                                            </td>
                                            <td>
                                                <form id="status_form_{{$user->id}}">
                                                    <div class="input-group input-group-sm" style="width: 150px;">
                                                        <input type="text" hidden name="user_id" value="{{$user->id}}">
                                                        <select name="status" class="form-control float-right" placeholder="Search">
                                                            <option @if($user->status == 1) selected @endif value="1">فعال</option>
                                                            <option @if($user->status == 0) selected @endif value="0">غير فعال</option>
                                                        </select>

                                                        <div class="input-group-append">
                                                            <button type="button" onclick="change_status({{$user->id}})" class="btn btn-default">حفظ</button>
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
        function delete_user(id) {
            var check = confirm('هل أنت متأكد من عملية الحذف؟');
            if(check == true)
            {
                $.ajax({
                    url:'{{url("api/v1/user/delete/")}}' + '/' + id,
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
                        $('#user_' + data.user_id).hide('slow')
                    },
                })

            }


        }
        function  change_status(id)
        {
            $.ajax({
                url:'{{url("api/v1/user/activate_user/")}}',
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
                },
            })
        }
    </script>
@endsection
