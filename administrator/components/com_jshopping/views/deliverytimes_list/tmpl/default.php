<?php
include(JPATH_COMPONENT_ADMINISTRATOR."/views/otherpanel/tmpl/submenu.php");
$rows = $this->rows;
$i = 0;
?>
<form action = "index.php?option=com_jshopping&controller=deliverytimes" method = "post" name = "adminForm">

<table class = "adminlist">
<thead>
  <tr>
    <th class = "title" width  = "10">
      #
    </th>
    <th width = "20">
	  <input type="checkbox" name="toggle" value="" onClick="checkAll(<?php echo count( $rows );?>);" />
    </th>
    <th align = "left">
      <?php echo _JSHOP_TITLE;?>
    </th>    
    <th width="50">
    	<?php print _JSHOP_EDIT?>
    </th>
    <th width = "40">
        <?php echo _JSHOP_ID;?>
    </th>
  </tr>
</thead>
<?php
 $count = count($rows);
 foreach($rows as $row){
  ?>
  <tr class = "row<?php echo $i % 2;?>">
   <td>
     <?php echo $i+1;?>
   </td>
   <td>
     <input type = "checkbox" onclick = "isChecked(this.checked)" name = "cid[]" id = "cb<?php echo $i;?>" value = "<?php echo $row->id?>" />
   </td>
   <td>
     <a href = "index.php?option=com_jshopping&controller=deliverytimes&task=edit&id=<?php echo $row->id; ?>"><?php echo $row->name;?></a>
   </td>
	<td align="center">
		<a href='index.php?option=com_jshopping&controller=deliverytimes&task=edit&id=<?php print $row->id;?>'><img src='../images/M_images/edit.png'></a>
	</td>
    <td align="center">
        <?php print $row->id;?>
    </td>
  </tr>
<?php
$i++;  
}
?>
</table>

<input type = "hidden" name = "task" value = "" />
<input type = "hidden" name = "hidemainmenu" value = "0" />
<input type = "hidden" name = "boxchecked" value = "0" />
</form>