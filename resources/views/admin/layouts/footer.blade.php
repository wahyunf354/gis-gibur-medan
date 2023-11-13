
    <!-- Control Sidebar -->
    <aside class="control-sidebar control-sidebar-dark">
      <!-- Control sidebar content goes here -->
      <div class="p-3">
        <h5>Title</h5>
        <p>Sidebar content</p>
      </div>
    </aside>
    <!-- /.control-sidebar -->

    <!-- Main Footer -->
    <footer class="main-footer">
      <!-- To the right -->
      <div class="float-right d-none d-sm-inline">
        <a href="https://dinkes.pemkomedan.go.id/">Dinas Kesehatan Kota Medan</a>
      </div>
      <!-- Default to the left -->
      <strong>Copyright &copy; 2024 <a href="https://www.unimed.ac.id/">Universitas Negeri Medan</a>.</strong>
    </footer>
  </div>
  <!-- ./wrapper -->

  <!-- REQUIRED SCRIPTS -->
  <!-- jQuery -->
  <script src="{{asset('admin')}}/plugins/jquery/jquery.min.js"></script>
  <!-- Bootstrap 4 -->
  <script src="{{asset('admin')}}/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
  <!-- DataTables  & Plugins -->
  <script src="{{asset('admin')}}/plugins/datatables/jquery.dataTables.min.js"></script>
  <script src="{{asset('admin')}}/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
  <script src="{{asset('admin')}}/plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
  <script src="{{asset('admin')}}/plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
  <script src="{{asset('admin')}}/plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
  <script src="{{asset('admin')}}/plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
  <script src="{{asset('admin')}}/plugins/jszip/jszip.min.js"></script>
  <script src="{{asset('admin')}}/plugins/pdfmake/pdfmake.min.js"></script>
  <script src="{{asset('admin')}}/plugins/pdfmake/vfs_fonts.js"></script>
  <script src="{{asset('admin')}}/plugins/datatables-buttons/js/buttons.html5.min.js"></script>
  <script src="{{asset('admin')}}/plugins/datatables-buttons/js/buttons.print.min.js"></script>
  <script src="{{asset('admin')}}/plugins/datatables-buttons/js/buttons.colVis.min.js"></script>

  <!-- AdminLTE App -->
  <script src="{{asset('admin')}}/dist/js/adminlte.min.js"></script>

  @yield('script')

</body>

</html>