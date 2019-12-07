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
                                <div class="col-12">
                                    <h6>
                                        <center>Pemilihan OPD</center>
                                    </h6>
                                </div>
                            </div>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body">
                        <form action="<?=base_url()?>monev/lra/do-import" method="POST"  enctype="multipart/form-data">
                            <input type="file" name="file" />
                            <input type="hidden" name="table" value="tb_monev_lra" />  
                            <input type="number" name="tahun">
                            <select name="opd" required autofocus>
                                <option value="">Pilih OPD</option>
                                <?php foreach($dataOpd as $opd){ ?>
                                <option value="<?=$opd['tb_urusan_kode'].'-'.$opd['tb_bidang_kode'].'-'.$opd['tb_unit_kode'].'-'.$opd['tb_sub_unit_kode']?>"><?=$opd['tb_sub_unit_nama']?></option>
                                <?php } ?>
                            </select>
                            <input type="submit"  />
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

