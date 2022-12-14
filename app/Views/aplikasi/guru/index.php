<?= $this->extend('aplikasi/layout/template') ?>
<?= $this->section('content') ?>

<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">Panduan Guru</h1>

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
						Kamu bisa buat tugas di halaman <a href="/aplikasi/guru/tugas" class="badge badge-info">Tugas</a> disana sudah lengkap dengan fitur untuk Tambah, Ubah, Hapus, dan Lihat data tugas.
						<br>
						<br>
						Saat kamu membuat tugas untuk siswa, disana ada fitur <b>Upload File, Foto dan Video</b> tapi maksimal pengiriman file/video hanya 20MB dan juga ekstensi yang terbatas. hanya bisa upload file <b>Microsoft Word, Power Point, Excel dan PDF</b>. Selain dari itu tidak diizinkan mengupload, <i>*terkecuali di perbaharui</i>
						<br>
						<br>
						Ketika kamu ingin memberikan konten pembelajaran berupa materi pembelajaran kepada siswa maka kamu dapat pergi ke halaman <a href="/aplikasi/guru/konten-pembelajaran" class="badge badge-info">Konten pembelajaran</a> disana kamu dapat membuat, mengubah, menghapus dan melihat data materi pembelajaran.
						Tidak hanya itu, mereka juga dapat berkomentar di tugas yang kamu berikan dan dapat menyerahkan tugas yang anda berikan.
						<br>
						<br>
						File, Foto dan Video yang siswa berikan juga bisa di download dan dapat dilihat juga, Tapi disini kamu tidak dapat menilai poin tugas siswa.
						<br>
						<br>
						<b>INGAT!</b> ketika kamu menghapus tugas, maka data tugas yang dikumpulkan oleh siswa juga terhapus. Jadi jika ingin menghapus tugas harap berpikir dahulu. Sekian dan terima kasih...
					</p>
				</div>
			</div>
		</div>



	</div>
</div>
<!-- /.container-fluid -->

<?= $this->endSection() ?>