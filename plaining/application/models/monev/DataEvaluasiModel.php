<?php

class DataEvaluasiModel extends CI_Model
{
    public function __construct()
    {
        parent::__construct();
    }

    public function selectKegiatan(){

        
        $table = "tb_renstra_kegiatan";

        $this->db->join('tb_rpjmd', 'tb_rpjmd.id_tb_rpjmd = '.$table.'.id_tb_rpjmd');
        
        $this->db->join('tb_rpjmd_sasaran', 'tb_rpjmd_sasaran.id_tb_rpjmd = '.$table.'.id_tb_rpjmd
                                    AND tb_rpjmd_sasaran.tb_rpjmd_misi_kode = '.$table.'.tb_rpjmd_misi_kode
                                    AND tb_rpjmd_sasaran.tb_rpjmd_tujuan_kode = '.$table.'.tb_rpjmd_tujuan_kode
                                    AND tb_rpjmd_sasaran.tb_rpjmd_sasaran_kode = '.$table.'.tb_rpjmd_sasaran_kode', 'left');
        
        $this->db->join('tb_rpjmd_program', 'tb_rpjmd_program.id_tb_rpjmd = '.$table.'.id_tb_rpjmd
                                    AND tb_rpjmd_program.tb_rpjmd_misi_kode = '.$table.'.tb_rpjmd_misi_kode
                                    AND tb_rpjmd_program.tb_rpjmd_tujuan_kode = '.$table.'.tb_rpjmd_tujuan_kode
                                    AND tb_rpjmd_program.tb_rpjmd_sasaran_kode = '.$table.'.tb_rpjmd_sasaran_kode
                                    AND tb_rpjmd_program.tb_rpjmd_program_kode = '.$table.'.tb_rpjmd_program_kode', 'left');

        $this->db->join('tb_rpjmd_program_indikator', 'tb_rpjmd_program_indikator.id_tb_rpjmd = '.$table.'.id_tb_rpjmd
                                    AND tb_rpjmd_program_indikator.tb_rpjmd_misi_kode = '.$table.'.tb_rpjmd_misi_kode
                                    AND tb_rpjmd_program_indikator.tb_rpjmd_tujuan_kode = '.$table.'.tb_rpjmd_tujuan_kode
                                    AND tb_rpjmd_program_indikator.tb_rpjmd_sasaran_kode = '.$table.'.tb_rpjmd_sasaran_kode
                                    AND tb_rpjmd_program_indikator.tb_rpjmd_program_kode = '.$table.'.tb_rpjmd_program_kode', 'left');
                                    
        // $this->db->join('tb_monev_triwulan', 'tb_monev_triwulan.id_tb_rpjmd = '.$table.'.id_tb_rpjmd
        //                             AND tb_monev_triwulan.tb_rpjmd_misi_kode = '.$table.'.tb_rpjmd_misi_kode
        //                             AND tb_monev_triwulan.tb_rpjmd_tujuan_kode = '.$table.'.tb_rpjmd_tujuan_kode
        //                             AND tb_monev_triwulan.tb_rpjmd_sasaran_kode = '.$table.'.tb_rpjmd_sasaran_kode
        //                             AND tb_monev_triwulan.tb_rpjmd_program_kode = '.$table.'.tb_rpjmd_program_kode
        //                             AND tb_monev_triwulan.tb_rpjmd_kegiatan_kode = '.$table.'.tb_renstra_kegiatan_kode
        //                             AND tb_monev_triwulan.tb_urusan_kode = '.$table.'.tb_urusan_kode
        //                             AND tb_monev_triwulan.tb_bidang_kode = '.$table.'.tb_bidang_kode
        //                             AND tb_monev_triwulan.tb_unit_kode = '.$table.'.tb_unit_kode
        //                             AND tb_monev_triwulan.tb_sub_unit_kode = '.$table.'.tb_sub_unit_kode
        //                             AND tb_monev_triwulan.tb_monev_triwulan_tahun = 1', 'left');

        $this->db->join('tb_urusan', 'tb_urusan.tb_urusan_kode = '.$table.'.tb_urusan_kode', 'left');

        $this->db->join('tb_bidang', 'tb_bidang.tb_urusan_kode = '.$table.'.tb_urusan_kode
                                    AND tb_bidang.tb_bidang_kode = '.$table.'.tb_bidang_kode', 'left');

        $this->db->join('tb_sub_unit', 'tb_sub_unit.tb_urusan_kode = '.$table.'.tb_urusan_kode
                                    AND tb_sub_unit.tb_bidang_kode = '.$table.'.tb_bidang_kode
                                    AND tb_sub_unit.tb_unit_kode = '.$table.'.tb_unit_kode
                                    AND tb_sub_unit.tb_sub_unit_kode = '.$table.'.tb_sub_unit_kode', 'left');

        $this->db->order_by($table.".tb_urusan_kode", "ASC");
        $this->db->order_by($table.".tb_bidang_kode", "ASC");
        $this->db->order_by($table.".tb_unit_kode", "ASC");
        $this->db->order_by($table.".tb_sub_unit_kode", "ASC");
        $this->db->order_by($table.".id_tb_rpjmd", "ASC");
        $this->db->order_by($table.".tb_rpjmd_misi_kode", "ASC");
        $this->db->order_by($table.".tb_rpjmd_tujuan_kode", "ASC");
        $this->db->order_by($table.".tb_rpjmd_sasaran_kode", "ASC");
        $this->db->order_by($table.".tb_rpjmd_program_kode", "ASC");
        $this->db->order_by($table.".tb_renstra_kegiatan_kode", "ASC");

        $this->db->where("tb_rpjmd.id_tb_rpjmd ", $_SESSION['rpjmd']);
        // $this->db->where("tb_monev_triwulan.tb_monev_triwulan_tahun", $tahunKe);
        $data = $this->db->get($table)->result_array();
        return $data;

    }

    public function selectKegiatanEvaluasi($data){

        $table = "tb_monev_triwulan";

        $where = array(
            "id_tb_rpjmd" => $data["id_tb_rpjmd"],
            "tb_rpjmd_misi_kode" => $data["tb_rpjmd_misi_kode"],
            "tb_rpjmd_tujuan_kode" => $data["tb_rpjmd_tujuan_kode"],
            "tb_rpjmd_sasaran_kode" => $data["tb_rpjmd_sasaran_kode"],
            "tb_rpjmd_program_kode" => $data["tb_rpjmd_program_kode"],
            "tb_rpjmd_kegiatan_kode" => $data["tb_renstra_kegiatan_kode"],
            "tb_urusan_kode" => $data["tb_urusan_kode"],
            "tb_bidang_kode" => $data["tb_bidang_kode"],
            "tb_unit_kode" => $data["tb_unit_kode"],
            "tb_sub_unit_kode" => $data["tb_sub_unit_kode"],
        );
        
        $this->db->order_by($table.".tb_monev_triwulan_tahun", "ASC");

        $this->db->where($where);

        $data = $this->db->get($table)->result_array();
        return $data;
    }

}