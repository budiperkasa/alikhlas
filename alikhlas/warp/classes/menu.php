<?php


/*
	Class: WarpMenu
		Menu base class
*/
class WarpMenu extends WarpObject {

	/*
		Function: process
			Abstract function. New implementation in child classes.

		Returns:
			Xml Object
	*/	
	function process($xmlobj, $level=0) {
		return $xmlobj;
	}

}