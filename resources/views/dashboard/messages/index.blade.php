@extends('layouts.app')
@section('content')
    <div class="content-wrapper" style="min-height: 594px;">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>الرسائل الواردة</h1>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="row">
                <!-- /.col -->
                <div class="col-md-12">
                    <div class="card card-primary card-outline">
                        <div class="card-header">
                            <h3 class="card-title">اقائمة الرسائل</h3>

                            <div class="card-tools">
                                <div class="input-group input-group-sm">
                                    <input type="text" class="form-control" placeholder="بحث">
                                    <div class="input-group-append">
                                        <div class="btn btn-primary">
                                            <i class="fa fa-search"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /.card-tools -->
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body p-0">
                            <div class="mailbox-controls">
                                <!-- Check all button -->
                                <button type="button" class="btn btn-default btn-sm checkbox-toggle"><i class="fa fa-square-o"></i>
                                </button>
                                <div class="btn-group">
                                    <button type="button" class="btn btn-default btn-sm"><i class="fa fa-trash-o"></i></button>
                                    <button type="button" class="btn btn-default btn-sm"><i class="fa fa-reply"></i></button>
                                    <button type="button" class="btn btn-default btn-sm"><i class="fa fa-share"></i></button>
                                </div>
                                <!-- /.btn-group -->
                                <button type="button" class="btn btn-default btn-sm"><i class="fa fa-refresh"></i></button>
                                <div class="float-left">
                                    {{$messages->links()}}
                                </div>
                                <!-- /.float-right -->
                            </div>
                            <div class="table-responsive mailbox-messages">
                                <table class="table table-hover table-striped">
                                    <tbody>
                                    <tr>
                                        <td><div class="icheckbox_flat-blue" aria-checked="false" aria-disabled="false" style="position: relative;"><input type="checkbox" style="position: absolute; opacity: 0;"><ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"></ins></div></td>
                                        <td class="mailbox-name">اسم المرسل</td>
                                        <td class="mailbox-name">رقم الموبايل</td>
                                        <td class="mailbox-subject">عناون الرسالة
                                        </td>
                                        <td class="mailbox-attachment">محتوى الرسالة</td>
                                        <td class="mailbox-date">وقت الارسال</td>
                                    </tr>
                                    @foreach($messages as $message)
                                    <tr>
                                        <td><div class="icheckbox_flat-blue" aria-checked="false" aria-disabled="false" style="position: relative;"><input type="checkbox" style="position: absolute; opacity: 0;"><ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"></ins></div></td>
                                        <td class="mailbox-name">{{$message->name}}</td>
                                        <td class="mailbox-name">{{$message->mobile}}</td>
                                        <td class="mailbox-subject">{{$message->title}}</td>
                                        <td class="mailbox-attachment">{{$message->body}}</td>
                                        <td class="mailbox-date">{{$message->created_at->diffForHumans()}}</td>
                                    </tr>
                                        @endforeach
                                    </tbody>
                                </table>
                                <!-- /.table -->
                            </div>
                            <!-- /.mail-box-messages -->
                        </div>
                        <!-- /.card-body -->
                        <div class="card-footer p-0">
                            <div class="mailbox-controls">
                                <!-- Check all button -->
                                <!-- /.btn-group -->
                                <button type="button" class="btn btn-default btn-sm"><i class="fa fa-refresh"></i></button>
                                <div class="float-left">
                                    <!-- /.btn-group -->
                                </div>
                                <!-- /.float-right -->
                            </div>
                        </div>
                    </div>
                    <!-- /. box -->
                </div>
                <!-- /.col -->
            </div>
            <!-- /.row -->
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
