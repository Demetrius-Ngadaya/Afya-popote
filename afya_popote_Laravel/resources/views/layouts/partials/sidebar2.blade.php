<!-- Main Sidebar Container -->
<!--aside class="main-sidebar sidebar-blue-primary elevation-4 "-->
<aside class="main-sidebar sidebar-dark-dark elevation-4 ">
    <!-- Brand Logo -->
    <a href="{{route('customer')}}" class="brand-link">
        <!--img src="" alt="CPSMS" class="brand-image img-circle elevation-3"
             style="opacity: .8"-->
        <center>
            <span class="brand-text font-weight-light">{{ config('app.name') }}</span>
        </center>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
        <!-- Sidebar user (optional) -->
        <div class="user-panel mt-3 pb-3 mb-3 d-flex">
            <div class="image">
            <i class="nav-icon fas fa-user"></i>
                
            </div>
            <div class="info">
                <a href="#" class="d-block">{{ auth()->user()->getFullname() }}</a>
            </div>
        </div>

        <!-- Sidebar Menu -->
        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                <li class="nav-item has-treeview">
                    <a href="{{ route('viewproducts') }}" class="nav-link">
                        <i class="nav-icon fas fa-tachometer-alt"></i>
                        <p>Dashboard</p>
                    </a>
                </li>



                <li class="nav-item">
                    <a href="#" class="nav-link">
                    <i class="nav-icon fas fa-archive"></i>
                        <p>
                            Products
                            <i class="fas fa-angle-left right"></i>

                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                
                        <li class="nav-item has-treeview">
                            <ul>
                                <a href="{{ route('productlist') }}" class="nav-link">
                                <i class="nav-icon fas fa-eye"></i>
                                    <p>View Products</p>
                                </a>
                            </ul>
            
                        </li>
                        <li class="nav-item has-treeview">
                            <ul>
                            <a href="{{ route('purchase.index') }}" class="nav-link {{ activeSegment(' ') }}">
                                <i class="nav-icon fas fa-eye"></i>
                                <p>View Orders</p>
                            </a>
                            </ul>
                        </li>
                    </ul>
                </li>
            
                <li class="nav-item">
                    <a href="#" class="nav-link">
                    <i class="nav-icon fas fa-archive"></i>
                        <p>
                            Payment
                            <i class="fas fa-angle-left right"></i>

                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item has-treeview">
                            <ul>
                            <a href="{{ route('payment.create') }}" class="nav-link {{ activeSegment('  ') }}">
                                <i class="nav-icon fas fa-credit-card"></i>
                                <p>Confirm Payment</p>
                            </a>
                            </ul>
                        </li>
                    </ul>
                </li>
              
</ul>
                            
                
        </nav>
        <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
</aside>
