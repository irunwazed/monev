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
        $foot['script'] = $this->load->view('monev/components/lra/import-script', $data, true);
        $this->load->view('monev/include/head');
        $this->load->view('monev/components/lra/import', $data);
        $this->load->view('monev/include/foot', $foot);
    }

    public function cetak($save = ''){
        $status = false;
        $pesan = "Data Tidak Ditemukan";
        $post = $this->input->post();

        $dataIndikator = array();
        $linkSavePDF = 'monev/pdf/lra';
        $nameFile = 'laporan';
        $pageStatus = 'miring';
        
        $pesan = "Berhasil Mendapatkan Data";
        $status = true;
        $dataAll = array();
        $dataAll = $this->DataModel->getLraOpd($post['cetakopd'], $post['cetaktahun']);
        $dataOpd = $this->DataModel->selectOneOpdByKode($post['cetakopd']);

        $kirim = array(
            "dataOpd" => $dataOpd,
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

}