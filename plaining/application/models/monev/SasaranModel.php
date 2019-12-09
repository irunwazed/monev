<?php

class SasaranModel extends CI_Model
{
    private $jumlah, $table;
    public function __construct()
    {
        parent::__construct();
        $this->jumlah = 20;
        $this->table = 'tb_rpjmd_sasaran';
    }

    public function setQuery($post){
        $kode = explode("-", $post['kode']);
        $this->db->where("tb_rpjmd_misi_kode", $kode[0]);
        $this->db->where("tb_rpjmd_tujuan_kode", $kode[1]);
    }

    public function getCount($post = array()){

        $this->setQuery($post);

        $query = $this->db->get($this->table);
        return $query->num_rows();
    }

    public function getJumlahInPage(){
        return $this->jumlah;
    }

    public function getAll($post = array()){


        $this->setQuery($post);
        
        $query = $this->db->get($this->table)->result_array();
        return $query;
    }

    public function create($post){
        
        $post = $this->security->xss_clean($post);
        $pesan = "Gagal Menambah Data";
        $status = False;
        if($this->cekInput($post)){
            $post['tb_user_password'] = $this->fungsi->password_hash($post['tb_user_password']);
            $data = array(
                'tb_user_username' => $post['tb_user_username'],
                'tb_user_password' => $post['tb_user_password'],
                'tb_user_hp' => $post['tb_user_hp'],
                'tb_user_akun' => 7,
                'tb_user_level' => $post['tb_user_level'],
            );
            $status = $this->db->insert($this->table, $data);

            if($status)
                $pesan = "Berhasil Menambah Data";
        }

        $kirim = array(
            'pesan' => $pesan,
            'status' => $status,
        );
        return $kirim;
    }

    public function update($post){
        
        $post = $this->security->xss_clean($post);
        $pesan = "Gagal Mengubah Data";
        $status = False;
        
        if($this->cekInput($post)){

            $data = array(
                'tb_user_username' => $post['tb_user_username'],
                'tb_user_hp' => $post['tb_user_hp'],
                'tb_user_akun' => 7,
                'tb_user_level' => $post['tb_user_level'],
            );
            $this->db->where('id_tb_user', $post['id_tb_user']);
            $query = $this->db->get($this->table)->result_array();

            if(@$query[0]['tb_user_password'] != $post['tb_user_password']){
                $post['tb_user_password'] = $this->fungsi->password_hash($post['tb_user_password']);
                $data['tb_user_password'] = $post['tb_user_password'];
            }

            $this->db->where('id_tb_user', $post['id_tb_user']);
            $status = $this->db->update($this->table, $data);
            if($status)
                $pesan = "Berhasil Mengubah Data";
        }

        $kirim = array(
            'pesan' => $pesan,
            'status' => $status,
        );
        return $kirim;
    }

    public function delete($post){
        $post = $this->security->xss_clean($post);
        $pesan = "Gagal Menghapus Data";
        $status = False;
        
        if($this->cekInput($post)){
            $this->db->where('id_tb_user', $post['kode']);
            $status = $this->db->delete($this->table);
            if($status)
                $pesan = "Berhasil Menghapus Data";
        }

        $kirim = array(
            'pesan' => $pesan,
            'status' => $status,
        );
        return $kirim;
    }
    
    public function cekInput($post){
        //ruang filter

        // $query = $this->db->get($this->table);
        return true;
    }
    

}