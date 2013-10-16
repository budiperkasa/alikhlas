<?php
/**
* @package   ZOO Comment Module
* @file      list-h.php
* @version   2.0.1 June 2010
* @author    YOOtheme http://www.yootheme.com
* @copyright Copyright (C) 2007 - 2010 YOOtheme GmbH
* @license   http://www.gnu.org/licenses/gpl-2.0.html GNU/GPLv2 only
*/

// no direct access
defined('_JEXEC') or die('Restricted access');

// include css
JHTML::stylesheet('style.css', JURI::base().'modules/mod_zoocomment/tmpl/list-h/');

// include js
JHTML::script('mod_zoocomment.js', JURI::base().'modules/mod_zoocomment/');

$count = count($comments);

?>

<div class="zoo-comment list-h">

	<?php if ($count) : ?>
	
		<ul>
			<?php $i = 0; foreach ($comments as $comment) : ?>
			
				<?php // set author name
					$author = $comment->getAuthor();
					$author->name = $author->name ? $author->name : JText::_('Anonymous');
				?>
			
				<li class="width<?php echo intval(100 / $count);?> <?php if ($i % 2 == 0) { echo 'odd'; } else { echo 'even'; } ?> <?php if ($author->isJoomlaAdmin()) echo 'comment-byadmin'; ?>">
					<div class="match-height">
				
						<?php if ($params->get('show_avatar', 1)) : ?>
						<div class="avatar">
							<?php if ($author->url) : ?><a href="<?php echo $author->url; ?>" title="<?php echo $author->url; ?>"><?php endif; ?>
							<?php echo $author->getAvatar($params->get('avatar_size', 50)); ?>
							<?php if ($author->url) : ?></a><?php endif; ?>
						</div>
						<?php endif; ?>
						
						<?php if ($params->get('show_author', 1)) : ?>
						<h3 class="author">
							<?php if ($author->url) : ?><a href="<?php echo $author->url; ?>" title="<?php echo $author->url; ?>"><?php endif; ?>
							<?php echo $author->name; ?>
							<?php if ($author->url) : ?></a><?php endif; ?>
						</h3>
						<?php endif; ?>
										
						<?php if ($params->get('show_meta', 1)) : ?>
						<p class="meta">
							<?php echo JHTML::_('date', $comment->created, JText::_('ZOO_COMMENT_MODULE_DATE_FORMAT') ); ?>
							| <a class="permalink" href="<?php echo JRoute::_('index.php?option=com_zoo&task=item&item_id='.$comment->item_id.'#comment-'.$comment->id, false); ?>">#</a>
						</p>
						<?php endif; ?>
					
						<p class="content">
							<?php echo CommentHelper::filterContentOutput(YString::truncate($comment->content, modZooCommentHelper::MAX_CHARACTERS)); ?>
						</p>
	
					</div>
				</li>
	
			<?php $i++; endforeach; ?>
		</ul>
		
	<?php else : ?>
		<?php echo JText::_('No comments found'); ?>
	<?php endif; ?>
	
</div>

<script type="text/javascript">

	window.addEvent('domready', function() {
		$$('div.zoo-comment').each(function (elm) {
			if (elm.hasClass('list-h')) {
				modZooComment.matchHeight(elm.getElements('div.match-height'), 0);
			}			
		});	
	});

</script>