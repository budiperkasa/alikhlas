<?php

// no direct access
defined('_JEXEC') or die('Restricted access'); ?>

<h3>
	<?php echo JText::_( 'More Articles...' ); ?>
</h3>

<ul>
	<?php foreach ($this->links as $link) : ?>
	<li>
		<a href="<?php echo JRoute::_(ContentHelperRoute::getArticleRoute($link->slug, $link->catslug, $link->sectionid)); ?>"><?php echo $link->title; ?></a>
	</li>
	<?php endforeach; ?>
</ul>
