
  
  
  <div class="modal fade" id="modal-pesan">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title" id="pesan-judul"></h4>
        </div>
        <div class="modal-body" id="pesan-isi">
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Batal</button>
          <button type="button" class="btn btn-primary" id="pesan-tombol">Ya</button>
        </div>
      </div>
      <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
  </div>
  <!-- /.modal -->

  <footer class="main-footer">
    <strong>Copyright &copy; 2014-2019 <a href="http://adminlte.io">AdminLTE.io</a>.</strong>
    All rights reserved.
    <div class="float-right d-none d-sm-inline-block">
      <b>Version</b> 3.0.2-pre
    </div>
  </footer>

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<!-- jQuery -->
<script src="<?=base_url()?>public/admin/plugins/jquery/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="<?=base_url()?>public/admin/plugins/jquery-ui/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
  $.widget.bridge('uibutton', $.ui.button)
</script>
<!-- Bootstrap 4 -->
<script src="<?=base_url()?>public/admin/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- ChartJS -->
<!-- <script src="<?=base_url()?>public/admin/plugins/chart.js/Chart.min.js"></script> -->
<!-- Sparkline -->
<!-- <script src="<?=base_url()?>public/admin/plugins/sparklines/sparkline.js"></script> -->
<!-- JQVMap -->
<!-- <script src="<?=base_url()?>public/admin/plugins/jqvmap/jquery.vmap.min.js"></script>
<script src="<?=base_url()?>public/admin/plugins/jqvmap/maps/jquery.vmap.usa.js"></script> -->
<!-- jQuery Knob Chart -->
<!-- <script src="<?=base_url()?>public/admin/plugins/jquery-knob/jquery.knob.min.js"></script> -->
<!-- daterangepicker -->
<script src="<?=base_url()?>public/admin/plugins/moment/moment.min.js"></script>
<script src="<?=base_url()?>public/admin/plugins/daterangepicker/daterangepicker.js"></script>
<!-- Tempusdominus Bootstrap 4 -->
<script src="<?=base_url()?>public/admin/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
<!-- Summernote -->
<script src="<?=base_url()?>public/admin/plugins/summernote/summernote-bs4.min.js"></script>
<!-- overlayScrollbars -->
<script src="<?=base_url()?>public/admin/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
<!-- AdminLTE App -->
<script src="<?=base_url()?>public/admin/dist/js/adminlte.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<!-- <script src="<?=base_url()?>public/admin/dist/js/pages/dashboard.js"></script> -->
<!-- AdminLTE for demo purposes -->
<script src="<?=base_url()?>public/admin/dist/js/demo.js"></script>

<script>
        
        var base_url = '<?=base_url()?>';

        function sendAjax(url, dataKirim){
            loading();
            return $.ajax({
            type: "POST",
            url: url,
            dataType: "JSON",
            data: dataKirim, 
            success: function(respon)
            {   
                loading(false);
                if(respon.status){
                    message(respon.pesan);
                }else{
                message(respon.pesan, '', 'warning');
                }
                console.log(respon);
            },
            error:function(error){
                loading(false);
                message('Gagal terhubung pada server!', '', 'error');
                console.log(error);
                $("#myerror").html(error.responseText);
            }
            });
        }

        function sendAjaxNewTab(url, dataKirim){
            loading();
            return $.ajax({
                type: "POST",
                url: url,
                dataType: "html",
                data: dataKirim, 
                success: function(respon)
                {   
                    var myWindow = window.open("", "_blank");
                    myWindow.document.write(respon);
                    loading(false);
                },
                    error:function(error){
                    loading(false);
                }
            });
        }

        function sendAjaxUpload(url, dataKirim, mymessage = true){
            loading();
            return $.ajax({
            type: "POST",
            url: url,
            dataType: "JSON",
            data: dataKirim, 
            enctype: 'multipart/form-data',
            processData: false,
            contentType: false,
            cache: false,
            timeout: 800000,
            success: function(respon)
            {   
                if(mymessage){
                if(respon.status){
                    message(respon.pesan);
                }
                }
                console.log(respon);
                loading(false);
            },
            error:function(error){
                console.log(error);
                loading(false);
                $("#myerror").html(error.responseText);
            }
            });
        }

        function loading(status = true){
            if(status){
                $("#loading").text("loading");
            }else{
                $("#loading").text("");
            }
        }

        function message(pesan = "", judul = '', status = 'success'){
            if(pesan != '')
                toastr[status](judul, pesan)
        }

        function setPesan(obj){
            let judul = $(obj).attr("data-judul");
            let isi = $(obj).attr("data-isi");
            let setFunction = $(obj).attr("data-setFunction");

            $('#pesan-judul').text(judul);
            $('#pesan-isi').text(isi);
            $('#pesan-tombol').attr("onclick", setFunction);
        }

        </script>

<script type="text/javascript">


// toastr["info"]("tes", "sdfsf")


toastr.options = {
  "closeButton": true,
  "debug": false,
  "newestOnTop": false,
  "progressBar": true,
  "rtl": false,
  "positionClass": "toast-top-right",
  "preventDuplicates": false,
  "onclick": null,
  "showDuration": 300,
  "hideDuration": 1000,
  "timeOut": 5000,
  "extendedTimeOut": 1000,
  "showEasing": "swing",
  "hideEasing": "linear",
  "showMethod": "fadeIn",
  "hideMethod": "fadeOut"
}


   
</script>
        <?=@$script?>

</body>
</html>
