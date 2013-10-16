<?php


// no direct access
defined('_JEXEC') or die('Restricted access');
?>
<span class="breadcrumbs">
<?php for ($i = 0; $i < $count; $i ++) :

	// clean subtitle from breadcrumb
	if ($pos = strpos($list[$i]->name, '||')) {
		$name = trim(substr($list[$i]->name, 0, $pos));
	} else {
		$name = $list[$i]->name;
	}
	
	// if not the last item in the breadcrumbs add the separator
	if ($i < $count -1) {
		if(!empty($list[$i]->link)) {
			echo '<a href="'.$list[$i]->link.'">'.$name.'</a>';
		} else {
			echo '<span class="separator">'.$name.'</span>';
		}
		//echo ' '.$separator.' ';
	} else { // when $i == $count -1
	    echo '<span class="current">'.$name.'</span>';
	}
endfor; ?>
</span>