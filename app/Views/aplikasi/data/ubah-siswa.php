<?= $this->extend("aplikasi/layout/template"); ?>

<?= $this->section("content"); ?>

<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-3 text-gray-800">Ubah Akun Siswa</h1>

	<hr class="my-2 mb-3">
	<!-- Content Row -->
	<div class="row">
		<div class="col-md-10">

			<form action="/aplikasi/data/update_data/<?= $siswa['id'] ?>" method="post">
				<?= csrf_field(); ?>
				<input type="hidden" name="_method" value="UPDATE">
				<input type="hidden" name="password_lama" value="<?= $siswa['password']; ?>">
				<input type="hidden" name="email_lama" value="<?= $siswa['email']; ?>">
				<div class="form-group row">
					<label for="nama_lengkap" class="col-3 col-lg-2 col-form-label">Nama Lengkap</label>
					<div class="col-9">
						<input type="text" class="form-control <?= ($validation->hasError('nama_lengkap')) ? 'is-invalid' : '' ?>" id="nama_lengkap" name="nama_lengkap" value="<?= (old('nama_lengkap')) ? old('nama_lengkap') : $siswa['nama_lengkap'] ?>">
						<div class="invalid-feedback">
							<?= $validation->getError('nama_lengkap') ?>
						</div>
					</div>
				</div>
				
				<div class="form-group row">
					<label for="email" class="col-3 col-lg-2 col-form-label">Email</label>
					<div class="col-9">
						<input type="text" class="form-control <?= ($validation->hasError('email')) ? 'is-invalid' : '' ?>" id="email" name="email" value="<?= (old('email')) ? old('email') : $siswa['email'] ?>">
						<div class="invalid-feedback">
							<?= $validation->getError('email') ?>
						</div>
					</div>
				</div>

				<div class="form-group row">
					<label for="password" class="col-3 col-lg-2 col-form-label">Password</label>
					<div class="col-9">
						<input type="text" class="form-control <?= ($validation->hasError('password')) ? 'is-invalid' : '' ?>" id="password" name="password" value="<?= old('password') ?>">
						<div class="invalid-feedback">
							<?= $validation->getError('password') ?>
						</div>
						<small class="form-text text-muted">
							Password berisi hash code, jika ingin mengubah silahkan isi jika tidak kosongkan saja.
						</small>
					</div>
				</div>

				<div class="form-group row">
					<label for="alamat" class="col-3 col-lg-2 col-form-label">Alamat</label>
					<div class="col-9">
						<input type="text" class="form-control <?= ($validation->hasError('alamat')) ? 'is-invalid' : '' ?>" id="alamat" name="alamat" value="<?= (old('alamat')) ? old('alamat') : $siswa['alamat'] ?>">
						<div class="invalid-feedback">
							<?= $validation->getError('alamat') ?>
						</div>
					</div>
				</div>

				<div class="form-group row">
					<label for="is_active" class="col-3 col-lg-2 col-form-label">Aktif ?</label>
					<div class="col-9">
						<div class="custom-control custom-switch">
							<input type="checkbox" class="custom-control-input" id="is_active" name="is_active" <?= ($siswa['is_active'] == 1) ? 'checked' : '' ?>>
							<label class="custom-control-label" for="is_active"></label>
						</div>
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

<?= $this->endSection(); ?>