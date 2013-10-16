<?php

// Check to ensure this file is included in Joomla!
defined('_JEXEC') or die();

jimport('joomla.application.component.view');

class fabrikViewGooglemap extends JView
{

	function display($tmpl = 'default')
	{
		FabrikHelperHTML::slimbox();
		$document =& JFactory::getDocument();
		FabrikHelperHTML::packageJS();
		$usersConfig = &JComponentHelper::getParams('com_fabrik');
		$model = &$this->getModel();
		$model->setId(JRequest::getVar('id', $usersConfig->get('visualizationid', JRequest::getInt('visualizationid', 0))));
		$this->row =& $model->getVisualization();
		$model->setTableIds();

		$js = $model->getJs();
		$model->getCustomJsAction();
		
		$this->txt = $model->getText();
		$this->params =& $model->getParams();

		$params =& $model->getPluginParams();
		$this->assignRef('params', $params);
		$tmpl = $params->get('fb_gm_layout', $tmpl);
		$tmplpath = COM_FABRIK_FRONTEND.DS.'plugins'.DS.'visualization'.DS.'googlemap'.DS.'views'.DS.'googlemap'.DS.'tmpl'.DS.$tmpl;
		FabrikHelperHTML::script('table.js', 'media/com_fabrik/js/', true);
		FabrikHelperHTML::script('Event.Delegation.js', 'media/com_fabrik/js/', true);

		if ($params->get('fb_gm_center') == 'userslocation') {
			$document->addScript('http://code.google.com/apis/gears/gears_init.js');
			FabrikHelperHTML::script('geo.js', 'components/com_fabrik/libs/geo-location/');
		}

		$this->get('PluginJsClasses');
		$tableplugins = "window.addEvent('domready', function(){\n"
		.$this->get('PluginJsObjects')
		."\n});";
		FabrikHelperHTML::addScriptDeclaration($tableplugins);
		JHTML::stylesheet('table.css', 'media/com_fabrik/css/');
		global $ispda;
		if ($ispda == 1) { //pdabot
		  $template = 'static';
		  $this->assign('staticmap', $this->get('StaticMap'));
		} else {
			$src = "http://maps.google.com/maps/api/js?sensor=".$params->get('fb_gm_sensor', 'false');
			$document->addScript($src);

			FabrikHelperHTML::script('googlemap.js', 'components/com_fabrik/plugins/visualization/googlemap/', true);

			if($this->params->get('fb_gm_clustering') == 1) {
				$document->addScript('http://google-maps-utility-library-v3.googlecode.com/svn/tags/markermanager/1.0/src/markermanager.js');
			}else if ($this->params->get('fb_gm_clustering') == 2) {
				$document->addScript('http://google-maps-utility-library-v3.googlecode.com/svn/trunk/markerclusterer/src/markerclusterer_compiled.js');
			} else {
				//doesnt work in v3
				//FabrikHelperHTML::script('markermanager.js', 'components/com_fabrik/libs/googlemaps/', true);
			}

			FabrikHelperHTML::addScriptDeclaration($js);
			$ab_css_file = $tmplpath.DS.'template.css';

			if (JFile::exists($ab_css_file))
			{
				JHTML::stylesheet('template.css', 'components/com_fabrik/plugins/visualization/googlemap/views/googlemap/tmpl/'.$tmpl.'/', true);
			}
			$template = null;
		}
		//check and add a general fabrik custom css file overrides template css and generic table css
		FabrikHelperHTML::stylesheetFromPath("media".DS."com_fabrik".DS."css".DS."custom.css");
		//check and add a specific viz template css file overrides template css generic table css and generic custom css
		FabrikHelperHTML::stylesheetFromPath("components".DS."com_fabrik".DS."plugins".DS."visualization".DS."googlemap".DS."views".DS."googlemap".DS."tmpl".DS.$tmpl.DS."custom.css");
		$this->assignRef('filters', $this->get('Filters'));
		$this->assign('showFilters', JRequest::getInt('showfilters', 1) === 1 ?  1 : 0);
		$this->assign('filterFormURL', $this->get('FilterFormURL'));
		$this->assign('sidebarPosition', $params->get('fb_gm_use_overlays_sidebar'));
		//if ((int)$params->get('fb_gm_use_overlays', 0) === 1 &&  (int)$params->get('fb_gm_use_overlays_sidebar', 0) > 0) {
		if ($this->get('ShowSideBar')) {
			$this->assign('showSidebar', 1);
			$this->assign('overlayUrls', $params->get('fb_gm_overlay_urls', array(), '_default', 'array'));
			$this->assign('overlayLabels', $params->get('fb_gm_overlay_labels', array(), '_default', 'array'));
		} else {
			$this->assign('showSidebar', 0);
		}

		$this->_setPath('template', $tmplpath);

		$this->assign('containerId', $this->get('ContainerId'));
		$this->assignRef('grouptemplates', $this->get('GroupTemplates'));

		//ensure we don't have an incorrect version of mootools loaded
		FabrikHelperHTML::cleanMootools();
		echo parent::display();
	}

}
?>