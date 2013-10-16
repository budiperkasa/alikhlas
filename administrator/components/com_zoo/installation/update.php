<?php
/**
* @package   ZOO Component
* @file      update.php
* @version   2.0.3 July 2010
* @author    YOOtheme http://www.yootheme.com
* @copyright Copyright (C) 2007 - 2010 YOOtheme GmbH
* @license   http://www.gnu.org/licenses/gpl-2.0.html GNU/GPLv2 only
*/

// no direct access
defined('_JEXEC') or die('Restricted access');

/*
 *  UPGRADE ZOO BETA2 -> ZOO BETA3
 */

// add application group field
$db = YDatabase::getInstance();
$fields = $db->getTableFields(ZOO_TABLE_APPLICATION);
if (isset($fields[ZOO_TABLE_APPLICATION]) && !array_key_exists('application_group', $fields[ZOO_TABLE_APPLICATION])) {
	$db->query('ALTER TABLE '.ZOO_TABLE_APPLICATION.' ADD application_group VARCHAR(255) AFTER name');
}

// add application group field content
$app_table = YTable::getInstance('application');
$apps = $app_table->all();
if (!empty($apps)) {
	foreach ($apps as $app) {
		if (empty($app->application_group)) {
			$app->application_group = $app->getParams()->get('group');
			$app_table->save($app);
		}
	}
}

/*
 *  UPGRADE PREVIOUS -> ZOO 2.0.3
 */

// try to delete old menu.php file
$file = $component->parent->getPath('extension_administrator').'/helpers/menu.php';
if (JFile::exists($file)) {
    JFile::delete($file);
}