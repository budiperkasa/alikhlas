<?php
/**
* @package   ZOO Category Module
* @file      helper.php
* @version   2.0.1 June 2010
* @author    YOOtheme http://www.yootheme.com
* @copyright Copyright (C) 2007 - 2010 YOOtheme GmbH
* @license   http://www.gnu.org/licenses/gpl-2.0.html GNU/GPLv2 only
*/

// no direct access
defined('_JEXEC') or die('Restricted access');

class CategoryRenderer {

    public static function render($category, $url, $level, $max_depth) {

		$result   = array();
		$result[] = '<li>';
		$result[] = '<a href="'.$url.$category->id.'">'.$category->name.'</a>';

		$children = $category->getChildren();
		if (count($children) && (!$max_depth || $max_depth >= $level)) {
			$result[] = '<ul class="level'.$level.'">';
			foreach ($category->getChildren() as $child) {
				$result[] = self::render($child, $url, $level+1, $max_depth);
			}
			$result[] = '</ul>';
		}

		$result[] = '</li>';

		return implode("\n", $result);
	}

}