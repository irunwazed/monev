<?php

$judul = "Data Kegiatan";

?>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1><?=$judul?></h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active"><?=$judul?></li>
                    </ol>
                </div>
            </div>
        </div><!-- /.container-fluid -->
    </section>
    <section class="content">
        <div class="container-fluid" id="data-load">
            <a href="<?=base_url("monev/program/".$kode)?>" class="btn btn-info"><i class="fa fa-arrow-circle-left"></i> Kembali</a>
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header">
                            <div class="row">
                                <div class="col-12">
                                    <!-- <h6>
                                        <center>PEMERINTAH KABUPATEN MOROWALI</center>
                                    </h6> -->
                                    <h4>
                                        <center><?=$judul?></center>
                                    </h4>
                                    <!-- <h6>
                                        <center>TAHUN ANGGARAN <span id="set-tahun"></span></center>
                                    </h6> -->
                                </div>
                            </div>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body">
                            <div>
                                <!-- <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modal-form" onclick="setCreate()"><i class="fa fas fa-plus"></i> Tambah Data</button> -->
                            </div>
                            <table>
                                <tr>
                                    <td>Visi</td>
                                    <td>:</td>
                                    <td><?=@$dataRpjmd->tb_rpjmd_visi?></td>
                                </tr>
                                <tr>
                                    <td>Misi</td>
                                    <td>:</td>
                                    <td><?=@$dataRpjmd->tb_rpjmd_misi_nama?></td>
                                </tr>
                                <tr>
                                    <td>Tujuan</td>
                                    <td>:</td>
                                    <td><?=@$dataRpjmd->tb_rpjmd_tujuan_nama?></td>
                                </tr>
                                <tr>
                                    <td>Sasaran</td>
                                    <td>:</td>
                                    <td><?=@$dataRpjmd->tb_rpjmd_sasaran_nama?></td>
                                </tr>
                                <tr>
                                    <td>Program</td>
                                    <td>:</td>
                                    <td><?=@$dataRpjmd->tb_rpjmd_program_nama?></td>
                                </tr>
                            </table>
                            
                            <div class="table-responsive">
                            <table id="table-user" class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>No</th>
                                        <th>Kode</th>
                                        <th>Kegiatan</th>
                                        <th>Indikator</th>
                                        <th>OPD</th>
                                        <!-- <th>Aksi</th> -->
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                            </div>
                        </div>
                        <!-- /.card-body -->
                    </div>
                    <!-- /.card -->
                </div>
            </div>
        </div>
    </section>
</div>
<div class="modal fade" id="modal-form">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Form <?=$judul?></h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="" method="post" id="form-action">
                    <input type="hidden" name="id_tb_user">
                    <div class="row">
                        <div class="col-12">
                            <div class="form-group">
                                <p>Username</p>
                                <input type="text" name="tb_user_username" class="form-control" placeholder="Username" required autofocus>  
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="form-group">
                                <p>Nomor Hp</p>
                                <input type="text" name="tb_user_hp" class="form-control" placeholder="Nomor Hp" required autofocus>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="form-group">
                                <p>Password</p>
                                <input type="password" name="tb_user_password" class="form-control" placeholder="Password" required autofocus>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="form-group">
                                <p>Level</p>
                                <select name="tb_user_level" class="form-control" required autofocus>
                                    <option value="">Pilih Level</option>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div style="float: right;">
                            <button type="submit" class="btn btn-primary" >Submit</button>
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