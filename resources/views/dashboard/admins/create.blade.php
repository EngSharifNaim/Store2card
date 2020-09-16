@extends('layouts.app')
@section('content')

    <div class="content-wrapper" style="min-height: 645px;">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h2>إضافة مدير جديد</h2>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-left">
                        <li class="breadcrumb-item"><a href="{{url('admins')}}">قائمة المدراء</a></li>
                        <li class="breadcrumb-item active">إضافة مدير جديد</li>
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
                            <h3 class="card-title">بيانات المدير</h3>
                        </div>
                        <!-- /.card-header -->
                        <!-- form start -->
                        <div class="direct-chat-msg right">
                        <form id="admin_form" action="{{url('api/create_admin')}}" method="post">
                            @csrf
                            <div class="card-body">
                                <div id="success_div" class="alert alert-success" style="display: none">
                                    لقد تم إضافة مدير بنجاح
                                </div>

                                <div class="form-group">
                                    <label for="exampleInputEmail1">إسم المدير</label>
                                    <div class="row">
                                        <div class="col-12">
                                            <input type="text" name="name" class="form-control" placeholder="اسم المدير">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-6">
                                            <input type="text" name="email" class="form-control" placeholder="الايميل">
                                        </div>
                                        <div class="col-6">
                                            <input type="text" name="password" class="form-control" placeholder="كلمة المرور">
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <!-- /.card-body -->

                            <div class="card-footer">
                                <button type="button" onclick="create_admin()" class="btn btn-primary">حفظ <i class="nav-icon fa fa-send"></i></button>
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
        function create_admin() {
            $.ajax({
                url:'{{url("api/create_admin/")}}',
                method:'post',
                data: new FormData(document.getElementById('admin_form')),
                // dataType:'json',
                contentType: false,
                cache: false,
                processData:false,
                beforeSend:function(){

                },
                success:function(data)
                {
                    if(data)
                    {
                        $('#success_div').show('slow')
                    }

                },
            })


        }
    </script>
@endsection
