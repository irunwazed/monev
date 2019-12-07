<?php

class LraModel extends CI_Model
{
    private $jumlah, $table;
    public function __construct()
    {
        parent::__construct();
        $this->jumlah = 20;
        $this->table = 'tb_monev_lra';
    }

    public function setQuery($post){
        // $this->db->where('rek_jenis', $post['jenis']);
        
        $this->db->order_by($this->table.".tb_rekening1_kode", "ASC");
        $this->db->order_by($this->table.".tb_rekening2_kode", "ASC");
        $this->db->order_by($this->table.".program_kode", "ASC");
        $this->db->order_by($this->table.".kegiatan_kode", "ASC");
        $this->db->order_by($this->table.".tb_rekening3_kode", "ASC");
        $this->db->order_by($this->table.".tb_rekening4_kode", "ASC");
        $this->db->order_by($this->table.".tb_rekening5_kode", "ASC");
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

        $jumlah = $this->jumlah;
        $awal = (@$post['page'] - 1)*$jumlah;

        $this->setQuery($post);
        $this->db->limit($jumlah,$awal); 
        
        $query = $this->db->get($this->table)->result_array();
        return $query;
    }

    public function create($post){
        
        $post = $this->security->xss_clean($post);
        $pesan = "Gagal Menambah Data";
        $status = False;
        if($this->cekInput($post)){
            $lastId = $this->getLastId($post);
            $data = array(
                'rek_jenis' => $post['rek_jenis'],
                'rek1_kode' => $lastId,
                'rek1_nama' => $post['rek1_nama'],
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

            $kode = explode("-", $post['kode']);
            $data = array(
                'rek_jenis' => $post['rek_jenis'],
                'rek1_kode' => $post['rek1_kode'],
                'rek1_nama' => $post['rek1_nama'],
            );

            $this->db->where('rek_jenis', $post['rek_jenis']);
            $this->db->where('rek1_kode', $kode[1]);
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
            $kode = explode("-", $post['kode']);
            $this->db->where('rek_jenis', $kode[0]);
            $this->db->where('rek1_kode', $kode[1]);
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

    public function getLastId($post){
        $this->db->where('rek_jenis', $post['rek_jenis']);
        $this->db->order_by($this->table.".rek1_kode", "DESC");
        $hasil = $this->db->get($this->table)->result_array();
        $id = @$hasil[0]['rek1_kode']?$hasil[0]['rek1_kode']+1:1;
        return $id;
    }
    
    public function cekInput($post){
        //ruang filter

        // $query = $this->db->get($this->table);
        return true;
    }
    

}