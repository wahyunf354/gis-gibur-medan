<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DataTahun extends Model
{
    use HasFactory;

    protected $table = 'data_tahuns';

    public function kecamatan()
    {
        return $this->belongsTo(Kecamatan::class, 'kec_id', 'id');
    }
}
