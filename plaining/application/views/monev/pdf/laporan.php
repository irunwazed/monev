<?php
    $style = 'style="border: 1px solid; padding: 10px;"';
    $styleLeft = 'style="border: 1px solid; padding: 10px; text-align: left;"';
    $styleRight = 'style="border: 1px solid; padding: 10px; text-align: right;"';
    $styleEdit = 'border: 1px solid; padding: 10px; ';
   
    $name = "INDIKATOR CAPAIAN TAHUN ".$post['thn_awal']." - ".$post['thn_akhir'];
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
            <p><?=$name?></p>
        </div>
        <div>
            <table>
                <tr>
                    <td>Provinsi</td>
                    <td>:</td>
                    <td>Sulawesi Tengah</td>
                </tr>
                <tr>
                    <td>Kabupaten</td>
                    <td>:</td>
                    <td>Morowali</td>
                </tr>
                <tr>
                    <td>Dinas</td>
                    <td>:</td>
                    <td><?=ucwords(@$dataOpd[0]['sub_unit_nama'])?></td>
                </tr>
            </table>
        </div>
        <?php
        
        $alpha = ['', 'A', 'B', 'C', 'D', 'E', 'F',
        'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N',
        'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V',
        'W', 'X', 'Y', 'Z'];
        
        ?>
        <div style="width: 100%;">
            <table style="border-collapse: collapse; width:100%;">
                <tr style="background-color: #1DAE94; color: #FFFFFF;">
                    <th rowspan="2" <?=$style?> >No</th>
                    <th rowspan="2" colspan="2" style="<?=$styleEdit?>" >Uraian</th>
                    <?php for($i = $post['thn_awal']; $i <= $post['thn_akhir']; $i++){ ?>
                    <th colspan="2" <?=$style?> ><?=$i?></th>
                    <?php } ?>
                </tr>
                <tr style="background-color: #1DAE94; color: #FFFFFF;">
                    <?php for($i = $post['thn_awal']; $i <= $post['thn_akhir']; $i++){ ?>
                    <th <?=$style?> >Nilai / Jumlah</th>
                    <th <?=$style?> >Satuan</th>
                    <?php } ?>
                </tr>
                <tr style="background-color: #1DAE94; color: #FFFFFF;">
                    <th <?=$style?> >(1)</th>
                    <th colspan="2" <?=$style?> >(2)</th>
                    <?php $j = 3; for($i = $post['thn_awal']; $i <= $post['thn_akhir']; $i++){ ?>
                    <th <?=$style?> >(<?=$j?>)</th>
                    <th <?=$style?> >(<?=$j+1?>)</th>
                    <?php $j +=2; } ?>
                </tr>
                <?php 
                    $rek1No = 1; 
                    $rek2No = 1; 
                    $rek3No = 1; 
                
                    for($i = 0; $i < count($data); $i++){ 
                    
                        if($data[$i]['level'] == 1){ ?>
                            <tr style="background-color: #EEEEEE; color: #000000;">
                                <th <?=$style?> ><?=$alpha[$rek1No]?></th>
                                <th colspan="2" <?=$styleLeft?> ><?=$data[$i]['rek1_nama']?></th>
                                <?php for($j = $post['thn_awal']; $j <= $post['thn_akhir']; $j++){ ?>
                                <th <?=$style?> ></th>
                                <th <?=$style?> ></th>
                                <?php } ?>
                            </tr>
                                <?php $rek1No++; 
                                    $rek2No = 1; 
                                    $rek3No = 1; 
                        } 
                        if($data[$i]['level'] == 2){ ?>
                            <tr style="background-color: #EEEEEE; color: #000000;">
                                <th <?=$style?> ></th>
                                <td style="<?=$styleEdit?> text-align: left; border-right: 0px; border-left: 0px; width: 10px;" ><?=$alpha[$rek1No-1].'.'.$rek2No?></td>
                                <td style="<?=$styleEdit?> text-align: left; border-right: 0px; border-left: 0px;" ><?=$data[$i]['rek2_nama']?></td>
                                <?php for($j = $post['thn_awal']; $j <= $post['thn_akhir']; $j++){ 
                                    if($data[$i]['rek3_jenis'] == 2){
                                        ?>
                                        <td <?=$styleRight?> ></td>
                                        <td <?=$style?> ></td>
                                        <?php 
                                    }else{
                                        ?>
                                        <td <?=$styleRight?> ><?=number_format($data[$i]['thn_'.$j],0,",",".")?></td>
                                        <td <?=$style?> ><?=@$data[$i]['id_satuan']!=0?$data[$i]['satuan_nama']:''?></td>
                                        <?php 
                                    }
                                } 
                                ?>
                            </tr>
                                <?php $rek2No++; 
                                    $rek3No = 1; 
                        } 
                        if($data[$i]['level'] == 3){ ?>
                            <tr style="background-color: #EEEEEE; color: #000000;">
                                <th <?=$style?> ></th>
                                <td style="<?=$styleEdit?> text-align: left; border-right: 0px; border-left: 0px; width: 10px;" ></td>
                                <td style="<?=$styleEdit?> text-align: left; border-right: 0px; border-left: 0px;" >- <?=$data[$i]['rek3_nama']?></td>
                        
                            <?php 
                            for($tahun = $post['thn_awal']; $tahun <= $post['thn_akhir']; $tahun++){ 
                                $i++;
                                if(@$data[$i]['level'] == 4 && @$data[$i]['capaian_tahun'] == $tahun){
                                    if($data[$i]['rek3_jenis'] == 2){
                                        $indexNilai = $data[$i]['capaian_nilai'];
                                        $arrNilai = json_decode($data[$i]['rek3_array'],true);
                                        $hasilNilai = $arrNilai[$indexNilai-1];
                                        ?>
                                            <td <?=$styleRight?> ><?=$hasilNilai?></td>
                                            <td <?=$style?> ></td>
                                        <?php 

                                    }else{
                                        ?>
                                            <td <?=$styleRight?> ><?=number_format($data[$i]['capaian_nilai'],0,",",".")?></td>
                                            <td <?=$style?> ><?=@$data[$i]['id_satuan']!=0?$data[$i]['satuan_nama']:''?></td>
                                        <?php 

                                    }
                                }else{
                                $i--;
                            ?>
                                <td <?=$style?> ></td>
                                <td <?=$style?> ></td>
                            <?php 
                                }
                            } ?>

                            </tr>
                                <?php 
                                $rek3No++; 
                        } 
                    } ?>
            </table>
        </div>
        <div style="height: 220px; width: 100%;">
           <div style="float: right; width: 280px;">
           <br>
           <br>
            <table>
                <tr>
                    <td colspan="2">Morowali, ..........................</td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: left;"><?=ucwords(@$dataOpd[0]['sub_unit_nama'])?></td>
                    <!-- <th style="text-align: left;"></th> -->
                </tr>
                <tr>
                    <td colspan="2" style="text-align: left; padding-bottom: 100px;">Kepala,</td>
                    <!-- <th style="text-align: left; padding-bottom: 100px;"></th> -->
                </tr>
                <tr>
                    <td colspan="2"><hr></td>
                </tr>
            </table>
            <!-- <h4 style="text-align: center; margin: 0px; padding: 0px;">An. BUPATI KOLAKA UTARA</h4>
            <h4 style="text-align: center; margin: 0px; padding: 0px;"> SEKRETARIS DAERAH</h4> -->
            <!-- <p style="text-align: right">Keterangan...</p> -->
            </div> 
        </div>
    </body>
</html>