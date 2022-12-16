<?= $this->extend("aplikasi/layout/template"); ?>

<?= $this->section("content"); ?>

<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-3 text-gray-800">Edit Konten Pembelajaran</h1>

	<hr class="my-2 mb-3">
	<!-- Content Row -->
	<div class="row">
		<div class="col-md-10">
			<?php if ($validation->getErrors()) : ?>
				<div class="alert alert-danger">
					<?= $validation->listErrors() ?>
				</div>
			<?php endif ?>

			<form action="/aplikasi/guru/act_ubah_konten/<?= $tugas['id'] ?>" method="post" enctype="multipart/form-data">
				<?= csrf_field(); ?>
				<input type="hidden" name="_method" value="UPDATE">
				<?php if (!empty($file_tugas)) : ?>
					<?php foreach ($file_tugas as $file) : ?>
						<input type="hidden" name="file_lama[]" value="<?= $file['name']; ?>">
					<?php endforeach ?>
				<?php endif ?>
				<div class="form-group row">
					<label for="judul" class="col-3 col-lg-2 col-form-label">Judul</label>
					<div class="col-9">
						<input type="text" class="form-control <?= ($validation->hasError('judul')) ? 'is-invalid' : '' ?>" id="judul" name="judul" value="<?= (old('judul')) ? old('judul') : $tugas['judul'] ?>">
						<div class="invalid-feedback">
							<?= $validation->getError('judul') ?>
						</div>
					</div>
				</div>

				<div class="form-group row">
                    <label for="deskripsi" class="col-3 col-lg-2 col-form-label">Deskripsi</label>
					<div class="col-9">
                        <textarea class="form-control <?= ($validation->hasError('deskripsi')) ? 'is-invalid' : '' ?>" id="deskripsi" name="deskripsi" rows="5"><?= (old('deskripsi')) ? old('deskripsi') : $tugas['deskripsi'] ?></textarea>
						<div class="invalid-feedback">
                            <?= $validation->getError('deskripsi') ?>
						</div>
					</div>
				</div>
                
				<div class="form-group row">
					<label for="file" class="col-3 col-lg-2 col-form-label">Ganti File/Foto : </label>
					<div class="col-9">
						<div class="custom-file">
							<input type="file" class="custom-file-input <?= ($validation->hasError('file')) ? 'is-invalid' : '' ?>" id="file" name="file[]" multiple>
							<div class="invalid-feedback">
								<?= $validation->getError('file') ?>
							</div>
							<label class="custom-file-label" for="file" id="pilihFile">Pilih File</label>
						</div>
						<div id="namaFile" class="mt-2"></div>
						<small class="text-danger">Ketika anda ganti file, maka file lama akan dihapus!</small>
					</div>
				</div>
				<div class="form-group row">
					<label for="file" class="col-3 col-lg-2 col-form-label">File/Foto Lama: </label>
					<div class="col-9">
						<?php if (!empty($file_tugas)) : ?>
							<?php foreach ($file_tugas as $file) : ?>
								<span class="d-block"><i class="fas fa-file-alt fa-sm fa-fw"></i> <?= $file['name']; ?></span>
							<?php endforeach ?>
						<?php else : ?>
							<span>tidak ada</span>
						<?php endif ?>
					</div>
				</div>

				<div class="form-group row mt-4">
					<div class="col d-flex justify-content-center">
						<button type="submit" class="btn btn-primary btn-icon-split btn-sm">
							<span class="icon text-white-50">
								<i class="fas fa-pen"></i>
							</span>
							<span class="text">Ubah</span>
						</button>
					</div>
				</div>
			</form>
		</div>
	</div>

</div>

<script>
	$('#info').click(function(e) {
		e.preventDefault();
		swal('Apa itu ditugaskan?', 'Jika kamu mencentang "ditugaskan" maka siswa diwajibkan untuk mengumpul tugas yang kamu berikan.', 'info')
	});
</script>

<?= $this->endSection(); ?>