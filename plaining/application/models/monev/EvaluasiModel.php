<?php

class EvaluasiModel extends CI_Model
{
    private $jumlah, $table;
    public function __construct()
    {
        parent::__construct();
        $this->jumlah = 20;
        $this->table = 'tb_monev_triwulan';
    }

    public function setQuery($post){

        $this->db->select("tb_monev_triwulan.*, tb_sub_unit.tb_sub_unit_nama, tb_renstra_kegiatan.tb_renstra_kegiatan_nama");

        $kode = explode("-", $post['kode']);
        $this->db->where("tb_monev_triwulan.tb_rpjmd_misi_kode", $kode[0]);
        $this->db->where("tb_monev_triwulan.tb_rpjmd_tujuan_kode", $kode[1]);
        $this->db->where("tb_monev_triwulan.tb_rpjmd_sasaran_kode", $kode[2]);
        $this->db->where("tb_monev_triwulan.tb_rpjmd_program_kode", $kode[3]);
        $this->db->where("tb_monev_triwulan.tb_rpjmd_kegiatan_kode", $kode[4]);

        $opd = explode("-", $post['opd']);
        $this->db->where("tb_monev_triwulan.tb_urusan_kode", $opd[0]);
        $this->db->where("tb_monev_triwulan.tb_bidang_kode", $opd[1]);
        $this->db->where("tb_monev_triwulan.tb_bidang_kode", $opd[2]);
        $this->db->where("tb_monev_triwulan.tb_sub_unit_kode", $opd[3]);

        
        $this->db->join('tb_sub_unit', 'tb_sub_unit.tb_urusan_kode = tb_monev_triwulan.tb_urusan_kode
                                    AND tb_sub_unit.tb_bidang_kode = tb_monev_triwulan.tb_bidang_kode
                                    AND tb_sub_unit.tb_unit_kode = tb_monev_triwulan.tb_unit_kode
                                    AND tb_sub_unit.tb_sub_unit_kode = tb_monev_triwulan.tb_sub_unit_kode');
                                    
        $this->db->join('tb_renstra_kegiatan', 'tb_renstra_kegiatan.id_tb_rpjmd = tb_monev_triwulan.id_tb_rpjmd
                                            AND tb_renstra_kegiatan.tb_rpjmd_misi_kode = tb_monev_triwulan.tb_rpjmd_misi_kode
                                            AND tb_renstra_kegiatan.tb_rpjmd_tujuan_kode = tb_monev_triwulan.tb_rpjmd_tujuan_kode
                                            AND tb_renstra_kegiatan.tb_rpjmd_sasaran_kode = tb_monev_triwulan.tb_rpjmd_sasaran_kode
                                            AND tb_renstra_kegiatan.tb_rpjmd_program_kode = tb_monev_triwulan.tb_rpjmd_program_kode
                                            AND tb_renstra_kegiatan.tb_renstra_kegiatan_kode = tb_monev_triwulan.tb_rpjmd_kegiatan_kode', 'left');

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
            $kode = explode("-", $post['kode']);
            $opd = explode("-", $post['opd']);

            $triwulan = $post['triwulan'];
            $data = array(
                'id_tb_rpjmd' => $_SESSION['rpjmd'],
                'tb_rpjmd_misi_kode' => $kode[0],
                'tb_rpjmd_tujuan_kode' => $kode[1],
                'tb_rpjmd_sasaran_kode' => $kode[2],
                'tb_rpjmd_program_kode' => $kode[3],
                'tb_rpjmd_kegiatan_kode' => $kode[4],
                'tb_urusan_kode' => $opd[0],
                'tb_bidang_kode' => $opd[1],
                'tb_unit_kode' => $opd[2],
                'tb_sub_unit_kode' => $opd[3],
                'tb_monev_triwulan_tahun' => $post['tahun'],
            );

            $this->db->where($data);
            $dataGet = $this->db->get($this->table, $data)->result_array();
            
            if(count($dataGet) > 0){
                
                $this->db->where('id_tb_monev_triwulan', $dataGet[0]['id_tb_monev_triwulan']);

                $data2['tb_monev_triwulan_target'.$triwulan] = $post['target'];
                $data2['tb_monev_triwulan_rupiah'.$triwulan] = $post['realisasi'];
                
                $status = $this->db->update($this->table, $data2);
            }else{
                $data['tb_monev_triwulan_target'.$triwulan] = $post['target'];
                $data['tb_monev_triwulan_rupiah'.$triwulan] = $post['realisasi'];
    
                $status = $this->db->insert($this->table, $data);
            }


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
            $opd = explode("-", $post['opd']);

            $triwulan = $post['triwulan'];
            
            $data['tb_monev_triwulan_target'.$triwulan] = $post['target'];
            $data['tb_monev_triwulan_rupiah'.$triwulan] = $post['realisasi'];


            $this->db->where('id_tb_monev_triwulan', $post['id_tb_monev_triwulan']);
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
            $this->db->where('id_tb_monev_triwulan', $post['kode']);
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