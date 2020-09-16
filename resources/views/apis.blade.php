@extends('layouts.app')

@section('content')
    <div class="content-wrapper" style="min-height: 645px;">
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0 text-dark">APIs</h1>
                    </div><!-- /.col -->
                </div><!-- /.row -->
            </div><!-- /.container-fluid -->
        </div>
        <!-- /.content-header -->
<div class="container-fluid">
    <div class="row">
    <div class="col-md-6">
        <div class="card">
            <div class="card-header">
                <h3 class="card-title">
                    http://hesab.com/api/get_market/{market id} [GET]
                </h3>
            </div>
            <!-- /.card-header -->
            <div class="card-body" dir="ltr" style="text-align: left">
                <blockquote>
                    <p dir="ltr">This API return the data of market .</p>
                    <small dir="ltr" style="text-align: left;font-family: 'Courier New', Courier, monospace">
                    </small>
                </blockquote>
            </div>
            <!-- /.card-body -->
        </div>
        <!-- /.card -->
    </div>
    <!-- ./col -->
    <div class="col-md-6">
        <div class="card">
            <div class="card-header">
                <h3 class="card-title">
                    http://hesab.com/api/get_markets [GET]
                </h3>
            </div>
            <!-- /.card-header -->
            <div class="card-body" dir="ltr" style="text-align: left">
                <blockquote>
                    <p dir="ltr">This API return list of all available markets .</p>
                    <small dir="ltr" style="text-align: left;font-family: 'Courier New', Courier, monospace">
                    </small>
                </blockquote>
            </div>
            <!-- /.card-body -->
        </div>
        <!-- /.card -->
    </div>
    <!-- ./col -->
</div>
    <div class="row">
    <div class="col-md-6">
        <div class="card">
            <div class="card-header">
                <h3 class="card-title">
                    http://hesab.com/api/create_market [POST]
                </h3>
            </div>
            <!-- /.card-header -->
            <div class="card-body" dir="ltr" style="text-align: left">
                <blockquote>
                    <p dir="ltr">This API return the data of market .</p>
                    <small dir="ltr" style="text-align: left;font-family: 'Courier New', Courier, monospace">
                    </small>
                </blockquote>
            </div>
            <!-- /.card-body -->
        </div>
        <!-- /.card -->
    </div>
    <!-- ./col -->
    <div class="col-md-6">
        <div class="card">
            <div class="card-header">
                <h3 class="card-title">
                    http://hesab.com/api/delete_market/{market id} [GET]
                </h3>
            </div>
            <!-- /.card-header -->
            <div class="card-body" dir="ltr" style="text-align: left">
                <blockquote>
                    <p dir="ltr">This API return list of all available markets .</p>
                    <small dir="ltr" style="text-align: left;font-family: 'Courier New', Courier, monospace">
                    </small>
                </blockquote>
            </div>
            <!-- /.card-body -->
        </div>
        <!-- /.card -->
    </div>
    <!-- ./col -->
</div>
</div>
    </div>
    @endsection
