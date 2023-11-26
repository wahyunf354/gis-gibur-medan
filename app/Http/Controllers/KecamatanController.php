<?php

namespace App\Http\Controllers;

use App\Models\DataTahun;
use App\Models\Kecamatan;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;

class KecamatanController extends Controller
{
    function gis_map()
    {
        $kecamatans = Kecamatan::orderBy('created_at', 'desc')->get();
        $jmlKasus = $kecamatans->sum('jml_gizi_buruk');
        $jmlSembuh = $kecamatans->sum('jml_sembuh_gizi_buruk');
        $jmlMeniggal = $kecamatans->sum('jml_meninggal_gizi_buruk');
        return view('pages.index', compact('kecamatans', 'jmlKasus', 'jmlSembuh', 'jmlMeniggal'));
    }

    function getDataKecamatan()
    {
        $kecamatans = Kecamatan::all();
        // dd($kecamatans);

        $data = DB::table('data_tahuns as dt')
            ->select(
                DB::raw('SUM(dt.jml_kasus) as jml_gizi_buruk'),
                DB::raw('SUM(dt.jml_sembuh) as jml_sembuh_gizi_buruk'),
                DB::raw('SUM(dt.jml_meninggal) as jml_meninggal_gizi_buruk'),
                // DB::raw('SUM(dt.jml_meninggal)/SUM(dt.jml_kasus) as rasio'),
                DB::raw('IFNULL(SUM(dt.jml_meninggal) / SUM(dt.jml_kasus), 0) as rasio'),
                'kc.name as name',
                'kc.id as id',
                'kc.file_gjson as file_gjson',
                'kc.jmlppdk as jmlppdk'
            )
            ->rightJoin('kecamatans as kc', 'kc.id', '=', 'dt.kec_id')
            ->groupBy('kc.name', 'kc.id', 'kc.file_gjson', 'kc.jmlppdk')
            ->get();
        // $kecamatansJson = json_encode($kecamatans);
        return $data;
    }

    function index(Request $request)
    {
        $kecamatans = Kecamatan::all();

        return view('admin.pages.kecamatan.index', compact('kecamatans'));
    }

    function create()
    {
        return view('admin.pages.kecamatan.create');
    }

    function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'string|required',
            'jmlpddk' => 'integer|required',
            'file_geojson' => 'file|required'
        ]);

        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator)->withInput($request->all());
        }

        $newData = new Kecamatan;
        $newData->name = $request->name;
        $newData->jmlppdk = $request->jmlpddk;

        $file_geojson = $request->file('file_geojson');
        $uploadDir = "kecamatans/October2023/";
        if ($file_geojson->isValid()) {
            $renameFile = Str::snake($request->name)  . $request->jmlpddk . "_" . $file_geojson->getClientOriginalName();

            $file_geojson->move($uploadDir, $renameFile);
            $newData->file_gjson = json_encode([
                [
                    "download_link" => $uploadDir . $renameFile
                ]
            ]);
        }
        $newData->save();

        return redirect()->route('admin.kecamatan.index')->with('success', 'Berhasil menambah data');
    }

    function edit($id, Request $request)
    {
        $data = Kecamatan::find($id);
        return view('admin.pages.kecamatan.edit', compact('data'));
    }


    function update($id, Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'string|required',
            'jmlpddk' => 'integer|required',
        ]);

        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator)->withInput($request->all());
        }

        $newData = Kecamatan::find($id);
        $newData->name = $request->name;
        $newData->jmlppdk = $request->jmlpddk;

        $file_geojson = $request->file('file_geojson');
        $uploadDir = "kecamatans/October2023/";
        if ($file_geojson) {
            $renameFile = Str::snake($request->name) . $request->jmlpddk . "_" . $file_geojson->getClientOriginalName();

            $file_geojson->move($uploadDir, $renameFile);
            $newData->file_gjson = json_encode([
                [
                    "download_link" => $uploadDir . $renameFile
                ]
            ]);
        }

        $newData->save();

        return redirect()->route('admin.kecamatan.index')->with('success', 'Berhasil mengubah data');
    }

    public function destroy($id)
    {
        Kecamatan::destroy($id);

        return redirect()->route('admin.kecamatan.index')->with('success', 'Berhasil menghapus data');
    }
}
