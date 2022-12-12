<?= $this->extend('aplikasi/layout/template') ?>
<?= $this->section('content') ?>

<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">Panduan Admin</h1>

	<div class="row">
		<div class="col-md-6">
			<?php if (session()->getFlashdata('berhasil')) : ?>
				<div class="alert alert-success text-center">
					<?= session()->getFlashdata('berhasil') ?>
				</div>
			<?php endif ?>
			<hr class="my-2">
			<div class="mb-3">
				<p>
					Halo <?= $user['nama_lengkap']; ?>,
					<br>Selamat datang di website belajar online! Kamu bisa upload tugas dan buat absensi kelas harian disini. jika kamu masih bingung dengan aplikasi ini silahkan baca <a href="#panduan" class="badge badge-primary" id="panduan">buku panduan</a> agar tidak terjadi ketidaknyamanan.
				</p>
			</div>
			<div>
				<h4 class="text-gray-800">Apa tujuan aplikasi ini ?</h4>
				<p>Tujuan dibentuknya aplikasi ini untuk memudahkan kita dalam belajar secara online,
					dalam masa pandemi ini diharapkan bisa memulai belajar dengan semangat dan meningkatkan prestasi siswa dalam belajar bahasa Inggris.
				</p>
			</div>
		</div>

		<!-- Content Row -->
		<div class="col-md-6">
			<h4 class="text-gray-800 mb-3" id="panduan">Buku panduan</h4>
			<nav>
				<div class="nav nav-tabs" id="nav-tab" role="tablist">
					<a class="nav-link active" id="nav-tugas-tab" data-toggle="tab" href="#nav-tugas" role="tab" aria-controls="nav-tugas" aria-selected="true">Tugas</a>
				</div>
			</nav>
			<div class="tab-content mb-5" id="nav-tabContent">
				<div class="tab-pane fade show active" id="nav-tugas" role="tabpanel" aria-labelledby="nav-tugas-tab">
					<p class="mt-2">
						Kamu bisa mengelola data - data menu utama di halaman <a href="/aplikasi/menu" class="badge badge-info">Data Menu</a> disana kamu dapat mengelola menu yang ada ataupun data yang ada di menu tersebut.
						<br>
						<br>
						Kamu juga bisa untuk mengelola data - data guru di halaman <a href="/aplikasi/data" class="badge badge-info">Data Guru</a> disana kamu dapat mengelola data guru yang ada.
						Mulai dari menambah data, menghapus data serta mengubah data yang ada.
						<br>
						<br>
						Kamu juga bisa untuk mengelola data - data guru di halaman <a href="/aplikasi/data/siswa" class="badge badge-info">Data Siswa</a> disana kamu dapat mengelola data guru yang ada.
						Mulai dari menambah data, menghapus data serta mengubah data yang ada.
					</p>
				</div>
			</div>
		</div>



	</div>
</div>
<!-- /.container-fluid -->

<?= $this->endSection() ?>