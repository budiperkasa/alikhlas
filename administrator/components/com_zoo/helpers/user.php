<?php
/**
* @package   ZOO Component
* @file      user.php
* @version   2.0.3 July 2010
* @author    YOOtheme http://www.yootheme.com
* @copyright Copyright (C) 2007 - 2010 YOOtheme GmbH
* @license   http://www.gnu.org/licenses/gpl-2.0.html GNU/GPLv2 only
*/

// no direct access
defined('_JEXEC') or die('Restricted access');

/*
   Class: UserHelper
   The Helper Class for user
*/
class UserHelper {

    public static function isJoomlaAdmin(JUser $user) {
		return in_array(strtolower($user->usertype), array('superadministrator', 'super administrator', 'administrator')) || $user->gid == 25 || $user->gid == 24;
    }

    public static function isJoomlaSuperAdmin(JUser $user) {
		return in_array(strtolower($user->usertype), array('superadministrator', 'super administrator')) || $user->gid == 25;
    }
    
}
