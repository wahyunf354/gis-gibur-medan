<?php

namespace App\Http\Controllers;

use App\Models\Kecamatan;
use Illuminate\Http\Request;

class DashboardController extends Controller
{
    public function index(Request $request)
    {
        $dataKecamatan = Kecamatan::all();

        $countKecamatan = $dataKecamatan->count('name');
        $sumJmlGiziBuruk = $dataKecamatan->sum('jml_gizi_buruk');
        $sumJmlSembuhGiziBuruk = $dataKecamatan->sum('jml_sembuh_gizi_buruk');
        $sumJmlMeninggalGiziBuruk = $dataKecamatan->sum('jml_meninggal_gizi_buruk');

        return view('admin.pages.dashboard', compact('countKecamatan', 'sumJmlGiziBuruk', 'sumJmlSembuhGiziBuruk', 'sumJmlMeninggalGiziBuruk'));
    }

    function peta()
    {
        return view('admin.pages.peta');
    }

    function grafik()
    {

        return view('admin.pages.grafik');
    }
}
