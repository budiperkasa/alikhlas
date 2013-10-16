<?php
class JElementCategories extends JElement {

  var   $_name = 'Categories';
  
  function fetchElement($name, $value, &$node, $control_name){
        require_once (JPATH_SITE.'/modules/mod_jshopping_latest_products/helper.php'); 
        $tmp = new stdClass();
        $tmp->category_id = "";
        $tmp->name = "All";
        $categories_1  = array($tmp);
        $categories_select =array_merge($categories_1 , buildTreeCategory(0)); 
        $ctrl  = $control_name .'['. $name .']';
        $ctrl .= '[]'; 

        return JHTML::_('select.genericlist', $categories_select,$ctrl,'class="inputbox" id = "category_ordering" multiple="multiple"','category_id','name', $value );
  }
}
?>