<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>SKPD</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active">Laporan SKPD</li>
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
                                <div class="col-12">
                                    <h6>
                                        <center>Pemilihan OPD</center>
                                    </h6>
                                </div>
                            </div>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body">
                        <form action="<?=base_url()?>monev/rpjmd/laporan/skpd/save/pdf" method="POST" id="form-cetak">
                            <div class="row">
                                <div class="col-4">
                                    <div class="form-group">
                                        <label>OPD</label>
                                        <select class="form-control" name="cetakopd" required>
                                            <option value="">-= Pilih OPD =-</option>
                                            <?php foreach($dataOPD as $opd){ ?>
                                            <option value="<?=$opd['tb_urusan_kode'].'-'.$opd['tb_bidang_kode'].'-'.$opd['tb_unit_kode'].'-'.$opd['tb_sub_unit_kode']?>"><?=$opd['tb_sub_unit_nama']?></option>
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

