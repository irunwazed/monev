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
                            <div class="row">
                                <input type="hidden" name="table" value="tb_rpjmd" /> 
                                <div class="col-4">
                                    <div class="form-group">
                                        <label>File</label>
                                        <input class="form-control" type="file" name="file" required />
                                    </div>
                                </div>
                            </div> 
                            <div class="col-3">
                                <input type="submit" class="btn btn-primary" />
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
                <h4 class="modal-title">Tambah Data LRA</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="" method="post" id="form-action">
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