<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class EvaluasiController2 extends CI_Controller {
    
	public function __construct()
    {
		parent::__construct();
        $this->load->model('monev/EvaluasiModel');
        $this->load->library('Fungsi');
    }

    public function view(){
        $data = array();

        // $this->load->model('monev/DataModel');
        // $data['dataOpd'] = $this->DataModel->getOpdJenis();
        // $data['dataOpdPilih'] = $this->DataModel->getOpdWithJenis($this->jenis);
        $foot['script'] = $this->load->view('monev/components/evaluasi2/script', $data, true);
		
        $this->load->view('monev/include/head');
        $this->load->view('monev/components/evaluasi2/data', $data);
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
            $data = $this->EvaluasiModel->getAll($post);

            // $dataAll
            $jumDataAll = $this->EvaluasiModel->getCount($post);
            $jumlahDatainPage = $this->EvaluasiModel->getJumlahInPage();
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
            $result = $this->EvaluasiModel->$action($post);
        }
        $kirim = $result;
		echo json_encode($kirim);

    }

}