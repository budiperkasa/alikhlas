<?php
	/*
	*
	
* @version		$Id: category.php 10707 2008-08-21 09:52:47Z eddieajau $

	* @package		Joomla.Framework
	
* @subpackage	Parameter

	* @copyright	Copyright (C) 2005 - 2008 Open Source Matters. All rights reserved.
	
* @license		GNU/GPL, see LICENSE.php
	
* Joomla! is free software. This version may have been modified pursuant
	
* to the GNU General Public License, and as distributed it includes or
	
* is derivative of works licensed under the GNU General Public License or
	
* other free or open source software licenses.
* See COPYRIGHT.php for copyright notices and details.
	
*/


	// Check to ensure this file is within the rest of the framework
defined('JPATH_BASE') or die();


	/*
	*
	
* Renders a category element
 
	*
 * @package 	Joomla.Framework
 
	* @subpackage		Parameter
 
	* @since		1.5
 
	*/



class JElementCategoryList extends JElement
{
	
	/*
	*
	
	* Element 	name
	
	*
	
	* @access	protected
	
	* @var		string
	
	*/
	

   var	$_name = 'Category';

	

   function fetchElement($name, $value, &$node, $control_name)
	{
		
	$db = &JFactory::getDBO();

		
	$section	= $node->attributes('section');
		
	$class		= $node->attributes('class');
		
	$size = ( $node->attributes('size') ? $node->attributes('size') : 5 );
	
	if (!$class) {
			
		$class = "inputbox";
		
	}

		
	if (!isset ($section)) {
			
		// alias for section
			
		$section = $node->attributes('scope');
			
		if (!isset ($section)) {
				
			$section = 'content';
			
		}
		
	}

		
	if ($section == 'content') {
			
		// This might get a conflict with the dynamic translation - TODO: search for better solution
			
		$query = ' select id, title from (' .
			 ' SELECT 0 AS id, "Uncategorised" AS title, 0 AS order_' .
			 ' union' .
			 ' SELECT c.id, CONCAT_WS( "/",s.title, c.title ) AS title, 1' .
				
			 ' FROM #__categories AS c' .
				
			 ' LEFT JOIN #__sections AS s ON s.id=c.section' .
				
			 ' WHERE c.published = 1' .
				
			 ' AND s.scope = '.$db->Quote($section).
				
			 ' ORDER BY order_, title ) a';
		
	} else {
			
		$query = 'SELECT c.id, c.title' .

			 ' FROM #__categories AS c' .

			 ' WHERE c.published = 1' .
				
			 ' AND c.section = '.$db->Quote($section).
				
			 ' ORDER BY c.title';
		
	}
		
	$db->setQuery($query);
		
	$options = $db->loadObjectList();
		

	
	return JHTML::_('select.genericlist',  $options, ''.$control_name.'['.$name.'][]', ' multiple="multiple" size="' . $size . '" class="'.$class.'"', 'id', 'title', $value, $control_name.$name );

   }

}