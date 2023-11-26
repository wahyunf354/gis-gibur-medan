<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\DataTahunController;
use App\Http\Controllers\KecamatanController;
use App\Models\Kecamatan;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', [KecamatanController::class, 'gis_map']);
Route::get('/getKecamatan', [KecamatanController::class, 'getDataKecamatan']);


Route::get('/login', [AuthController::class, 'form_login']);
Route::post('/login', [AuthController::class, 'login'])->name('admin.login');

Route::group(['prefix' => 'admin'], function () {
    Route::get('dashboard', [DashboardController::class, 'index'])->name('admin.dashboard');

    Route::get('data', [DataTahunController::class, 'index'])->name('admin.datatahun.index');
    Route::get('data/form', [DataTahunController::class, 'create'])->name('admin.datatahun.create');
    Route::get('data/edit/{id}', [DataTahunController::class, 'edit'])->name('admin.datatahun.edit');
    Route::post('data', [DataTahunController::class, 'store'])->name('admin.datatahun.store');
    Route::put('data/{id}', [DataTahunController::class, 'update'])->name('admin.datatahun.update');
    Route::delete('data/{id}', [DataTahunController::class, 'delete'])->name('admin.datatahun.delete');

    Route::get('kecamatan', [KecamatanController::class, 'index'])->name('admin.kecamatan.index');
    Route::get('kecamatan/form', [KecamatanController::class, 'create'])->name('admin.kecamatan.create');
    Route::get('kecamatan/{id}/edit', [KecamatanController::class, 'edit'])->name('admin.kecamatan.edit');
    Route::post('kecamatan', [KecamatanController::class, 'store'])->name('admin.kecamatan.store');
    Route::put('kecamatan/{id}', [KecamatanController::class, 'update'])->name('admin.kecamatan.update');
    Route::delete('kecamatan/{id}', [KecamatanController::class, 'destroy'])->name('admin.kecamatan.destroy');


    Route::get('peta', [DashboardController::class, 'peta'])->name('admin.peta');


    Route::get('grafik', [DashboardController::class, 'grafik'])->name('admin.grafik');
});
