<?= $this->extend('aplikasi/layout/template') ?>
<?= $this->section('content') ?>

<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">Dashboard Siswa</h1>

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
					<br>
					Selamat datang di website belajar online! kamu bisa mengumpulkan tugas dan mendownload konten pembelajaran disini. jika kamu masih bingung dengan aplikasi ini silahkan baca <a href="#panduan" class="badge badge-primary" id="panduan">buku panduan</a> agar tidak terjadi ketidaknyamanan.
				</p>
			</div>
			<div>
				<h4 class="text-gray-800">Apa tujuan aplikasi ini ?</h4>
				<p>Tujuan dibentuknya aplikasi ini untuk memudahkan kita dalam belajar secara online,
					dalam masa pandemi ini diharapkan bisa memulai belajar dengan semangat dan meningkatkan prestasi kita dalam belajar bahasa inggris.
				</p>
			</div>
		</div>

		<!-- Content Row -->
		<div class="col-md-6">
			<h4 class="text-gray-800 mb-3" id="panduan">Buku panduan</h4>
			<nav>
				<div class="nav nav-tabs" id="nav-tab" role="tablist">
					<a class="nav-link active" id="nav-tugas-tab" data-toggle="tab" href="#nav-tugas" role="tab" aria-controls="nav-tugas" aria-selected="true">Umum</a>
				</div>
			</nav>
			<div class="tab-content mb-5" id="nav-tabContent">
				<div class="tab-pane fade show active" id="nav-tugas" role="tabpanel" aria-labelledby="nav-tugas-tab">
					<p class="mt-2">
						Di aplikasi ini kamu dapat mendownload konten pembelajaran yang telah diberikan oleh guru didalam aplikasi e-learning di halaman <a href="/aplikasi/siswa/forum-konten-pembelajaran" class="badge badge-primary">Konten Pembelajaran</a>
						<br>
						<br>
						Kamu bisa menyerahkan tugas di halaman tugas tetapi penyerahan tugas hanya bisa 1 kali saja.
						<br>
						Selain dari itu, kamu juga bisa berkomentar dan berdiskusi disana
						<br>
						Kamu akan mendapatkan notifikasi dari gmail jika ada tugas baru yang masuk,
						<br>
						<br>
						Saat kamu menyerahkan tugas, disana ada fitur <b>Upload File, Foto dan Video</b> tapi maksimal pengiriman file/video hanya 20MB dan juga ekstensi yang terbatas. hanya bisa upload file <b>Microsoft Word, Power Point, Excel dan PDF</b>. Selain dari itu tidak diizinkan mengupload, <i>*terkecuali di perbaharui</i>
						<br>
						<br>
						<b>INGAT!</b> ketika <b>Guru</b> kamu menghapus tugas, maka data tugas yang kamu kumpulkan juga terhapus.
						<br>
						<i>Jadilah pengguna yang bijak! Sekian dan terima kasih...</i>
					</p>
				</div>
			</div>
		</div>



	</div>
</div>
<!-- /.container-fluid -->

<?= $this->endSection() ?>