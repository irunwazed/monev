<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class MisiController extends CI_Controller {
    
	public function __construct()
    {
		parent::__construct();
        $this->load->model('monev/MisiModel');
        $this->load->library('Fungsi');
    }

    public function view(){
        $data = array();

        $this->load->model('monev/DataModel');
        $data['dataRpjmd'] = $this->DataModel->getVisi($_SESSION['rpjmd']);
        // $data['dataOpdPilih'] = $this->DataModel->getOpdWithJenis($this->jenis);
        $foot['script'] = $this->load->view('monev/components/misi/script', $data, true);
		
        $this->load->view('monev/include/head');
        $this->load->view('monev/components/misi/data', $data);
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
            $data = $this->MisiModel->getAll($post);
            // $dataAll
            $jumDataAll = $this->MisiModel->getCount($post);
            $jumlahDatainPage = $this->MisiModel->getJumlahInPage();
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
            $result = $this->MisiModel->$action($post);
        }
        $kirim = $result;
		echo json_encode($kirim);

    }

}