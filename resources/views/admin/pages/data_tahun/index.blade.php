@extends('admin.layouts.index')

@section('content')
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <div class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1 class="m-0">Tabel Data Gizi Buruk Kota Medan Per Tahun</h1>
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

                <a href="{{route('admin.datatahun.create')}}" class="btn btn-primary btn-sm mb-2" > <i class="fas fa-plus"></i> Tambah Data</a>
                <select name="tahun" id="tahun" class="custom-select">
                  <option value=""> -- Tahun -- </option>
                  @foreach($years as $year)
                  <option value="{{$year->tahun}}">{{$year->tahun}}</option>
                  @endforeach
                </select>
              </div>
            </div>
            <!-- /.card-header -->
            <div class="card-body">
              <table id="table_data_gibur" class="table table-bordered table-hover">
                <thead>
                <tr>
                  <th>No</th>
                  <th>Kecamatan</th>
                  <th>Tahun</th>
                  <th>Kasus</th>
                  <th>Meninggal</th>
                  <th>Sembuh</th>
                  <th>Action</th>
                </tr>
                </thead>
                <tbody>
                  @foreach($dataGiziBurukTahun as $key=> $row)
                    <tr>
                      <td>{{$key+1}}</td>
                      <td>{{$row->kecamatan->name}}</td>
                      <td>{{$row->tahun}}</td>
                      <td>{{$row->jml_kasus}}</td>
                      <td>{{$row->jml_meninggal}}</td>
                      <td>{{$row->jml_sembuh}}</td>
                      <td>
                        <form action="{{route('admin.datatahun.delete', $row->id)}}" method="POST" >
                          @method('DELETE')
                          @csrf
                          <a href="{{route('admin.datatahun.edit', $row->id)}}" class="btn btn-sm btn-info" >
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

  const yearFilter =document.getElementById("tahun");
  const urlParams =  new URLSearchParams(window.location.search);
  const year = urlParams.get('year');
  console.log(year)
  if(year) {
    yearFilter.value = year
  }
  
  yearFilter.addEventListener('change', (e) => {
    window.location.href = '?year='+e.target.value;
  })
  
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