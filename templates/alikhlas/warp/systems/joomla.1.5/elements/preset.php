<?php

class JElementPreset extends JElement {

	var	$_name = 'Preset';

	function fetchElement($name, $value, &$node, $control_name) {
		
		// load config
		require_once(dirname(dirname(dirname(dirname(dirname(__FILE__))))).'/config.php');
        
		return $warp->template->render('admin/controls/presets');
	}

}