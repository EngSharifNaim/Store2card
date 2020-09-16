@extends('layouts.app')
@section('content')

    <div class="content-wrapper" style="min-height: 645px;">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h2>إضافة زبون جديد</h2>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-left">
                            <li class="breadcrumb-item"><a href="{{url('users')}}">قائمة لزبائن</a></li>
                            <li class="breadcrumb-item active">إضافة زبون جديد</li>
                        </ol>
                    </div>

                </div>
            </div><!-- /.container-fluid -->
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <!-- left column -->
                    <div class="col-md-12">
                        <!-- general form elements -->
                        <div class="card card-primary">
                            <div class="card-header">
                                <h3 class="card-title">بيانات المتجر</h3>
                            </div>
                            <!-- /.card-header -->
                            <!-- form start -->
                            <div class="direct-chat-msg right">
                                <form id="user_form"  method="post">
                                    @csrf
                                    <div class="card-body">
                                        <div id="success_div" class="alert alert-success" style="display: none">
                                            لقد تم انشاء حساب مستخدم بنجاح
                                        </div>

                                        <div class="form-group">
                                            <label for="exampleInputEmail1">إسم المستخدم</label>
                                            <div class="row">
                                                <div class="col-8">
                                                    <input hidden type="text" required name="user_id" value="{{$user->id}}" class="form-control" >
                                                    <input type="text" required name="name" value="{{$user->name}}" class="form-control" placeholder="اسم الزبون">
                                                </div>

                                                <div class="col-4">
                                                    <select type="text" name="type" class="form-control" placeholder="">
                                                        <option value="0">نوع العضوية</option>
                                                        <option value="عادية">عضوية عادية</option>
                                                        <option value="فضية">عضوية فضية</option>
                                                        <option value="ذهبية">عضوية ذهبية</option>
                                                        <option value="ماسية">عضوية ماسية</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">العنوان</label>
                                            <div class="row">
                                                <div class="col-12">
                                                    <input type="text" required name="address" value="{{$user->address}}" class="form-control" placeholder="العنوان">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">بيانات التواصل</label>
                                            <div class="row">
                                                <div class="col-4">
                                                    <input type="text" name="phone" value="{{$user->phone}}" class="form-control" placeholder="رقم الهاتف">
                                                </div>
                                                <div class="col-4">
                                                    <input type="text" required name="mobile" value="{{$user->mobile}}" class="form-control" placeholder="رقم الجوال">
                                                </div>
                                                <div class="col-4">
                                                    <input type="text" required name="email" value="{{$user->email}}" class="form-control" placeholder="الايميل">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputFile">صورة الشعار</label>
                                            <div class="input-group">
                                                <div class="custom-file">
                                                    <input type="file" name="image" class="custom-file-input" id="exampleInputFile">
                                                    <label class="custom-file-label" for="exampleInputFile">اختر صورة من الجهاز</label>
                                                </div>
                                                <div class="input-group-append">
                                                    <span class="input-group-text" id="">تحميل</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /.card-body -->

                                    <div class="card-footer">
                                        <button type="button" onclick="update_user()" class="btn btn-primary">حفظ <i class="nav-icon fa fa-send"></i></button>
                                    </div>
                                </form>
                            </div>
                            <!-- /.card -->

                            <!-- Form Element sizes -->
                        </div>
                        <!--/.col (left) -->
                        <!-- right column -->
                        <!--/.col (right) -->
                    </div>
                    <!-- /.row -->
                </div><!-- /.container-fluid -->
        </section>
        <!-- /.content -->
    </div>
    <script>
        function update_user() {
            $.ajax({
                url:'{{url("api/v1/user/update_user/")}}',
                method:'post',
                data: new FormData(document.getElementById('user_form')),
                // dataType:'json',
                contentType: false,
                cache: false,
                processData:false,
                beforeSend:function(){

                },
                success:function(data)
                {
                    $('#success_div').show('slow')
                },
            })


        }
    </script>
@endsection
