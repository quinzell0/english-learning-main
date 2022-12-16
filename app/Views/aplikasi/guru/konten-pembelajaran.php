<?= $this->extend('aplikasi/layout/template') ?>
<?= $this->section('content') ?>

<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-3 text-gray-800">Daftar Konten</h1>

    <a href="#" class="btn btn-primary btn-icon-split mb-3" data-toggle="modal" data-target="#tambahKontenModal">
        <span class="icon text-white-50">
            <i class="fas fa-plus"></i>
        </span>
        <span class="text">Buat Konten Pembelajaran</span>
    </a>
    <div class="row">
        <div class="col-md-8">
            <?php if ($validation->getErrors()) : ?>
                <div class="alert alert-danger">
                    <?= $validation->listErrors() ?>
                </div>
            <?php endif ?>
            <?php if (session()->getFlashdata('berhasil')) : ?>
                <div class="alert alert-success">
                    <?= session()->getFlashdata('berhasil') ?>
                </div>
            <?php endif ?>
        </div>
    </div>

    <div class="card shadow mt-3 mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Riwayat Konten</h6>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th>No.</th>
                            <th>Judul Konten</th>
                            <th>Deskripsi</th>
                            <th>Tanggal Upload</th>
                            <th>Aksi</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php $no = 1;
                        foreach ($tugas as $t) : ?>
                            <tr>
                                <td><?= $no++; ?></td>
                                <td><?= word_limiter($t['judul'], 6); ?></td>
                                <td><?= word_limiter($t['deskripsi'], 6) ?></td>
                                <td><?= tanggal_lengkap($t['created_at']); ?> <?= jam($t['created_at']); ?></td>
                                <td>
                                    <a href="/aplikasi/guru/detail-konten/<?= $t['id']; ?>" class="badge badge-success"><i class="fa fa-eye fa-fw"></i> Lihat tugas</a>
                                    <a href="/aplikasi/guru/ubah-konten/<?= $t['id']; ?>" class="badge badge-warning"><i class="fas fa-pen fa-fw"></i> Ubah</a>
                                    <a href="#" class="badge badge-danger" id="btnHapusKonten" data-id="<?= $t['id']; ?>"><i class="fa fa-trash fa-fw"></i> Hapus</a>
                                </td>
                            </tr>
                        <?php endforeach ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <!-- /.container-fluid -->

</div>

<!-- Tambah Tugas Modal-->
<div class="modal fade" id="tambahKontenModal" tabindex="-1" role="dialog" aria-labelledby="tambahKontenModal" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="Konten Pembelajaran-title" id="tambahKontenModal">Konten Pembelajaran</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <form action="/aplikasi/guru/tambah_konten" method="POST" enctype="multipart/form-data" autocomplete="off">
                <div class="modal-body">
                    <?= csrf_field(); ?>
                    <div class="form-group">
                        <input type="text" class="form-control" id="judul" placeholder="Judul konten pembelajaran" name="judul" value="<?= old('judul'); ?>">
                    </div>
                    <div class="form-group">
                        <textarea class="form-control" id="text" placeholder="Deskripsi" name="deskripsi" rows="3"><?= old('deskripsi'); ?></textarea>
                    </div>
                    <div class="Kontengroup">
                        <label for="file">Tambahkan File/Foto : </label>
                        <div class="custom-file">
                            <input type="file" class="custom-file-input <?= ($validation->hasError('file')) ? 'is-invalid' : '' ?>" id="file" name="file[]" multiple>
                            <div class="invalid-feedback">
                                <?= $validation->getError('file') ?>
                            </div>
                            <label class="custom-file-label" for="file" id="pilihFile">Pilih File</label>
                        </div>
                        <div id="namaFile" class="mt-2"></div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">batal</button>
                    <button class="btn btn-primary" type="submit">Tambah</button>
                </div>
            </form>
        </div>
    </div>
</div>


<script>
    // HAPUS TUGAS
    $('a#btnHapusKonten').click(function(e) {
        e.preventDefault();
        swal({
                title: "Apa kamu yakin?",
                text: "Jika kamu hapus konten pembelajaran ini, maka file yang diupload juga akan terhapus!",
                icon: "warning",
                buttons: ["Batal!", true],
                dangerMode: true,
            })
            .then((willDelete) => {
                if (willDelete) {
                    swal("Ketik 'ya' jika ingin menghapus :", {
                            content: "input",
                        })
                        .then((value) => {
                            if (value.toLowerCase() == 'ya') {
                                var id = $(this).data('id');
                                $.ajax({
                                    type: "post",
                                    url: "/aplikasi/guru/hapus_tugas",
                                    data: {
                                        id: id
                                    },
                                    success: function(r) {
                                        swal("Data berhasil dihapus!", {
                                            icon: "success",
                                        }).then((dihapus) => {
                                            window.location.href = '/aplikasi/guru/konten-pembelajaran';
                                        });
                                    }
                                });
                            } else {
                                swal('Kode Salah!', 'Kode yang kamu masukan tidak sesuai!', 'error')
                            }
                        });
                }
            });
    });
</script>
<?= $this->endSection() ?>