<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/*
| -------------------------------------------------------------------------
| URI ROUTING
| -------------------------------------------------------------------------
| This file lets you re-map URI requests to specific controller functions.
|
| Typically there is a one-to-one relationship between a URL string
| and its corresponding controller class/method. The segments in a
| URL normally follow this pattern:
|
|	example.com/class/method/id/
|
| In some instances, however, you may want to remap this relationship
| so that a different class/function is called than the one
| corresponding to the URL.
|
| Please see the user guide for complete details:
|
|	https://codeigniter.com/user_guide/general/routing.html
|
| -------------------------------------------------------------------------
| RESERVED ROUTES
| -------------------------------------------------------------------------
|
| There are three reserved routes:
|
|	$route['default_controller'] = 'welcome';
|
| This route indicates which controller class should be loaded if the
| URI contains no data. In the above example, the "welcome" class
| would be loaded.
|
|	$route['404_override'] = 'errors/page_missing';
|
| This route will tell the Router which controller/method to use if those
| provided in the URL cannot be matched to a valid route.
|
|	$route['translate_uri_dashes'] = FALSE;
|
| This is not exactly a route, but allows you to automatically route
| controller and method names that contain dashes. '-' isn't a valid
| class or method name character, so it requires translation.
| When you set this option to TRUE, it will replace ALL dashes in the
| controller and method URI segments.
|
| Examples:	my-controller/index	-> my_controller/index
|		my-controller/my-method	-> my_controller/my_method
*/

$route['monev/import'] = 'monev/ImportController/viewImport';

$route['monev/lra/import'] = 'monev/DataLraController/view';
$route['monev/lra/do-import'] = 'monev/ImportController/importRek';
$route['monev/lra/save/(:any)'] = 'monev/DataLraController/cetak/$1';

$route['monev/rpjmd/import'] = 'monev/DataRpjmdController/view';
$route['monev/rpjmd/do-import'] = 'monev/ImportController/importRek';

$route['monev/logout'] = 'monev/LoginController/logout';

$route['monev/login'] = 'monev/LoginController/login';
$route['monev/cek-login'] = 'monev/LoginController/cekLogin';

$route['monev/beranda'] = 'monev/LoginController/beranda';

$route['monev/lra'] = 'monev/LraController/view';
$route['monev/lra/page-(:num)'] = 'monev/LraController/getData/$1';
$route['monev/lra/create'] = 'monev/LraController/action/create';
$route['monev/lra/update'] = 'monev/LraController/action/update';
$route['monev/lra/delete'] = 'monev/LraController/action/delete';

$route['monev/evaluasi'] = 'monev/Evaluasi2Controller/view';
$route['monev/evaluasi2/page-(:num)'] = 'monev/Evaluasi2Controller/getData/$1';
$route['monev/evaluasi2/create'] = 'monev/Evaluasi2Controller/action/create';
$route['monev/evaluasi2/update'] = 'monev/Evaluasi2Controller/action/update';
$route['monev/evaluasi2/delete'] = 'monev/Evaluasi2Controller/action/delete';

$route['monev/user'] = 'monev/UserController/view';
$route['monev/user/page-(:num)'] = 'monev/UserController/getData/$1';
$route['monev/user/create'] = 'monev/UserController/action/create';
$route['monev/user/update'] = 'monev/UserController/action/update';
$route['monev/user/delete'] = 'monev/UserController/action/delete';

$route['monev/misi'] = 'monev/MisiController/view';
$route['monev/misi/page-(:num)'] = 'monev/MisiController/getData/$1';

$route['monev/tujuan/page-(:num)'] = 'monev/TujuanController/getData/$2';
$route['monev/tujuan/(:any)'] = 'monev/TujuanController/view/$1';

$route['monev/sasaran/page-(:num)'] = 'monev/SasaranController/getData/$2';
$route['monev/sasaran/(:any)'] = 'monev/SasaranController/view/$1';

$route['monev/program/page-(:num)'] = 'monev/ProgramController/getData/$2';
$route['monev/program/(:any)'] = 'monev/ProgramController/view/$1';

$route['monev/kegiatan/page-(:num)'] = 'monev/KegiatanController/getData/$2';
$route['monev/kegiatan/(:any)'] = 'monev/KegiatanController/view/$1';


$route['monev/evaluasi/laporan'] = 'monev/DataEvaluasiContoller/view';
$route['monev/evaluasi/save/(:any)'] = 'monev/DataEvaluasiContoller/cetak/$1';

$route['monev/evaluasi/page-(:num)'] = 'monev/EvaluasiController/getData/$2';
$route['monev/evaluasi/create'] = 'monev/EvaluasiController/action/create';
$route['monev/evaluasi/update'] = 'monev/EvaluasiController/action/update';
$route['monev/evaluasi/delete'] = 'monev/EvaluasiController/action/delete';
$route['monev/evaluasi/(:any)/(:any)'] = 'monev/EvaluasiController/view/$1/$2';

$route['monev/rpjmd/session'] = 'monev/rpjmd/LaporanMTSController/sessionCoba';

$route['monev/rpjmd/laporan/misi-tujuan-sasaran'] = 'monev/rpjmd/LaporanMTSController/view';
$route['monev/rpjmd/laporan/misi-tujuan-sasaran/save/(:any)'] = 'monev/rpjmd/LaporanMTSController/cetak/$1';

$route['monev/rpjmd/laporan/skpd'] = 'monev/rpjmd/LaporanSKPDController/view';
$route['monev/rpjmd/laporan/skpd/save/(:any)'] = 'monev/rpjmd/LaporanSKPDController/cetak/$1';

$route['default_controller'] = 'welcome';
$route['404_override'] = '';
$route['translate_uri_dashes'] = FALSE;
