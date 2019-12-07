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


}