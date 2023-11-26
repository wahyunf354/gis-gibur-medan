
<link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css"
integrity="sha256-p4NxAoJBhIIN+hmNHrzRCf9tD/miZyoHS5obTRR9BMY="
crossorigin=""/>

<style>
#map { height: 65vh; }
</style>


<div id="map"></div>


<script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"
integrity="sha256-20nQCchB9co0qIjJZRGuk2/Z9VM+kNiyxNV1lvTlZBo="
crossorigin=""></script>


<script>
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
        const resFileGeojson = await fetch('/storage/' + urlFileGeoJson);
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