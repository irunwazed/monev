<?php

class DataModel extends CI_Model
{
    public function __construct()
    {
        parent::__construct();
    }

    public function selectAllLra($post){
        $this->db->where("tb_urusan_kode", $post["tb_urusan_kode"]);
        $this->db->where("tb_bidang_kode", $post["tb_bidang_kode"]);
        $this->db->where("tb_unit_kode", $post["tb_unit_kode"]);
        $this->db->where("tb_sub_unit_kode", $post["tb_sub_unit_kode"]);
        $data = $this->db->get("tb_monev_lra")->result_array();
        return $data;
    }

    public function selectAllOpd(){
        $data = $this->db->get("tb_sub_unit")->result_array();
        return $data;
    }

    public function selectOneOpdByKode($kode){
        $kode = explode("-", $kode);

        
        $this->db->join('tb_urusan', 'tb_urusan.tb_urusan_kode = tb_sub_unit.tb_urusan_kode');
        $this->db->join('tb_bidang', 'tb_bidang.tb_urusan_kode = tb_sub_unit.tb_urusan_kode
                                    AND tb_bidang.tb_bidang_kode = tb_sub_unit.tb_bidang_kode');
        $this->db->join('tb_unit', 'tb_unit.tb_urusan_kode = tb_sub_unit.tb_urusan_kode
                                    AND tb_unit.tb_bidang_kode = tb_sub_unit.tb_bidang_kode
                                    AND tb_unit.tb_unit_kode = tb_sub_unit.tb_unit_kode');

        $this->db->where("tb_sub_unit.tb_urusan_kode", $kode[0]);
        $this->db->where("tb_sub_unit.tb_bidang_kode", $kode[1]);
        $this->db->where("tb_sub_unit.tb_unit_kode", $kode[2]);
        $this->db->where("tb_sub_unit.tb_sub_unit_kode", $kode[3]);
        $data = $this->db->get("tb_sub_unit")->row();
        return $data;
    }

    

    public function getRpjmdTahun(){
        $data = $this->db->get("tb_sub_unit")->result_array();
        return $data;
    }

    public function getLraOpd($opd, $tahun){
        
        $kode = explode("-", @$opd);
        $this->db->where('tb_urusan_kode', $kode[0]);
        $this->db->where('tb_bidang_kode', $kode[1]);
        $this->db->where('tb_unit_kode', $kode[2]);
        $this->db->where('tb_sub_unit_kode', $kode[3]);
        $this->db->where('tb_monev_lra_tahun', $tahun);
        
        $this->db->order_by("tb_monev_lra.tb_rekening1_kode", "ASC");
        $this->db->order_by("tb_monev_lra.tb_rekening2_kode", "ASC");
        $this->db->order_by("tb_monev_lra.program_kode", "ASC");
        $this->db->order_by("tb_monev_lra.kegiatan_kode", "ASC");
        $this->db->order_by("tb_monev_lra.tb_rekening3_kode", "ASC");
        $this->db->order_by("tb_monev_lra.tb_rekening4_kode", "ASC");
        $this->db->order_by("tb_monev_lra.tb_rekening5_kode", "ASC");

        $query = $this->db->get('tb_monev_lra')->result_array();
        return $query;
    }

}