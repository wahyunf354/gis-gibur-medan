<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css"
    integrity="sha256-p4NxAoJBhIIN+hmNHrzRCf9tD/miZyoHS5obTRR9BMY="
    crossorigin=""/>

    <title>GIS</title>
    <style>
      #map { height: 65vh; }
      #wrap-chart-1 {height: 20vh;}
      .h-400 { height: 400px; }
      .legend {
          line-height: 18px;
          color: #555;
      }
      .legend i {
          width: 18px;
          height: 18px;
          float: left;
          margin-right: 8px;
          opacity: 0.7;
      }
    </style>
  </head>
  <body>
    <!-- Image and text -->
    <nav class="navbar navbar-light bg-light">
      <div class="container">
        <a class="navbar-brand" href="#">
          <img src="{{asset('img')}}/logo_medan.svg" width="30" height="30" class="d-inline-block align-top" alt="">
          Sistem Informasi Geografis Gizi Buruk di Kota Medan
        </a>
      </div>
    </nav>
    <main class="container-fluid" >
      <div class="row justify-content-center">
        <div class="col-md-2 py-2">
          <div class="card text-white bg-warning mb-2">
            <div class="card-body text-center">
              <h4 class="card-title">{{$jmlKasus}}</h4>
              <p class="card-text">Jumlah Kasus</p>
            </div>
          </div>
          <div class="card text-white bg-success mb-2">
            <div class="card-body text-center">
              <h4 class="card-title">{{$jmlSembuh}}</h4>
              <p class="card-text">Jumlah Sembuh</p>
            </div>
          </div>
          <div class="card text-white bg-danger mb-2">
            <div class="card-body text-center">
              <h4 class="card-title">{{$jmlMeniggal}}</h4>
              <p class="card-text">Jumlah Meniggal</p>
            </div>
          </div>
          <div class="card">
            <div class="card-body p-0" >
              <ul class="list-group list-group-flush overflow-auto" style="height: 100vh" class="h-400">
                @foreach($kecamatans as $kec)
                  <li class="list-group-item">
                    <h6>{{$kec->name}}</h6>
                    <span class="text-warning">Jumlah Gizi Buruk : {{$kec->jml_gizi_buruk}}</span><br>
                    <span class="text-success">Jumlah Sembuh : {{$kec->jml_sembuh_gizi_buruk}}</span><br>
                    <span class="text-danger">Jumlah Meninggal : {{$kec->jml_meninggal_gizi_buruk}}</span>
                  </li>
                @endforeach
              </ul>
            </div>
          </div>
        </div>
        <div class="col-md-9 p-0">
          <div class="row">
            <div class="col-12">
              <div id="map"></div>
            </div>
          </div>
          <div class="row">
            <div class="col-md-12" id="wrap-chart-1" style="position: relative; height:40vh; width:80vw">
              <canvas id="chart-1" ></canvas>
            </div>
          </div>
        </div>
      </div>
    </main>

    <script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"
      integrity="sha256-20nQCchB9co0qIjJZRGuk2/Z9VM+kNiyxNV1lvTlZBo="
      crossorigin=""></script>

    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>


    {{-- MAP --}}
    <script>

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

      var map = L.map('map').setView([3.6424541,98.5870924], 11);

      L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
          maxZoom: 19,
          attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
      }).addTo(map);

      
      var legend = L.control({position: 'bottomright'});

      legend.onAdd = function (map) {
          var div = L.DomUtil.create('div', 'info legend'),
              grades = ["Zona Hijau", "Zona Oranye", "Zona Merah"],
              labels = [];
          // loop through our density intervals and generate a label with a colored square for each interval
          for (var i = 0; i < grades.length; i++) {
              div.innerHTML +=
                  '<i style="background:' + getColor(grades[i]) + '"></i> ' +
                  grades[i] +'<br>';
          }
          return div;
      };
      legend.addTo(map);
      function getColor(d) {
        return d === "Zona Hijau" ? "#236316" :  d == "Zona Oranye" ? "#f5c842" : d == "Zona Merah" ? "#871313" : "#871313" 
      }
      const keysToExtract = ['jml_sembuh_gizi_buruk', 'rasio'];
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

        const claster = await getAPIDBscan(data);
        const colors = addColorCluster(claster);
        extractGeoJson(claster, colors)
      })()

      async function getAPIDBscan(data) {
        try {
          const dataRequest = data.map(obj => {
            return keysToExtract.map(key => obj[key]);
          });
          const res = await fetch('http://localhost:5000/', {
            method: "POST",
            headers: {
              "Content-Type": "application/json",
            },
            body: JSON.stringify(dataRequest),
          })
          const responJson = await res.json()
          const indexCluster = Object.keys(responJson[0]).length-1 

          const result = data.map((item, i) => {
            return {
              ...item,
              claster: responJson[i][indexCluster]
            }
          })

          // console.log(result)
          return result
        } catch (error) {
          console.log(error)
        }
      }

      
      function addColorCluster(data) {
        // clusternya ada apa aja
        var uniqueClusters = [...new Set(data.map((item) => item.claster))];
        // console.log(uniqueClusters) // output: [0,1,2]

        const result = [];
        uniqueClusters.forEach((item, i) => {
          result.push({cluster: item})
          keysToExtract.forEach(key => {
            result[i] = {
              ...result[i],
              ["avg_"+key] : 0,
              ["count_"+key] : 0,
              ["sum_"+key] : 0,
            }
          })
        })

        result.forEach((item, i) => {
          let cluster = item.cluster

          data.forEach((row) => {
            if(cluster == row.claster) {
              result.forEach(row1=> {
                keysToExtract.forEach(e => {
                  row1['sum_'+e] = row1['sum_'+e] + parseFloat(row[e])
                  row1['count_'+e] = row1['count_'+e] + 1
                })
              })
            }
          })
          
          let tmp = 0
          let count = 0
          keysToExtract.forEach(f => {
            item['avg_'+f] = item['sum_'+f] / item['count_'+f] 
            tmp += item['avg_'+f]
            count++
          })
          item.avg = tmp / count
        })

        // // Pengurutan cluster dari yang terendah ke tertinggi
        result.sort(function(a, b) {
          return a.avg - b.avg
        });

        // Memberikan warna pada cluster
        const colorMap = ["#236316", "#f5c842", "#871313"];
        const statusMap = ["Zona Hijau", "Zona Oranye", "Zona Merah"];
        result.forEach((item, index) => {
          item.color = colorMap[index];
          item.status = statusMap[index];
        })
        return result
      }

      function extractGeoJson(data,colors) {
        return new Promise(async (resolve, reject) => {
          try {
            data.forEach(async(data, i, arr) => {
              const urlFileGeoJson = JSON.parse(data.file_gjson)[0].download_link
              const resFileGeojson = await fetch('storage/' + urlFileGeoJson);
              const gjson = await resFileGeojson.json()
              
              const colorCluster = colors.filter(e => e.cluster === data.claster)[0].color
              const status = colors.filter(e => e.cluster === data.claster)[0].status

              const geoJson = L.geoJSON(gjson, {
                style:  style(colorCluster), 
              }).addTo(map)
              .bindPopup(
                "<b>" +
                data.name +
                "</b><br />Jumlah Gizi Buruk: " +
                (data.jml_gizi_buruk && data.jml_gizi_buruk > 0 ? data.jml_gizi_buruk : "-") +
                "<br />Jumlah Meninggal Gizi Buruk: " +
                (data.jml_meninggal_gizi_buruk && data.jml_meninggal_gizi_buruk > 0 ? data.jml_meninggal_gizi_buruk : "-") +
                "<br />Jumlah Sembuh Gizi Buruk: " +
                (data.jml_sembuh_gizi_buruk && data.jml_sembuh_gizi_buruk > 0 ? data.jml_sembuh_gizi_buruk : "-") +
                "<br/>Cluster: " + data.claster + " (" + status + ")"
              );
              // geoJson
              //   .bindTooltip(data.name, {
              //   permanent: true, 
              //   direction: "bottom", 
              //   className: "", 
              // }).openTooltip();
            })
            resolve("Success");
          } catch (error) {
            reject(error)
          }
        })
      }
      function style(color) {
          return {
            fillColor: color, 
            color: "white", 
            weight: "3",
            dashArray: '3', 
            opacity: "0.4", 
            fillOpacity: "0.9"
          , };
        }

    </script>
  </body>
</html>