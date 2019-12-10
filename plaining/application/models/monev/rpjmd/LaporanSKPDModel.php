<?php

class LaporanSKPDModel extends CI_Model
{

    public function __construct()
    {
        parent::__construct();
    }
    
    public function _getDataRPJMD(){
        return $this->db->get_where('tb_rpjmd', ['id_tb_rpjmd' => @$_SESSION['rpjmd']])->result_array();
    }

    public function _getDataOPD($id = null){
        if($id == null){
            $this->db->join('tb_urusan', 'tb_urusan.tb_urusan_kode = tb_sub_unit.tb_urusan_kode');
            $this->db->join('tb_bidang', 'tb_bidang.tb_bidang_kode = tb_sub_unit.tb_bidang_kode
                                    AND tb_bidang.tb_urusan_kode = tb_sub_unit.tb_urusan_kode');
            $this->db->join('tb_unit', 'tb_unit.tb_unit_kode = tb_sub_unit.tb_unit_kode
                                    AND tb_unit.tb_bidang_kode = tb_sub_unit.tb_bidang_kode
                                    AND tb_unit.tb_urusan_kode = tb_sub_unit.tb_urusan_kode');
            return $this->db->get('tb_sub_unit')->result_array();
        }else{
            $id = explode("-", $id);
            $this->db->join('tb_urusan', 'tb_urusan.tb_urusan_kode = tb_sub_unit.tb_urusan_kode');
            $this->db->join('tb_bidang', 'tb_bidang.tb_bidang_kode = tb_sub_unit.tb_bidang_kode
                                    AND tb_bidang.tb_urusan_kode = tb_sub_unit.tb_urusan_kode');
            $this->db->join('tb_unit', 'tb_unit.tb_unit_kode = tb_sub_unit.tb_unit_kode
                                    AND tb_unit.tb_bidang_kode = tb_sub_unit.tb_bidang_kode
                                    AND tb_unit.tb_urusan_kode = tb_sub_unit.tb_urusan_kode');
                                    
            $this->db->where("tb_sub_unit.tb_urusan_kode", $id[0]);
            $this->db->where("tb_sub_unit.tb_bidang_kode", $id[1]);
            $this->db->where("tb_sub_unit.tb_unit_kode", $id[2]);
            $this->db->where("tb_sub_unit.tb_sub_unit_kode", $id[3]);
            return $this->db->get('tb_sub_unit')->result_array();
        }
    }

    public function _getDataUrusan(){
        return $this->db->get('tb_urusan')->result_array();
    }

    public function _getDataBidang(){
        $this->db->join('tb_urusan', 'tb_urusan.tb_urusan_kode = tb_bidang.tb_urusan_kode');
        return $this->db->get('tb_bidang')->result_array();
    }

    public function _getDataProgram(){
        $this->db->join('tb_rpjmd', 'tb_rpjmd.id_tb_rpjmd = tb_rpjmd_program.id_tb_rpjmd');
        $this->db->join('tb_rpjmd_misi', 'tb_rpjmd_misi.id_tb_rpjmd = tb_rpjmd_program.id_tb_rpjmd
                                    AND tb_rpjmd_misi.tb_rpjmd_misi_kode = tb_rpjmd_program.tb_rpjmd_misi_kode');
        $this->db->join('tb_rpjmd_tujuan', 'tb_rpjmd_tujuan.id_tb_rpjmd = tb_rpjmd_program.id_tb_rpjmd
                                    AND tb_rpjmd_tujuan.tb_rpjmd_misi_kode = tb_rpjmd_program.tb_rpjmd_misi_kode
                                    AND tb_rpjmd_tujuan.tb_rpjmd_tujuan_kode = tb_rpjmd_program.tb_rpjmd_tujuan_kode');
        $this->db->join('tb_rpjmd_sasaran', 'tb_rpjmd_sasaran.id_tb_rpjmd = tb_rpjmd_program.id_tb_rpjmd
                                    AND tb_rpjmd_sasaran.tb_rpjmd_misi_kode = tb_rpjmd_program.tb_rpjmd_misi_kode
                                    AND tb_rpjmd_sasaran.tb_rpjmd_tujuan_kode = tb_rpjmd_program.tb_rpjmd_tujuan_kode
                                    AND tb_rpjmd_sasaran.tb_rpjmd_sasaran_kode = tb_rpjmd_program.tb_rpjmd_sasaran_kode');
        $this->db->join('tb_rpjmd_opd', 'tb_rpjmd_opd.tb_rpjmd_program_kode = tb_rpjmd_program.tb_rpjmd_program_kode
                                    AND tb_rpjmd_opd.tb_rpjmd_misi_kode = tb_rpjmd_program.tb_rpjmd_misi_kode
                                    AND tb_rpjmd_opd.tb_rpjmd_tujuan_kode = tb_rpjmd_program.tb_rpjmd_tujuan_kode
                                    AND tb_rpjmd_opd.tb_rpjmd_sasaran_kode = tb_rpjmd_program.tb_rpjmd_sasaran_kode');
        $this->db->join('tb_rpjmd_program_indikator', 'tb_rpjmd_program_indikator.tb_rpjmd_program_kode = tb_rpjmd_program.tb_rpjmd_program_kode
                                    AND tb_rpjmd_program_indikator.tb_rpjmd_misi_kode = tb_rpjmd_program.tb_rpjmd_misi_kode
                                    AND tb_rpjmd_program_indikator.tb_rpjmd_tujuan_kode = tb_rpjmd_program.tb_rpjmd_tujuan_kode
                                    AND tb_rpjmd_program_indikator.tb_rpjmd_sasaran_kode = tb_rpjmd_program.tb_rpjmd_sasaran_kode');
        $this->db->join('tb_satuan', 'tb_satuan.id_tb_satuan = tb_rpjmd_program_indikator.id_tb_satuan');
        
        return $this->db->get('tb_rpjmd_program')->result_array();
    }

    public function _getDataKegiatan(){
        $this->db->join('tb_rpjmd', 'tb_rpjmd.id_tb_rpjmd = tb_renstra_kegiatan.id_tb_rpjmd');
        $this->db->join('tb_urusan', 'tb_urusan.tb_urusan_kode = tb_renstra_kegiatan.tb_urusan_kode');
        $this->db->join('tb_bidang', 'tb_bidang.tb_bidang_kode = tb_renstra_kegiatan.tb_bidang_kode
                                    AND tb_bidang.tb_urusan_kode = tb_renstra_kegiatan.tb_urusan_kode');
        $this->db->join('tb_unit', 'tb_unit.tb_unit_kode = tb_renstra_kegiatan.tb_unit_kode
                                    AND tb_unit.tb_bidang_kode = tb_renstra_kegiatan.tb_bidang_kode
                                    AND tb_unit.tb_urusan_kode = tb_renstra_kegiatan.tb_urusan_kode');
        $this->db->join('tb_sub_unit', 'tb_sub_unit.tb_urusan_kode = tb_renstra_kegiatan.tb_urusan_kode
                                    AND tb_sub_unit.tb_bidang_kode = tb_renstra_kegiatan.tb_bidang_kode
                                    AND tb_sub_unit.tb_unit_kode = tb_renstra_kegiatan.tb_unit_kode
                                    AND tb_sub_unit.tb_sub_unit_kode = tb_renstra_kegiatan.tb_sub_unit_kode');
        $this->db->join('tb_rpjmd_misi', 'tb_rpjmd_misi.id_tb_rpjmd = tb_renstra_kegiatan.id_tb_rpjmd
                                    AND tb_rpjmd_misi.tb_rpjmd_misi_kode = tb_renstra_kegiatan.tb_rpjmd_misi_kode');
        $this->db->join('tb_rpjmd_tujuan', 'tb_rpjmd_tujuan.id_tb_rpjmd = tb_renstra_kegiatan.id_tb_rpjmd
                                    AND tb_rpjmd_tujuan.tb_rpjmd_misi_kode = tb_renstra_kegiatan.tb_rpjmd_misi_kode
                                    AND tb_rpjmd_tujuan.tb_rpjmd_tujuan_kode = tb_renstra_kegiatan.tb_rpjmd_tujuan_kode');
        $this->db->join('tb_rpjmd_sasaran', 'tb_rpjmd_sasaran.id_tb_rpjmd = tb_renstra_kegiatan.id_tb_rpjmd
                                    AND tb_rpjmd_sasaran.tb_rpjmd_misi_kode = tb_renstra_kegiatan.tb_rpjmd_misi_kode
                                    AND tb_rpjmd_sasaran.tb_rpjmd_tujuan_kode = tb_renstra_kegiatan.tb_rpjmd_tujuan_kode
                                    AND tb_rpjmd_sasaran.tb_rpjmd_sasaran_kode = tb_renstra_kegiatan.tb_rpjmd_sasaran_kode');
        $this->db->join('tb_rpjmd_program', 'tb_rpjmd_program.id_tb_rpjmd = tb_renstra_kegiatan.id_tb_rpjmd
                                    AND tb_rpjmd_program.tb_rpjmd_misi_kode = tb_renstra_kegiatan.tb_rpjmd_misi_kode
                                    AND tb_rpjmd_program.tb_rpjmd_tujuan_kode = tb_renstra_kegiatan.tb_rpjmd_tujuan_kode
                                    AND tb_rpjmd_program.tb_rpjmd_sasaran_kode = tb_renstra_kegiatan.tb_rpjmd_sasaran_kode
                                    AND tb_rpjmd_program.tb_rpjmd_program_kode = tb_renstra_kegiatan.tb_rpjmd_program_kode');
        $this->db->join('tb_monev_triwulan', 'tb_monev_triwulan.id_tb_rpjmd = tb_renstra_kegiatan.id_tb_rpjmd
                                    AND tb_monev_triwulan.tb_rpjmd_misi_kode = tb_renstra_kegiatan.tb_rpjmd_misi_kode
                                    AND tb_monev_triwulan.tb_rpjmd_tujuan_kode = tb_renstra_kegiatan.tb_rpjmd_tujuan_kode
                                    AND tb_monev_triwulan.tb_rpjmd_sasaran_kode = tb_renstra_kegiatan.tb_rpjmd_sasaran_kode
                                    AND tb_monev_triwulan.tb_rpjmd_program_kode = tb_renstra_kegiatan.tb_rpjmd_program_kode
                                    AND tb_monev_triwulan.tb_bidang_kode = tb_renstra_kegiatan.tb_bidang_kode
                                    AND tb_monev_triwulan.tb_urusan_kode = tb_renstra_kegiatan.tb_urusan_kode
                                    AND tb_monev_triwulan.tb_unit_kode = tb_renstra_kegiatan.tb_unit_kode
                                    AND tb_monev_triwulan.tb_sub_unit_kode = tb_renstra_kegiatan.tb_sub_unit_kode');
        $this->db->join('tb_satuan', 'tb_satuan.id_tb_satuan = tb_renstra_kegiatan.id_tb_satuan');

        return $this->db->get('tb_renstra_kegiatan')->result_array();
    }

    public function _getDataTriwulan(){
        $this->db->join('tb_rpjmd', 'tb_rpjmd.id_tb_rpjmd = tb_monev_triwulan.id_tb_rpjmd');
        $this->db->join('tb_urusan', 'tb_urusan.tb_urusan_kode = tb_monev_triwulan.tb_urusan_kode');
        $this->db->join('tb_bidang', 'tb_bidang.tb_bidang_kode = tb_monev_triwulan.tb_bidang_kode
                                    AND tb_bidang.tb_urusan_kode = tb_monev_triwulan.tb_urusan_kode');
        $this->db->join('tb_unit', 'tb_unit.tb_unit_kode = tb_monev_triwulan.tb_unit_kode
                                    AND tb_unit.tb_bidang_kode = tb_monev_triwulan.tb_bidang_kode
                                    AND tb_unit.tb_urusan_kode = tb_monev_triwulan.tb_urusan_kode');
        $this->db->join('tb_sub_unit', 'tb_sub_unit.tb_urusan_kode = tb_monev_triwulan.tb_urusan_kode
                                    AND tb_sub_unit.tb_bidang_kode = tb_monev_triwulan.tb_bidang_kode
                                    AND tb_sub_unit.tb_unit_kode = tb_monev_triwulan.tb_unit_kode
                                    AND tb_sub_unit.tb_sub_unit_kode = tb_monev_triwulan.tb_sub_unit_kode');
        $this->db->join('tb_rpjmd_misi', 'tb_rpjmd_misi.id_tb_rpjmd = tb_monev_triwulan.id_tb_rpjmd
                                    AND tb_rpjmd_misi.tb_rpjmd_misi_kode = tb_monev_triwulan.tb_rpjmd_misi_kode');
        $this->db->join('tb_rpjmd_tujuan', 'tb_rpjmd_tujuan.id_tb_rpjmd = tb_monev_triwulan.id_tb_rpjmd
                                    AND tb_rpjmd_tujuan.tb_rpjmd_misi_kode = tb_monev_triwulan.tb_rpjmd_misi_kode
                                    AND tb_rpjmd_tujuan.tb_rpjmd_tujuan_kode = tb_monev_triwulan.tb_rpjmd_tujuan_kode');
        $this->db->join('tb_rpjmd_sasaran', 'tb_rpjmd_sasaran.id_tb_rpjmd = tb_monev_triwulan.id_tb_rpjmd
                                    AND tb_rpjmd_sasaran.tb_rpjmd_misi_kode = tb_monev_triwulan.tb_rpjmd_misi_kode
                                    AND tb_rpjmd_sasaran.tb_rpjmd_tujuan_kode = tb_monev_triwulan.tb_rpjmd_tujuan_kode
                                    AND tb_rpjmd_sasaran.tb_rpjmd_sasaran_kode = tb_monev_triwulan.tb_rpjmd_sasaran_kode');
        $this->db->join('tb_rpjmd_program', 'tb_rpjmd_program.id_tb_rpjmd = tb_monev_triwulan.id_tb_rpjmd
                                    AND tb_rpjmd_program.tb_rpjmd_misi_kode = tb_monev_triwulan.tb_rpjmd_misi_kode
                                    AND tb_rpjmd_program.tb_rpjmd_tujuan_kode = tb_monev_triwulan.tb_rpjmd_tujuan_kode
                                    AND tb_rpjmd_program.tb_rpjmd_sasaran_kode = tb_monev_triwulan.tb_rpjmd_sasaran_kode
                                    AND tb_rpjmd_program.tb_rpjmd_program_kode = tb_monev_triwulan.tb_rpjmd_program_kode');
        // $this->db->join('tb_renstra_kegiatan', 'tb_renstra_kegiatan.id_tb_rpjmd = tb_monev_triwulan.id_tb_rpjmd
        //                             AND tb_renstra_kegiatan.tb_urusan_kode = tb_monev_triwulan.tb_urusan_kode
        //                             AND tb_renstra_kegiatan.tb_bidang_kode = tb_monev_triwulan.tb_bidang_kode
        //                             AND tb_renstra_kegiatan.tb_unit_kode = tb_monev_triwulan.tb_unit_kode
        //                             AND tb_renstra_kegiatan.tb_sub_unit_kode = tb_monev_triwulan.tb_sub_unit_kode
        //                             AND tb_renstra_kegiatan.tb_rpjmd_misi_kode = tb_monev_triwulan.tb_rpjmd_misi_kode
        //                             AND tb_renstra_kegiatan.tb_rpjmd_tujuan_kode = tb_monev_triwulan.tb_rpjmd_tujuan_kode
        //                             AND tb_renstra_kegiatan.tb_rpjmd_sasaran_kode = tb_monev_triwulan.tb_rpjmd_sasaran_kode
        //                             AND tb_renstra_kegiatan.tb_renstra_kegiatan_kode = tb_monev_triwulan.tb_rpjmd_kegiatan_kode');
        // $this->db->join('tb_satuan', 'tb_satuan.id_tb_satuan = tb_monev_triwulan.id_tb_satuan');

        return $this->db->get('tb_monev_triwulan')->result_array();
    }

}