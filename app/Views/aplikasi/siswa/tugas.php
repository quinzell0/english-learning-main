<?= $this->extend('aplikasi/layout/template') ?>
<?= $this->section('content') ?>

<!-- Begin Page Content -->
<div class="container-fluid">
	<h1 class="h3 text-gray-800">Daftar Tugas</h1>
	<ol class="breadcrumb mb-4">
		<li class="breadcrumb-item"><a href="/aplikasi/siswa"><i class="fa fa-home fa-fw fa-sm"></i> home</a></li>
		<li class="breadcrumb-item active"><a href="/aplikasi/siswa/forum-tugas"><i class="fa fa-comments fa-fw fa-sm"></i>Tugas</a></li>
		<!-- <li class="breadcrumb-item active"></li> -->
	</ol>

	<?php if ($tugas == null) : ?>
		<div class="row mb-5">
			<div class="col-md-6 col-lg-4">
				<div class="alert alert-info" role="alert">
					<span>Daftar Tugas belum tersedia</span>
				</div>
			</div>
		</div>
	<?php else : ?>


		<div class="row mb-5">
			<?php foreach ($tugas as $t) : ?>
				<?php $guru = $db->table('user')->where('id', $t['user_id'])->get()->getRowArray() ?>

				<div class="col-md-6 col-lg-4">
					<div class="card shadow mb-4">
						<div class="card-body">
							<div class="row align-items-center">
								<div class="col-auto">
									<img src="/template/img/profil/<?= $guru['foto']; ?>" class="rounded-circle" width="60" height="60">
								</div>
								<div class="col">
									<p class="h6 font-weight-bold text-gray-800 mb-0 text-break"><?= $t['judul']; ?></p>
									<small class=""><?= waktu_lalu($t['created_at']) ?></small>
									<?php if ($t['ditugaskan'] == 1) : ?>
										<div class="small text-info mt-1 text-break">DITUGASKAN</div>
									<?php endif ?>
								</div>
							</div>
						</div>
						<div class="card-footer small d-flex justify-content-between">
							<a href="/aplikasi/siswa/detail-tugas/<?= $t['id']; ?>" class="text-muted text-decoration-none"><?= $komentar->where('tugas_id', $t['id'])->countAllResults(); ?> komentar</a>
							<a href="/aplikasi/siswa/detail-tugas/<?= $t['id']; ?>" class="text-primary text-decoration-none">Lihat selengkapnya <i class="fa fa-chevron-right fa-sm fa-fw"></i></a>

						</div>
					</div>
				</div>
			<?php endforeach ?>
		</div>

	<?php endif ?>





</div>
<!-- /.container-fluid -->

<?= $this->endSection() ?>