<?php
include "header.php";
?>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>LRA</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active">LRA</li>
                    </ol>
                </div>
            </div>
        </div><!-- /.container-fluid -->
    </section>
    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header">
                            <div class="row">
                                <div class="col-2">
                                    <img src="dist/img/logo.png" width="50%" alt="" srcset="">
                                </div>
                                <div class="col-10">
                                    <h6>
                                        <center>PEMERINTAH KABUPATEN MOROWALI</center>
                                    </h6>
                                    <h4>
                                        <center>LAPORAN REALISASI ANGGARAN PENDAPATAN DAN BELANJA DAERAH</center>
                                    </h4>
                                    <h6>
                                        <center>TAHUN ANGGARAN 2019</center>
                                    </h6>
                                </div>
                            </div>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body">
                            <table>
                                <tr>
                                    <td>Kode Rekening</td>
                                    <td>:</td>
                                    <td>Urusan Wajib Pelayanan Dasar Pendidikan</td>
                                </tr>
                                <tr>
                                    <td>Uraian</td>
                                    <td>:</td>
                                    <td>Dinas Pendidikan dan Kebudayaan</td>
                                </tr>
                                <tr>
                                    <td>Jumlah</td>
                                    <td>:</td>
                                    <td>Dinas Pendidikan dan Kebudayaan</td>
                                </tr>
                            </table>
                            <hr>

                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modal-default"><i class="fa fas fa-plus"></i> Tambah Data LRA</button>
                            <div style="float: right;">
                                <form action="" method="post">
                                    <div class="row">
                                        <div class="col-8">
                                            <input type="text" class="form-control" id="exampleInputEmail1" placeholder="Enter keyword">
                                        </div>
                                        <div class="col-4">
                                            <button type="button" class="btn btn-success"><i class="fa fas fa-search"></i> Cari</button>
                                        </div>
                                    </div>
                                </form>
                            </div>

                            <hr>
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th rowspan="2">Kode Rekening</th>
                                        <th rowspan="2">Uraian</th>
                                        <th colspan="2">Jumlah</th>
                                        <th rowspan="2">Fisik</th>
                                        <th rowspan="2">Bertambah / Berkurang</th>
                                        <th rowspan="2">%</th>
                                        <th rowspan="2">Pelaksana</th>
                                        <th rowspan="2">Sumber Dana</th>
                                        <th rowspan="2">Lokasi</th>
                                    </tr>
                                    <tr>
                                        <th>Anggaran</th>
                                        <th>Realisasi</th>
                                    </tr>
                                    <tr>
                                        <?php
                                        for ($i = 1; $i <= 10; $i++) { ?>
                                            <th>
                                                <center><?= $i; ?></center>
                                            </th>
                                        <?php }
                                        ?>
                                    </tr>
                                </thead>
                                <tbody>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <!-- <tr>
                                        <td>1.</td>
                                        <td>Update software</td>
                                        <td>
                                            <div class="progress progress-xs">
                                                <div class="progress-bar progress-bar-danger" style="width: 55%"></div>
                                            </div>
                                        </td>
                                        <td><span class="badge bg-danger">55%</span></td>
                                    </tr> -->
                                </tbody>
                            </table>
                        </div>
                        <!-- /.card-body -->
                        <div class="card-footer clearfix">
                            <ul class="pagination pagination-sm m-0 float-right">
                                <li class="page-item"><a class="page-link" href="#">&laquo;</a></li>
                                <li class="page-item"><a class="page-link" href="#">1</a></li>
                                <li class="page-item"><a class="page-link" href="#">2</a></li>
                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                <li class="page-item"><a class="page-link" href="#">&raquo;</a></li>
                            </ul>
                        </div>
                    </div>
                    <!-- /.card -->
                </div>
            </div>
        </div>
    </section>
</div>
<div class="modal fade" id="modal-default">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Tambah Data LRA</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="" method="post">
                    <div class="row">
                        <div class="col-4">
                            <div class="form-group">
                                <select class="form-control">
                                    <option>Rekening 1</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="form-group">
                                <select class="form-control">
                                    <option>Rekening 2</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="form-group">
                                <select class="form-control">
                                    <option>Rekening 3</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="form-group">
                                <select class="form-control">
                                    <option>Rekening 4</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="form-group">
                                <select class="form-control">
                                    <option>Rekening 5</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="form-group">
                                <p>Uraian</p>
                                <input type="text" name="uraian" class="form-control" placeholder="Uraian">
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="form-group">
                                <p>Anggaran</p>
                                <input type="text" name="anggaran" class="form-control" placeholder="Anggaran">
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="form-group">
                                <p>Realisasi</p>
                                <input type="text" name="realisasi" class="form-control" placeholder="Realisisai">
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="form-group">
                                <p>Fisik</p>
                                <input type="text" name="fisik" class="form-control" placeholder="Fisik">
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="form-group">
                                <p>Bertambah/Berkurang</p>
                                <input type="text" name="tambah_kurang" class="form-control" placeholder="Bertambah/Berkurang">
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="form-group">
                                <p>%</p>
                                <input type="text" name="persen" class="form-control" placeholder="%">
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="form-group">
                                <p>Pelaksana</p>
                                <input type="text" name="pelaksana" class="form-control" placeholder="Pelaksana">
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="form-group">
                                <p>Sumber Dana</p>
                                <input type="text" name="sumber_dana" class="form-control" placeholder="Sumber Dana">
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="form-group">
                                <p>Lokasi</p>
                                <input type="text" name="lokasi" class="form-control" placeholder="Lokasi">
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div style="float: right;">
                            <button type="button" class="btn btn-primary">Submit</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->
<?php
include "footer.php";
