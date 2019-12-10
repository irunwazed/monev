<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class LaporanMTSController extends CI_Controller {
    
    private $sessionData = array();
	public function __construct()
    {
		parent::__construct();
        $this->load->model('monev/rpjmd/LaporanMTSModel');

    }

    public function sessionCoba(){
        $this->sessionData = array(
            'id_tb_rpjmd' => 1
        );

        $this->session->set_userdata($this->sessionData);

        redirect(base_url()."monev/rpjmd/laporan/misi-tujuan-sasaran");
    }

    public function view(){
        $data = array();

        // $this->load->model('monev/DataModel');
        // $data['dataOpd'] = $this->DataModel->selectAllOpd();

        $foot['script'] = $this->load->view('monev/components/rpjmd/laporan/mts/import-script', $data, true);
		
        $this->load->view('monev/include/head');
        $this->load->view('monev/components//rpjmd/laporan/mts/import', $data);
        $this->load->view('monev/include/foot', $foot);
	}

    public function cetak($save = ''){
        $status = false;
        $pesan = "Data Tidak Ditemukan";
        $post = $this->input->post();

        $dataIndikator = array();
        $linkSavePDF = 'monev/pdf/laporan-mts';
        $nameFile = 'laporan';
        $pageStatus = 'miring';
        
        $pesan = "Berhasil Mendapatkan Data";
        $status = true;
        $dataAll = array();

        $dataVisi = $this->LaporanMTSModel->_getDataVisi($_SESSION['rpjmd']);
        $dataMisi = $this->LaporanMTSModel->_getDataMisi($_SESSION['rpjmd']);
        $dataTujuan = $this->LaporanMTSModel->_getDataTujuan($_SESSION  ['rpjmd']);
        $dataSasaran = $this->LaporanMTSModel->_getDataSasaran($_SESSION['rpjmd']);

        // print_r($dataOpd);
        $kirim = array(
            "dataAll" => $dataAll,
            "dataVisi" => $dataVisi,
            "dataMisi" => $dataMisi,
            "dataTujuan" => $dataTujuan,
            "dataSasaran" => $dataSasaran,
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