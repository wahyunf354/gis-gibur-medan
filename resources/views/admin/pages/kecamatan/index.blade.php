@extends('admin.layouts.index')

@section('content')
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <div class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1 class="m-0">Tabel Data Kecamatan Kota Medan</h1>
        </div><!-- /.col -->
        <div class="col-sm-6">
          <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item"></li>Admin</li>
            <li class="breadcrumb-item active">Tabel Data Gizi</li>
          </ol>
        </div><!-- /.col -->
      </div><!-- /.row -->
      @if(session('success'))
      <div class="alert alert-success" role="alert">
        {{session('success')}}
      </div>
      @endif
    </div><!-- /.container-fluid -->
  </div>
  <!-- /.content-header -->

  <!-- Main content -->
  <div class="content">
    <div class="container-fluid">
      <div class="row">
        <div class="col-12">
          <div class="card">
            <div class="card-header row ">
              <div class="col-2 ">

                <a href="{{route('admin.kecamatan.create')}}" class="btn btn-primary btn-sm mb-2" > <i class="fas fa-plus"></i> Tambah Data</a>
              </div>
            </div>
            <!-- /.card-header -->
            <div class="card-body">
              <table id="table_data_gibur" class="table table-bordered table-hover">
                <thead>
                <tr>
                  <th>No</th>
                  <th>Nama</th>
                  <th>Jumlah Penduduk</th>
                  <th>Action</th>
                </tr>
                </thead>
                <tbody>
                  @foreach($kecamatans as $key=> $row)
                    <tr>
                      <td>{{$key+1}}</td>
                      <td>{{$row->name}}</td>
                      <td>{{$row->jmlppdk}}</td>
                      <td>
                        <form action="{{route('admin.kecamatan.destroy', $row->id)}}" method="POST" >
                          @method('DELETE')
                          @csrf
                          <a href="{{route('admin.kecamatan.edit', $row->id)}}" class="btn btn-sm btn-info" >
                            <i class="fas fa-pen-fancy"></i>
                          </a>
                          <button href="#" class="btn btn-sm btn-danger" >
                            <i class="far fa-trash-alt"></i>
                          </button>
                        </form>
                      </td>
                    </tr>
                  @endforeach
                </tbody>
              </table>
            </div>
            <!-- /.card-body -->
          </div>
        </div>
      </div>  
      <!-- /.row -->
    </div><!-- /.container-fluid -->
  </div>
  <!-- /.content -->
</div>
<!-- /.content-wrapper -->
@endsection

@section('script')
<script>
  $(function () {
    $('#table_data_gibur').DataTable({
      "paging": true,
      "lengthChange": false,
      "searching": false,
      "ordering": true,
      "info": true,
      "autoWidth": false,
      "responsive": true,
    });
  });
</script>
@endsection