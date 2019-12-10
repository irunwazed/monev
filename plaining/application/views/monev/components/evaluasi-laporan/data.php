<?php

$judul = "Data Evaluasi Triwulan";

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
                            <form action="<?=base_url()?>monev/evaluasi/save/pdf" method="POST" id="form-cetak">
                                <div class="row">
                                    <div class="col-4">
                                        <div class="form-group">
                                        <label>Tahun</label>
                                            <select class="form-control" name="tahun" required>
                                                <option value="">-= Pilih Tahun =-</option>
                                                <?php for($i = date('Y')+5; $i >= 2001; $i--){ ?>
                                                <option value="<?=$i?>"><?=$i?></option>
                                                <?php } ?>
                                            </select>
                                        </div>
                                    </div>
                                </div> 
                                <div class="col-3">
                                    <button type="submit" class="btn btn-primary mr-2">PDF</button>
                                    <span onclick="doSave('print')" class="btn btn-info">Print</span>
                                </div>
                            </form>
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
                    <input type="hidden" name="id_tb_monev_triwulan">
                    <input type="hidden" name="opd" value="<?=$opd?>">
                    <input type="hidden" name="kode" value="<?=$kode?>">
                    <div class="row">
                        <div class="col-12">
                            <div class="form-group">
                                <p>Tahun</p>
                                <select name="tahun" class="form-control" required autofocus>
                                    <option value="">-= Pilih Tahun Ke =-</option>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="form-group">
                                <p>Triwulan</p>
                                <select name="triwulan" class="form-control" required autofocus>
                                    <option value="">-= Pilih Triwulan =-</option>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="form-group">
                                <p>Target</p>
                                <input type="number" name="target" class="form-control" placeholder="Target" required autofocus>  
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="form-group">
                                <p>Realisasi</p>
                                <input type="number" name="realisasi" class="form-control" placeholder="Realisasi" required autofocus>
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