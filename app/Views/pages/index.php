<?= $this->extend('layout/template'); ?>
<?= $this->section('content'); ?>
<?php if (session()->getFlashdata('berhasil')) : ?>
	<script>
		swal('Pesan terkirim!!', 'Terima kasih sudah hubungi kami, secepatnya akan kami respon', 'success')
	</script>
<?php endif ?>
<?php if (session()->getFlashdata('gagal')) : ?>
	<script>
		swal('Error!', '<?= $validation->getError('nama_lengkap') ?> <?= $validation->getError('email') ?> <?= $validation->getError('pesan') ?>', 'error')
	</script>
<?php endif ?>

<div id="home">
	<nav class="navbar navbar-expand-lg navbar-light fixed-top custom-navbar">
		<div class="container">
			<a class="navbar-brand font-weight-bold" href="/">E-Learning</a>
			<button class="navbar-toggler d-lg-none" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="navbarNav">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse justify-content-end" id="navbarNav">
				<ul class="navbar-nav mt-2 mt-lg-0 align-items-center">
					<li class="nav-item">
						<a class="nav-link active" href="#home">Home</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="#fitur">Fitur</a>
					</li>
					<!-- <li class="nav-item">
						<a class="nav-link" href="#hubungi">Hubungi Kami</a>
					</li> -->
					<li class="nav-item">
						<a class="nav-link btn-masuk mt-2 mt-lg-0" href="/masuk">
							<?= (session()->has('e')) ? '<i class="fas fa-user fa-sm fa-fw"></i> Dashboard Saya' : '<i class="fas fa-sign-in-alt fa-sm fa-fw"></i> Masuk'; ?>
						</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container">
		<div class="row">
			<div class="col-lg-4">
				<div class="custom-section">
					<h1>Tingkatkan Prestasi Mu <br>dengan belajar Bahasa Inggris!</h1>
					<p>Bingung belajar bahasa Inggris dimana? daftar disini aja.
						Tunggu apalagi ? Daftar Sekarang!
					</p>
					<a class="btn btn-primary btn-daftar mr-1" href="/daftar">Daftar sekarang</a>
					<a class="btn btn-primary btn-masuk" href="/masuk">Masuk</a>
				</div>
			</div>
		</div>
	</div>

	<section id="fitur">
		<div class="container py-5">
			<div class="row">
				<div class="col">
					<h1 class="text-capitalize">Apa saja fitur yang
						disediakan?</h2>
				</div>
			</div>
			<div class="row mt-4 justify-content-center">
				<div class="col-lg-4 mb-3">
					<img src="/img/tugas-kelas.png" alt="Tugas kelas" class="mb-4">
					<h5>Konten Kelas</h5>
					<p>Untuk menilai kemampuan kamu, kamu akan diberikan tugas oleh guru kamu.</p>
				</div>
				<div class="col-lg-4 mb-3">
					<img src="/img/absen-kelas.png" alt="Membaca artikel" class="mb-4">
					<h5>Komentar Tugas</h5>
					<p>Bingung sama soal tugas? tenang! kamu bisa berkomentar untuk menanyakan detail tugas.</p>
				</div>
			</div>
		</div>
	</section>

	<!-- <section id="hubungi">
		<div class="container py-3">
			<div class="row">
				<div class="col">
					<h1 class="text-capitalize">Hubungi Kami</h2>
				</div>
			</div>
			<div class="row justify-content-center mb-2">
				<div class="col-md-6">
					<form action="/hubungi" method="post" class="form-hubungi" autocomplete="off">
						<div class="form-group">
							<label for="nama_lengkap">Nama lengkap</label>
							<input type="text" class="form-control" name="nama_lengkap" id="nama_lengkap" aria-describedby="asdsad" value="<?= old('nama_lengkap'); ?>">
						</div>
						<div class="form-group">
							<label for="email">Email</label>
							<input type="text" class="form-control" name="email" id="email" value="<?= old('email'); ?>">
						</div>
						<div class="form-group">
							<label for="pesan">Pesan</label>
							<textarea class="form-control" name="pesan" id="pesan" rows="4"><?= old('pesan'); ?></textarea>
						</div>
						<div class="d-flex justify-content-center">
							<button type="submit" class="btn">Kirim</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section> -->

</div>
<?= $this->endSection(); ?>