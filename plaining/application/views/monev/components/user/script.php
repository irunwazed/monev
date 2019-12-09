<script>
    var link = "monev/user";
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

    getData();
    function getData(_page = 1){
        page = _page;

        let url = base_url+link+"/page-"+page;
        let data = {
            page : page,
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
                element['tb_user_username'],
                element['tb_user_hp'],
                '<a class="fa fa-edit" style="padding:5px;" href="#" onclick="setUpdate('+element['id_tb_user']+')" data-toggle="modal" data-target="#modal-form" > </a>'+
                '<a class="fa fa-trash" style="padding:5px;" href="#"  data-setFunction="doDelete('+element['id_tb_user']+')" data-judul="Hapus Data!" data-isi="Apakah anda yakin menghapus data?" onclick="setPesan(this)" data-toggle="modal" data-target="#modal-pesan"></a>',
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
            if(id == element['id_tb_user']){
                dataPilih = element;
            }
        });
        return dataPilih;
    }

    function setForm(data){
        $("input[name='id_tb_user']").val(data['id_tb_user']);
        $("input[name='tb_user_username']").val(data['tb_user_username']);
        $("input[name='tb_user_hp']").val(data['tb_user_hp']);
        $("input[name='tb_user_password']").val(data['tb_user_password']);
        $("select[name='tb_user_level']").val(data['tb_user_level']);
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
        console.log("tes");
        event.preventDefault();
        let form = $(this);
        let url = form.attr('action');
        let data = form.serializeArray();
        $("#modal-form").modal("hide");
        
        $.when(sendAjax(url, data)).done(function(respon){
            getData();
        });
    });

    function setFormInput(name, status, form = "select"){
        if(status){
            $("#"+name).show();
            $(form+"[name='"+name+"']").attr("autofocus", true);
            $(form+"[name='"+name+"']").attr("required", true);
        }else{
            $("#"+name).hide();
            $(form+"[name='"+name+"']").attr("autofocus", false);
            $(form+"[name='"+name+"']").attr("required", false);
        }
    }

    // setFormInput('indikator', false);
    // setFormInput('tahun', false);
    // setFormInput('id_opd', false);
    // $("select[name='level']").change(function(){
        
    //     setFormInput('indikator', false);
    //     setFormInput('tahun', false);
    //     setFormInput('id_opd', false);
    //     if($(this).val() == 2){
    //         setFormInput('indikator', true);
    //         // setFormInput('tahun', true);
    //     }else if($(this).val() == 3){
            
    //         setFormInput('id_opd', true);
    //     }
    // });

</script>