<?php 
/**
* @package   ZOO Component
* @file      addelement.php
* @version   2.0.3 July 2010
* @author    YOOtheme http://www.yootheme.com
* @copyright Copyright (C) 2007 - 2010 YOOtheme GmbH
* @license   http://www.gnu.org/licenses/gpl-2.0.html GNU/GPLv2 only
*/

// no direct access
defined('_JEXEC') or die('Restricted access');

// output elements html
if ($this->element) {
	echo $this->partial('editelement', array('element' => $this->element, 'name' => 'New', 'var' => $this->var));
}

?>