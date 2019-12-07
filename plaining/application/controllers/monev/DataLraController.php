<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class DataLraController extends CI_Controller {

    public function __construct()
    {
        parent::__construct();
        $this->load->model('monev/DataModel');
        // $this->load->library('Fungsi');
    }
    
    public function view($tahun = null){
        if($tahun == null){
            $tahun = date("Y");
        }
        $data['dataOpd'] = $this->DataModel->selectAllOpd();
        $data['tahun'] = $tahun;
        $post = array();
        $foot = array();
        // $foot['script'] = $this->load->view('components/laporan/pelaporan/script', $data, true);
        $this->load->view('monev/include/head');
        $this->load->view('monev/components/lra/import', $data);
        $this->load->view('monev/include/foot', $foot);
    }

    public function cetak($save = ''){
        $status = false;
        $pesan = "Data Tidak Ditemukan";
        $post = $this->input->post();

        if($_SESSION['level'] == 3){
            $post['rek_jenis'] = $_SESSION['jenis_opd'];
        }

        if(!@$post['thn_awal']){
            $post['thn_awal'] = date('Y');
        }
        if(!@$post['thn_akhir']){
            $post['thn_akhir'] = date('Y');
        }

        $dataIndikator = array();
        $linkSavePDF = 'pdf/laporan';
        $nameFile = 'laporan';
        $pageStatus = 'miring';
        
        $pesan = "Berhasil Mendapatkan Data";
        $status = true;
        $dataAll = array();
        $data = $this->LaporanModel->selectLaporan($post);
        $dataOpd = $this->DataModel->getOpdWithJenis($post['rek_jenis']);

        $rek1_kode = 0;
        $rek2_kode = 0;
        $rek3_kode = 0;

        $index = 0;
        $index_rek2 = 0;
        for($i = 0; $i < count($data); $i++){

            if($rek1_kode != $data[$i]['rek1_kode']){
                $rek1_kode = $data[$i]['rek1_kode'];
                $rek2_kode = 0;
                $rek3_kode = 0;

                $dataAll[$index] = $data[$i];
                $dataAll[$index]['level'] = 1;
                $index++;
            }

            if($rek2_kode != $data[$i]['rek2_kode']){
                $rek2_kode = $data[$i]['rek2_kode'];
                $rek3_kode = 0;

                $dataAll[$index] = $data[$i];
                $dataAll[$index]['level'] = 2;
                $index_rek2 = $index;
                for($j = $post['thn_awal']; $j <= $post['thn_akhir']; $j++){
                    $dataAll[$index]['thn_'.$j] = 0;
                }

                $index++;
            }

            if($rek3_kode != $data[$i]['rek3_kode']){
                $rek3_kode = $data[$i]['rek3_kode'];
                
                $dataAll[$index] = $data[$i];
                $dataAll[$index]['level'] = 3;
                $index++;
            }


            $dataAll[$index] = $data[$i];
            $dataAll[$index]['level'] = 4;

            $dataAll[$index_rek2]['thn_'.$dataAll[$index]['capaian_tahun']] = @$dataAll[$index_rek2]['thn_'.$dataAll[$index]['capaian_tahun']]?$dataAll[$index_rek2]['thn_'.$dataAll[$index]['capaian_tahun']]+$dataAll[$index]['capaian_nilai']:+$dataAll[$index]['capaian_nilai'];

            $index++;
        }
        
        $kirim = array(
            "dataOpd" => $dataOpd,
            "data" => $dataAll,
            "status" => $status,
            "post" => $post,
            "pesan" => $pesan,
        );
        // echo "<pre>";
        // print_r($dataAll);

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

}