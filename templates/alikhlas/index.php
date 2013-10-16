<?php

// no direct access
defined('_JEXEC') or die('Restricted access');

// include config	
include_once(dirname(__FILE__).'/config.php');

// load main template file, located in /layouts/template.php
echo $warp->template->render('template');