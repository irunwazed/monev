<script>

    // var myTable = $('#table-action').DataTable();
    var link = "monev/rpjmd/laporan/misi-tujuan-sasaran";
    var dataAll = [];

    function doSearch(){
        getData();
    }

    function doSave(save){
        getData(save);
    }
    // getData();
    function getData(save = ''){
        
        let data = null;
        
        if(save == 'pdf'){
            let url = base_url+link+"/save/pdf";
            // console.log(url);
            $.when(sendAjaxNewTab(url, data)).done(function(respon){
            });
        }else if(save == 'print'){
            let url = base_url+link+"/save/print";
            $.when(sendAjaxNewTab(url, data)).done(function(respon){
            });
        }else{
            let url = base_url+link+"/data";
            $.when(sendAjax(url, data)).done(function(respon){
                if(respon.status){
                    setTable(respon.data);
                    dataAll = respon.data;
                }else{

                }
            });
        }
        
    }



</script>