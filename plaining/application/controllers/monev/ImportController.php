<?php
if (!defined('BASEPATH')) exit('No direct script access allowed');

class ImportController extends CI_Controller {
    
    private $data, $index, $no_kk, $hapus;
    public function __construct() {
        parent::__construct();
        $this->index = 1;
        $this->hapus = true;
    } 
    
    public function viewImport(){
        echo '<form action="importRek" method="POST"  enctype="multipart/form-data">
            <input type="file" name="file" />
            <select  name="table">
                <option>tb_urusan</option>
                <option>tb_fungsi</option>
                <option>tb_bidang</option>
                <option>tb_unit</option>
                <option>tb_sub_unit</option>
            </select>
            <input type="submit"  />
            </form>';
    }

    public function tb_rpjmd($set, $table = null){
        $kode = (string)$set[0];
        $kode = explode(".", $kode);
        $post = $this->input->post();


        // if($this->hapus){
        //     // delete
        //     $this->db->where('tb_monev_lra_tahun', $this->data['tb_monev_lra_tahun']);
        //     $this->db->where('tb_urusan_kode', $post['tb_urusan_kode']);
        //     $this->db->where('tb_bidang_kode', $post['tb_bidang_kode']);
        //     $this->db->where('tb_unit_kode', $post['tb_unit_kode']);
        //     $this->db->where('tb_sub_unit_kode', $post['tb_sub_unit_kode']);
        //     $status = $this->db->delete($table);
        // }
        $this->data = array();
        
        if(is_numeric($kode[0])){
            
            
            if(count($kode) == 1){
                $this->data['id_tb_rpjmd'] = 1;
                $this->data['tb_rpjmd_misi_kode'] = $kode[0];
                $this->data['tb_rpjmd_misi_nama'] = (string)$set[1];
                
                $this->db->insert('tb_rpjmd_misi', $this->data);

            }else if(count($kode) == 2){
                print_r($kode);
                $this->data['id_tb_rpjmd'] = 1;
                $this->data['tb_rpjmd_misi_kode'] = $kode[0];
                $this->data['tb_rpjmd_tujuan_kode'] = $kode[1];
                $this->data['tb_rpjmd_tujuan_nama'] = (string)$set[1];
                
                $this->db->insert('tb_rpjmd_tujuan', $this->data);
            }else if(count($kode) == 3){
                $this->data['id_tb_rpjmd'] = 1;
                $this->data['tb_rpjmd_misi_kode'] = $kode[0];
                $this->data['tb_rpjmd_tujuan_kode'] = $kode[1];
                $this->data['tb_rpjmd_sasaran_kode'] = $kode[2];
                $this->data['tb_rpjmd_sasaran_nama'] = (string)$set[1];
                $this->data['tb_rpjmd_sasaran_indikator'] = (string)$set[2];
                
                $this->db->insert('tb_rpjmd_sasaran', $this->data);
            }else if(count($kode) == 4){




                $this->data['id_tb_rpjmd'] = 1;
                $this->data['tb_rpjmd_misi_kode'] = $kode[0];
                $this->data['tb_rpjmd_tujuan_kode'] = $kode[1];
                $this->data['tb_rpjmd_sasaran_kode'] = $kode[2];
                $this->data['tb_rpjmd_program_kode'] = $kode[3];
                $this->data['tb_rpjmd_program_nama'] = (string)$set[1];
                $this->data['tb_rpjmd_program_pagu_th1'] = (string)$set[9];
                $this->data['tb_rpjmd_program_pagu_th2'] = (string)$set[11];
                $this->data['tb_rpjmd_program_pagu_th3'] = (string)$set[13];
                $this->data['tb_rpjmd_program_pagu_th4'] = (string)$set[15];
                $this->data['tb_rpjmd_program_pagu_th5'] = (string)$set[17];
                $this->data['id_tb_satuan'] = (string)$set[5];

                $this->db->insert('tb_rpjmd_program', $this->data);

                $this->data = array();

                $this->data['id_tb_rpjmd'] = 1;
                $this->data['tb_rpjmd_misi_kode'] = $kode[0];
                $this->data['tb_rpjmd_tujuan_kode'] = $kode[1];
                $this->data['tb_rpjmd_sasaran_kode'] = $kode[2];
                $this->data['tb_rpjmd_program_kode'] = $kode[3];
                $this->data['tb_rpjmd_program_indikator_kode'] = 1;
                $this->data['tb_rpjmd_program_indikator_ket'] = (string)$set[1];
                $this->data['tb_rpjmd_program_indikator_target_th1'] = (string)$set[8];
                $this->data['tb_rpjmd_program_indikator_target_th2'] = (string)$set[10];
                $this->data['tb_rpjmd_program_indikator_target_th3'] = (string)$set[12];
                $this->data['tb_rpjmd_program_indikator_target_th4'] = (string)$set[14];
                $this->data['tb_rpjmd_program_indikator_target_th5'] = (string)$set[16];
                $this->data['id_tb_satuan'] = (string)$set[5];

                $this->db->insert('tb_rpjmd_program_indikator', $this->data);
            }else if(count($kode) == 5){

                
                $kodeOPD = explode(".", (string)$set[3]);

                $this->data['id_tb_rpjmd'] = 1;
                $this->data['tb_rpjmd_misi_kode'] = $kode[0];
                $this->data['tb_rpjmd_tujuan_kode'] = $kode[1];
                $this->data['tb_rpjmd_sasaran_kode'] = $kode[2];
                $this->data['tb_rpjmd_program_kode'] = $kode[3];
                $this->data['tb_urusan_kode'] = $kodeOPD[0];
                $this->data['tb_bidang_kode'] = $kodeOPD[1];
                $this->data['tb_unit_kode'] = $kodeOPD[2];
                $this->data['tb_sub_unit_kode'] = $kodeOPD[3];

                $this->db->insert('tb_rpjmd_opd', $this->data);

                $this->data = array();

                $this->data['id_tb_rpjmd'] = 1;
                $this->data['tb_rpjmd_misi_kode'] = $kode[0];
                $this->data['tb_rpjmd_tujuan_kode'] = $kode[1];
                $this->data['tb_rpjmd_sasaran_kode'] = $kode[2];
                $this->data['tb_rpjmd_program_kode'] = $kode[3];
                $this->data['tb_renstra_kegiatan_kode'] = $kode[4];
                $this->data['tb_urusan_kode'] = $kodeOPD[0];
                $this->data['tb_bidang_kode'] = $kodeOPD[1];
                $this->data['tb_unit_kode'] = $kodeOPD[2];
                $this->data['tb_sub_unit_kode'] = $kodeOPD[3];
                $this->data['tb_renstra_kegiatan_nama'] = (string)$set[1];
                $this->data['tb_renstra_kegiatan_indikator'] = (string)$set[1];
                $this->data['tb_renstra_kegiatan_awal'] = (string)$set[7];
                $this->data['tb_renstra_kegiatan_target1'] = (string)$set[8];
                $this->data['tb_renstra_kegiatan_anggaran1'] = (string)$set[9];
                $this->data['tb_renstra_kegiatan_target2'] = (string)$set[10];
                $this->data['tb_renstra_kegiatan_anggaran2'] = (string)$set[11];
                $this->data['tb_renstra_kegiatan_target3'] = (string)$set[12];
                $this->data['tb_renstra_kegiatan_anggaran3'] = (string)$set[13];
                $this->data['tb_renstra_kegiatan_target4'] = (string)$set[14];
                $this->data['tb_renstra_kegiatan_anggaran4'] = (string)$set[15];
                $this->data['tb_renstra_kegiatan_target5'] = (string)$set[16];
                $this->data['tb_renstra_kegiatan_anggaran5'] = (string)$set[17];
                $this->data['tb_renstra_kegiatan_lokasi'] = (string)$set[20];
                $this->data['id_tb_satuan'] = (string)$set[5];

                $this->db->insert('tb_renstra_kegiatan', $this->data);
            }


            echo "<pre>";
            print_r($this->data);
            echo "</pre>";
        }
    }

    public function tb_monev_lra($set, $table = null){
        $kode = (string)$set[0];
        $kode = explode(".", $kode);
        $post = $this->input->post();
        if(@$post['opd']){
            $kodeOpd = explode("-", $post['opd']);
            $post = array(
                "tb_urusan_kode" => $kodeOpd[0],
                "tb_bidang_kode" => $kodeOpd[1],
                "tb_unit_kode" => $kodeOpd[2],
                "tb_sub_unit_kode" => $kodeOpd[3],
            );
        }else{
            $post = array(
                "tb_urusan_kode" => 1,
                "tb_bidang_kode" => 1,
                "tb_unit_kode" => 1,
                "tb_sub_unit_kode" => 1,
            );
        }

        $this->data['tb_monev_lra_tahun'] = @$post['tahun']?$post['tahun']:2019;

        if($this->hapus){
            // delete
            $this->db->where('tb_monev_lra_tahun', $this->data['tb_monev_lra_tahun']);
            $this->db->where('tb_urusan_kode', $post['tb_urusan_kode']);
            $this->db->where('tb_bidang_kode', $post['tb_bidang_kode']);
            $this->db->where('tb_unit_kode', $post['tb_unit_kode']);
            $this->db->where('tb_sub_unit_kode', $post['tb_sub_unit_kode']);
            $status = $this->db->delete($table);

        }
        
        if((int)$kode[0] == 5){
            $rek = 0;
            $jenis = 1;
            $langsung = true;
            $this->data['tb_rekening1_kode'] = 0;
            $this->data['tb_rekening2_kode'] = 0;
            $this->data['tb_rekening3_kode'] = 0;
            $this->data['tb_rekening4_kode'] = 0;
            $this->data['tb_rekening5_kode'] = 0;
            $this->data['program_kode'] = 0;
            $this->data['kegiatan_kode'] = 0;

            for($i = 0; $i < count($kode); $i++){
                if($i == 1 && $kode[$i] == 1){
                    $langsung = false;
                    $jenis = 2;
                }

                if($i == 2){
                    $this->data['program_kode'] = (int)$kode[$i];
                    if($langsung){
                        $jenis = 3;
                    }
                }else if($i == 3){
                    $this->data['kegiatan_kode'] = (int)$kode[$i];
                    if($langsung){
                        $jenis = 4;
                    }
                }else{
                    $rek++;
                    $this->data['tb_rekening'.($rek).'_kode'] = (int)$kode[$i];
                    if($langsung && $i > 3 ){
                        $jenis = $rek+2;
                    }else{
                        $jenis = $rek;
                    }
                }
            }

            $this->data['tb_monev_lra_ket'] = (string)$set[1];
            $this->data['tb_monev_lra_anggaran'] = (string)$set[2];
            $this->data['tb_monev_lra_realisasi'] = (string)$set[3];
            $this->data['tb_monev_lra_fisik'] = (string)$set[4];
            $this->data['tb_monev_lra_pelaksana'] = (string)$set[7];
            $this->data['tb_monev_lra_sumber_dana'] = (string)$set[8];
            $this->data['tb_monev_lra_lokasi'] = (string)$set[9];

            
            $this->data['tb_urusan_kode'] = $post['tb_urusan_kode'];
            $this->data['tb_bidang_kode'] = $post['tb_bidang_kode'];
            $this->data['tb_unit_kode'] = $post['tb_unit_kode'];
            $this->data['tb_sub_unit_kode'] = $post['tb_sub_unit_kode'];

            $this->db->insert($table, $this->data);

            echo "<pre>";
            print_r($this->data);
            echo "</pre>";
        }
    }

    public function tb_urusan($set, $table = null){
        $this->data = array(
            "tb_urusan_kode" => (string)$set[0], 
            "tb_urusan_nama" => (string)$set[1], 
        );
        $this->db->insert($table, $this->data);
    }

    public function tb_fungsi($set, $table = null){
        $this->data = array(
            "tb_fungsi_kode" => (string)$set[0], 
            "tb_fungsi_nama" => (string)$set[1], 
        );
        $this->db->insert($table, $this->data);
    }

    public function tb_bidang($set, $table = null){
        $this->data = array(
            "tb_urusan_kode" => (string)$set[0],
            "tb_bidang_kode" => (string)$set[1], 
            "tb_bidang_nama" => (string)$set[2], 
            "tb_fungsi_kode" => (string)$set[3],
        );
        $this->db->insert($table, $this->data);
    }

    public function tb_unit($set, $table = null){
        $this->data = array(
            "tb_urusan_kode" => (string)$set[0],
            "tb_bidang_kode" => (string)$set[1],
            "tb_unit_kode" => (string)$set[2], 
            "tb_unit_nama" => (string)$set[3], 
        );
        $this->db->insert($table, $this->data);
    }

    public function tb_sub_unit($set, $table = null){
        $this->data = array(
            "tb_urusan_kode" => (string)$set[0],
            "tb_bidang_kode" => (string)$set[1],
            "tb_unit_kode" => (string)$set[2], 
            "tb_sub_unit_kode" => (string)$set[3], 
            "tb_sub_unit_nama" => (string)$set[4], 
        );
        $this->db->insert($table, $this->data);
    }

    public function importRek()
    {
        $post = $this->input->post();
        $data = array();
        $this->load->library("excel");
        $pesan = "Gagal mengimport data";
        $status = false;
        if(isset($_FILES["file"]["name"]))
        {
        $path = $_FILES["file"]["tmp_name"];
        $object = PHPExcel_IOFactory::load($path);
        foreach($object->getWorksheetIterator() as $worksheet)
        {
            $highestRow = $worksheet->getHighestRow();
            $highestColumn = $worksheet->getHighestColumn();
            for($row=2; $row<=$highestRow; $row++)
            {
                for ($i=0; $i < 27; $i++) { 
                    $set[$i] = $worksheet->getCellByColumnAndRow($i, $row)->getValue();
                }
                $this->$post['table']($set, $post['table']);
                $this->hapus = false;
                array_push($data,$this->data);
                $pesan = "Berhasil menyimpan data";
                $status = true;
            }
        }
        // echo "<pre>";
        // print_r($data);
        // echo "</pre>";
        //    $this->excel_import_model->insert();
        // echo 'Data Imported successfully';
        } 
        $kirim = array(
            'status'=>$status,
            'pesan'=>$pesan
        );

        echo json_encode($kirim);
    }

}