<?php
/**
* @package   ZOO Comment Module
* @file      mod_zoocomment.php
* @version   2.0.1 June 2010
* @author    YOOtheme http://www.yootheme.com
* @copyright Copyright (C) 2007 - 2010 YOOtheme GmbH
* @license   http://www.gnu.org/licenses/gpl-2.0.html GNU/GPLv2 only
*/

// no direct access
defined('_JEXEC') or die('Restricted access');

// load config
require_once(JPATH_ADMINISTRATOR.'/components/com_zoo/config.php');

// load helper
require_once(dirname(__FILE__).DS.'helper.php');

// init vars
$app = YTable::getInstance('application')->get($params->get('application', 0));

// is application ?
if (empty($app)) {
	return null;
}

// add facebook script
if ($app->getParams()->get('global.comments.facebook_enable')) {
	$document = JFactory::getDocument();
	$document->addScript('http://static.ak.connect.facebook.com/js/api_lib/v0.4/FeatureLoader.js.php');
	$document->addScriptDeclaration("window.addEvent('domready', function(){\nFB.init('".$app->getParams()->get('global.comments.facebook_api_key')."', '".ZOO_ADMIN_URI."libraries/facebook/xd_receiver.php');\n});");
}

// set one or multiple categories
$category = $params->get('category', 0);
if ($params->get('subcategories')) {
	$categories = $app->getCategoryTree(true);
	if (isset($categories[$category])) {
		$category = array_merge(array($category), array_keys($categories[$category]->getChildren(true)));
	}
}

// get latest comments
$comments = modZooCommentHelper::getLatestComments($app, $category, $params->get('count', 10));

// load template
include(JModuleHelper::getLayoutPath('mod_zoocomment', $params->get('theme', 'list-v')));