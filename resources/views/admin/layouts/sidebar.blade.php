    <!-- Main Sidebar Container -->
    <aside class="main-sidebar sidebar-dark-primary elevation-4">
      <!-- Brand Logo -->
      <a href="index3.html" class="brand-link">
        <img src="{{ asset('admin') }}/dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3"
          style="opacity: .8">
        <span class="brand-text font-weight-light">SIG Gizi Buruk</span>
      </a>

      <!-- Sidebar -->
      <div class="sidebar">
        <!-- Sidebar Menu -->
        <nav class="mt-2">
          <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">

            <li class="nav-item">
              <a href="{{route('admin.dashboard')}}" class="nav-link">
                <i class="nav-icon fas fa-tachometer-alt"></i>
                <p>
                  Dashboard
                </p>
              </a>
            </li>

            <li class="nav-item">
              <a href="{{route('admin.datatahun.index')}}" class="nav-link">
                <i class="nav-icon fas fa-table"></i>
                <p>
                  Data Gizi Buruk
                </p>
              </a>
            </li>

            <li class="nav-item">
              <a href="{{route('admin.kecamatan.index')}}" class="nav-link">
                <i class="nav-icon fas fa-table"></i>
                <p>
                  Kecamatan
                </p>
              </a>
            </li>

            <li class="nav-item">
              <a href="{{route('admin.peta')}}" class="nav-link">
                <i class="nav-icon far fa-map"></i>
                <p>
                  Peta
                </p>
              </a>
            </li>

            <li class="nav-item">
              <a href="{{route('admin.grafik')}}" class="nav-link">
                <i class="nav-icon fas fa-chart-bar"></i>
                <p>
                  Grafik
                </p>
              </a>
            </li>
          </ul>
        </nav>
        <!-- /.sidebar-menu -->
      </div>
      <!-- /.sidebar -->
    </aside>
