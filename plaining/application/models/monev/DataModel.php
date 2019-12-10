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

    public function getVisi($kode){
        $this->db->where("tb_rpjmd.id_tb_rpjmd", $kode);
        $data = $this->db->get("tb_rpjmd")->row();
        return $data;
    }

    public function getMisi($kode){
        $kode = explode("-", @$kode);
        $table = "tb_rpjmd_misi";
        $this->db->join('tb_rpjmd', 'tb_rpjmd.id_tb_rpjmd = '.$table.'.id_tb_rpjmd');

        $this->db->where($table.".id_tb_rpjmd", $_SESSION['rpjmd']);
        $this->db->where($table.".tb_rpjmd_misi_kode", $kode[0]);
        $data = $this->db->get($table)->row();
        return $data;
    }

    public function getTujuan($kode){
        $kode = explode("-", @$kode);
        $table = "tb_rpjmd_tujuan";
        $this->db->join('tb_rpjmd', 'tb_rpjmd.id_tb_rpjmd = '.$table.'.id_tb_rpjmd');
        $this->db->join('tb_rpjmd_misi', 'tb_rpjmd_misi.id_tb_rpjmd = '.$table.'.id_tb_rpjmd
                                    AND tb_rpjmd_misi.tb_rpjmd_misi_kode = '.$table.'.tb_rpjmd_misi_kode');

        $this->db->where($table.".id_tb_rpjmd", $_SESSION['rpjmd']);
        $this->db->where($table.".tb_rpjmd_misi_kode", $kode[0]);
        $this->db->where($table.".tb_rpjmd_tujuan_kode", $kode[1]);
        $data = $this->db->get($table)->row();
        return $data;
    }

    public function getSasaran($kode){
        $kode = explode("-", @$kode);
        $table = "tb_rpjmd_sasaran";
        $this->db->join('tb_rpjmd', 'tb_rpjmd.id_tb_rpjmd = '.$table.'.id_tb_rpjmd');
        $this->db->join('tb_rpjmd_misi', 'tb_rpjmd_misi.id_tb_rpjmd = '.$table.'.id_tb_rpjmd
                                    AND tb_rpjmd_misi.tb_rpjmd_misi_kode = '.$table.'.tb_rpjmd_misi_kode');
        $this->db->join('tb_rpjmd_tujuan', 'tb_rpjmd_tujuan.id_tb_rpjmd = '.$table.'.id_tb_rpjmd
                                    AND tb_rpjmd_tujuan.tb_rpjmd_misi_kode = '.$table.'.tb_rpjmd_misi_kode
                                    AND tb_rpjmd_tujuan.tb_rpjmd_tujuan_kode = '.$table.'.tb_rpjmd_tujuan_kode');

        $this->db->where($table.".id_tb_rpjmd", $_SESSION['rpjmd']);
        $this->db->where($table.".tb_rpjmd_misi_kode", $kode[0]);
        $this->db->where($table.".tb_rpjmd_tujuan_kode", $kode[1]);
        $this->db->where($table.".tb_rpjmd_sasaran_kode", $kode[2]);
        $data = $this->db->get($table)->row();
        return $data;
    }

    public function getProgram($kode){
        $kode = explode("-", @$kode);
        $table = "tb_rpjmd_program";
        $this->db->join('tb_rpjmd', 'tb_rpjmd.id_tb_rpjmd = '.$table.'.id_tb_rpjmd');
        $this->db->join('tb_rpjmd_misi', 'tb_rpjmd_misi.id_tb_rpjmd = '.$table.'.id_tb_rpjmd
                                    AND tb_rpjmd_misi.tb_rpjmd_misi_kode = '.$table.'.tb_rpjmd_misi_kode');
        $this->db->join('tb_rpjmd_tujuan', 'tb_rpjmd_tujuan.id_tb_rpjmd = '.$table.'.id_tb_rpjmd
                                    AND tb_rpjmd_tujuan.tb_rpjmd_misi_kode = '.$table.'.tb_rpjmd_misi_kode
                                    AND tb_rpjmd_tujuan.tb_rpjmd_tujuan_kode = '.$table.'.tb_rpjmd_tujuan_kode');
        $this->db->join('tb_rpjmd_sasaran', 'tb_rpjmd_sasaran.id_tb_rpjmd = '.$table.'.id_tb_rpjmd
                                    AND tb_rpjmd_sasaran.tb_rpjmd_misi_kode = '.$table.'.tb_rpjmd_misi_kode
                                    AND tb_rpjmd_sasaran.tb_rpjmd_tujuan_kode = '.$table.'.tb_rpjmd_tujuan_kode
                                    AND tb_rpjmd_sasaran.tb_rpjmd_sasaran_kode = '.$table.'.tb_rpjmd_sasaran_kode');

        $this->db->where($table.".id_tb_rpjmd", $_SESSION['rpjmd']);
        $this->db->where($table.".tb_rpjmd_misi_kode", $kode[0]);
        $this->db->where($table.".tb_rpjmd_tujuan_kode", $kode[1]);
        $this->db->where($table.".tb_rpjmd_sasaran_kode", $kode[2]);
        $this->db->where($table.".tb_rpjmd_program_kode", $kode[3]);
        $data = $this->db->get($table)->row();
        return $data;
    }

    public function getKegiatan($kode){
        $kode = explode("-", @$kode);
        $table = "tb_renstra_kegiatan";
        $this->db->join('tb_rpjmd', 'tb_rpjmd.id_tb_rpjmd = '.$table.'.id_tb_rpjmd');
        $this->db->join('tb_rpjmd_misi', 'tb_rpjmd_misi.id_tb_rpjmd = '.$table.'.id_tb_rpjmd
                                    AND tb_rpjmd_misi.tb_rpjmd_misi_kode = '.$table.'.tb_rpjmd_misi_kode');
        $this->db->join('tb_rpjmd_tujuan', 'tb_rpjmd_tujuan.id_tb_rpjmd = '.$table.'.id_tb_rpjmd
                                    AND tb_rpjmd_tujuan.tb_rpjmd_misi_kode = '.$table.'.tb_rpjmd_misi_kode
                                    AND tb_rpjmd_tujuan.tb_rpjmd_tujuan_kode = '.$table.'.tb_rpjmd_tujuan_kode');
        $this->db->join('tb_rpjmd_sasaran', 'tb_rpjmd_sasaran.id_tb_rpjmd = '.$table.'.id_tb_rpjmd
                                    AND tb_rpjmd_sasaran.tb_rpjmd_misi_kode = '.$table.'.tb_rpjmd_misi_kode
                                    AND tb_rpjmd_sasaran.tb_rpjmd_tujuan_kode = '.$table.'.tb_rpjmd_tujuan_kode
                                    AND tb_rpjmd_sasaran.tb_rpjmd_sasaran_kode = '.$table.'.tb_rpjmd_sasaran_kode');
        $this->db->join('tb_rpjmd_program', 'tb_rpjmd_program.id_tb_rpjmd = '.$table.'.id_tb_rpjmd
                                    AND tb_rpjmd_program.tb_rpjmd_misi_kode = '.$table.'.tb_rpjmd_misi_kode
                                    AND tb_rpjmd_program.tb_rpjmd_tujuan_kode = '.$table.'.tb_rpjmd_tujuan_kode
                                    AND tb_rpjmd_program.tb_rpjmd_sasaran_kode = '.$table.'.tb_rpjmd_sasaran_kode
                                    AND tb_rpjmd_program.tb_rpjmd_program_kode = '.$table.'.tb_rpjmd_program_kode');

        $this->db->join('tb_sub_unit', 'tb_sub_unit.tb_urusan_kode = '.$table.'.tb_urusan_kode
                                    AND tb_sub_unit.tb_bidang_kode = '.$table.'.tb_bidang_kode
                                    AND tb_sub_unit.tb_unit_kode = '.$table.'.tb_unit_kode
                                    AND tb_sub_unit.tb_sub_unit_kode = '.$table.'.tb_sub_unit_kode');

        $this->db->where($table.".id_tb_rpjmd", $_SESSION['rpjmd']);
        $this->db->where($table.".tb_rpjmd_misi_kode", $kode[0]);
        $this->db->where($table.".tb_rpjmd_tujuan_kode", $kode[1]);
        $this->db->where($table.".tb_rpjmd_sasaran_kode", $kode[2]);
        $this->db->where($table.".tb_rpjmd_program_kode", $kode[3]);
        $this->db->where($table.".tb_renstra_kegiatan_kode", $kode[4]);
        $data = $this->db->get($table)->row();
        return $data;
    }

}