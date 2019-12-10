<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class BidangController extends CI_Controller {
    private $arr;
	public function __construct()
    {
		parent::__construct();
        $this->load->model('pelaporan/BidangModel');
        $this->load->library('Fungsi');
        $this->load->library('Filter');
        $this->arr = array(
			'level' => array(1,2,3,4),
        );
    }

    public function view($tahun = null){
        $status = $this->filter->cekLogin($this->arr);
		if(!$status){
			redirect(base_url()."login");
		}
        $data['tahun'] = $tahun;
        $foot['script'] = $this->load->view('components/bidang/script', $data, true);

        $this->load->view('include/head');
        $this->load->view('components/bidang/data', $data);
        $this->load->view('include/foot', $foot);
    }

    public function getData($page = 1, $api = true){
        $jumDataAll = 0;
        $post = $this->input->post();
		$status = $this->filter->cekLogin($this->arr);
		if($status){
            $search = '';
            if(@$this->input->post('search')){
                $search = $this->input->post('search');
            }

            if($_SESSION['level'] == 2){
                $this->load->model('pelaporan/DataModel');
                $post['userKode'] = @$this->DataModel->getUserKode($_SESSION['id'], $_SESSION['level']);
            }else if($_SESSION['level'] == 3){
                $this->load->model('pelaporan/DataModel');
                $post['userKode'] = @$this->DataModel->getUserKode($_SESSION['id'], $_SESSION['level']);
            }else if($_SESSION['level'] == 4){
                $this->load->model('pelaporan/DataModel');
                $post['userKode'] = @$this->DataModel->getUserKode($_SESSION['id'], $_SESSION['level']);
            }

            $data = $this->BidangModel->getAll($page, $search, $post);

            // $dataAll
            $jumDataAll = $this->BidangModel->getCount($search, $post);
            $jumlahDatainPage = $this->BidangModel->getJumlahInPage();
            $jumlahPage = ceil($jumDataAll/$jumlahDatainPage);
		}else{
            $data = array();
            $jumlahPage = 1;
        }

        $this->load->model('pelaporan/DataModel');
        for($i = 0; $i < count($data); $i++){
            $post['kode'] = $post['tahun'].'-'.$data[$i]['bidang_kode'];
            $data[$i]['jumlah_isi'] = $this->DataModel->jumlah_isi($post);
            $data[$i]['jumlah_isi'] += $this->DataModel->jumlah_isi_penunjang($post);
            // die($data[$i]['jumlah_isi']);
        }
        // print_r($data);
        
		$kirim = array(
            'jumlahAll' => $jumDataAll,
            'jumlahPage' => $jumlahPage,
			'data' => $data,
			'status' => $status
        );

        if($api)
            echo json_encode($kirim);
        else
            return json_encode($kirim);
	}
	
	public function action($action = '', $id = null){
        $post = $this->input->post();
        $status = $this->filter->cekLogin($this->arr);
        
		$result = array(
			'pesan' => 'gagal terhubung server',
			'status' => false,
        );
        
        if($status){
			if($id != null){
				$post['id_user'] = $id;
			}
            $result = $this->BidangModel->$action($post);
        }
        $kirim = $result;
		echo json_encode($kirim);
    }
    
}
