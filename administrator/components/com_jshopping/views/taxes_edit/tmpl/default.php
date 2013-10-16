<?php
$row = $this->tax;
$edit = $this->edit;
JHTML::_('behavior.tooltip');
?>
<form action = "index.php?option=com_jshopping&controller=taxes" method = "post"name = "adminForm">

<div class="col100">
<fieldset class="adminform">
<table width = "100%" class="admintable">
   <tr>
     <td class="key" style="width:250px;">
       <?php echo _JSHOP_TITLE; ?>
     </td>
     <td>
       <input type = "text" class = "inputbox" id = "tax_name" name = "tax_name" value = "<?php echo $row->tax_name;?>" />
     </td>
   </tr>
   <tr>
     <td  class="key">
       <?php echo _JSHOP_VALUE; ?>
     </td>
     <td>
       <input type = "text" class = "inputbox" id = "tax_value" name = "tax_value" value = "<?php echo $row->tax_value;?>" /> %
       <?php echo JHTML::tooltip(_JSHOP_VALUE_TAX_INFO);?>
     </td>
   </tr>
 </table>
</fieldset>
</div>
<div class="clr"></div>

<input type = "hidden" name = "task" value = "<?php echo JRequest::getVar('task')?>" />
<input type = "hidden" name = "edit" value = "<?php echo $edit;?>" />
<?php if ($edit) {?>
  <input type = "hidden" name = "tax_id" value = "<?php echo $row->tax_id?>" />
<?php }?>
</form>
<script type = "text/javascript">
 function submitbutton(pressbutton){
     if (pressbutton == 'save' || pressbutton == 'apply'){
         var taxValue = $F_('tax_value');
         if (isNaN(taxValue)){
           alert ('<?php echo _JSHOP_WRITE_TAX_NO_VALID;?>');
         } else if (taxValue < 0 || taxValue >= 100){
           alert ('<?php echo _JSHOP_WRITE_TAX_BIG_LESS;?>');
         } else {
             submitform(pressbutton);
         }
     } else {
            submitform(pressbutton);
     }
 }
</script>