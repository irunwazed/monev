<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class ProgramController extends CI_Controller {
    
	public function __construct()
    {
		parent::__construct();
        $this->load->model('monev/ProgramModel');
        $this->load->library('Fungsi');
    }

    public function view($kode){
        $data = array();
        $data['kode'] = $kode;
        $this->load->model('monev/DataModel');
        $data['dataRpjmd'] = $this->DataModel->getSasaran($kode);
        // $data['dataOpdPilih'] = $this->DataModel->getOpdWithJenis($this->jenis);
        $foot['script'] = $this->load->view('monev/components/program/script', $data, true);
		
        $this->load->view('monev/include/head');
        $this->load->view('monev/components/program/data', $data);
        $this->load->view('monev/include/foot', $foot);
	}

    public function getData($page = 1){
        $post = $this->input->post();
        $post['page'] = $page;
        $jumDataAll = 0;
        $jumlahDatainPage = 0;
        // $status = $this->filter->cekLogin($this->arr);
        $status = true;
		if($status){
            $data = $this->ProgramModel->getAll($post);
            // $dataAll
            $jumDataAll = $this->ProgramModel->getCount($post);
            $jumlahDatainPage = $this->ProgramModel->getJumlahInPage();
            $jumlahPage = ceil($jumDataAll/$jumlahDatainPage);
		}else{
            $data = array();
            $jumlahPage = 1;
        }

        $kirim = array(
            'jumlahAll' => $jumDataAll,
            'jumlahPage' => $jumlahPage,
			'data' => $data,
			'status' => $status
        );

        echo json_encode($kirim);
    }
    
	public function action($action = ''){
        $post = $this->input->post();
        // $status = $this->filter->cekLogin($this->arr);
        $status = true;
		$result = array(
			'pesan' => 'gagal terhubung server',
			'status' => false,
        );
        if($status){
            $result = $this->ProgramModel->$action($post);
        }
        $kirim = $result;
		echo json_encode($kirim);

    }

}