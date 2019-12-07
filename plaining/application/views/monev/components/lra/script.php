<script>
    var link = "monev/lra";
    var myTable = $('#table-user tbody');
    var page = 1;
    var dataAll = [];
    var kodeOpd;
    getData();
    function getData(_page = 1){
        page = _page;

        let url = base_url+link+"/page-"+page;
        let data = {
            kodeOpd : kodeOpd,
            page : page,
        }
        $.when(sendAjax(url, data)).done(function(respon){
            if(respon.status){
                setTable(respon.data);
                dataAll = respon.data;
                setPage(respon.jumlahPage);
                

            }else{

            }
        });
    }

    function setPage(jum){
        $('#set-page').empty();
        let = 
        for(let i = 1; i <= jum; i++){
            
            $('#set-page').append('<option value="'+i+'">'+i+'</option>');
        }
    }

    function setTable(data){
        myTable.empty();
        no = 1;
        data.forEach(element => {
            // tempData = [
            //     no,
            //     element['nama'],
            //     element['username'],
            //     element['level'],
            //     '<a class="fa fa-pencil" style="padding:5px;" href="#" onclick="setUpdate('+element['id_users']+')" data-toggle="modal" data-target="#modal-form" > </a>'+
            //     '<a class="fa fa-trash" style="padding:5px;" href="#"  data-setFunction="doDelete('+element['id_users']+')" data-judul="Hapus Data!" data-isi="Apakah anda yakin menghapus data?" onclick="setPesan(this)" data-toggle="modal" data-target="#modal-pesan"></a>',
            // ]
            // myTable.row.add(tempData).draw(  );
            // let kodeLra = element['tb_rekening1_kode']+' . '+element['tb_rekening2_kode']+' . '+element['program_kode']+' . '+element['kegiatan_kode']+' . '+element['tb_rekening3_kode']+' . '+element['tb_rekening4_kode']+' . '+element['tb_rekening5_kode'];
            let kodeLra = element['tb_rekening1_kode'];
            let jenis = 2;
            if(element['tb_rekening2_kode'] != 0){
                kodeLra += ' . '+element['tb_rekening2_kode'];
                if(element['tb_rekening2_kode'] == 1){
                    kodeLra += ' . '+element['program_kode']+' . '+element['kegiatan_kode'];
                }
            }
            if(element['program_kode'] != 0){
                kodeLra += ' . '+element['program_kode'];
            }
            if(element['kegiatan_kode'] != 0){
                kodeLra += ' . '+element['kegiatan_kode'];
            }
            if(element['tb_rekening3_kode'] != 0){
                kodeLra += ' . '+element['tb_rekening3_kode'];
            }
            if(element['tb_rekening4_kode'] != 0){
                kodeLra += ' . '+element['tb_rekening4_kode'];
            }
            if(element['tb_rekening5_kode'] != 0){
                kodeLra += ' . '+element['tb_rekening5_kode'];
            }
            tempData = '<tr>'+
                            '<td>'+kodeLra+'</td>'+
                            '<td>'+element['tb_monev_lra_ket']+'</td>'+
                            '<td>'+element['tb_monev_lra_anggaran']+'</td>'+
                            '<td>'+element['tb_monev_lra_realisasi']+'</td>'+
                            '<td>'+element['tb_monev_lra_fisik']+'</td>'+
                            '<td>'+(element['tb_monev_lra_anggaran']-element['tb_monev_lra_realisasi'])+'</td>'+
                            '<td>'+(Math.round(10000*element['tb_monev_lra_realisasi']/element['tb_monev_lra_anggaran']))/100+'</td>'+
                            '<td>'+element['tb_monev_lra_pelaksana']+'</td>'+
                            '<td>'+element['tb_monev_lra_sumber_dana']+'</td>'+
                            '<td>'+element['tb_monev_lra_lokasi']+'</td>'+
                        '</tr>';

            myTable.append(tempData);
            no++;
        });
    }

    $('#set-page').change(function(){
        let val = $(this).val();
        getData(val);
    });

    function dataNext(){
        page++;
        getData(page);
    }

    function dataPrevious(){
        page--;
        getData(page);
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
            if(id == element['id_users']){
                dataPilih = element;
            }
        });
        return dataPilih;
    }

    function setForm(data){
        $("input[name='id_users']").val(data['id_users']);
        $("input[name='nama']").val(data['nama']);
        $("input[name='username']").val(data['username']);
        $("input[name='password']").val(data['password']);
        $("select[name='level']").val(data['level']);
    }

    function doDelete(id){
        let url = base_url+link+"/delete";
        let data = {
            id_users : id
        }
        $("#modal-pesan").modal("hide");
        $.when(sendAjax(url, data)).done(function(respon){
            if(respon.status){
                getData();
            }
            // setPesanIsi("pesan-keluarga-anggota", respon.status, respon.pesan)
            // $("#pesan-no-kk").text(respon.pesan);
        });
    }

    $("#form-action").submit(function(event){
        event.preventDefault();
        let form = $(this);
        let url = form.attr('action');
        let data = form.serializeArray();
        console.log("as");
        $("#modal-form").modal("hide");
        
        $.when(sendAjax(url, data)).done(function(respon){
            // if(respon.status){
                getData();
            // }
            // setPesanIsi("", respon.status, respon.pesan)
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

    $("select[name='opd']").change(function(){
        let val = $(this).val();
        kodeOpd = val.split("-");
        console.log(kodeOpd);

    });

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