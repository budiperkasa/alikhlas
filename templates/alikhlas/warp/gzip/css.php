<?php 


// set header
if (extension_loaded('zlib') && !ini_get('zlib.output_compression')) @ob_start('ob_gzhandler');
header('Content-type: text/css; charset=UTF-8');
header('Expires: '.gmdate('D, d M Y H:i:s', time() + 86400).' GMT');

// include file
if (isset($_GET['id']) && $_GET['id']) {

	$id   = (string) preg_replace('/[^A-Z0-9_\.-]/i', '', $_GET['id']);
	$file = dirname(__FILE__).'/css-'.$id.'.css';

	if (is_file($file)) {
		include($file);
	}
}