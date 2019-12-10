<script>
    var link = "monev/evaluasi";
    var myTable = $('#table-user').DataTable({
      "pageLength": 10,
      "paging": true,
      "lengthChange": false,
      "searching": true,
      "ordering": true,
      "info": true,
      "autoWidth": true,
    });
    var page = 1;
    var dataAll = [];
    var setId;
    var setKode = "<?=$kode?>";
    var setOpd = "<?=$opd?>";

    getData();
    function getData(_page = 1){
        page = _page;

        let url = base_url+link+"/page-"+page;
        let data = {
            page : page,
            kode : setKode,
            opd : setOpd,
        }
        $.when(sendAjax(url, data)).done(function(respon){
            if(respon.status){
                setTable(respon.data);
                dataAll = respon.data;
                $("#data-load").show();
            }else{
                $("#data-load").hide();
            }
        });
    }

    function setTable(data){
        myTable.clear().draw();
        no = 1;
        data.forEach(element => {
            tempData = [
                no,
                element['tb_sub_unit_nama'],
                element['tb_renstra_kegiatan_nama'],
                element['tb_monev_triwulan_tahun'],
                element['tb_monev_triwulan_target1'],
                element['tb_monev_triwulan_rupiah1'],
                element['tb_monev_triwulan_target2'],
                element['tb_monev_triwulan_rupiah2'],
                element['tb_monev_triwulan_target3'],
                element['tb_monev_triwulan_rupiah3'],
                element['tb_monev_triwulan_target4'],
                element['tb_monev_triwulan_rupiah4'],
                '<a class="fa fa-edit" style="padding:5px;" href="#" onclick="setUpdate('+element['id_tb_monev_triwulan']+')" data-toggle="modal" data-target="#modal-form" > </a>'+
                '<a class="fa fa-trash" style="padding:5px;" href="#"  data-setFunction="doDelete('+element['id_tb_monev_triwulan']+')" data-judul="Hapus Data!" data-isi="Apakah anda yakin menghapus data?" onclick="setPesan(this)" data-toggle="modal" data-target="#modal-pesan"></a>',
            ]
            myTable.row.add(tempData).draw(  );
            no++;
        });
    }

    function setCreate(){
        $("#form-action")[0].reset();
        $("#form-action").attr("action", base_url+link+"/create")
    }

    function setUpdate(id){
        $("#form-action")[0].reset();
        $("#form-action").attr("action", base_url+link+"/update");
        
        dataPilih = getDataPilih(id);
        setForm(dataPilih);
    }

    function getDataPilih(id){
        dataPilih = {};
        dataAll.forEach(element => {
            if(id == element['id_tb_monev_triwulan']){
                dataPilih = element;
            }
        });
        return dataPilih;
    }

    function setForm(data){
        $("input[name='id_tb_monev_triwulan']").val(data['id_tb_monev_triwulan']);
        $("select[name='tahun']").val(data['tb_monev_triwulan_tahun']);
    }

    function doDelete(id){
        let url = base_url+link+"/delete";
        let data = {
            kode : id
        }
        $("#modal-pesan").modal("hide");
        $.when(sendAjax(url, data)).done(function(respon){
            if(respon.status){
                getData();
            }
        });
    }

    $("#form-action").submit(function(event){
        event.preventDefault();
        let form = $(this);
        let url = form.attr('action');
        let data = form.serializeArray();
        $("#modal-form").modal("hide");
        
        $.when(sendAjax(url, data)).done(function(respon){
            getData();
        });
    });

</script>