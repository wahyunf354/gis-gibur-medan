<?php

namespace App\Http\Controllers;

use App\Models\Kecamatan;
use Illuminate\Http\Request;

class KecamatanController extends Controller
{
    function gis_map()
    {
        $kecamatans = Kecamatan::all();
        $jmlKasus = $kecamatans->sum('jml_gizi_buruk');
        $jmlSembuh = $kecamatans->sum('jml_sembuh_gizi_buruk');
        $jmlMeniggal = $kecamatans->sum('jml_meninggal_gizi_buruk');
        return view('pages.index', compact('kecamatans', 'jmlKasus', 'jmlSembuh', 'jmlMeniggal'));
    }

    function getDataKecamatan()
    {
        $kecamatans = Kecamatan::all();
        // dd($kecamatans);

        // $kecamatansJson = json_encode($kecamatans);
        return $kecamatans;
    }

    public function grafik()
    {
        return "hai";
    }
}
