<?php



/*
	Class: WarpMenuDefault
		Menu base class
*/
class WarpMenuDefault extends WarpMenu {

	
	/*
		Function: process

		Returns:
			Xml Object
	*/	
	function process(&$module, &$xmlobj) {
		
		$this->_process($module, $xmlobj);
		
		return $xmlobj;
	}
	
	function _process(&$module, &$xmlobj, $level=0) {
		
		if($level===0){
            $xmlobj->addClass("menu");
        } else {
            $xmlobj->addClass("class", "level".($level+1));
        }
        
        $lis = $xmlobj->children("li");
        
        for($i=0,$imax=count($lis);$i<$imax;$i++){
            
            $attributes = array();
            
            if($lis[$i]->child("a")){
                $link =& $lis[$i]->child("a");
            }else{
                $link =& $lis[$i]->child("span");
            }

            $attributes[] = "level".($level+1);
            $attributes[] = "item".($i+1);
            
            if($i==0) $attributes[] = "first";
            if($i==$imax-1) $attributes[] = "last";
            
            $child_list = $lis[$i]->child("ul");
            
            if ($child_list) {
              $this->_process($module, $child_list,($level+1));                   
              $attributes[] = "parent";  
            }       
            
            if(isset($lis[$i]->_attributes['data-menu-active']) && $lis[$i]->_attributes['data-menu-active']==1) {
                $attributes[] = "active current";
                
                $parent =& $lis[$i]->parent();
                
                while($parent){
                    if($parent->name()=='li'){
                        $parent->addClass('active');
                    }           
                    $parent =& $parent->parent();
                }
            }
            
            
            if($link) {    
                if(!$link->child('span')){
                    $span =& $link->createElement('span', $link->_data);
					$link->_data = null;
                }
                
                $span =& $link->child('span');
                $span->addClass('bg');
                
                if(isset($span->_attributes['data-menu-image'])) {
                    $span->addAttribute('style', 'background-image: url('.$span->_attributes['data-menu-image'].');');
                    $span->addClass('icon');
                }
                
                $subline = explode('||', $span->_data);
                
                if(count($subline)==2){
                    $span->_children = array();
                    $span->createElement('span', trim($subline[0]), array('class'=>'title'));
                    $span->createElement('span', trim($subline[1]), array('class'=>'subtitle') );
                }
            }
            
            foreach ($attributes as $a) {
               $lis[$i]->addClass($a); 
               if($link) $link->addClass($a); 
            }
            
        }
	}

}