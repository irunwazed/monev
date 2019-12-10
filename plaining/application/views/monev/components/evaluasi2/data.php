<?php

$judul = "Evaluasi";

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
                                        <center>Evaluasi Terhadap Hasil RKPD Kabupaten/kota…….. Tahun .... </center>
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
                                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modal-form" onclick="setCreate()"><i class="fa fas fa-plus"></i> Tambah Data</button>
                            </div>
                            
                            <div class="table-responsive">
                            <table id="table-user" class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th rowspan="3">No</th>
                                        <th rowspan="3">Sasaran</th>
                                        <th rowspan="3">Kode</th>
                                        <th rowspan="3">Urusan/Bidang Urusan Pemerintahan Daerah Dan Program/Kegiatan </th>
                                        <th rowspan="3">Indikator  Kinerja Program (Outcome)/ Kegiatan (output) </th>
                                        <th rowspan="2" colspan="2">Target RPJMD Kabupaten/kota pada Tahun ........ (Akhir Periode RPJMD) </th>
                                        <th rowspan="2" colspan="2">Realisasi Capaian Kinerja RPJMD Kabupaten/kota sampai dengan RKPD Kabupaten/kota Tahun Lalu  (n-2) </th>
                                        <th rowspan="2" colspan="2">Target Kinerja dan Anggaran RKPD Kabupaten/kota Tahun Berjalan (Tahun n-1) yang Dievaluasi </th>
                                        <th colspan="8">Realisasi Kinerja Pada Triwulan </th>
                                        <th rowspan="2" colspan="2">Realisasi Capaian Kinerja dan Anggaran RKPD Kabupaten/kota yang Dievaluasi </th>
                                        <th rowspan="2" colspan="2">Realisasi Kinerja dan Anggaran RPJMD Kabupaten/kota s/d Tahun ....... (Akhir Tahun Pelaksanaan RKPD tahun....) </th>
                                        <th rowspan="2" colspan="2">Tingkat Capaian Kinerja dan Realisasi Anggaran RPJMD Kabupaten/kota  s/d Tahun ... (%) </th>
                                        <th rowspan="3">Perangkat Daerah  Penanggung Jawab </th>
                                    </tr>
                                    <tr>
                                        <th colspan="2">I</th>
                                        <th colspan="2">II</th>
                                        <th colspan="2">III</th>
                                        <th colspan="2">IV</th>
                                    </tr>
                                    <tr>
                                        <th>K</th>
                                        <th>Rp</th>
                                        <th>K</th>
                                        <th>Rp</th>
                                        <th>K</th>
                                        <th>Rp</th>
                                        <th>K</th>
                                        <th>Rp</th>
                                        <th>K</th>
                                        <th>Rp</th>
                                        <th>K</th>
                                        <th>Rp</th>
                                        <th>K</th>
                                        <th>Rp</th>
                                        <th>K</th>
                                        <th>Rp</th>
                                        <th>K</th>
                                        <th>Rp</th>
                                        <th>K</th>
                                        <th>Rp</th>
                                    </tr>
                                    <tr>
                                        <?php
                                        for ($i = 1; $i <= 16; $i++) { 
                                        if($i >= 6 && $i <= 15){
                                        ?>
                                            <th colspan="2"><center><?= $i; ?></center></th>
                                        <?php 
                                        }else{
                                        ?>
                                            <th><center><?= $i; ?></center></th>
                                        <?php 
                                        }
                                        }
                                        ?>
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