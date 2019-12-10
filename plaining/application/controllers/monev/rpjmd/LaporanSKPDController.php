<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class LaporanSKPDController extends CI_Controller {
    
    private $sessionData = array();
	public function __construct()
    {
		parent::__construct();
        $this->load->model('monev/rpjmd/LaporanSKPDModel');

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

        $data['dataRPJMD'] = $this->LaporanSKPDModel->_getDataRPJMD();
        $data['dataOPD'] = $this->LaporanSKPDModel->_getDataOPD();
        $data['dataUrusan'] = $this->LaporanSKPDModel->_getDataUrusan();
        $data['dataBidang'] = $this->LaporanSKPDModel->_getDataBidang();
        $data['dataProgram'] = $this->LaporanSKPDModel->_getDataProgram();

        $foot['script'] = $this->load->view('monev/components/rpjmd/laporan/skpd/import-script', $data, true);
		
        $this->load->view('monev/include/head');
        $this->load->view('monev/components//rpjmd/laporan/skpd/import', $data);
        $this->load->view('monev/include/foot', $foot);
	}

    public function cetak($save = ''){
        $status = false;
        $pesan = "Data Tidak Ditemukan";
        $post = $this->input->post();

        $tahunNow = date("Y");
        $bulanNow = date("m");

        $dataIndikator = array();
        $linkSavePDF = 'monev/pdf/laporan-skpd';
        $nameFile = 'laporan';
        $pageStatus = 'miring';
        
        $pesan = "Berhasil Mendapatkan Data";
        $status = true;
        $dataAll = array();

        $dataRPJMD = $this->LaporanSKPDModel->_getDataRPJMD();
        $dataOPD = $this->LaporanSKPDModel->_getDataOPD($post['cetakopd']);
        $dataUrusan = $this->LaporanSKPDModel->_getDataUrusan();
        $dataBidang = $this->LaporanSKPDModel->_getDataBidang();
        $dataProgram = $this->LaporanSKPDModel->_getDataProgram();
        $dataKegiatan = $this->LaporanSKPDModel->_getDataKegiatan();
        $dataTriwulan = $this->LaporanSKPDModel->_getDataTriwulan();

        // print_r($dataTriwulan);
        // die;

        $kirim = array(
            "dataRPJMD" => $dataRPJMD,
            "dataOPD" => $dataOPD,
            "dataUrusan" => $dataUrusan,
            "dataBidang" => $dataBidang,
            "dataProgram" => $dataProgram,
            "dataKegiatan" => $dataKegiatan,
            "dataTriwulan" => $dataTriwulan,
            "tahunNow" => $tahunNow,
            "bulanNow" => $bulanNow,
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