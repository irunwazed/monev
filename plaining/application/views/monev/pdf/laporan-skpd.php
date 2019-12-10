<?php
    $styleTable = 'style="color: #232323; border-collapse: collapse; font-size: 9px;"';
    $styleData = 'style="border: 1px solid #999; padding: 8px 20px; font-size: 9px; max-width:700px;"';

    $styleLeft = 'style="border: 1px solid; padding: 10px; text-align: left;"';
    $styleRight = 'style="border: 1px solid; padding: 10px; text-align: right;"';
    $styleEdit = 'style="border: 1px solid;"';
   
    $name = "LAPORAN PROGRAM SKPD YANG MENGACU KEPADA PROGRAM PEMDA";
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
                <h4>LAPORAN PROGRAM SKPD YANG MENGACU KEPADA PROGRAM PEMDA</h4>
            </div>
        </div>

        <p style="text-align: center; float:center;">Dinas : <?=$dataOPD[0]['tb_sub_unit_nama']?></p>
        <table <?=$styleTable?> align="center">
            <thead>
                <tr>
                    <th <?=$styleData?> rowspan="3">KODE</th>
                    <th <?=$styleData?> rowspan="3">URAIAN</th>
                    <th <?=$styleData?> rowspan="3">INDIKATOR</th>
                    <th <?=$styleData?> rowspan="3">SATUAN</th>
                    <th <?=$styleData?> rowspan="3">KONDISI AWAL</th>
                    <th <?=$styleData?> colspan="10">TARGET</th>
                    <th <?=$styleData?> rowspan="3">KONDISI AKHIR</th>
                    <th <?=$styleData?> colspan="10">RELASI</th>
                    <th <?=$styleData?> rowspan="3">KONDISI AKHIR</th>
                </tr>
                <tr>
                    <th <?=$styleData?> colspan="2">1</th>
                    <th <?=$styleData?> colspan="2">2</th>
                    <th <?=$styleData?> colspan="2">3</th>
                    <th <?=$styleData?> colspan="2">4</th>
                    <th <?=$styleData?> colspan="2">5</th>

                    <th <?=$styleData?> colspan="2">1</th>
                    <th <?=$styleData?> colspan="2">2</th>
                    <th <?=$styleData?> colspan="2">3</th>
                    <th <?=$styleData?> colspan="2">4</th>
                    <th <?=$styleData?> colspan="2">5</th>
                </tr>

                <tr>
                    <th <?=$styleData?>>K</th>
                    <th <?=$styleData?>>Rp.</th>
                    <th <?=$styleData?>>K</th>
                    <th <?=$styleData?>>Rp.</th>
                    <th <?=$styleData?>>K</th>
                    <th <?=$styleData?>>Rp.</th>
                    <th <?=$styleData?>>K</th>
                    <th <?=$styleData?>>Rp.</th>
                    <th <?=$styleData?>>K</th>
                    <th <?=$styleData?>>Rp.</th>

                    <th <?=$styleData?>>K</th>
                    <th <?=$styleData?>>Rp.</th>
                    <th <?=$styleData?>>K</th>
                    <th <?=$styleData?>>Rp.</th>
                    <th <?=$styleData?>>K</th>
                    <th <?=$styleData?>>Rp.</th>
                    <th <?=$styleData?>>K</th>
                    <th <?=$styleData?>>Rp.</th>
                    <th <?=$styleData?>>K</th>
                    <th <?=$styleData?>>Rp.</th>
                </tr>
            </thead>
            <tbody>

            <?php
                for($i = 0; $i <= count($dataUrusan)-1; $i++){
                    if($dataOPD[0]['tb_urusan_kode'] == $dataUrusan[$i]['tb_urusan_kode']){
            ?>

                        <tr>
                            <td <?=$styleData?>><?=$dataUrusan[$i]['tb_urusan_kode']?></td>
                            <td <?=$styleData?>><?=$dataUrusan[$i]['tb_urusan_nama']?></td>
                            <td <?=$styleData?>></td>
                            <td <?=$styleData?>></td>
                            <td <?=$styleData?>></td>
                            <td <?=$styleData?>></td>
                            <td <?=$styleData?>></td>
                            <td <?=$styleData?>></td>
                            <td <?=$styleData?>></td>
                            <td <?=$styleData?>></td>
                            <td <?=$styleData?>></td>
                            <td <?=$styleData?>></td>
                            <td <?=$styleData?>></td>
                            <td <?=$styleData?>></td>
                            <td <?=$styleData?>></td>
                            <td <?=$styleData?>></td>
                            <td <?=$styleData?>></td>
                            <td <?=$styleData?>></td>
                            <td <?=$styleData?>></td>
                            <td <?=$styleData?>></td>
                            <td <?=$styleData?>></td>
                            <td <?=$styleData?>></td>
                            <td <?=$styleData?>></td>
                            <td <?=$styleData?>></td>
                            <td <?=$styleData?>></td>
                            <td <?=$styleData?>></td>
                            <td <?=$styleData?>></td>
                        </tr>

            <?php
                        for($j = 0; $j <= count($dataBidang)-1; $j++){
                            if($dataUrusan[$i]['tb_urusan_kode'] == $dataBidang[$j]['tb_urusan_kode']){
            ?>
                        
                                <tr>
                                    <td <?=$styleData?>><?=$dataUrusan[$i]['tb_urusan_kode'].".".$dataBidang[$j]['tb_bidang_kode']?></td>
                                    <td <?=$styleData?>><?=$dataBidang[$j]['tb_bidang_nama']?></td>
                                    <td <?=$styleData?>></td>
                                    <td <?=$styleData?>></td>
                                    <td <?=$styleData?>></td>
                                    <td <?=$styleData?>></td>
                                    <td <?=$styleData?>></td>
                                    <td <?=$styleData?>></td>
                                    <td <?=$styleData?>></td>
                                    <td <?=$styleData?>></td>
                                    <td <?=$styleData?>></td>
                                    <td <?=$styleData?>></td>
                                    <td <?=$styleData?>></td>
                                    <td <?=$styleData?>></td>
                                    <td <?=$styleData?>></td>
                                    <td <?=$styleData?>></td>
                                    <td <?=$styleData?>></td>
                                    <td <?=$styleData?>></td>
                                    <td <?=$styleData?>></td>
                                    <td <?=$styleData?>></td>
                                    <td <?=$styleData?>></td>
                                    <td <?=$styleData?>></td>
                                    <td <?=$styleData?>></td>
                                    <td <?=$styleData?>></td>
                                    <td <?=$styleData?>></td>
                                    <td <?=$styleData?>></td>
                                    <td <?=$styleData?>></td>
                                </tr>
    
            <?php
                                for($k = 0; $k <= count($dataProgram)-1; $k++){
                                    $targetK1 = 0;
                                    $targetK2 = 0;
                                    $targetK3 = 0;
                                    $targetK4 = 0;
                                    $targetK5 = 0;
                                    $targetRp1 = 0;
                                    $targetRp2 = 0;
                                    $targetRp3 = 0;
                                    $targetRp4 = 0;
                                    $targetRp5 = 0;
                                    $targetAkhir = 0;

                                    $realisasi['xK1'] = 0;
                                    $realisasi['xK2'] = 0;
                                    $realisasi['xK3'] = 0;
                                    $realisasi['xK4'] = 0;
                                    $realisasi['xK5'] = 0;
                                    $realisasi['xRp1'] = 0;
                                    $realisasi['xRp2'] = 0;
                                    $realisasi['xRp3'] = 0;
                                    $realisasi['xRp4'] = 0;
                                    $realisasi['xRp5'] = 0;
                                    $realisasi['xAkhir'] = 0;
                                    
                                    $tahun = (($dataRPJMD[0]['tb_rpjmd_tahun']-$tahunNow)+1);
                                    $bulan = $bulanNow % 3;
                                    if($bulan == 0){
                                        $bulan = ($bulanNow/3)-1;
                                    }else if($bulan == 1){
                                        $bulan = (($bulanNow+2)/3)-1;
                                    }else if($bulan == 2){
                                        $bulan = (($bulan+1)/3)-1;
                                    }

                                    if($dataBidang[$j]['tb_urusan_kode'] == $dataProgram[$k]['tb_urusan_kode'] && $dataBidang[$j]['tb_bidang_kode'] == $dataProgram[$k]['tb_bidang_kode']){
                                        for($l1 = 0; $l1 <= count($dataKegiatan)-1; $l1++){
                                            if($dataProgram[$k]['tb_urusan_kode'] == $dataKegiatan[$l1]['tb_urusan_kode'] && $dataProgram[$k]['tb_bidang_kode'] == $dataKegiatan[$l1]['tb_bidang_kode'] && $dataProgram[$k]['tb_rpjmd_misi_kode'] == $dataKegiatan[$l1]['tb_rpjmd_misi_kode'] && $dataProgram[$k]['tb_rpjmd_tujuan_kode'] == $dataKegiatan[$l1]['tb_rpjmd_tujuan_kode'] && $dataProgram[$k]['tb_rpjmd_sasaran_kode'] == $dataKegiatan[$l1]['tb_rpjmd_sasaran_kode'] && $dataProgram[$k]['tb_rpjmd_program_kode'] == $dataKegiatan[$l1]['tb_rpjmd_program_kode']){
                                                $targetK1 = $targetK1 + $dataKegiatan[$l1]['tb_renstra_kegiatan_target1'];
                                                $targetK2 = $targetK2 + $dataKegiatan[$l1]['tb_renstra_kegiatan_target2'];
                                                $targetK3 = $targetK3 + $dataKegiatan[$l1]['tb_renstra_kegiatan_target3'];
                                                $targetK4 = $targetK4 + $dataKegiatan[$l1]['tb_renstra_kegiatan_target4'];
                                                $targetK5 = $targetK5 + $dataKegiatan[$l1]['tb_renstra_kegiatan_target5'];
                                                $targetRp1 = $targetRp1 + $dataKegiatan[$l1]['tb_renstra_kegiatan_anggaran1'];
                                                $targetRp2 = $targetRp2 + $dataKegiatan[$l1]['tb_renstra_kegiatan_anggaran2'];
                                                $targetRp3 = $targetRp3 + $dataKegiatan[$l1]['tb_renstra_kegiatan_anggaran3'];
                                                $targetRp4 = $targetRp4 + $dataKegiatan[$l1]['tb_renstra_kegiatan_anggaran4'];
                                                $targetRp5 = $targetRp5 + $dataKegiatan[$l1]['tb_renstra_kegiatan_anggaran5'];
                                                $targetAkhir = $targetAkhir + $dataKegiatan[$l1]['tb_renstra_kegiatan_target'.$tahun];

                                                for($m1 = 0; $m1 <= count($dataTriwulan)-1; $m1++){
                                                    if($dataKegiatan[$l1]['tb_urusan_kode'] == $dataTriwulan[$m1]['tb_urusan_kode'] && $dataKegiatan[$l1]['tb_bidang_kode'] == $dataTriwulan[$m1]['tb_bidang_kode'] && $dataKegiatan[$l1]['tb_rpjmd_misi_kode'] == $dataTriwulan[$m1]['tb_rpjmd_misi_kode'] && $dataKegiatan[$l1]['tb_rpjmd_tujuan_kode'] == $dataTriwulan[$m1]['tb_rpjmd_tujuan_kode'] && $dataKegiatan[$l1]['tb_rpjmd_sasaran_kode'] == $dataTriwulan[$m1]['tb_rpjmd_sasaran_kode'] && $dataKegiatan[$l1]['tb_rpjmd_program_kode'] == $dataTriwulan[$m1]['tb_rpjmd_program_kode']){
                                                        for($n = $tahun; $n >= 1; $n--){
                                                            if($dataTriwulan[$m1]['tb_monev_triwulan_tahun'] == $n){
                                                                if($n != 1){
                                                                    $realisasi['xK'.$n] = $realisasi['xK'.$n] + $dataTriwulan[$m1]['tb_monev_triwulan_target4'];
                                                                    $realisasi['xRp'.$n] = $realisasi['xRp'.$n] + $dataTriwulan[$m1]['tb_monev_triwulan_rupiah4'];
                                                                }else{
                                                                    if($bulan != 0){
                                                                        $realisasi['xK'.$n] = $realisasi['xK'.$n] + $dataTriwulan[$m1]['tb_monev_triwulan_target'.$bulan];
                                                                        $realisasi['xRp'.$n] = $realisasi['xRp'.$n] + $dataTriwulan[$m1]['tb_monev_triwulan_rupiah'.$bulan];
                                                                    }
                                                                }
                                                                        
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                        $realisasi['xAkhir'] = $realisasi['xK'.$tahun];
            ?>
                        
                                        <tr>
                                            <td <?=$styleData?>><?=$dataUrusan[$i]['tb_urusan_kode'].".".$dataBidang[$j]['tb_bidang_kode'].".".$dataProgram[$k]['tb_rpjmd_program_kode']?></td>
                                            <td <?=$styleData?>><?=$dataProgram[$k]['tb_rpjmd_program_nama']?></td>
                                            <td <?=$styleData?>><?=$dataProgram[$k]['tb_rpjmd_program_indikator_indikator']?></td>
                                            <td <?=$styleData?>><?=$dataProgram[$k]['tb_satuan_nama']?></td>
                                            <td <?=$styleData?>><?=$dataProgram[$k]['tb_rpjmd_program_indikator_awal']?></td>
                                            <td <?=$styleData?>><?=$targetK1?></td>
                                            <td <?=$styleData?>><?=$targetRp1?></td>
                                            <td <?=$styleData?>><?=$targetK1?></td>
                                            <td <?=$styleData?>><?=$targetRp1?></td>
                                            <td <?=$styleData?>><?=$targetK1?></td>
                                            <td <?=$styleData?>><?=$targetRp1?></td>
                                            <td <?=$styleData?>><?=$targetK1?></td>
                                            <td <?=$styleData?>><?=$targetRp1?></td>
                                            <td <?=$styleData?>><?=$targetK1?></td>
                                            <td <?=$styleData?>><?=$targetRp1?></td>
                                            <td <?=$styleData?>><?=$targetAkhir?></td>
                                            <td <?=$styleData?>><?=$realisasi['xK1']?></td>
                                            <td <?=$styleData?>><?=$realisasi['xRp1']?></td>
                                            <td <?=$styleData?>><?=$realisasi['xK2']?></td>
                                            <td <?=$styleData?>><?=$realisasi['xRp2']?></td>
                                            <td <?=$styleData?>><?=$realisasi['xK3']?></td>
                                            <td <?=$styleData?>><?=$realisasi['xRp3']?></td>
                                            <td <?=$styleData?>><?=$realisasi['xK4']?></td>
                                            <td <?=$styleData?>><?=$realisasi['xRp4']?></td>
                                            <td <?=$styleData?>><?=$realisasi['xK5']?></td>
                                            <td <?=$styleData?>><?=$realisasi['xRp5']?></td>
                                            <td <?=$styleData?>><?=$realisasi['xAkhir']?></td>
                                        </tr>

            <?php
                                        $realisasi['K1'] = 0;
                                        $realisasi['K2'] = 0;
                                        $realisasi['K3'] = 0;
                                        $realisasi['K4'] = 0;
                                        $realisasi['K5'] = 0;
                                        $realisasi['Rp1'] = 0;
                                        $realisasi['Rp2'] = 0;
                                        $realisasi['Rp3'] = 0;
                                        $realisasi['Rp4'] = 0;
                                        $realisasi['Rp5'] = 0;
                                        $realisasi['Akhir'] = 0;
                                        
                                        for($l = 0; $l <= count($dataKegiatan)-1; $l++){
                                            if($dataProgram[$k]['tb_urusan_kode'] == $dataKegiatan[$l]['tb_urusan_kode'] && $dataProgram[$k]['tb_bidang_kode'] == $dataKegiatan[$l]['tb_bidang_kode'] && $dataProgram[$k]['tb_rpjmd_misi_kode'] == $dataKegiatan[$l]['tb_rpjmd_misi_kode'] && $dataProgram[$k]['tb_rpjmd_tujuan_kode'] == $dataKegiatan[$l]['tb_rpjmd_tujuan_kode'] && $dataProgram[$k]['tb_rpjmd_sasaran_kode'] == $dataKegiatan[$l]['tb_rpjmd_sasaran_kode'] && $dataProgram[$k]['tb_rpjmd_program_kode'] == $dataKegiatan[$l]['tb_rpjmd_program_kode']){
                                                for($m = 0; $m <= count($dataTriwulan)-1; $m++){
                                                    if($dataKegiatan[$l]['tb_urusan_kode'] == $dataTriwulan[$m]['tb_urusan_kode'] && $dataKegiatan[$l]['tb_bidang_kode'] == $dataTriwulan[$m]['tb_bidang_kode'] && $dataKegiatan[$l]['tb_rpjmd_misi_kode'] == $dataTriwulan[$m]['tb_rpjmd_misi_kode'] && $dataKegiatan[$l]['tb_rpjmd_tujuan_kode'] == $dataTriwulan[$m]['tb_rpjmd_tujuan_kode'] && $dataKegiatan[$l]['tb_rpjmd_sasaran_kode'] == $dataTriwulan[$m]['tb_rpjmd_sasaran_kode'] && $dataKegiatan[$l]['tb_rpjmd_program_kode'] == $dataTriwulan[$m]['tb_rpjmd_program_kode']){
                                                        for($n = $tahun; $n >= 1; $n--){
                                                            if($dataTriwulan[$m]['tb_monev_triwulan_tahun'] == $n){
                                                                $realisasi['Akhir'] = $dataTriwulan[$m]['tb_monev_triwulan_target'.$bulan];
                                                                if($n != 1){
                                                                    $realisasi['K'.$n] = $dataTriwulan[$m]['tb_monev_triwulan_target4'];
                                                                    $realisasi['Rp'.$n] = $dataTriwulan[$m]['tb_monev_triwulan_rupiah4'];
                                                                }else{
                                                                    if($bulan != 0){
                                                                        $realisasi['K'.$n] = $dataTriwulan[$m]['tb_monev_triwulan_target'.$bulan];
                                                                        $realisasi['Rp'.$n] = $dataTriwulan[$m]['tb_monev_triwulan_rupiah'.$bulan];
                                                                    }
                                                                }
                                                                        
                                                            }
                                                        }
                                                    }
                                                }
            ?>
                
                                                <tr>
                                                    <td <?=$styleData?>><?=$dataUrusan[$i]['tb_urusan_kode'].".".$dataBidang[$j]['tb_bidang_kode'].".".$dataProgram[$k]['tb_rpjmd_program_kode'].".".$dataKegiatan[$l]['tb_renstra_kegiatan_kode']?></td>
                                                    <td <?=$styleData?>><?=$dataKegiatan[$l]['tb_renstra_kegiatan_nama']?></td>
                                                    <td <?=$styleData?>><?=$dataKegiatan[$l]['tb_renstra_kegiatan_indikator']?></td>
                                                    <td <?=$styleData?>><?=$dataKegiatan[$l]['tb_satuan_nama']?></td>
                                                    <td <?=$styleData?>><?=$dataKegiatan[$l]['tb_renstra_kegiatan_awal']?></td>
                                                    <td <?=$styleData?>><?=$dataKegiatan[$l]['tb_renstra_kegiatan_target1']?></td>
                                                    <td <?=$styleData?>><?=$dataKegiatan[$l]['tb_renstra_kegiatan_anggaran1']?></td>
                                                    <td <?=$styleData?>><?=$dataKegiatan[$l]['tb_renstra_kegiatan_target2']?></td>
                                                    <td <?=$styleData?>><?=$dataKegiatan[$l]['tb_renstra_kegiatan_anggaran2']?></td>
                                                    <td <?=$styleData?>><?=$dataKegiatan[$l]['tb_renstra_kegiatan_target3']?></td>
                                                    <td <?=$styleData?>><?=$dataKegiatan[$l]['tb_renstra_kegiatan_anggaran3']?></td>
                                                    <td <?=$styleData?>><?=$dataKegiatan[$l]['tb_renstra_kegiatan_target4']?></td>
                                                    <td <?=$styleData?>><?=$dataKegiatan[$l]['tb_renstra_kegiatan_anggaran4']?></td>
                                                    <td <?=$styleData?>><?=$dataKegiatan[$l]['tb_renstra_kegiatan_target5']?></td>
                                                    <td <?=$styleData?>><?=$dataKegiatan[$l]['tb_renstra_kegiatan_anggaran5']?></td>
                                                    <td <?=$styleData?>><?=$dataKegiatan[$l]['tb_renstra_kegiatan_target'.$tahun]?></td>
                                                    <td <?=$styleData?>><?=$realisasi['K1']?></td>
                                                    <td <?=$styleData?>><?=$realisasi['Rp1']?></td>
                                                    <td <?=$styleData?>><?=$realisasi['K2']?></td>
                                                    <td <?=$styleData?>><?=$realisasi['Rp2']?></td>
                                                    <td <?=$styleData?>><?=$realisasi['K3']?></td>
                                                    <td <?=$styleData?>><?=$realisasi['Rp3']?></td>
                                                    <td <?=$styleData?>><?=$realisasi['K4']?></td>
                                                    <td <?=$styleData?>><?=$realisasi['Rp4']?></td>
                                                    <td <?=$styleData?>><?=$realisasi['K5']?></td>
                                                    <td <?=$styleData?>><?=$realisasi['Rp5']?></td>
                                                    <td <?=$styleData?>><?=$realisasi['Akhir']?></td>
                                                </tr>

            <?php
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            ?>
            
            </tbody>
        </table>
        
    </body>
</html>