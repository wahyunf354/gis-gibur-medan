@extends('admin.layouts.index')

@section('content')
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <div class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1 class="m-0">Data Kecamatan Kota Medan Per Tahun - Form</h1>
        </div><!-- /.col -->
        <div class="col-sm-6">
          <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item"></li>Admin</li>
            <li class="breadcrumb-item"><a href="{{route('admin.kecamatan.index')}}">Tabel Kecamatan</a></li>
            <li class="breadcrumb-item active">Tambah</li>
          </ol>
        </div><!-- /.col -->
      </div><!-- /.row -->
    </div><!-- /.container-fluid -->
  </div>
  <!-- /.content-header -->

  <!-- Main content -->
  <div class="content">
    <div class="container-fluid">
      <div class="row">
        <div class="col-md-6 col-12">
          <div class="card card-primary">
            <div class="card-header">
              <h3 class="card-title">Tambah Data </h3>
            </div>
            <!-- /.card-header -->
            <!-- form start -->
            <form method="POST" action="{{route('admin.kecamatan.store')}}" enctype="multipart/form-data"  >
              @csrf
              <div class="card-body">
                <div class="form-group">
                  <label for="name">Nama Kecamatan</label>
                  <input type="text" class="form-control" name="name" id="name" placeholder="nama kecamatan" >
                </div>
                <div class="form-group">
                  <label for="jmlpddk">Jumlah Penduduk</label>
                  <input type="number" class="form-control" name="jmlpddk" id="jmlpddk" placeholder="jumlah penduduk" >
                </div>
                <div class="form-group">
                  <label for="file_geojson">File Geojson</label>
                  <input type="file" class="form-control" name="file_geojson" id="file_geojson" >
                </div>
              </div>
              <!-- /.card-body -->
              @if($errors->any())
                  <div class="alert alert-danger">
                    <ul>
                      @foreach($errors->all() as $error)
                        <li>{{ $error }}</li>
                      @endforeach
                    </ul>
                  </div>
                @endif
              <div class="card-footer">
                <button type="submit" class="btn btn-primary">Submit</button>
              </div>
            </form>
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
</script>
@endsection