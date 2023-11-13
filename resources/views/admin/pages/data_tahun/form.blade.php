@extends('admin.layouts.index')

@section('content')
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <div class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1 class="m-0">Data Gizi Buruk Kota Medan Per Tahun - Form</h1>
        </div><!-- /.col -->
        <div class="col-sm-6">
          <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item"></li>Admin</li>
            <li class="breadcrumb-item"><a href="{{route('admin.datatahun.index')}}">Tabel Data Gizi</a></li>
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
            <form method="POST" action="{{route('admin.datatahun.store')}}"  >
              @csrf
              <div class="card-body">
                <div class="form-group">
                  <label for="kec_id">Nama Kecamatan</label>
                  <select class="custom-select" name="kec_id" id="kec_id">
                    @foreach($kecamatanOptions as $row)
                      <option value="{{$row->id}}">{{$row->name}}</option>
                    @endforeach
                  </select>
                </div>
                <div class="form-group">
                  <label for="year">Tahun</label>
                  <input class="form-control" type="number" name="year" id="year" placeholder="YYYY" value="{{old('year')}}" >
                </div>
                <div class="form-group">
                  <label for="jml_gizi_buruk">Jumlah Kasus Gizi Buruk</label>
                  <input class="form-control" type="number" name="jml_gizi_buruk" id="jml_gizi_buruk" value="{{old('jml_gizi_buruk')}}" >
                </div>
                
                <div class="form-group">
                  <label for="jml_sembuh_gizi_buruk">Jumlah Sembuh Kasus Gizi Buruk</label>
                  <input class="form-control" type="number" name="jml_sembuh_gizi_buruk" value="{{old('jml_sembuh_gizi_buruk')}}" id="jml_sembuh_gizi_buruk" >
                </div>

                <div class="form-group">
                  <label for="jml_meninggal_gizi_buruk">Jumlah Meniggal Kasus Gizi Buruk</label>
                  <input class="form-control" type="number" name="jml_meninggal_gizi_buruk" id="jml_meninggal_gizi_buruk" value="{{old('jml_meninggal_gizi_buruk')}}" >
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