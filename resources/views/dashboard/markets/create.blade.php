@extends('layouts.app')
@section('content')

    <div class="content-wrapper" style="min-height: 645px;">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h2>إضافة متجر جديد</h2>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-left">
                        <li class="breadcrumb-item"><a href="{{url('markets')}}">قائمة المتاجر</a></li>
                        <li class="breadcrumb-item active">إضافة متجر جديد</li>
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
                        <form id="market_form" action="{{url('api/create_market')}}" method="post">
                            <div class="card-body">
                                <div id="success_div" class="alert alert-success" style="display: none">
                                    لقد تم انشاء المتجر بنجاح
                                </div>

                                <div class="form-group">
                                    <label for="exampleInputEmail1">إسم المتجر</label>
                                    <div class="row">
                                        <div class="col-8">
                                            <input type="text" name="name" class="form-control" placeholder="اسم المتجر">
                                        </div>

                                        <div class="col-4">
                                            <input type="text" name="owner_id" class="form-control" placeholder="رقم صاحب المتجر">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">العنوان</label>
                                    <div class="row">
                                        <div class="col-8">
                                            <input type="text" name="address" class="form-control" placeholder="عنوان المتجر">
                                        </div>

                                        <div class="col-4">
                                            <input type="text" name="phone" class="form-control" placeholder="رقم الهاتف">
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
                                <button type="button" onclick="create_market()" class="btn btn-primary">حفظ <i class="nav-icon fa fa-send"></i></button>
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
        function create_market() {
            $.ajax({
                url:'{{url("api/create_market/")}}',
                method:'post',
                data: new FormData(document.getElementById('market_form')),
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
