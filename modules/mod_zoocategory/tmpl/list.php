<?php
/**
* @package   ZOO Category Module
* @file      list.php
* @version   2.0.1 June 2010
* @author    YOOtheme http://www.yootheme.com
* @copyright Copyright (C) 2007 - 2010 YOOtheme GmbH
* @license   http://www.gnu.org/licenses/gpl-2.0.html GNU/GPLv2 only
*/

// no direct access
defined('_JEXEC') or die('Restricted access');

// include css
JHTML::stylesheet('style.css', JURI::base().'modules/mod_zoocategory/tmpl/list/');

$count = count($categories);

?>

<div class="zoo-category list">
	
	<?php if ($count) : ?>

		<ul class="level1">
			<?php foreach ($categories as $category) : ?>
				<?php echo CategoryRenderer::render($category, $url, 2, $max_depth); ?>
			<?php endforeach; ?>
		</ul>
		
	<?php else : ?>
		<?php echo JText::_('No categories found'); ?>
	<?php endif; ?>
		
</div>