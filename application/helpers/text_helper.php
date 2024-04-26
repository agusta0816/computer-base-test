<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

function text_fill($txt)
{
	$type = "sekolah";
	$text = array();

	if($type == "kampus")
	{
		$text['tipe'] 	= 'kampus';
		$text['pelajaran'] 	= 'Mata Kuliah';
		$text['pengajar'] 	= 'Dosen';
		$text['peserta'] 	= 'Mahasiswa';
	}
	else if($type == "sekolah")
	{
		$text['tipe'] 	= 'sekolah';
		$text['pelajaran'] 	= 'Mata Pelajaran';
		$text['pengajar'] 	= 'Guru';
		$text['peserta'] 	= 'Siswa';
	}

	return $text[$txt];
}