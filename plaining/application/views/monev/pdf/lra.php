<?php
    $style = 'style="border: 1px solid #aaaaaa; padding: 10px;"';
    $styleLeft = 'style="border: 1px solid #aaaaaa; padding: 10px; text-align: left;"';
    $styleRight = 'style="border: 1px solid #aaaaaa; padding: 10px; text-align: right;"';
    $styleEdit = 'border: 1px solid #aaaaaa; padding: 10px; ';
   
    $name = "INDIKATOR CAPAIAN TAHUN ";
    // echo "<pre>";
    // print_r($data);
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
        <div style="width: 100%; text-align: center">
            <div style="width: 10%; text-align: left; float:left">
                <img src="<?=base_url()?>public/image/morowali.png" style="height: 100px"/>
            </div>
            <div style="width: 90%; text-align: center; float:left">
                <h6>PEMERINTAH KABUPATEN MOROWALI</h6>
                <h4>LAPORAN REALISASI ANGGARAN PENDAPATAN DAN BELANJA DAERAH</h4>
                <h6>TAHUN ANGGARAN <span id="set-tahun"></span></h6>
            </div>
        </div>
        <div>
            <table>
                <tr>
                    <td>Urusan Pemerintahan</td>
                    <td>:</td>
                    <td><?=ucwords(@$dataOpd->tb_urusan_nama)?></td>
                </tr>
                <tr>
                    <td>Unit Organisasi</td>
                    <td>:</td>
                    <td><?=ucwords(@$dataOpd->tb_unit_nama)?></td>
                </tr>
                <tr>
                    <td>Sub Unit Organisasi</td>
                    <td>:</td>
                    <td><?=ucwords(@$dataOpd->tb_sub_unit_nama)?></td>
                </tr>
            </table>
        </div>
        <br>
        <div style="width: 100%;">
            <table style="border-collapse: collapse; width:100%;">
                <thead>
                    <tr style="background-color: #1DAE94; color: #FFFFFF;">
                        <th <?=$style?> rowspan="2">KODE REKENING</th>
                        <th <?=$style?> rowspan="2">URAIAN</th>
                        <th <?=$style?> colspan="2">JUMLAH</th>
                        <th <?=$style?> rowspan="2">FISIK</th>
                        <th <?=$style?> rowspan="2">BERTAMBAH / BERKURANG</th>
                        <th <?=$style?> rowspan="2">%</th>
                        <th <?=$style?> rowspan="2">PELAKSANA</th>
                        <th <?=$style?> rowspan="2">SUMBER DANA</th>
                        <th <?=$style?> rowspan="2">LOKASI</th>
                    </tr>
                    <tr style="background-color: #1DAE94; color: #FFFFFF;">
                        <th <?=$style?>>ANGGARAN</th>
                        <th <?=$style?>>REALISASI</th>
                    </tr>
                    <tr style="background-color: #1DAE94; color: #FFFFFF;">
                    <?php for($i = 1; $i <= 10; $i++){ ?>
                        <th <?=$style?>><?=$i?></th>
                    <?php } ?>
                    </tr>
                </thead>
                <tbody>
                    <?php for($i = 0; $i < count($data); $i++){ ?>
                    <tr>
                        <td <?=$style?>><?=$data[$i]['tb_rekening1_kode'].".".$data[$i]['tb_rekening2_kode'].".".$data[$i]['program_kode'].".".$data[$i]['kegiatan_kode'].".".$data[$i]['tb_rekening3_kode'].".".$data[$i]['tb_rekening4_kode'].".".$data[$i]['tb_rekening5_kode']?></td>
                        <td <?=$style?>><?=$data[$i]['tb_monev_lra_ket']?></td>
                        <td <?=$styleRight?>><?=number_format($data[$i]['tb_monev_lra_anggaran'],2,',','.')?></td>
                        <td <?=$styleRight?>><?=number_format($data[$i]['tb_monev_lra_realisasi'],2,',','.')?></td>
                        <td <?=$style?>><?=$data[$i]['tb_monev_lra_fisik']?></td>
                        <td <?=$styleRight?>><?=($data[$i]['tb_monev_lra_realisasi']-$data[$i]['tb_monev_lra_anggaran'])<0?"(".number_format(ABS(($data[$i]['tb_monev_lra_realisasi']-$data[$i]['tb_monev_lra_anggaran'])),2,',','.').")":number_format($data[$i]['tb_monev_lra_realisasi']-$data[$i]['tb_monev_lra_anggaran'],2,',','.')?></td>
                        <td <?=$styleRight?>><?=$data[$i]['tb_monev_lra_anggaran']!=0?round((100*$data[$i]['tb_monev_lra_realisasi']/$data[$i]['tb_monev_lra_anggaran']), 2):0?></td>
                        <td <?=$style?>><?=$data[$i]['tb_monev_lra_pelaksana']?></td>
                        <td <?=$style?>><?=$data[$i]['tb_monev_lra_sumber_dana']?></td>
                        <td <?=$style?>><?=$data[$i]['tb_monev_lra_lokasi']?></td>
                    </tr>
                    <?php } ?>
                </tbody>

            </table>
        </div>
    </body>
</html>