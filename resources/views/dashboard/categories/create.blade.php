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
                                <h3 class="card-title">إضافة تصنيف جديد</h3>
                            </div>
                            <!-- /.card-header -->
                            <!-- form start -->
                            <form action="{{url('categories')}}" method="post" enctype="multipart/form-data">
                                @csrf
                                @if(isset($message))
                                    <div class="alert alert-success alert-dismissible">
                                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                                        <h5><i class="icon fa fa-check"></i></h5>
                                        لقد تم اضافة التصنيف بنجاح ,
                                    </div>
                                    @endif
                                <div class="card-body">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">الإسم</label>
                                        <input required type="text" name="name" class="form-control" id="exampleInputEmail1" placeholder="اسم التصنيف">
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">وصف</label>
                                        <textarea required name="description" class="form-control"></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputFile">صورة</label>
                                        <div class="input-group">
                                            <div class="custom-file">
                                                <input type="file" name="image" class="custom-file-input" id="exampleInputFile">
                                                <label class="custom-file-label" for="exampleInputFile">اختر صورة للتحميل</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- /.card-body -->

                                <div class="card-footer">
                                    <button type="submit" class="btn btn-primary">حفظ</button>
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
@endsection

