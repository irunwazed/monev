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
                <h4>Evaluasi Terhadap Hasil RKPD Tahun <?=$tahun?></h4>
            </div>
        </div>
        <div>
        </div>
        <br>
        <div style="width: 100%;">
            <table style="border-collapse: collapse; width:100%;">
                <thead>
                    <tr style="background-color: #1DAE94; color: #FFFFFF;">
                        <th <?=$style?> rowspan="3">NO</th>
                        <th <?=$style?> rowspan="3">SASARAN</th>
                        <th <?=$style?> rowspan="3">KODE</th>
                        <th <?=$style?> rowspan="3">Urusan/Bidang Urusan Pemerintahan Daerah Dan Program/Kegiatan </th>
                        <th <?=$style?> rowspan="3">Indikator  Kinerja Program (Outcome)/ Kegiatan (output) </th>
                        <th <?=$style?> rowspan="2" colspan="2">Target RPJMD Kabupaten/kota pada Tahun <?=$tahun?> (Akhir Periode RPJMD) </th>
                        <th <?=$style?> rowspan="2" colspan="2">Realisasi Capaian Kinerja RPJMD Kabupaten/kota sampai dengan RKPD Kabupaten/kota Tahun Lalu (<?=($tahun-1)?>) Target </th>
                        <th <?=$style?> rowspan="2" colspan="2">Target Kinerja dan Anggaran RKPD Kabupaten/kota Tahun Berjalan (Tahun <?=($tahun-1)?>) yang Dievaluasi </th>
                        <th <?=$style?> colspan="8">Realisasi Kinerja Pada Triwulan </th>
                        <th <?=$style?> rowspan="2" colspan="2">Realisasi Capaian Kinerja dan Anggaran RKPD Kabupaten/kota yang Dievaluasi </th>
                        <th <?=$style?> rowspan="3">Realisasi Kinerja dan Anggaran RPJMD Kabupaten/kota s/d Tahun ....... (Akhir Tahun Pelaksanaan RKPD tahun....) </th>
                        <th <?=$style?> rowspan="3">Tingkat Capaian Kinerja dan Realisasi Anggaran RPJMD Kabupaten/kota  s/d Tahun ... (%) </th>
                        <th <?=$style?> rowspan="3">Perangkat Daerah  Penanggung Jawab </th>
                    </tr>
                    <tr style="background-color: #1DAE94; color: #FFFFFF;">
                        <th <?=$style?> colspan="2">I</th>
                        <th <?=$style?> colspan="2">II</th>
                        <th <?=$style?> colspan="2">III</th>
                        <th <?=$style?> colspan="2">IV</th>
                    </tr>
                    <tr style="background-color: #1DAE94; color: #FFFFFF;">
                    <?php for($i = 1; $i <= 8; $i++){ ?>
                        <th <?=$style?>>K</th>
                        <th <?=$style?>>Rp</th>
                    <?php } ?>
                    </tr>
                    <tr style="background-color: #1DAE94; color: #FFFFFF;">
                    <?php for($i = 1; $i <= 24; $i++){ ?>
                        <th <?=$style?>><?=$i?></th>
                    <?php } ?>
                    </tr>
                </thead>
                <tbody>
                    <?php $no = 1; for($i = 0; $i < count($data); $i++){ ?>
                        <?php if($data[$i]['jenis'] == 1){ ?>
                        <tr>
                            <td <?=$style?>><?=$no?></td>
                            <td <?=$style?>><?=@$data[$i]['tb_rpjmd_sasaran_nama']?></td>
                            <td <?=$style?>><?=$data[$i]['tb_urusan_kode']?></td>
                            <td <?=$style?>><?=@$data[$i]['tb_urusan_nama']?></td>
                            <td <?=$style?> colspan="20"></td>
                        </tr>
                        <?php }else if($data[$i]['jenis'] == 2){ ?>
                        <tr>
                            <td <?=$style?>><?=$no?></td>
                            <td <?=$style?>><?=@$data[$i]['tb_rpjmd_sasaran_nama']?></td>
                            <td <?=$style?>><?=@$data[$i]['tb_urusan_kode'].".".$data[$i]['tb_bidang_kode']?></td>
                            <td <?=$style?>><?=@$data[$i]['tb_bidang_nama']?></td>
                            <td <?=$style?> colspan="20"></td>
                        </tr>
                        <?php }else if($data[$i]['jenis'] == 3){ ?>
                        <tr>
                            <td <?=$style?>><?=$no?></td>
                            <td <?=$style?>><?=@$data[$i]['tb_rpjmd_sasaran_nama']?></td>
                            <td <?=$style?>><?=@$data[$i]['tb_urusan_kode'].".".$data[$i]['tb_bidang_kode'].".".$data[$i]['tb_rpjmd_misi_kode'].".".$data[$i]['tb_rpjmd_tujuan_kode'].".".$data[$i]['tb_rpjmd_sasaran_kode'].".".$data[$i]['tb_rpjmd_program_kode']?></td>
                            <td <?=$style?>><?=@$data[$i]['tb_rpjmd_program_nama']?></td>
                            <td <?=$style?>><?=@$data[$i]['tb_rpjmd_program_indikator_ket']?></td>
                            <td <?=$styleRight?>><?=@$data[$i]['tb_renstra_kegiatan_target'.$tahunKe]?></td>
                            <td <?=$styleRight?>><?=@$data[$i]['tb_renstra_kegiatan_anggaran'.$tahunKe]?></td>
                            <td <?=$styleRight?>><?=@$data[$i]['dataEvaluasi'.($tahunKe-1)]['tb_monev_triwulan_target4']?$data[$i]['dataEvaluasi'.($tahunKe-1)]['tb_monev_triwulan_target4']:0?></td>
                            <td <?=$styleRight?>><?=@$data[$i]['dataEvaluasi'.($tahunKe-1)]['tb_monev_triwulan_rupiah4']?$data[$i]['dataEvaluasi'.($tahunKe-1)]['tb_monev_triwulan_rupiah4']:0?></td>
                            <td <?=$styleRight?>><?=@$data[$i]['tb_renstra_kegiatan_target'.($tahunKe-1)]?></td>
                            <td <?=$styleRight?>><?=@$data[$i]['tb_renstra_kegiatan_anggaran'.($tahunKe-1)]?></td>
                            <td <?=$styleRight?>><?=@$data[$i]['dataEvaluasi'.$tahunKe]['tb_monev_triwulan_target1']?$data[$i]['dataEvaluasi'.$tahunKe]['tb_monev_triwulan_target1']:0?></td>
                            <td <?=$styleRight?>><?=@$data[$i]['dataEvaluasi'.$tahunKe]['tb_monev_triwulan_rupiah1']?$data[$i]['dataEvaluasi'.$tahunKe]['tb_monev_triwulan_rupiah1']:0?></td>
                            <td <?=$styleRight?>><?=@$data[$i]['dataEvaluasi'.$tahunKe]['tb_monev_triwulan_target2']?$data[$i]['dataEvaluasi'.$tahunKe]['tb_monev_triwulan_target2']:0?></td>
                            <td <?=$styleRight?>><?=@$data[$i]['dataEvaluasi'.$tahunKe]['tb_monev_triwulan_rupiah2']?$data[$i]['dataEvaluasi'.$tahunKe]['tb_monev_triwulan_rupiah2']:0?></td>
                            <td <?=$styleRight?>><?=@$data[$i]['dataEvaluasi'.$tahunKe]['tb_monev_triwulan_target3']?$data[$i]['dataEvaluasi'.$tahunKe]['tb_monev_triwulan_target3']:0?></td>
                            <td <?=$styleRight?>><?=@$data[$i]['dataEvaluasi'.$tahunKe]['tb_monev_triwulan_rupiah3']?$data[$i]['dataEvaluasi'.$tahunKe]['tb_monev_triwulan_rupiah3']:0?></td>
                            <td <?=$styleRight?>><?=@$data[$i]['dataEvaluasi'.$tahunKe]['tb_monev_triwulan_target4']?$data[$i]['dataEvaluasi'.$tahunKe]['tb_monev_triwulan_target4']:0?></td>
                            <td <?=$styleRight?>><?=@$data[$i]['dataEvaluasi'.$tahunKe]['tb_monev_triwulan_rupiah4']?$data[$i]['dataEvaluasi'.$tahunKe]['tb_monev_triwulan_rupiah4']:0?></td>
                            <td <?=$styleRight?>><?=@$data[$i]['dataEvaluasi'.$tahunKe]['tb_monev_triwulan_target'.$triwulan]?$data[$i]['dataEvaluasi'.$tahunKe]['tb_monev_triwulan_target'.$triwulan]:0?></td>
                            <td <?=$styleRight?>><?=@$data[$i]['dataEvaluasi'.$tahunKe]['tb_monev_triwulan_rupiah'.$triwulan]?$data[$i]['dataEvaluasi'.$tahunKe]['tb_monev_triwulan_rupiah'.$triwulan]:0?></td>
                            <td <?=$styleRight?>><?=@$data[$i]['realisasiAnggaran']?></td>
                            <td <?=$styleRight?>><?=@$data[$i]['capaianAnggaran']?></td>
                            <td <?=$style?>></td>
                        </tr>
                        <?php }else if($data[$i]['jenis'] == 4){ 
                        
                        ?>
                        <tr>
                            <td <?=$style?>><?=$no?></td>
                            <td <?=$style?>><?=@$data[$i]['tb_rpjmd_sasaran_nama']?></td>
                            <td <?=$style?>><?=@$data[$i]['tb_urusan_kode'].".".$data[$i]['tb_bidang_kode'].".".$data[$i]['tb_rpjmd_misi_kode'].".".$data[$i]['tb_rpjmd_tujuan_kode'].".".$data[$i]['tb_rpjmd_sasaran_kode'].".".$data[$i]['tb_rpjmd_program_kode'].".".$data[$i]['tb_renstra_kegiatan_kode']?></td>
                            <td <?=$style?>><?=@$data[$i]['tb_renstra_kegiatan_nama']?></td>
                            <td <?=$style?>><?=@$data[$i]['tb_renstra_kegiatan_indikator']?></td>
                            <td <?=$styleRight?>><?=@$data[$i]['tb_renstra_kegiatan_target'.$tahunKe]?></td>
                            <td <?=$styleRight?>><?=@$data[$i]['tb_renstra_kegiatan_anggaran'.$tahunKe]?></td>
                            <td <?=$styleRight?>><?=@$data[$i]['dataEvaluasi'.($tahunKe-1)]['tb_monev_triwulan_target4']?$data[$i]['dataEvaluasi'.($tahunKe-1)]['tb_monev_triwulan_target4']:0?></td>
                            <td <?=$styleRight?>><?=@$data[$i]['dataEvaluasi'.($tahunKe-1)]['tb_monev_triwulan_rupiah4']?$data[$i]['dataEvaluasi'.($tahunKe-1)]['tb_monev_triwulan_rupiah4']:0?></td>
                            <td <?=$styleRight?>><?=@$data[$i]['tb_renstra_kegiatan_target'.($tahunKe-1)]?></td>
                            <td <?=$styleRight?>><?=@$data[$i]['tb_renstra_kegiatan_anggaran'.($tahunKe-1)]?></td>
                            <td <?=$styleRight?>><?=@$data[$i]['dataEvaluasi'.$tahunKe]['tb_monev_triwulan_target1']?$data[$i]['dataEvaluasi'.$tahunKe]['tb_monev_triwulan_target1']:0?></td>
                            <td <?=$styleRight?>><?=@$data[$i]['dataEvaluasi'.$tahunKe]['tb_monev_triwulan_rupiah1']?$data[$i]['dataEvaluasi'.$tahunKe]['tb_monev_triwulan_rupiah1']:0?></td>
                            <td <?=$styleRight?>><?=@$data[$i]['dataEvaluasi'.$tahunKe]['tb_monev_triwulan_target2']?$data[$i]['dataEvaluasi'.$tahunKe]['tb_monev_triwulan_target2']:0?></td>
                            <td <?=$styleRight?>><?=@$data[$i]['dataEvaluasi'.$tahunKe]['tb_monev_triwulan_rupiah2']?$data[$i]['dataEvaluasi'.$tahunKe]['tb_monev_triwulan_rupiah2']:0?></td>
                            <td <?=$styleRight?>><?=@$data[$i]['dataEvaluasi'.$tahunKe]['tb_monev_triwulan_target3']?$data[$i]['dataEvaluasi'.$tahunKe]['tb_monev_triwulan_target3']:0?></td>
                            <td <?=$styleRight?>><?=@$data[$i]['dataEvaluasi'.$tahunKe]['tb_monev_triwulan_rupiah3']?$data[$i]['dataEvaluasi'.$tahunKe]['tb_monev_triwulan_rupiah3']:0?></td>
                            <td <?=$styleRight?>><?=@$data[$i]['dataEvaluasi'.$tahunKe]['tb_monev_triwulan_target4']?$data[$i]['dataEvaluasi'.$tahunKe]['tb_monev_triwulan_target4']:0?></td>
                            <td <?=$styleRight?>><?=@$data[$i]['dataEvaluasi'.$tahunKe]['tb_monev_triwulan_rupiah4']?$data[$i]['dataEvaluasi'.$tahunKe]['tb_monev_triwulan_rupiah4']:0?></td>
                            <td <?=$styleRight?>><?=@$data[$i]['dataEvaluasi'.$tahunKe]['tb_monev_triwulan_target'.$triwulan]?$data[$i]['dataEvaluasi'.$tahunKe]['tb_monev_triwulan_target'.$triwulan]:0?></td>
                            <td <?=$styleRight?>><?=@$data[$i]['dataEvaluasi'.$tahunKe]['tb_monev_triwulan_rupiah'.$triwulan]?$data[$i]['dataEvaluasi'.$tahunKe]['tb_monev_triwulan_rupiah'.$triwulan]:0?></td>
                            <td <?=$styleRight?>><?=@$data[$i]['realisasiAnggaran']?></td>
                            <td <?=$styleRight?>><?=@$data[$i]['capaianAnggaran']?></td>
                            <td <?=$styleRight?>><?=$data[$i]['tb_sub_unit_nama']?></td>
                        </tr>
                        <?php } ?>
                    <?php $no++; } ?>
                </tbody>

            </table>
        </div>
    </body>
</html>