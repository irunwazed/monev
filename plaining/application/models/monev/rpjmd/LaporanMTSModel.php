<?php

class LaporanMTSModel extends CI_Model
{

    public function __construct()
    {
        parent::__construct();
    }
    
    public function _getDataVisi($id_tb_rpjmd = null){
        return $this->db->get_where('tb_rpjmd', ['id_tb_rpjmd' => $id_tb_rpjmd])->result_array();
    }

    public function _getDataMisi($id_tb_rpjmd = null){
        return $this->db->get_where('tb_rpjmd_misi', ['id_tb_rpjmd' => $id_tb_rpjmd])->result_array();
    }

    public function _getDataTujuan($id_tb_rpjmd = null){
        return $this->db->get_where('tb_rpjmd_tujuan', ['id_tb_rpjmd' => $id_tb_rpjmd])->result_array();
    }

    public function _getDataSasaran($id_tb_rpjmd = null){
        return $this->db->get_where('tb_rpjmd_sasaran', ['id_tb_rpjmd' => $id_tb_rpjmd])->result_array();
    }

}