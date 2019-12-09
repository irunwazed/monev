<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class LraController extends CI_Controller {
    
	public function __construct()
    {
		parent::__construct();
        $this->load->model('monev/LraModel');
    }

    public function view(){
        $data = array();

        $this->load->model('monev/DataModel');
        $data['dataOpd'] = $this->DataModel->selectAllOpd();
        // $data['dataOpdPilih'] = $this->DataModel->getOpdWithJenis($this->jenis);
        $foot['script'] = $this->load->view('monev/components/lra/script', $data, true);
		
        $this->load->view('monev/include/head');
        $this->load->view('monev/components/lra/data', $data);
        $this->load->view('monev/include/foot', $foot);
	}

    public function getData($page = 1){
        $post = $this->input->post();
        $post['page'] = $page;
        $tahun = $post['tahun'];
        $jumDataAll = 0;
        $jumlahDatainPage = 0;
        // $status = $this->filter->cekLogin($this->arr);
        $status = true;
		if($status){

            $this->load->model('monev/DataModel');

            $data = $this->LraModel->getAll($post);
            $jumDataAll = $this->LraModel->getCount($post);
            $jumlahDatainPage = $this->LraModel->getJumlahInPage();
            $jumlahPage = ceil($jumDataAll/$jumlahDatainPage);
		}else{
            $data = array();
            $jumlahPage = 1;
        }
        $dataOneOpd = $this->DataModel->selectOneOpdByKode($post['kodeOpd']);

        $kirim = array(
            'tahun' => $tahun,
            'dataOneOpd' => $dataOneOpd,
            'jumlahAll' => $jumDataAll,
            'jumlahPage' => $jumlahPage,
			'data' => $data,
			'status' => $status
        );

        echo json_encode($kirim);
    }

    
	public function action($action = ''){
        $post = $this->input->post();
        $post['rek_jenis'] = $this->jenis;
        // $status = $this->filter->cekLogin($this->arr);
        $status = true;
		$result = array(
			'pesan' => 'gagal terhubung server',
			'status' => false,
        );
        if($status){
            $result = $this->LraModel->$action($post);
        }
        $kirim = $result;
		echo json_encode($kirim);

    }

}