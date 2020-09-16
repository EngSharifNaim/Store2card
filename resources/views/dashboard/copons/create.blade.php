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
                            <h3 class="card-title">بيانات المنتج</h3>
                        </div>
                        <!-- /.card-header -->
                        <!-- form start -->
                        <div class="direct-chat-msg right">
                        <form id=user_form" action="{{url('copons/store_cote')}}" method="post" enctype="multipart/form-data">
                            @csrf
                            <div class="card-body">
                                @if(isset($message))
                                <div id="success_div" class="alert alert-success">
                                        {{$message}}
                                </div>
                                @endif

                                <div class="form-group">
                                    <label for="exampleInputEmail1">إسم المنتج</label>
                                    <div class="row">
                                        <div class="col-6">
                                            <input type="text" required name="name" class="form-control" placeholder="اسم الكوتة">
                                        </div>
                                        <div class="col-2">
                                            <input type="number" required name="discount" class="form-control" placeholder="نسبة الخصم">
                                        </div>
                                        <div class="col-2">
                                            <input type="number" required name="copons_count" class="form-control" placeholder="عدد الكوبونات">
                                        </div>

                                    </div>
                                </div>
                            <div class="card-footer">
                                <button type="reset" class="btn btn-primary">جديد <i class="nav-icon fa fa-plus"></i></button>
                                <button type="submit" class="btn btn-primary">حفظ <i class="nav-icon fa fa-send"></i></button>
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
        function create_user() {
            $.ajax({
                url:'{{url("api/v1/user/add_user/")}}',
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
