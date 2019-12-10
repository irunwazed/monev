<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class DataEvaluasiContoller extends CI_Controller {

    public function __construct()
    {
        parent::__construct();
        $this->load->model('monev/DataEvaluasiModel');
        $this->load->model('monev/DataModel');
    }
    
    public function view($tahun = null){
        if($tahun == null){
            $tahun = date("Y");
        }
        $data['dataOpd'] = $this->DataModel->selectAllOpd();
        $data['tahun'] = $tahun;
        $post = array();
        $foot = array();
        $foot['script'] = $this->load->view('monev/components/evaluasi-laporan/script', $data, true);
        $this->load->view('monev/include/head');
        $this->load->view('monev/components/evaluasi-laporan/data', $data);
        $this->load->view('monev/include/foot', $foot);
    }

    public function cetak($save = ''){
        $status = false;
        $pesan = "Data Tidak Ditemukan";
        $post = $this->input->post();

        $dataIndikator = array();
        $linkSavePDF = 'monev/pdf/evaluasi';
        $nameFile = 'laporan';
        $pageStatus = 'miring';
        
        $pesan = "Berhasil Mendapatkan Data";
        $status = true;
        $dataAll = array();

        $tahun = $post['tahun'];
        $triwulan = 1;
        $post['triwulan'] = $triwulan;

        // print_r($post);
        
        $dataAll = $this->setData($post);
        $dataRpjmd = $this->DataModel->getStatusRpjmd();
        $tahunKe = $tahun - $dataRpjmd->tb_rpjmd_tahun + 1;
        // $dataAll = $this->DataModel->getLraOpd($post['cetakopd'], $post['cetaktahun']);
        // $dataOpd = $this->DataModel->selectOneOpdByKode($post['cetakopd']);


        $kirim = array(
            // "dataOpd" => $dataOpd,
            "triwulan" => $triwulan,
            "tahun" => $tahun,
            "tahunKe" => $tahunKe,
            "data" => $dataAll,
            "status" => $status,
            "post" => $post,
            "pesan" => $pesan,
        );

        if($save == 'pdf'){
            $this->load->library('M_pdf');
            $this->m_pdf->getPdf($nameFile, $linkSavePDF, $kirim, $pageStatus);
        }else if($save == 'print'){
            $kirim['print'] = true;
            $this->load->view($linkSavePDF, $kirim);
        }else if($save == 'excel'){
            $this->exportExcelIndikator($dataType, $nameFile, $kirim, $kirim);
        }else{
            echo json_encode($kirim);
        }
    }

    public function setData($post){

        
        $dataRpjmd = $this->DataModel->getStatusRpjmd();
        $tahun = $post['tahun'];
        $triwulan = $post['triwulan'];
        $tahunKe = $tahun - $dataRpjmd->tb_rpjmd_tahun + 1;

        $data = $this->DataEvaluasiModel->selectKegiatan();


        $dataAll = array();
        $index = 0;
        $kode_urusan = 0;
        $kode_bidang = 0;
        $kode_program = 0;
        $kode_kegiatan = 0;

        $index_program = 0;
        for($i = 0; $i < count($data); $i++){
            if($data[$i]['tb_urusan_kode'] != $kode_urusan){
                $kode_urusan = $data[$i]['tb_urusan_kode'];
                $dataAll[$index] = $data[$i];
                $dataAll[$index]['jenis'] = 1;
                $index++;
                $kode_bidang = 0;
                $kode_program = 0;
                $kode_kegiatan = 0;
            }

            if($data[$i]['tb_bidang_kode'] != $kode_bidang){
                
                $kode_bidang = $data[$i]['tb_bidang_kode'];
                $dataAll[$index] = $data[$i];
                $dataAll[$index]['jenis'] = 2;
                $index++;

                $kode_program = 0;
                $kode_kegiatan = 0;
            }

            if($data[$i]['tb_rpjmd_program_kode'] != $kode_program){
                
                $kode_program = $data[$i]['tb_rpjmd_program_kode'];
                $dataAll[$index] = $data[$i];
                $dataAll[$index]['jenis'] = 3;

                $index_program = $index;
                $dataAll[$index_program]['tb_renstra_kegiatan_target'.$tahunKe] = array();
                $dataAll[$index_program]['tb_renstra_kegiatan_anggaran'.$tahunKe] = 0;
                $dataAll[$index_program]['dataEvaluasi'.($tahunKe-1)]['tb_monev_triwulan_target4'] = array();
                $dataAll[$index_program]['dataEvaluasi'.($tahunKe-1)]['tb_monev_triwulan_rupiah4'] = 0;
                $dataAll[$index_program]['tb_renstra_kegiatan_target'.($tahunKe-1)] = array();
                $dataAll[$index_program]['tb_renstra_kegiatan_anggaran'.($tahunKe-1)] = 0;
                $dataAll[$index_program]['dataEvaluasi'.$tahunKe]['tb_monev_triwulan_target1'] = array();
                $dataAll[$index_program]['dataEvaluasi'.$tahunKe]['tb_monev_triwulan_rupiah1'] = 0;
                $dataAll[$index_program]['dataEvaluasi'.$tahunKe]['tb_monev_triwulan_target2'] = array();
                $dataAll[$index_program]['dataEvaluasi'.$tahunKe]['tb_monev_triwulan_rupiah2'] = 0;
                $dataAll[$index_program]['dataEvaluasi'.$tahunKe]['tb_monev_triwulan_target3'] = array();
                $dataAll[$index_program]['dataEvaluasi'.$tahunKe]['tb_monev_triwulan_rupiah3'] = 0;
                $dataAll[$index_program]['dataEvaluasi'.$tahunKe]['tb_monev_triwulan_target4'] = array();
                $dataAll[$index_program]['dataEvaluasi'.$tahunKe]['tb_monev_triwulan_rupiah4'] = 0;

                $dataAll[$index_program]['realisasiAnggaran'] = 0;
                $dataAll[$index_program]['capaianAnggaran'] = 0;

                $index++;
                $kode_kegiatan = 0;
            }

            $kode_kegiatan = $data[$i]['tb_renstra_kegiatan_kode'];
            $dataAll[$index] = $data[$i];
            $dataAll[$index]['jenis'] = 4;
            $dataEvaluasi = $this->DataEvaluasiModel->selectKegiatanEvaluasi($data[$i]);
            for($j = 0; $j < count($dataEvaluasi); $j++){
                $dataAll[$index]['dataEvaluasi'.$dataEvaluasi[$j]['tb_monev_triwulan_tahun']] = $dataEvaluasi[$j];
            }

            $dataAll[$index]['realisasiAnggaran'] = @$dataAll[$index]['dataEvaluasi'.$tahunKe]['tb_monev_triwulan_rupiah'.$triwulan] + @$dataAll[$index]['dataEvaluasi'.($tahunKe-1)]['tb_monev_triwulan_rupiah4'];
            $dataAll[$index]['capaianAnggaran'] = 100*$dataAll[$index]['realisasiAnggaran']/$dataAll[$index]['tb_renstra_kegiatan_anggaran'.$tahunKe];
            
            // $dataAll[$index_program]['tb_renstra_kegiatan_target'] += $dataAll[$index]['tb_renstra_kegiatan_target'];

            $dataAll[$index_program]['realisasiAnggaran'] += $dataAll[$index]['realisasiAnggaran'];
            $dataAll[$index_program]['capaianAnggaran'] += $dataAll[$index]['capaianAnggaran'];

            array_push($dataAll[$index_program]['tb_renstra_kegiatan_target'.$tahunKe], @$dataAll[$index]['tb_renstra_kegiatan_target'.$tahunKe]);
            array_push($dataAll[$index_program]['dataEvaluasi'.($tahunKe-1)]['tb_monev_triwulan_target4'],@$dataAll[$index]['dataEvaluasi'.($tahunKe-1)]['tb_monev_triwulan_target4']);
            array_push($dataAll[$index_program]['tb_renstra_kegiatan_target'.($tahunKe-1)],@$dataAll[$index]['tb_renstra_kegiatan_target'.($tahunKe-1)]);
            array_push($dataAll[$index_program]['dataEvaluasi'.$tahunKe]['tb_monev_triwulan_target1'], @$dataAll[$index]['dataEvaluasi'.$tahunKe]['tb_monev_triwulan_target1']);
            array_push($dataAll[$index_program]['dataEvaluasi'.$tahunKe]['tb_monev_triwulan_target2'], @$dataAll[$index]['dataEvaluasi'.$tahunKe]['tb_monev_triwulan_target2']);
            array_push($dataAll[$index_program]['dataEvaluasi'.$tahunKe]['tb_monev_triwulan_target3'], @$dataAll[$index]['dataEvaluasi'.$tahunKe]['tb_monev_triwulan_target3']);
            array_push($dataAll[$index_program]['dataEvaluasi'.$tahunKe]['tb_monev_triwulan_target4'], @$dataAll[$index]['dataEvaluasi'.$tahunKe]['tb_monev_triwulan_target4']);

            $dataAll[$index_program]['tb_renstra_kegiatan_anggaran'.$tahunKe] += @$dataAll[$index]['tb_renstra_kegiatan_anggaran'.$tahunKe];
            $dataAll[$index_program]['dataEvaluasi'.($tahunKe-1)]['tb_monev_triwulan_rupiah4'] += @$dataAll[$index]['dataEvaluasi'.($tahunKe-1)]['tb_monev_triwulan_rupiah4'];
            $dataAll[$index_program]['tb_renstra_kegiatan_anggaran'.($tahunKe-1)] += @$dataAll[$index]['tb_renstra_kegiatan_anggaran'.($tahunKe-1)];
            $dataAll[$index_program]['dataEvaluasi'.$tahunKe]['tb_monev_triwulan_rupiah1'] += @$dataAll[$index]['dataEvaluasi'.$tahunKe]['tb_monev_triwulan_rupiah1'];
            $dataAll[$index_program]['dataEvaluasi'.$tahunKe]['tb_monev_triwulan_rupiah2'] += @$dataAll[$index]['dataEvaluasi'.$tahunKe]['tb_monev_triwulan_rupiah2'];
            $dataAll[$index_program]['dataEvaluasi'.$tahunKe]['tb_monev_triwulan_rupiah3'] += @$dataAll[$index]['dataEvaluasi'.$tahunKe]['tb_monev_triwulan_rupiah3'];
            $dataAll[$index_program]['dataEvaluasi'.$tahunKe]['tb_monev_triwulan_rupiah4'] += @$dataAll[$index]['dataEvaluasi'.$tahunKe]['tb_monev_triwulan_rupiah4'];
           



            if(!@$data[$i+1] || $data[$i+1]['tb_rpjmd_program_kode'] != $kode_program){

                $tempArr = $dataAll[$index_program]['tb_renstra_kegiatan_target'.$tahunKe];
                if(count($tempArr) == 0){
                    $tempArr = 0;
                }else{
                    $tempArr = array_sum($tempArr)/count($tempArr);
                }
                $dataAll[$index_program]['tb_renstra_kegiatan_target'.$tahunKe] = $tempArr;

                $tempArr = $dataAll[$index_program]['dataEvaluasi'.($tahunKe-1)]['tb_monev_triwulan_target4'];
                if(count($tempArr) == 0){
                    $tempArr = 0;
                }else{
                    $tempArr = array_sum($tempArr)/count($tempArr);
                }
                $dataAll[$index_program]['dataEvaluasi'.($tahunKe-1)]['tb_monev_triwulan_target4'] = $tempArr;

                $tempArr = $dataAll[$index_program]['tb_renstra_kegiatan_target'.($tahunKe-1)];
                if(count($tempArr) == 0){
                    $tempArr = 0;
                }else{
                    $tempArr = array_sum($tempArr)/count($tempArr);
                }
                $dataAll[$index_program]['tb_renstra_kegiatan_target'.($tahunKe-1)] = $tempArr;

                $tempArr = $dataAll[$index_program]['dataEvaluasi'.$tahunKe]['tb_monev_triwulan_target1'];
                if(count($tempArr) == 0){
                    $tempArr = 0;
                }else{
                    $tempArr = array_sum($tempArr)/count($tempArr);
                }
                $dataAll[$index_program]['dataEvaluasi'.$tahunKe]['tb_monev_triwulan_target1'] = $tempArr;

                $tempArr = $dataAll[$index_program]['dataEvaluasi'.$tahunKe]['tb_monev_triwulan_target2'];
                if(count($tempArr) == 0){
                    $tempArr = 0;
                }else{
                    $tempArr = array_sum($tempArr)/count($tempArr);
                }
                $dataAll[$index_program]['dataEvaluasi'.$tahunKe]['tb_monev_triwulan_target2'] = $tempArr;

                $tempArr = $dataAll[$index_program]['dataEvaluasi'.$tahunKe]['tb_monev_triwulan_target3'];
                if(count($tempArr) == 0){
                    $tempArr = 0;
                }else{
                    $tempArr = array_sum($tempArr)/count($tempArr);
                }
                $dataAll[$index_program]['dataEvaluasi'.$tahunKe]['tb_monev_triwulan_target3'] = $tempArr;

                $tempArr = $dataAll[$index_program]['dataEvaluasi'.$tahunKe]['tb_monev_triwulan_target4'];
                if(count($tempArr) == 0){
                    $tempArr = 0;
                }else{
                    $tempArr = array_sum($tempArr)/count($tempArr);
                }
                $dataAll[$index_program]['dataEvaluasi'.$tahunKe]['tb_monev_triwulan_target4'] = $tempArr;

                
            }



            $index++;

        }
        return $dataAll;

    }

}