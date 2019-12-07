<?php
if (!defined('BASEPATH')) exit('No direct script access allowed');

class ImportController extends CI_Controller {
    
    private $data, $index, $no_kk;
    public function __construct() {
        parent::__construct();
        $this->index = 1;
    } 
    
    public function viewImport(){
        echo '<form action="importRek" method="POST"  enctype="multipart/form-data">
            <input type="file" name="file" />
            <select  name="table">
                <option>sotk_urusan</option>
                <option>sotk_bidang</option>
                <option>sotk_unit</option>
                <option>sotk_sub_unit</option>
                <option>tb_monev_lra</option>
            </select>
            <input type="submit"  />
            </form>';
    }

    public function tb_monev_lra($set, $table = null){
        // $this->data = array(
        //     "tb_rekening1_kode" => (string)$set[1], 
        //     "tb_rekening2_kode" => (string)$set[2], 
        //     "tb_rekening3_kode" => (string)$set[3], 
        //     "tb_rekening4_kode" => (string)$set[4], 
        //     "tb_rekening5_kode" => (string)$set[5], 
        // );
        // $this->db->insert($table, $this->data);
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

    public function sotk_urusan($set, $table = null){
        $this->data = array(
            "urusan_kode" => (string)$set[0], 
            "urusan_nama" => (string)$set[1], 
        );
        $this->db->insert($table, $this->data);
    }

    public function sotk_bidang($set, $table = null){
        $this->data = array(
            "urusan_kode" => (string)$set[0],
            "bidang_kode" => (string)$set[1], 
            "bidang_nama" => (string)$set[2], 
        );
        $this->db->insert($table, $this->data);
    }

    public function sotk_unit($set, $table = null){
        $this->data = array(
            "urusan_kode" => (string)$set[0],
            "bidang_kode" => (string)$set[1],
            "unit_kode" => (string)$set[2], 
            "unit_nama" => (string)$set[3], 
        );
        $this->db->insert($table, $this->data);
    }

    public function sotk_sub_unit($set, $table = null){
        $this->data = array(
            "urusan_kode" => (string)$set[0],
            "bidang_kode" => (string)$set[1],
            "unit_kode" => (string)$set[2], 
            "sub_unit_kode" => (string)$set[3], 
            "sub_unit_nama" => (string)$set[4], 
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