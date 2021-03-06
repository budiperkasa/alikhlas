<?php
/**
 * Plugin element to render two fields to capture a link (url/label)
 * @package fabrikar
 * @author Rob Clayburn
 * @copyright (C) Rob Clayburn
 * @license http://www.gnu.org/copyleft/gpl.html GNU/GPL
 */

// Check to ensure this file is included in Joomla!
defined('_JEXEC') or die();

require_once(JPATH_SITE.DS.'components'.DS.'com_fabrik'.DS.'models'.DS.'element.php');

class FabrikModelFabrikLink extends FabrikModelElement {

	var $_pluginName = 'link';

	/**
	 * Constructor
	 */

	function __construct()
	{
		$this->hasSubElements = true;
		parent::__construct();
	}

	/**
	 * shows the data formatted for the table view
	 * @param string data
	 * @param object all the data in the tables current row
	 * @return string formatted value
	 */

	function renderTableData($data, $oAllRowsData)
	{
		$tableModel =& $this->getTableModel();
		$params =& $this->getParams();
		$target = $params->get('link_target', '');
		$smart_link = $params->get('link_smart_link', false);
		if ($tableModel->_outPutFormat != 'rss' && ($smart_link || $target == 'mediabox')) {
			FabrikHelperHTML::slimbox();
		}
		$data = explode(GROUPSPLITTER, $data);
		for ($i=0; $i < count($data); $i++) {
			$data[$i] = $this->_renderTableData($data[$i], $oAllRowsData);
		}
		$data = implode(GROUPSPLITTER, $data);
		return parent::renderTableData($data, $oAllRowsData);
	}

	/**
	 * @access private
	 *
	 * @param string data
	 * @param object all the data in the tables current row
	 * @return string formatted value
	 */

	function _renderTableData($data, $oAllRowsData)
	{
		$data = explode(GROUPSPLITTER2, $data);
		$tableModel =& $this->getTableModel();
		$params =& $this->getParams();
		$attribs = $params->get('link_attribs');
		if (is_array($data)) {
			if (count($data) == 1) { $data[1] = $data[0];}
			if (empty($data[1]) && empty($data[0])) {
				return '';
			}
			$target = $params->get('link_target', '');
			if ($tableModel->_outPutFormat != 'rss') {
				if (empty($data[1])) {
					$link = $data[0];
				}
				else {
					$smart_link = $params->get('link_smart_link', false);
					if ($smart_link || $target == 'mediabox') {
						$smarts = $this->_getSmartLinkType( $data[1]);
						$link = "<a href=\"" . $data[1] . "\" rel=\"lightbox[" . $smarts['type'] . " " . $smarts['width'] . " " . $smarts['height'] . "]\"$attribs>" . $data[0] . "</a>";
					}
					else {
						$link = "<a href=\"" . $data[1] . "\" target=\"" .$target . "\" $attribs>" . $data[0] . "</a>";
					}
				}
			} else {
				$link = $data[1];
			}
			$w = new FabrikWorker();
			$link = $tableModel->parseMessageForRowHolder($link, JArrayHelper::fromObject($oAllRowsData));
			return $link;
		}
		return $data;
	}

	/**
	 * draws the form element
	 * @param int repeat group counter
	 * @return string returns element html
	 */

	function render($data, $repeatCounter = 0)
	{
		$name 			= $this->getHTMLName($repeatCounter);
		$id 				= $this->getHTMLId($repeatCounter);
		$params 		=& $this->getParams();
		$attribs = $params->get('link_attribs');
		$element 		=& $this->getElement();
		$size 			= $element->width;
		$maxlength 	= $params->get('maxlength');
		if ($maxlength == "0" or $maxlength == "") {
			$maxlength = $size;
		}
		$value 			= $this->getValue($data, $repeatCounter);
		$sizeInfo 	=  " size=\"$size\" maxlength=\"$maxlength\"";
		if ($value == "") {
			$value = array('label'=>'', 'link'=>'');
		}else{
			if (!is_array($value)) {
				$tmpvalue = explode(GROUPSPLITTER2, $value);
				$value = array();
				$value['label'] = $tmpvalue[0];
				if (count($tmpvalue) > 1) {
					$value['link'] = $tmpvalue[1];
				} else {
					$value['link'] = $tmpvalue[0];
				}
			}
		}

		if (count($value) == 0) {
			$value = array('label'=>'', 'link'=>'');
		}

		if (JRequest::getVar('rowid') == 0) {
			$value['link'] = $params->get('link_default_url');
		}
		if (!$this->_editable) {
			if (empty($value['link'])) {
				return $value['label'];
			}
			else {
				$w = new FabrikWorker();
				$value['link'] = is_array($data) ? $w->parseMessageForPlaceHolder($value['link'], $data) : $w->parseMessageForPlaceHolder($value['link']);
				$target = $params->get('link_target', '');
				$smart_link = $params->get('link_smart_link', false);
				if ($smart_link || $target == 'mediabox') {
					$smarts = $this->_getSmartLinkType($value['link']);
					return "<a href=\"" . $value['link'] . "\" rel=\"lightbox[" . $smarts['type'] . " " . $smarts['width'] . " " . $smarts['height'] . "]\" $attribs>" . $value['label'] . "</a>";
				} else {
					return "<a href=\"" . $value['link']. "\" target=\"".$target."\" $attribs>"  . $value['label'] . "</a>";
				}
			}
		}
		$errorCSS  = '';
		if (isset($this->_elementError) && $this->_elementError != '') {
			$errorCSS = " elementErrorHighlight";
		}
		$labelname = FabrikString::rtrimword($name, "[]") . '[label]';
		$linkname = FabrikString::rtrimword($name, "[]") . '[link]';

		$str = "<div class='fabrikSubElementContainer' id='$id'>";
		$str .= JText::_('Label') . ":<br />";
		$str .= "<input  class=\"fabrikinput inputbox$errorCSS\" name=\"$labelname\" $sizeInfo value=\"" . $value['label'] . "\" />\n";
		$str .= "<br />URL:<br />";
		$str .= "<input class=\"fabrikinput inputbox$errorCSS\" name=\"$linkname\" $sizeInfo value=\"" . $value['link'] . "\" />\n";
		$str .="</div>";
		return $str;
	}

	function getFieldDescription()
	{
		$p = $this->getParams();
		if ($this->encryptMe()) {
			return 'BLOB';
		}
		return "TEXT";
	}

	function renderAdminSettings()
	{
		$params =& $this->getParams();
		$pluginParams =& $this->getPluginParams();
		?>
<div id="page-<?php echo $this->_name;?>" class="elementSettings"
	style="display: none"><?php
	echo $pluginParams->render('details');
	echo $pluginParams->render('params', 'extra');
	?>
	<fieldset><legend><?php echo JText::_('BITYLY')?></legend>
	<?php echo $pluginParams->render('params', 'bitly'); ?>
	</fieldset>
	</div>
	<?php
	}

	/**
	 * used to format the data when shown in the form's email
	 * @param mixed element's data
	 * @return string formatted value
	 */

	protected function _getEmailValue($value, $data = array(), $repeatCounter = 0)
	{
		if (is_string($value)) {
			$value = explode(GROUPSPLITTER2, $value);
			$value['label'] = $value[0];
			$value['link'] = $value[1];
		}
		if (is_array($value)) {
			$w = new FabrikWorker();
			$link 	= $w->parseMessageForPlaceHolder($value['link']);
			$value = "<a href=\"" . $link . "\" >" . $value['label'] . "</a>";
		}

		return $value;
	}

	/**
	 *  manupulates posted form data for insertion into database
	 * @param mixed thie elements posted form data
	 * @param array posted form data
	 */

	function storeDatabaseFormat($val, $data)
	{
		// $$$ hugh - added 'normalization' of links, to add http:// if no :// in the link.
		// not sure if we really want to do it here, or only when rendering?
		// $$$ hugh - quit normalizing links.
		$return = '';
		$params =& $this->getParams();
		if (is_array($val)) {
			if ($params->get('use_bitly')) {
				require_once(JPATH_SITE.DS.'components'.DS.'com_fabrik'.DS.'libs'.DS.'bitly'.DS.'bitly.php');
				$login = $params->get('bitly_login');
				$key = $params->get('bitly_apikey');
				$bitly = new bitly( $login, $key);
			}
			foreach ($val as $key=>$v) {
				if (is_array($v)) {
					// in repeat group
					/*
					if ($key == 'link' && $params->get('use_bitly')) {
						for ($i = 0; $i < count($v); $i++) {
							$v[$i] = $bitly->shorten($v[$i]);
						}
					}
					*/
					if ($params->get('use_bitly')) {
						// bitly will return an error if you try and shorten a shortened link,
						// and the class file we are using doesn't check for this
						if (!strstr($v['link'],'bit.ly/') && $v['link'] !== '') {
							$v['link'] = $bitly->shorten($v['link']);
						}
					}
					$return .= implode(GROUPSPLITTER2, $v);
					$return .= GROUPSPLITTER;
				} else {
					// not in repeat group
					if($key == 'link' && $params->get('use_bitly')) {
						if (!strstr($v,'bit.ly/') && $v !== '') {
							$v = $bitly->shorten($v);
						}
					}
					$return .= $v .GROUPSPLITTER2;
				}
			}
		} else {
			$return = $val;
		}
		$return = FabrikString::rtrimword($return, GROUPSPLITTER);
		$return = FabrikString::rtrimword($return, GROUPSPLITTER2);
		return $return;
}

	/**
	 * load the javascript class that manages interaction with the form element
	 * should only be called once
	 * @return string javascript class file
	 */

	function formJavascriptClass()
	{
		FabrikHelperHTML::script('javascript.js', 'components/com_fabrik/plugins/element/fabriklink/', true);
	}

	/**
	 * return the javascript to create an instance of the class defined in formJavascriptClass
	 * @return string javascript to create instance. Instance name must be 'el'
	 */

	function elementJavascript($repeatCounter)
	{
		$tableModel =& $this->getTableModel();
		$params =& $this->getParams();
		$target = $params->get('link_target', '');
		$smart_link = $params->get('link_smart_link', false);
		if ($tableModel->_outPutFormat != 'rss' && ($smart_link || $target == 'mediabox')) {
			FabrikHelperHTML::slimbox();
		}
		$id = $this->getHTMLId($repeatCounter);
		$opts =& $this->getElementJSOptions($repeatCounter);
		$opts = json_encode($opts);
		return "new fbLink('$id', $opts)";
	}

	/**
	 *
	 * @param array $value, previously encrypted values
	 * @param array data
	 * @param int repeat group counter
	 * @return null
	 */

	function getValuesToEncrypt(&$values, $data, $c)
	{
		$data = explode(GROUPSPLITTER2, $this->getValue($data, $c));
		$name = $this->getFullName(false, true, false);
		$group =& $this->getGroup();
		if ($group->canRepeat()) {
			// $$$ rob - I've not actually tested this bit!
			if (!array_key_exists($name, $values)) {
				$values[$name]['data']['label'] = array();
				$values[$name]['data']['link'] = array();
			}
			$values[$name]['data']['label'][$c] = $data[0];
			$values[$name]['data']['link'][$c] = $data[1];
		} else {
			$values[$name]['data']['label'] = $data[0];
			$values[$name]['data']['link'] = $data[1];
		}
	}

	/**
	 * this really does get just the default value (as defined in the element's settings)
	 * @param array data to use as parsemessage for placeholder
	 * @return unknown}_type
	 */

	function getDefaultValue($data = array() )
	{
		if (!isset($this->_default)) {
			$w = new FabrikWorker();
			$params =& $this->getParams();
			$link = $params->get('link_default_url');
			// $$$ hugh - no idea what this was here for, but it was causing some BIZARRE bugs!
			//$formdata = $this->getForm()->getData();
			// $$$ rob only parse for place holder if we can use the element
			// otherwise for encrypted values store raw, and they are parsed when the
			// form in processsed in form::addEncrytedVarsToArray();
			if ($this->canUse()) {
				$link = $w->parseMessageForPlaceHolder($link, $data);
			}
			$element =& $this->getElement();
			$default = $w->parseMessageForPlaceHolder($element->default, $data);
			if ($element->eval == "1") {
				$default = @eval(stripslashes($default));
				FabrikWorker::logEval($default, 'Caught exception on eval in '.$element->name.'::getDefaultValue() : %s');
			}
			$this->_default = array('label'=>$default, 'link'=>$link);
		}
		return $this->_default;
	}

	/**
	 * can be overwritten by plugin class
	 * determines the value for the element in the form view
	 * @TODO: whats the diff between this and getValue() ?????
	 * $$$ROB - TESTING POINTING getValue() to here
	 * @param array data
	 * @param int when repeating joinded groups we need to know what part of the array to access
	 * @param array options
	 * @return string default value
	 */

	function getValue($data, $repeatCounter = 0, $opts = array() )
	{
		if (!isset($this->defaults)) {
			$this->defaults = array();
		}
		if (!array_key_exists($repeatCounter, $this->defaults)) {
			$groupModel =& $this->getGroup();
			$group			=& $groupModel->getGroup();
			$joinid			= $group->join_id;
			$formModel 	=& $this->_form;
			$element		=& $this->getElement();
			// $$$rob - if no search form data submitted for the search element then the default
			// selection was being applied instead
			if (array_key_exists('use_default', $opts) && $opts['use_default'] == false) {
				$default = '';
			} else {
				$default   = $this->getDefaultValue($data);
			}

			$name = $this->getFullName(false, true, false);

			if ($groupModel->isJoin()) {
				if ($groupModel->canRepeat()) {
					if (array_key_exists('join', $data) && array_key_exists($joinid, $data['join']) && is_array($data['join'][$joinid]) &&  array_key_exists($name, $data['join'][$joinid]) && array_key_exists($repeatCounter, $data['join'][$joinid][$name])) {
						$default = $data['join'][$joinid][$name][$repeatCounter];
					}
				} else {
					// $$$ hugh - seems like data is (sometimes?) still an array
					/*
					if (array_key_exists('join', $data) && array_key_exists($joinid, $data['join']) && is_array($data['join'][$joinid]) && array_key_exists($name, $data['join'][$joinid])) {
						$default = $data['join'][$joinid][$name];
					}
					*/
					if (array_key_exists('join', $data) && array_key_exists($joinid, $data['join']) && is_array($data['join'][$joinid]) && array_key_exists($name, $data['join'][$joinid]) && array_key_exists(0, $data['join'][$joinid][$name]) && is_array($data['join'][$joinid][$name][0])) {
						$default = $data['join'][$joinid][$name][0];
					}
					else if (array_key_exists('join', $data) && array_key_exists($joinid, $data['join']) && is_array($data['join'][$joinid]) && array_key_exists($name, $data['join'][$joinid])) {
						$default = $data['join'][$joinid][$name];
					}
				}
			} else {
				if ($groupModel->canRepeat()) {
					//repeat group NO join
					if (array_key_exists($name, $data)) {
						if (is_array($data[$name])) {
							//occurs on form submission for fields at least
							$a = $data[$name];
						} else {
							//occurs when getting from the db
							$a = 	explode(GROUPSPLITTER, $data[$name]);
						}
						$default = JArrayHelper::getValue($a, $repeatCounter, $default);
					}

				} else {
					if (array_key_exists($name, $data)) {
						$default = JArrayHelper::getValue($data, $name);
					}
				}
			}
			if ($default === '') { //query string for joined data
				$default = JArrayHelper::getValue($data, $name);
			}
			$element->default = $default;
			//stops this getting called from form validation code as it messes up repeated/join group validations
			if (array_key_exists('runplugins', $opts) && $opts['runplugins'] == 1) {
				$formModel->getPluginManager()->runPlugins('onGetElementDefault', $formModel, 'form', $this);
			}
			if (is_array($element->default)) {
				$element->default = implode(GROUPSPLITTER2, $element->default);
			}
			$this->defaults[$repeatCounter] = $element->default;

		}
		return $this->defaults[$repeatCounter];
	}

	/**
	 *
	 * @param string url
	 * @return string url
	 */
	function _getSmartLinkType ($link) {
		/* $$$ hugh - not really sure how much of this is necessary, like setting different widths
		 * and heights for different social video sites.  I copied the numbers from the examples page
		 * for mediabox: http://iaian7.com/webcode/mediaboxAdvanced
		 */
		$ret = array (
			'width' => '800',
			'height' => '600',
			'type' => 'mediabox'
			);
			if (preg_match('#^http://([\w\.]+)/#',$link,$matches)) {
				$site = $matches[1];
				// @TODO should probably make this a little more intelligent, like optional www,
				// and check for site specific spoor in the URL (like '/videoplay' for google,
				// '/photos' for flicker, etc).
				switch ($site) {
					case 'www.flickr.com':
						$ret['width'] = '400';
						$ret['height'] = '300';
						$ret['type'] = 'social';
						break;
					case 'video.google.com':
						$ret['width'] = '640';
						$ret['height'] = '400';
						$ret['type'] = 'social';
						break;
					case 'www.metacafe.com':
						$ret['width'] = '400';
						$ret['height'] = '350';
						$ret['type'] = 'social';
						break;
					case 'vids.myspace.com':
						$ret['width'] = '430';
						$ret['height'] = '346';
						$ret['type'] = 'social';
						break;
					case 'myspacetv.com':
						$ret['width'] = '430';
						$ret['height'] = '346';
						$ret['type'] = 'social';
						break;
					case 'www.revver.com':
						$ret['width'] = '480';
						$ret['height'] = '392';
						$ret['type'] = 'social';
						break;
					case 'www.seesmic.com':
						$ret['width'] = '425';
						$ret['height'] = '353';
						$ret['type'] = 'social';
						break;
					case 'www.youtube.com':
						$ret['width'] = '480';
						$ret['height'] = '380';
						$ret['type'] = 'social';
						break;
					case 'www.veoh.com':
						$ret['width'] = '540';
						$ret['height'] = '438';
						$ret['type'] = 'social';
						break;
					case 'www.viddler.com':
						$ret['width'] = '437';
						$ret['height'] = '370';
						$ret['type'] = 'social';
						break;
					case 'vimeo.com':
						$ret['width'] = '400';
						$ret['height'] = '302';
						$ret['type'] = 'social';
						break;
					case '12seconds.tv':
						$ret['width'] = '431';
						$ret['height'] = '359';
						$ret['type'] = 'social';
						break;
				}
				if ($ret['type'] == 'mediabox') {
					$ext = strtolower(JFile::getExt($link));
					switch ($ext) {
						case 'swf':
						case 'flv':
						case 'mp4':
							$ret['width'] = '640';
							$ret['height'] = '360';
							$ret['type'] = 'flash';
							break;
						case 'mp3':
							$ret['width'] = '400';
							$ret['height'] = '20';
							$ret['type'] = 'audio';
							break;
					}
				}
			}
			return $ret;
	}

	/**
	 *
	 * Examples of where this would be overwritten include drop downs whos "please select" value might be "-1"
	 * @param string data posted from form to check
	 * @param int repeat group counter
	 * @return bol if data is considered empty then returns true
	 */

	function dataConsideredEmpty($data, $repeatCounter)
	{
		$data = strip_tags($data);
		if (trim($data) == '' || $data == GROUPSPLITTER2 || $data == '<a target="_self" href=""></a>') {
			return true;
		}
		return false;
	}
}
?>