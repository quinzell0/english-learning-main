<?php

namespace App\Models;

use CodeIgniter\Model;

class TugasModel extends Model
{
  protected $table = 'tugas';
  protected $allowedFields = ['user_id', 'mapel_id', 'mapel', 'kelas', 'jurusan', 'judul', 'type', 'deskripsi', 'icon', 'ditugaskan', 'deadline_at'];
  protected $useTimestamps = true;

  public function getTugas($id = false)
  {
    if ($id != false) {
      return $this->where(['id' => $id])->first();
    }
    return $this->findAll();
  }
}
