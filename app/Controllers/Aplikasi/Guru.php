<?php

namespace App\Controllers\Aplikasi;

use \CodeIgniter\I18n\Time;
use App\Controllers\BaseController;
use CodeIgniter\Exceptions\PageNotFoundException;

class Guru extends BaseController
{
	public function index()
	{
		$data = [
			'title' => 'Halaman Utama',
			'user' => $this->userModel->getUser($this->id),
			'db' => \Config\Database::connect(),
		];
		return view('aplikasi/guru/index', $data);
	}

	public function tugas()
	{
		$data = [
			'title' => 'Tugas',
			'user' => $this->userModel->getUser($this->id),
			'db' => \Config\Database::connect(),
			'validation' => \Config\Services::validation(),
			'mapel' => $this->db->table('user_mapel')->where(['user_role' => 3])->orderBy('jurusan', 'DESC')->get()->getResultArray(),
			'tugas' => $this->tugasModel->where(['user_id' => $this->id, 'type' => 'tugas'])->orderBy('id', 'DESC')->findAll(),
		];
		return view('aplikasi/guru/tugas', $data);
	}
	public function konten_pembelajaran()
	{
		$data = [
			'title' => 'Konten Pembelajaran',
			'user' => $this->userModel->getUser($this->id),
			'db' => \Config\Database::connect(),
			'validation' => \Config\Services::validation(),
			'mapel' => $this->db->table('user_mapel')->where(['user_role' => 3])->orderBy('jurusan', 'DESC')->get()->getResultArray(),
			'tugas' => $this->tugasModel->where(['user_id' => $this->id, 'type' => 'konten-pembelajaran'])->orderBy('id', 'DESC')->findAll(),
		];
		return view('aplikasi/guru/konten-pembelajaran', $data);
	}

	public function ubah_tugas($id)
	{
		$data = [
			'title' => 'Tugas Kelas',
			'user' => $this->userModel->getUser($this->id),
			'db' => \Config\Database::connect(),
			'validation' => \Config\Services::validation(),
			'file_tugas' => $this->db->table('file_tugas')->where('tugas_id', $id)->get()->getResultArray(),
			'mapel' => $this->db->table('user_mapel')->where(['user_role' => 3])->orderBy('jurusan', 'DESC')->get()->getResultArray(),
			'tugas' => $this->tugasModel->where(['id' => $id, 'user_id' => $this->id])->orderBy('id', 'DESC')->first(),
		];
		return view('aplikasi/guru/ubah-tugas', $data);
	}

	public function forum_tugas()
	{
		$data = [
			'title' => 'Forum Tugas',
			'user' => $this->userModel->getUser($this->id),
			'db' => \Config\Database::connect(),
		];
		return view('aplikasi/guru/forum-tugas', $data);
	}

	public function detail_tugas($id)
	{
		$user = $this->userModel->getUser($this->id);
		$user_mapel = $this->db->table('user_mapel')->where('id', $user['mapel_id'])->get()->getRowArray();
		$tugas =  $this->tugasModel->where(['id' => $id, 'mapel' => $user_mapel['mapel']])->first();
		if (empty($tugas)) {
			throw new PageNotFoundException('Tugas tidak ditemukan');
		}
		$data = [
			'title' => 'Tugas - ' . $tugas['judul'],
			'user' => $this->userModel->getUser($this->id),
			'db' => \Config\Database::connect(),
			'tugas' => $tugas,
			'komentar' => $this->db->table('komentar_tugas'),
			'id' => $id,
            'is_deadline' => now() > strtotime($tugas['deadline_at']) ? true : false,
			'file_tugas' => $this->db->table('file_tugas')->where('tugas_id', $id)->get()->getResultArray(),
			'user_tugas' => $this->userModel->getUser($tugas['user_id']),
			'validation' => \Config\Services::validation()
		];
		return view('aplikasi/guru/detail-tugas', $data);
	}

    public function ubah_konten($id)
	{
		$data = [
			'title' => 'Konten Pembelajaran',
			'user' => $this->userModel->getUser($this->id),
			'db' => \Config\Database::connect(),
			'validation' => \Config\Services::validation(),
			'file_tugas' => $this->db->table('file_tugas')->where('tugas_id', $id)->get()->getResultArray(),
			'mapel' => $this->db->table('user_mapel')->where(['user_role' => 3])->orderBy('jurusan', 'DESC')->get()->getResultArray(),
			'tugas' => $this->tugasModel->where(['id' => $id, 'user_id' => $this->id])->orderBy('id', 'DESC')->first(),
		];
		return view('aplikasi/guru/ubah-konten', $data);
	}

    public function detail_konten($id)
	{
		$user = $this->userModel->getUser($this->id);
		$user_mapel = $this->db->table('user_mapel')->where('id', $user['mapel_id'])->get()->getRowArray();
		$tugas =  $this->tugasModel->where(['id' => $id, 'mapel' => $user_mapel['mapel']])->first();
		if (empty($tugas)) {
			throw new PageNotFoundException('Konten Pembelajaran tidak ditemukan');
		}
		$data = [
			'title' => 'Konten Pembelajaran - ' . $tugas['judul'],
			'user' => $this->userModel->getUser($this->id),
			'db' => \Config\Database::connect(),
			'tugas' => $tugas,
			'komentar' => $this->db->table('komentar_tugas'),
			'id' => $id,
            'is_deadline' => now() > strtotime($tugas['deadline_at']) ? true : false,
			'file_tugas' => $this->db->table('file_tugas')->where('tugas_id', $id)->get()->getResultArray(),
			'user_tugas' => $this->userModel->getUser($tugas['user_id']),
			'validation' => \Config\Services::validation()
		];
		return view('aplikasi/guru/detail-konten', $data);
	}

	public function data_tugas($id)
	{
		$data_tugas = $this->db->table('data_tugas')->where('tugas_id', $id)->get()->getRowArray();
		$tugas = $this->db->table('tugas')
			->select('tugas.*')
			->join('user_mapel', 'tugas.mapel = user_mapel.mapel')
			->where('tugas.id', $data_tugas['tugas_id'] ?? null)
			->get()
			->getRowArray();
		if ($tugas) {
			if ($tugas['user_id'] != NULL) {
				if ($tugas['user_id'] != $this->id) {
					throw new PageNotFoundException('Data tidak ditemukan!');
				}
			}
			$file_data_tugas = $this->db->table('file_tugas')
				->select('file_tugas.*, tugas.id')
				->join('tugas', 'tugas.id = ' . $id)
				->where(['tugas.id' => $id, 'data_tugas_id' => $data_tugas['id']])
				->get()->getResultArray();
		}
		$data = [
			'title' => 'Tugas Kelas',
			'user' => $this->userModel->getUser($this->id),
			'db' => \Config\Database::connect(),
			'validation' => \Config\Services::validation(),
			'mapel' => $this->db->table('user_mapel')->where(['user_role' => 3])->orderBy('jurusan', 'DESC')->get()->getResultArray(),
			'file_tugas' => $this->db->table('file_tugas')->where('tugas_id', $id)->get()->getResultArray(),
			'file_data_tugas' => $file_data_tugas ?? [],
			'data_tugas' => $data_tugas ?? [],
			'tugas' => $tugas,
			'id' => $id
		];
		return view('aplikasi/guru/data-tugas', $data);
	}

	public function data_tugas_siswa($user_id, $id)
	{
		$data_tugas = $this->db->table('data_tugas')->where(['tugas_id' => $id, 'user_id' => $user_id])->get()->getRowArray();
		if (is_null($data_tugas)) {
			throw new PageNotFoundException('Tugas tidak ditemukan');
		}
		$file_data_tugas = $this->db->table('file_tugas')->where(['data_tugas_id' => $data_tugas['id']])->get()->getResultArray();

		$data = [
			'title' => 'Tugas Kelas',
			'user' => $this->userModel->getUser($this->id),
			'db' => \Config\Database::connect(),
			'validation' => \Config\Services::validation(),
			'file_data_tugas' => $file_data_tugas,
			'data_tugas' => $data_tugas,
			'user_tugas' => $this->userModel->where(['id' => $data_tugas['user_id']])->first()
		];
		return view('aplikasi/guru/data-tugas-siswa', $data);
	}

	public function notifikasi()
	{
		$data = [
			'title' => 'Notifikasi',
			'user' => $this->userModel->getUser($this->id),
			'db' => \Config\Database::connect(),
			'notifikasi' => $this->notifModel->where(['user_id' => $this->id])->orderBy('id', 'DESC')->paginate(10, 'notifikasi'),
			'pager' => $this->notifModel->pager
		];
		return view('aplikasi/guru/notifikasi', $data);
	}

	/* <========================= TAMBAH =========================> */
	public function tambah_tugas()
	{
		if (!$this->validate([
			'judul' => [
				'label' => 'Judul tugas',
				'rules' => 'required'
			],
			'deskripsi' => 'required',
			'file' => 'max_size[file,20000]|mime_in[file,application/vnd.openxmlformats-officedocument.wordprocessingml.document,application/vnd.openxmlformats-officedocument.presentationml.presentation,application/vnd.openxmlformats-officedocument.spreadsheetml.sheet,application/pdf,image/png,image/jpg,image/jpeg,video/mp4,video/3gpp,video/quicktime,video/MP2T,video/x-msvideo]|ext_in[file,png,jpg,jpeg,gif,pdf,docs,docx,doc,ppt,xlsx,pptx,xls,mp4,3gp,ts,avi,mov]',
		])) {
			return redirect()->to('/aplikasi/guru/tugas')->withInput();
		}
		$judul = htmlspecialchars($this->request->getPost('judul'));
		$deskripsi = htmlspecialchars($this->request->getPost('deskripsi'));
		$file = $this->request->getFiles('file');
		$user = $this->userModel->getUser($this->id);
		$mapel_guru = $this->db->table('user_mapel')->where('id', $user['mapel_id'])->get()->getRowArray();
		$ditugaskan = htmlspecialchars($this->request->getPost('ditugaskan'));
		$ditugaskan = ($ditugaskan == NULL) ? 0 : 1;

		$this->tugasModel->save([
			'user_id' => $this->id,
			'mapel' => $mapel_guru['mapel'],
			'judul' => $judul,
			'deskripsi' => $deskripsi,
			'ditugaskan' => $ditugaskan,
		]);
		$tugas = $this->db->table('tugas')->where('user_id', $this->id)->orderBy('id', 'DESC')->get()->getRowArray();
		$user_tugas = $this->userModel->where(['role_id' => 3])->findAll();
		foreach ($user_tugas as $a) {
			// sendEmail(
			// 	$a['email'],
			// 	'TUGAS ' . strtoupper($mapel_guru['mapel']),
			// 	'Hallo ' . $a['nama_lengkap'] . '! ' . $user['nama_lengkap'] . ' Telah mengupload tugas baru, <a href="' . base_url() . '/aplikasi/siswa/detail-tugas/' . $tugas['id'] . '" target="_blank">Klik disini</a> untuk melihat tugas!'
			// );
			tambah_notif($a['id'], '/aplikasi/siswa/detail-tugas/' . $tugas['id'], 'TUGAS ' . $mapel_guru['mapel'] . '! Ayo lihat dan kerjakan sekarang!', 'fa-clipboard-list');
		}
		if ($file) {
			foreach ($file['file'] as $f) {
				if (!$f->getError() == 4) {
					$this->db->table('file_tugas')->insert([
						'tugas_id' => $tugas['id'],
						'name' => $f->getName(),
						'ext' => $f->getExtension(),
					]);
					$f->move('file/tugas', $f->getName());
				}
			}
		}
		session()->setFlashdata('berhasil', 'Tugas berhasil terkirim! silahkan beri informasi kepada siswa kamu');
		return redirect()->to('/aplikasi/guru/tugas');
	}

	public function tambah_konten()
	{
		if (!$this->validate([
			'judul' => [
				'label' => 'Judul tugas',
				'rules' => 'required'
			],
			'deskripsi' => 'required',
			'file' => 'max_size[file,20000]|mime_in[file,application/vnd.openxmlformats-officedocument.wordprocessingml.document,application/vnd.openxmlformats-officedocument.presentationml.presentation,application/vnd.openxmlformats-officedocument.spreadsheetml.sheet,application/pdf,image/png,image/jpg,image/jpeg,video/mp4,video/3gpp,video/quicktime,video/MP2T,video/x-msvideo]|ext_in[file,png,jpg,jpeg,gif,pdf,docs,docx,doc,ppt,xlsx,pptx,xls,mp4,3gp,ts,avi,mov]',
		])) {
			return redirect()->to('/aplikasi/guru/tugas')->withInput();
		}
		$judul = htmlspecialchars($this->request->getPost('judul'));
		$deskripsi = htmlspecialchars($this->request->getPost('deskripsi'));
		$file = $this->request->getFiles('file');
		$user = $this->userModel->getUser($this->id);
		$mapel_guru = $this->db->table('user_mapel')->where('id', $user['mapel_id'])->get()->getRowArray();

		$this->tugasModel->save([
			'user_id' => $this->id,
			'mapel' => $mapel_guru['mapel'],
			'judul' => $judul,
			'deskripsi' => $deskripsi,
			'ditugaskan' => 0,
			'type' => 'konten-pembelajaran',
		]);
		$tugas = $this->db->table('tugas')->where('user_id', $this->id)->orderBy('id', 'DESC')->get()->getRowArray();
		$user_tugas = $this->userModel->where(['role_id' => 3])->findAll();
		foreach ($user_tugas as $a) {
			// sendEmail(
			// 	$a['email'],
			// 	'TUGAS ' . strtoupper($mapel_guru['mapel']),
			// 	'Hallo ' . $a['nama_lengkap'] . '! ' . $user['nama_lengkap'] . ' Telah mengupload tugas baru, <a href="' . base_url() . '/aplikasi/siswa/detail-tugas/' . $tugas['id'] . '" target="_blank">Klik disini</a> untuk melihat tugas!'
			// );
			tambah_notif($a['id'], '/aplikasi/siswa/detail-tugas/' . $tugas['id'], 'TUGAS ' . $mapel_guru['mapel'] . '! Ayo lihat dan kerjakan sekarang!', 'fa-clipboard-list');
		}
		if ($file) {
			foreach ($file['file'] as $f) {
				if (!$f->getError() == 4) {
					$this->db->table('file_tugas')->insert([
						'tugas_id' => $tugas['id'],
						'name' => $f->getName(),
						'ext' => $f->getExtension(),
					]);
					$f->move('file/tugas', $f->getName());
				}
			}
		}
		session()->setFlashdata('berhasil', 'Tugas berhasil terkirim! silahkan beri informasi kepada siswa kamu');
		return redirect()->to('/aplikasi/guru/tugas');
	}

	public function tambah_komentar()
	{
		$id = htmlspecialchars($this->request->getPost('id'));
		if (!$this->validate([
			'komentar' => 'required'
		])) {
			return redirect()->to('/aplikasi/guru/detail-tugas/' . $id)->withInput();
		}
		$komentar = htmlspecialchars($this->request->getPost('komentar'));
		$guru = $this->userModel->getUser($this->id);
		$this->komentarTugas->save([
			'tugas_id' => $id,
			'user_id' => $this->id,
			'komentar' => $komentar
		]);
		$komentars = $this->db->table('komentar_tugas')->select('user_id')->where(['tugas_id' => $id])->distinct()->get()->getResultArray();
		foreach ($komentars as $k) {
			if ($k['user_id'] != $guru['id']) {
				tambah_notif($k['user_id'], '/aplikasi/siswa/detail-tugas/' .  $id, '' . $guru['nama_lengkap'] . ' mengomentari tugas nya.', 'fa-comments');
			}
		}
		session()->setFlashdata('berhasil', 'Komentar berhasil ditambahkan.');
		return redirect()->to('/aplikasi/guru/detail-tugas/' . $id);
	}

	/* <========================= UBAH =========================> */

	public function act_ubah_tugas($id)
	{
		if (!$this->validate([
			'judul' => [
				'label' => 'Judul tugas',
				'rules' => 'required'
			],
			'deskripsi' => 'required',
			'file' => 'max_size[file,20000]|mime_in[file,application/vnd.openxmlformats-officedocument.wordprocessingml.document,application/vnd.openxmlformats-officedocument.presentationml.presentation,application/vnd.openxmlformats-officedocument.spreadsheetml.sheet,application/pdf,image/png,image/jpg,image/jpeg,video/mp4,video/3gpp,video/quicktime,video/MP2T,video/x-msvideo]|ext_in[file,png,jpg,jpeg,gif,pdf,docs,docx,doc,ppt,xlsx,pptx,xls,mp4,3gp,ts,avi,mov]',
		])) {
			return redirect()->to('/aplikasi/guru/ubah-tugas/' . $id)->withInput();
		}
		$judul = htmlspecialchars($this->request->getPost('judul'));
		$deadline_at = htmlspecialchars($this->request->getPost('deadline_at'));
		$deskripsi = htmlspecialchars($this->request->getPost('deskripsi'));
		$file = $this->request->getFiles('file');
		$file_lama = $this->request->getPost('file_lama');
		$user = $this->userModel->getUser($this->id);
		$mapel_guru = $this->db->table('user_mapel')->where('id', $user['mapel_id'])->get()->getRowArray();
		$ditugaskan = htmlspecialchars($this->request->getPost('ditugaskan'));
		$ditugaskan = ($ditugaskan == NULL) ? 0 : 1;

		$this->tugasModel->save([
			'id' => $id,
			'user_id' => $this->id,
			'mapel' => $mapel_guru['mapel'],
			'judul' => $judul,
			'deadline_at' => $deadline_at,
			'deskripsi' => $deskripsi,
			'ditugaskan' => $ditugaskan,
		]);
		$tugas = $this->db->table('tugas')->where(['id' => $id, 'user_id' => $this->id])->orderBy('id', 'DESC')->get()->getRowArray();
		if ($file_lama) {
			foreach ($file_lama as $fl) {
				$this->db->table('file_tugas')->update([
					'name' => $fl,
				], ['tugas_id' => $tugas['id']]);
			}
		}
		if ($file) {
			if ($file_lama) {
				foreach ($file['file'] as $f) {
					if (!$f->getError() == 4) {
						$this->db->table('file_tugas')->update([
							'name' => $f->getName(),
							'ext' => $f->getExtension(),
						], ['tugas_id' => $tugas['id']]);
						$f->move('file/tugas', $f->getName());
					}
				}
			} else {
				foreach ($file['file'] as $f) {
					if (!$f->getError() == 4) {
						$this->db->table('file_tugas')->insert([
							'tugas_id' => $tugas['id'],
							'name' => $f->getName(),
							'ext' => $f->getExtension(),
						]);
						$f->move('file/tugas', $f->getName());
					}
				}
			}
		}
		session()->setFlashdata('berhasil', 'Tugas berhasil diubah!');
		return redirect()->to('/aplikasi/guru/tugas');
	}

	public function act_ubah_konten($id)
	{
		if (!$this->validate([
			'judul' => [
				'label' => 'Judul konten',
				'rules' => 'required'
			],
			'deskripsi' => 'required',
			'file' => 'max_size[file,20000]|mime_in[file,application/vnd.openxmlformats-officedocument.wordprocessingml.document,application/vnd.openxmlformats-officedocument.presentationml.presentation,application/vnd.openxmlformats-officedocument.spreadsheetml.sheet,application/pdf,image/png,image/jpg,image/jpeg,video/mp4,video/3gpp,video/quicktime,video/MP2T,video/x-msvideo]|ext_in[file,png,jpg,jpeg,gif,pdf,docs,docx,doc,ppt,xlsx,pptx,xls,mp4,3gp,ts,avi,mov]',
		])) {
			return redirect()->to('/aplikasi/guru/ubah-konten/' . $id)->withInput();
		}
		$judul = htmlspecialchars($this->request->getPost('judul'));
		$deadline_at = htmlspecialchars($this->request->getPost('deadline_at'));
		$deskripsi = htmlspecialchars($this->request->getPost('deskripsi'));
		$file = $this->request->getFiles('file');
		$file_lama = $this->request->getPost('file_lama');
		$user = $this->userModel->getUser($this->id);
		$mapel_guru = $this->db->table('user_mapel')->where('id', $user['mapel_id'])->get()->getRowArray();

		$this->tugasModel->save([
			'id' => $id,
			'user_id' => $this->id,
			'mapel' => $mapel_guru['mapel'],
			'judul' => $judul,
			'type' => 'konten-pembelajaran',
			'deadline_at' => $deadline_at,
			'deskripsi' => $deskripsi,
			'ditugaskan' => 0,
		]);
		$tugas = $this->db->table('tugas')->where(['id' => $id, 'user_id' => $this->id])->orderBy('id', 'DESC')->get()->getRowArray();
		if ($file_lama) {
			foreach ($file_lama as $fl) {
				$this->db->table('file_tugas')->update([
					'name' => $fl,
				], ['tugas_id' => $tugas['id']]);
			}
		}
		if ($file) {
			if ($file_lama) {
				foreach ($file['file'] as $f) {
					if (!$f->getError() == 4) {
						$this->db->table('file_tugas')->update([
							'name' => $f->getName(),
							'ext' => $f->getExtension(),
						], ['tugas_id' => $tugas['id']]);
						$f->move('file/tugas', $f->getName());
					}
				}
			} else {
				foreach ($file['file'] as $f) {
					if (!$f->getError() == 4) {
						$this->db->table('file_tugas')->insert([
							'tugas_id' => $tugas['id'],
							'name' => $f->getName(),
							'ext' => $f->getExtension(),
						]);
						$f->move('file/tugas', $f->getName());
					}
				}
			}
		}
		session()->setFlashdata('berhasil', 'Tugas berhasil diubah!');
		return redirect()->to('/aplikasi/guru/konten-pembelajaran');
	}

	/* <========================= HAPUS =========================> */
	public function hapus_absen()
	{
		if ($this->request->isAjax()) {
			$id = htmlspecialchars($this->request->getPost('id'));
			$this->db->table('absen')->delete(['id' => $id]);
			session()->setFlashdata('berhasil', 'Absen Berhasil dihapus!');
			return $this->db->table('data_absen')->delete(['absen_id' => $id]);
		} else {
			return redirect()->to('/auth/blocked');
		}
	}
	public function hapus_tugas()
	{
		if ($this->request->isAjax()) {
			$id = htmlspecialchars($this->request->getPost('id'));
			$file_tugas = $this->db->table('file_tugas')->where(['tugas_id' => $id])->get()->getResultArray();
			$data_tugas = $this->db->table('data_tugas')->where(['tugas_id' => $id])->get()->getResultArray();
			if ($data_tugas) {
				foreach ($data_tugas as $dt) {
					$file_data_tugas = $this->db->table('file_tugas')->where(['data_tugas_id' => $dt['id']])->get()->getResultArray();
					if ($file_data_tugas) {
						foreach ($file_data_tugas as $fdt) {
							unlink('file/tugas/' . $fdt['name']);
						}
					}
				}
			}
			if ($file_tugas) {
				foreach ($file_tugas as $ft) {
					unlink('file/tugas/' . $ft['name']);
				}
			}
			$this->db->table('tugas')->delete(['id' => $id]);
			$this->db->table('file_tugas')->delete(['tugas_id' => $id]);
			$this->db->table('komentar_tugas')->delete(['tugas_id' => $id]);
			session()->setFlashdata('berhasil', 'Tugas Berhasil dihapus!');
			return $this->db->table('data_tugas')->delete(['tugas_id' => $id]);
		} else {
			return redirect()->to('/auth/blocked');
		}
	}
	public function hapus_notifikasi()
	{
		if ($this->request->isAJAX()) {
			$id = htmlspecialchars($this->request->getPost('id'));
			session()->setFlashdata('berhasil', 'Notifikasi berhasil dihapus!');
			return $this->notifModel->where(['user_id' => $this->id])->delete();
		} else {
			return redirect()->to('/auth/blocked');
		}
	}
	public function hapus_artikel()
	{
		if ($this->request->isAJAX()) {
			$id = htmlspecialchars($this->request->getPost('id'));
			session()->setFlashdata('berhasil', 'Artikel berhasil dihapus!');
			return $this->artikelModel->where(['id' => $id, 'user_id' => $this->id])->delete();
		} else {
			return redirect()->to('/auth/blocked');
		}
	}

	public function delete_image_artikel()
	{
		$src = $this->request->getPost('src');
		$file_name = str_replace(base_url() . '/', '', $src);
		unlink($file_name);
	}


	public function download($name = FALSE)
	{
		if ($name == FALSE) {
			return redirect()->to('/auth/blocked');
		} else {
			return $this->response->download('file/tugas/' . $name, null)->setFileName('File Tugas belajar online - ' . $name);
		}
	}

	public function cek_notif()
	{
		if ($this->request->isAJAX()) {
			$id = htmlspecialchars($this->request->getPost('id'));
			return $this->notifModel->save([
				'id' => $id,
				'is_cek' => 1,
			]);
		} else {
			return redirect()->to('/auth/blocked');
		}
	}
}
