<?php

namespace App\Http\Controllers;

use App\Models\DataTahun;
use App\Models\Kecamatan;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class DataTahunController extends Controller
{
    function index(Request $request)
    {
        $tahun = $request->year ? $request->year : null;
        if ($tahun) {
            $dataGiziBurukTahun = DataTahun::where('tahun', '=', $tahun)->orderBy('created_at', 'desc')->get();
        } else {
            $dataGiziBurukTahun = DataTahun::orderBy('created_at', 'desc')->get();
        }

        $years = DataTahun::select('tahun')->distinct()->get();

        return view('admin.pages.data_tahun.index', compact('dataGiziBurukTahun', 'years'));
    }

    function create()
    {

        $kecamatanOptions = Kecamatan::select('name', 'id')->orderBy('name', 'asc')->get();

        return view('admin.pages.data_tahun.form', compact('kecamatanOptions'));
    }

    function store(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'kec_id' => 'required',
            'year' => 'required',
            'jml_gizi_buruk' => 'required',
            'jml_sembuh_gizi_buruk' => 'required',
            'jml_meninggal_gizi_buruk' => 'required'
        ]);


        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator)->withInput($request->all());
        }

        $newData = new DataTahun;
        $newData->kec_id = $request->kec_id;
        $newData->tahun = $request->year;
        $newData->jml_kasus = $request->jml_gizi_buruk;
        $newData->jml_meninggal = $request->jml_meninggal_gizi_buruk;
        $newData->jml_sembuh = $request->jml_sembuh_gizi_buruk;
        $newData->save();

        return redirect()->route('admin.datatahun.index')->with('success', 'Berhasil menambah data');
    }

    function edit($id)
    {
        $dataGiziBuruk = DataTahun::find($id);
        $kec = Kecamatan::find($dataGiziBuruk->kec_id);
        return view('admin.pages.data_tahun.edit', compact('dataGiziBuruk', 'kec'));
    }

    function update($id, Request $request)
    {
        $validator = Validator::make($request->all(), [
            'kec_id' => 'required',
            'year' => 'required',
            'jml_gizi_buruk' => 'required',
            'jml_sembuh_gizi_buruk' => 'required',
            'jml_meninggal_gizi_buruk' => 'required'
        ]);


        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator)->withInput($request->all());
        }

        // dd($request->all());

        $newData = DataTahun::find($id);
        $newData->kec_id = $request->kec_id;
        $newData->tahun = $request->year;
        $newData->jml_kasus = $request->jml_gizi_buruk;
        $newData->jml_meninggal = $request->jml_meninggal_gizi_buruk;
        $newData->jml_sembuh = $request->jml_sembuh_gizi_buruk;
        $newData->save();

        return redirect()->route('admin.datatahun.index')->with('success', 'Berhasil mengubah data');
    }

    function delete($id)
    {
        DataTahun::destroy($id);
        return redirect()->route('admin.datatahun.index')->with('success', 'Berhasil delete data');
    }
}
