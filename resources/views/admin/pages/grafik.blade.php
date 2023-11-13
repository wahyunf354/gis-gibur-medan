@extends('admin.layouts.index')

@section('content')
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <div class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1 class="m-0">Grafik Data Gizi Buruk di Kota Medan</h1>
        </div><!-- /.col -->
        <div class="col-sm-6">
          <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item">Admin</li>
            <li class="breadcrumb-item"><a href="{{route('admin.dashboard')}}">Dashboard</a></li>
            <li class="breadcrumb-item active">Peta</li>
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
        <div class="col-12">
          <div class="card">
            <div class="row">
              <div class="col-md-12 p-3" id="wrap-chart-1">
                <canvas id="chart-1" ></canvas>
              </div>
            </div>
          </div>
        </div>
        <!-- /.col-md-6 -->
      </div>
      <!-- /.row -->
    </div><!-- /.container-fluid -->
  </div>
  <!-- /.content -->
</div>
<!-- /.content-wrapper -->
@endsection

@section('script')
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>

<script>
  (async () => {
    let res  = await fetch('<?= url('getKecamatan') ?>')
    let data = await res.json()

    console.log(data)
    const labelsKec = data.map(kec => kec.name)
    const sembuhGiziBurukKec = data.map(kec => kec.jml_sembuh_gizi_buruk)
    const jumlahGiziBurukKec = data.map(kec => kec.jml_gizi_buruk)
    const meninggalGiziBurukKec = data.map(kec => kec.jml_meninggal_gizi_buruk)
    const rasioGiziBurukKec = data.map(kec => kec.rasio)
    console.log(labelsKec)

    makeChartBar('chart-1', data)
  })()

  function makeChartBar (idElChart, data) {
    const ctx = document.getElementById(idElChart);
    new Chart(ctx, {
      type: 'bar',
      data: {
        labels: data.map(e=>e.name),
        datasets: [{
          label: 'Meniggal',
          data: data.map(e=>e.jml_meninggal_gizi_buruk),
          borderWidth: 1,
          backgroundColor: 'rgb(255, 99, 132)'
        }, 
        {
          label: 'Jumlah Sembuh',
          data: data.map(e=>e.jml_sembuh_gizi_buruk),
          borderWidth: 1,
          backgroundColor: 'rgb(36, 237, 9)'
        },
        {
          label: 'Jumlah Kasus',
          data: data.map(e=>e.jml_gizi_buruk),
          borderWidth: 1,
          backgroundColor: 'rgb(255, 205, 86)'
        }
      ]
      },
      options: {
        scales: {
          y: {
            beginAtZero: true
          }
        }
      }
    });
  }
</script>
@endsection
