<?php
    $styleTable = 'style="color: #232323; border-collapse: collapse; font-size: 12px;"';
    $styleData = 'style="border: 1px solid #999; padding: 8px 20px; font-size: 12px; max-width:700px;"';

    $styleLeft = 'style="border: 1px solid; padding: 10px; text-align: left;"';
    $styleRight = 'style="border: 1px solid; padding: 10px; text-align: right;"';
    $styleEdit = 'style="border: 1px solid;"';
   
    $name = "KETERKAITAN VISI, MISI, TUJUAN DAN SASARAN";
    // echo "<pre>";
    // print_r($dataOpd);
    // echo "</pre>";
?>
<html>
    <head>
        <?php if(@$print){ ?>
        
        <title><?=$name?></title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width,maximum-scale=1.0">
        <style type="text/css" media="screen"></style>
        <style type="text/css" media="print">
            @page {
                size: A4 landscape;
            }
            /* Size in mm */    
            @page {
                size: 100mm 200mm landscape;
            }
            /* Size in inches */    
            @page {
                size: 4in 6in landscape;
            }
        </style>
        <?php } ?>
    </head>

    <body onload="window.print()">
        <div style="width: 100%; text-align: center;">
            <div style="width: 10%; text-align: left; float:left;">
                <img src="<?=base_url()?>public/image/morowali.png" style="height: 100px"/>
            </div>
            <div style="width: 90%; text-align: center; float:center;">
                <h6>PEMERINTAH KABUPATEN MOROWALI</h6>
                <h4>LAPORAN KETERKAITAN VISI, MISI, TUJUAN DAN SASARAN</h4>
                <h6>TAHUN ANGGARAN <?=$dataVisi[0]['tb_rpjmd_tahun']." - ".($dataVisi[0]['tb_rpjmd_tahun']+5)?> <span></span></h6>
            </div>
        </div>

        <p style="text-align: center; float:center;">Visi : <?=$dataVisi[0]['tb_rpjmd_visi']?></p>
        <table <?=$styleTable?> align="center">
            <thead>
                <tr>
                    <th <?=$styleData?>>KODE</th>
                    <th <?=$styleData?>>URAIAN</th>
                    <th <?=$styleData?>>INDIKATOR</th>
                </tr>
            </thead>
            <tbody>

                <?php
                    for($i = 0; $i <= count($dataMisi)-1; $i++){
                ?>

                        <tr>
                            <td <?=$styleData?>><?=$dataMisi[$i]['tb_rpjmd_misi_kode']?></td>
                            <td <?=$styleData?>><span></span><?=$dataMisi[$i]['tb_rpjmd_misi_nama']?></td>
                            <td <?=$styleData?>></td>
                        </tr>

                <?php
                        for($j = 0; $j <= count($dataTujuan)-1; $j++){
                            if($dataTujuan[$j]['tb_rpjmd_misi_kode'] == $dataMisi[$i]['tb_rpjmd_misi_kode']){
                ?>
                                <tr>
                                    <td <?=$styleData?>><?=$dataMisi[$i]['tb_rpjmd_misi_kode'].".".$dataTujuan[$j]['tb_rpjmd_tujuan_kode']?></td>
                                    <td <?=$styleData?>><?=$dataTujuan[$j]['tb_rpjmd_tujuan_nama']?></td>
                                    <td <?=$styleData?>></td>
                                </tr>
                <?php
                            }

                            for($k = 0; $k <= count($dataSasaran)-1; $k++){
                                if($dataSasaran[$k]['tb_rpjmd_misi_kode'] == $dataMisi[$i]['tb_rpjmd_misi_kode'] && $dataSasaran[$k]['tb_rpjmd_tujuan_kode'] == $dataTujuan[$j]['tb_rpjmd_misi_kode']){
                ?>
                                    <tr>
                                        <td <?=$styleData?>><?=$dataMisi[$i]['tb_rpjmd_misi_kode'].".".$dataTujuan[$j]['tb_rpjmd_tujuan_kode'].".".$dataSasaran[$k]['tb_rpjmd_sasaran_kode']?></td>
                                        <td <?=$styleData?>><?=$dataSasaran[$k]['tb_rpjmd_sasaran_nama']?></td>
                                        <td <?=$styleData?>><?=$dataSasaran[$k]['tb_rpjmd_sasaran_indikator']?></td>
                                    </tr>
                <?php
                                }
                            }
                        }
                    }
                ?>
            
            
            </tbody>
        </table>
        
    </body>
</html>