<?php


/*
	Class: WarpHelper
		Helper base class
*/
class WarpHelper extends WarpObject {

	/* name */
	var $_name;

	/* template */
	var $warp;

	/*
		Function: Constructor
			Class Constructor.
	*/
	function __construct() {

		// set default name
		$this->_name = strtolower(substr(get_class($this), strlen(__CLASS__)));
		$this->warp =& Warp::getInstance();

	}

	/*
		Function: getName
			Get helper name

		Returns:
			String
	*/	
	function getName() {
		return $this->_name;
	}

	/*
		Function: getWarp
			Retrieve related template object

		Returns:
			Template
	*/	
	function &getWarp() {
		return $this->warp;
	}
	
	/*
		Function: getHelper
			Retrieve Helper based on related template object

		Returns:
			Helper
	*/	
	function &getHelper($name) {
		return $this->warp->getHelper($name);
	}

}