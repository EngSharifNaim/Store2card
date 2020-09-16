<aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="index3.html" class="brand-link" style="font-family: 'STC Light'">
        <img src="{{url('images/logo.png')}}" alt="Hesab Logo" class="brand-image img-circle elevation-3"
             style="opacity: .8">
        <span class="brand-text font-weight-light">على الحساب</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
        <div>
            <!-- Sidebar user panel (optional) -->
            <div class="user-panel mt-3 pb-3 mb-3 d-flex">
                <div class="image">
                    <img src="{{url('images/myimg.jpg')}}" class="img-circle elevation-2" alt="User Image">
                </div>
                <div class="info">
                    <a href="#" class="d-block">
                        @if(Auth::check())
                            {{Auth::User()->name}}
                        @endif
                    </a>
                </div>
            </div>

            <!-- Sidebar Menu -->
            <nav class="mt-2">
                <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                    <!-- Add icons to the links using the .nav-icon class
                         with font-awesome or any other icon font library -->
                    <li class="nav-item has-treeview menu-open">
                        <a href="{{url('/')}}" class="nav-link active">
                            <i class="nav-icon fa fa-dashboard"></i>
                            <p>
                                القائمة الرئيسية
                            </p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="{{url('/home')}}" class="nav-link">
                            <i class="nav-icon fa fa-th"></i>
                            <p>
                                احصائيات
                            </p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="{{url('test')}}" class="nav-link">
                            <i class="nav-icon fa fa-user"></i>
                            <p>
                                زبائن
                                <span class="right badge badge-danger">{{$users_count}}</span>
                            </p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="{{url('products')}}" class="nav-link">
                            <i class="nav-icon fa fa-shopping-basket"></i>
                            <p>
                                المنتجات
                                <span class="right badge badge-danger">{{$products_count}}</span>
                            </p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="{{url('offers')}}" class="nav-link">
                            <i class="nav-icon fa fa-shopping-basket"></i>
                            <p>
                                عروض خاصة
                                <span class="right badge badge-danger">{{$offers_count}}</span>
                            </p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="{{url('categories')}}" class="nav-link">
                            <i class="nav-icon fa fa-list"></i>
                            <p>
                                تصنيفات
                                <span class="right badge badge-danger">23</span>
                            </p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="{{url('orders')}}" class="nav-link">
                            <i class="nav-icon fa fa-first-order"></i>
                            <p>
                                طلبيات
                                <span class="right badge badge-danger">23</span>
                            </p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="{{url('messages')}}" class="nav-link">
                            <i class="nav-icon fa fa-first-order"></i>
                            <p>
                                رسائل العملاء
                                <span class="right badge badge-danger">23</span>
                            </p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="{{url('sliders')}}" class="nav-link">
                            <i class="nav-icon fa fa-first-order"></i>
                            <p>
                                إعلانات
                                <span class="right badge badge-danger">23</span>
                            </p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="{{url('copons')}}" class="nav-link">
                            <i class="nav-icon fa fa-first-order"></i>
                            <p>
                                كوبونات الخصم
                                <span class="right badge badge-danger">23</span>
                            </p>
                        </a>
                    </li>
                    {{--                        <li class="nav-item">--}}
                    {{--                            <a href="{{url('payments')}}" class="nav-link">--}}
                    {{--                                <i class="nav-icon fa fa-money"></i>--}}
                    {{--                                <p>--}}
                    {{--                                    دفعات--}}
                    {{--                                    <span class="right badge badge-danger">23</span>--}}
                    {{--                                </p>--}}
                    {{--                            </a>--}}
                    {{--                        </li>--}}
                    <li class="nav-item">
                        <a href="{{url('settings')}}" class="nav-link">
                            <i class="nav-icon fa fa-th-list"></i>
                            <p>
                                إعدادات النظام
                            </p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="#" onclick="document.getElementById('logout_form').submit()" class="nav-link">
                            <i class="nav-icon fa fa-sign-out text-warning"></i>
                            <p class="text-warning">
                                خروج
                            </p>
                        </a>
                        <form id="logout_form" method="post" action="{{route('logout')}}">
                            @csrf
                        </form>

                    </li>
                </ul>
            </nav>
            <!-- /.sidebar-menu -->
        </div>
    </div>
    <!-- /.sidebar -->
</aside>
