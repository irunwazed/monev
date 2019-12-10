<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Keterkaitan Visi, Misi, Tujuan dan Sasaran</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active">Keterkaitan Visi, Misi, Tujuan dan Sasaran</li>
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
                                        <center>CETAK ATAU DOWNLOAD LAPORAN</center>
                                    </h6>
                                </div>
                            </div>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body">
                        <form action="<?=base_url()?>monev/rpjmd/laporan/misi-tujuan-sasaran/save/pdf" method="POST" id="form-cetak">
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

