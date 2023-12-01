<!-- Main Sidebar Container -->
<!--aside class="main-sidebar sidebar-blue-primary elevation-4 "-->
<aside class="main-sidebar sidebar-dark-dark elevation-4 ">
    <!-- Brand Logo -->
    <a href="{{route('home')}}" class="brand-link">
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
                    <a href="{{route('home')}}" class="nav-link">
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
                                     <a href="{{ route('products.create') }}" class="nav-link ">
                       <i class="nav-icon fas fa-cart-plus"></i>
                        <p>Add  Products</p>
                    </a>
                    </ul>

                </li>
                                <li class="nav-item has-treeview">
                                    <ul>
                    <a href="{{ route('products.index') }}" class="nav-link">
                    <i class="nav-icon fas fa-eye"></i></i>
                        <p>View Products</p>
                    </a>
                    </ul>
                    
                </li>
                <li class="nav-item has-treeview">
                    <ul>
                    <a href="{{ url('barcode') }}" class="nav-link ">
                     <i class="fas fa-envelope mr-2"></i>
                        <p>Product Barcode</p>
                    </a>
                    </ul>
                </li>
</ul>




                <li class="nav-item">
                            <a href="#" class="nav-link">
                            <i class="nav-icon fas fa-archive"></i>
                                <p>
                                    Sales
                                    <i class="fas fa-angle-left right"></i>

                                </p>
                            </a>
                            <ul class="nav nav-treeview">
                            <li class="nav-item has-treeview">
                                <ul>
                    <a href="{{ route('cart.index') }}" class="nav-link ">
                        <i class="nav-icon fas fa-cart-plus"></i>
                        <p>Record Sales</p>
                    </a>
                    </ul>
                </li>
                <li class="nav-item has-treeview">
                    <ul>
                    <a href="{{ route('orders.index') }}" class="nav-link ">
                        <i class="nav-icon fas fa-cart-plus"></i>
                        <p>View Sales</p>
                    </a>
                    </ul>
                </li>
</ul>


<li class="nav-item">
                            <a href="#" class="nav-link">
                            <i class="nav-icon fas fa-archive"></i>
                                <p>
                                    Return
                                    <i class="fas fa-angle-left right"></i>

                                </p>
                            </a>
                            <ul class="nav nav-treeview">
                            
                <li class="nav-item has-treeview">
                    <ul>
                    <a href="{{ route('customers.index') }}" class="nav-link {{ activeSegment(' ') }}">
                        <i class="nav-icon fas fa-users"></i>
                        <p>Return product</p>
                    </a>
                    </ul>
                </li>
                
                <li class="nav-item has-treeview">
                    <ul>
                    <a href="{{ route('customers.index') }}" class="nav-link {{ activeSegment('  ') }}">
                        <i class="nav-icon fas fa-users"></i>
                        <p>View returned</p>
                    </a>
                    </ul>
                </li>
</ul>



<li class="nav-item">
                            <a href="#" class="nav-link">
                            <i class="nav-icon fas fa-archive"></i>
                                <p>
                                    Customers
                                    <i class="fas fa-angle-left right"></i>

                                </p>
                            </a>
                            <ul class="nav nav-treeview">
                            
                <li class="nav-item has-treeview">
                    <ul>
                    <a href="{{ route('customers.index') }}" class="nav-link {{ activeSegment('  ') }}">
                        <i class="nav-icon fas fa-users"></i>
                        <p>Add Customer</p>
                    </a>
                    </ul>
                </li>
                
                <li class="nav-item has-treeview">
                    <ul>
                    <a href="{{ route('customers.index') }}" class="nav-link {{ activeSegment('  ') }}">
                        <i class="nav-icon fas fa-users"></i>
                        <p>View customers</p>
                    </a>
                    </ul>
                </li>
</ul>
<li class="nav-item">
                            <a href="#" class="nav-link">
                            <i class="nav-icon fas fa-archive"></i>
                                <p>
                                Record Expenses
                                    <i class="fas fa-angle-left right"></i>

                                </p>
                            </a>
                            <ul class="nav nav-treeview">
                            
                            <li class="nav-item has-treeview">
                                <ul>
                    <a href="{{route('Expenditure.create')}}" class="nav-link {{ activeSegment('     ') }}">
                        <i class="nav-icon fas fa-cart-plus"></i>
                        <p>Record Expenses</p>
                    </a>
                    </ul>
                </li>
                <li class="nav-item has-treeview">
                    <ul>
                    <a href="{{ route('Expenditure.index') }}" class="nav-link {{ activeSegment('      ') }}">
                        <i class="nav-icon fas fa-eye"></i></i>
                        <p>View Expenses</p>
                        
                    </a>
                    </ul>
                </li>
</ul>
<li class="nav-item">
                            <a href="#" class="nav-link">
                            <i class="nav-icon fas fa-archive"></i>
                                <p>
                             Reports
                                    <i class="fas fa-angle-left right"></i>

                                </p>
                            </a>
                            <ul class="nav nav-treeview">
                            
                     
                <li class="nav-item has-treeview" class="list-ci">
                    <ul>
                    <a href="{{ url('view-products-charts') }}" class="nav-link {{ activeSegment('      ') }}">
                        <i class="nav-icon fas fa-users"></i>
                        <p>Sales reports</p>
                    </a>
                    </ul>
                </li>
                <li class="nav-item has-treeview">
                    <ul>
                    <a href="{{ url('expenditure-report') }}" class="nav-link {{ activeSegment('     ') }}">
                        <i class="nav-icon fas fa-users"></i>
                        <p>Expenses reports</p>
                    </a>
                    </ul>
                </li>
</ul>
                    

<li class="nav-item">
                            <a href="#" class="nav-link">
                            <i class="nav-icon fas fa-archive"></i>
                                <p>
                                    Setting
                                    <i class="fas fa-angle-left right"></i>

                                </p>
                            </a>
                            <ul class="nav nav-treeview">
                            <li class="nav-item has-treeview">
                                <ul>
                    <a href="{{ route('settings.index') }}" class="nav-link ">
                        <i class="nav-icon fas fa-cart-plus"></i>
                        <p>Set system</p>
                    </a>
                    </ul>
                </li>
                <li class="nav-item has-treeview">
                    <ul>
                    <a href="{{ route('settings.index') }}" class="nav-link">
                        <i class="nav-icon fas fa-cart-plus"></i>
                        <p>Change password</p>
                    </a>
                    </ul>
                </li>
</ul>
                            
                
        </nav>
        <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
</aside>
