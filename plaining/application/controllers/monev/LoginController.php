<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class LoginController extends CI_Controller {

	public function index()
	{
        $this->load->view('include/head');
        $this->load->view('components/simple');
        $this->load->view('include/foot');
    }
    
    public function login(){
        $this->load->view('monev/pages/login');
    }
    
    public function beranda(){

        
        $data = array();
        $this->load->model('monev/DataModel');

        $data['jumOPD'] = $this->DataModel->getJumlahOPD();
        $data['jumProgram'] = $this->DataModel->getJumlahProgram();
        $data['jumKegiatan'] = $this->DataModel->getJumlahKegiatan();
        $data['jumUser'] = $this->DataModel->getJumlahUser();

        $foot = array();
        $this->load->view('monev/include/head');
        $this->load->view('monev/components/beranda/data', $data);
        $this->load->view('monev/include/foot', $foot);
    }

    public function profil(){
        
        $this->load->model('DataModel');
        $id_user = $_SESSION['id'];
        $data['dataUser'] = $this->DataModel->getUserProfil($id_user);
        $data['kode'] = 'tes';
        $foot['script'] = $this->load->view('components/profil/script', $data, true);
		
        $this->load->view('include/head');
        $this->load->view('components/profil/data', $data);
        $this->load->view('include/foot', $foot);
    }

    public function cekLogin(){
        $this->load->model('monev/LoginModel');
        $post = $this->input->post();
        $dataOneUser = $this->LoginModel->selectOneUserByUser(@$post['username']);
        $status = false;
        if(count($dataOneUser) > 0){
            if(password_verify($post['password'], $dataOneUser[0]['tb_user_password'])) {
                $status = true;
                $data_session = array(
                    'id' => $dataOneUser[0]['id_tb_user'],
                    'rpjmd' => 1,
                    'username'  => $dataOneUser[0]['tb_user_username'],
                    'akun' => $dataOneUser[0]['tb_user_akun'],
                    'level' => $dataOneUser[0]['tb_user_level'],
                    'logged_in' => TRUE,
                );
                
                $this->session->set_userdata($data_session);
                redirect(base_url()."monev/beranda");
            }
        }
        $pesan = array(
            "pesan" => "Gagal melakukan Login",
            "status" => false,
        );
        $this->session->set_flashdata('pesan', $pesan);
        redirect(base_url()."monev/login");
    }

    public function logout(){
        session_destroy();
        redirect(base_url()."monev/login");
    }
}
