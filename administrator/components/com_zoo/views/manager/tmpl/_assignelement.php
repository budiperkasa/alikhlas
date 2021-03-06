<?php 
/**
* @package   ZOO Component
* @file      _assignelement.php
* @version   2.0.3 July 2010
* @author    YOOtheme http://www.yootheme.com
* @copyright Copyright (C) 2007 - 2010 YOOtheme GmbH
* @license   http://www.gnu.org/licenses/gpl-2.0.html GNU/GPLv2 only
*/

// no direct access
defined('_JEXEC') or die('Restricted access');

// get elements meta data
$metadata = $element->getMetaData();
$name = isset($position) && isset($index) ? 'positions['.$position.']['.$index.']' : 'elements['.$element->identifier.']';
$form = $element->getConfigForm();
$form->layout_path = $this->path;
$form->selectable_types = $element->getConfig()->get('selectable_types', array());

?>
<li class="element hideconfig" role="<?php echo $element->identifier; ?>">
	<div class="element-icon edit-element edit-event" title="<?php echo JText::_('Edit element'); ?>"></div>
	<div class="element-icon delete-element delete-event" title="<?php echo JText::_('Delete element'); ?>"></div>
	<div class="name sort-event" title="<?php echo JText::_('Drag to sort'); ?>"><?php echo $element->getConfig()->get('name'); ?> 
	<?php if ($element->getGroup() != 'Core') :?>
		<span>(<?php echo $metadata['name']; ?>)</span>
	<?php endif;?>
	</div>
	<div class="config">
		<?php echo $form->setValues($data)->render($name, 'render'); ?>
		<input type="hidden" name="<?php echo $name;?>[element]" value="<?php echo $element->identifier; ?>" />
	</div>
</li>
