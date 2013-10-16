<?php
    $row = $this->product;
    $lists = $this->lists;
    $tax_value = $this->tax_value;
    $jshopConfig = &JSFactory::getConfig();
    $currency = $this->currency;
    
    JHTML::_('behavior.tooltip');
    jimport('joomla.html.pane');
    JHTML::_('behavior.modal', 'a.modal');
?>
<script type="text/javascript">var lang_delete = "<?php print _JSHOP_DELETE; ?>";</script>
<form action = "index.php?option=com_jshopping&controller=products" method = "post" enctype = "multipart/form-data" name = "adminForm">
   <?php
   $pane =& JPane::getInstance('Tabs');
   echo $pane->startPane('productPane');
   
   include(dirname(__FILE__)."/description.php");
   include(dirname(__FILE__)."/info.php");
   
   JPluginHelper::importPlugin('jshoppingadmin');
   $dispatcher =& JDispatcher::getInstance();   
   $dispatcher->trigger( 'onDisplayProductEditTabs', array(&$pane, &$row, &$list, &$tax_value, &$currency) );
   
   if ($jshopConfig->admin_show_attributes) {
    include(dirname(__FILE__)."/attribute.php");
   }
   if ($jshopConfig->admin_show_freeattributes) {
    include(dirname(__FILE__)."/freeattribute.php");
   }
   include(dirname(__FILE__)."/images.php");
   if ($jshopConfig->admin_show_product_video) {
    include(dirname(__FILE__)."/videos.php");
   }
   if ($jshopConfig->admin_show_product_related) {
    include(dirname(__FILE__)."/related.php");
   }
   if ($jshopConfig->admin_show_product_files) {
    include(dirname(__FILE__)."/files.php");
   }
   if ($jshopConfig->admin_show_product_extra_field) {
    include(dirname(__FILE__)."/extrafields.php");
   }
    
   echo $pane->endPane();
   ?>     
   <input type = "hidden" name = "task" value = "" />
   <input type = "hidden" name = "current_cat" value = "<?php echo JRequest::getVar('current_cat', 0)?>" />
   <input type = "hidden" name = "product_id" value = "<?php echo $row->product_id?>" />             
</form>

<script type = "text/javascript">
function submitbutton(pressbutton){
    if (pressbutton == 'save' || pressbutton == 'apply'){
        if (isEmpty($F_('product_width_image')) && isEmpty($F_('product_height_image'))){
           alert ('<?php echo _JSHOP_WRITE_SIZE_BAD?>');
        } else if ($_('category_id').selectedIndex == -1){
           alert ('<?php echo _JSHOP_WRITE_SELECT_CATEGORY?>');
        } else {
            submitform(pressbutton);
        }
    } else {
        submitform(pressbutton);
    }
}
 
function showHideAddPrice(){
     $_('tr_add_price').style.display = ($_('product_is_add_price').checked)  ? ('') : ('none');
}
showHideAddPrice();
</script>