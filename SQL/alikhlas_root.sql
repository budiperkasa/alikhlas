-- phpMyAdmin SQL Dump
-- version 3.4.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 14, 2011 at 10:57 AM
-- Server version: 5.0.91
-- PHP Version: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `alikhlas_root`
--

-- --------------------------------------------------------

--
-- Table structure for table `jos_banner`
--

CREATE TABLE IF NOT EXISTS `jos_banner` (
  `bid` int(11) NOT NULL auto_increment,
  `cid` int(11) NOT NULL default '0',
  `type` varchar(90) NOT NULL default 'banner',
  `name` text NOT NULL,
  `alias` varchar(255) NOT NULL default '',
  `imptotal` int(11) NOT NULL default '0',
  `impmade` int(11) NOT NULL default '0',
  `clicks` int(11) NOT NULL default '0',
  `imageurl` varchar(100) NOT NULL default '',
  `clickurl` varchar(200) NOT NULL default '',
  `date` datetime default NULL,
  `showBanner` tinyint(1) NOT NULL default '0',
  `checked_out` tinyint(1) NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `editor` varchar(150) default NULL,
  `custombannercode` text,
  `catid` int(10) unsigned NOT NULL default '0',
  `description` text NOT NULL,
  `sticky` tinyint(1) unsigned NOT NULL default '0',
  `ordering` int(11) NOT NULL default '0',
  `publish_up` datetime NOT NULL default '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL default '0000-00-00 00:00:00',
  `tags` text NOT NULL,
  `params` text NOT NULL,
  PRIMARY KEY  (`bid`),
  KEY `viewbanner` (`showBanner`),
  KEY `idx_banner_catid` (`catid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `jos_banner`
--

INSERT INTO `jos_banner` (`bid`, `cid`, `type`, `name`, `alias`, `imptotal`, `impmade`, `clicks`, `imageurl`, `clickurl`, `date`, `showBanner`, `checked_out`, `checked_out_time`, `editor`, `custombannercode`, `catid`, `description`, `sticky`, `ordering`, `publish_up`, `publish_down`, `tags`, `params`) VALUES
(1, 1, 'banner', 'OSM 1', 'osm-1', 0, 43, 0, 'osmbanner1.png', 'http://www.opensourcematters.org', '2004-07-07 15:31:29', 1, 0, '0000-00-00 00:00:00', '', '', 13, '', 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(2, 1, 'banner', 'OSM 2', 'osm-2', 0, 49, 0, 'osmbanner2.png', 'http://www.opensourcematters.org', '2004-07-07 15:31:29', 1, 0, '0000-00-00 00:00:00', '', '', 13, '', 0, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `jos_bannerclient`
--

CREATE TABLE IF NOT EXISTS `jos_bannerclient` (
  `cid` int(11) NOT NULL auto_increment,
  `name` text NOT NULL,
  `contact` text NOT NULL,
  `email` varchar(255) NOT NULL default '',
  `extrainfo` text NOT NULL,
  `checked_out` tinyint(1) NOT NULL default '0',
  `checked_out_time` time default NULL,
  `editor` varchar(150) default NULL,
  PRIMARY KEY  (`cid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `jos_bannerclient`
--

INSERT INTO `jos_bannerclient` (`cid`, `name`, `contact`, `email`, `extrainfo`, `checked_out`, `checked_out_time`, `editor`) VALUES
(1, 'Open Source Matters', 'Administrator', 'admin@opensourcematters.org', '', 0, '00:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jos_bannertrack`
--

CREATE TABLE IF NOT EXISTS `jos_bannertrack` (
  `track_date` date NOT NULL,
  `track_type` int(10) unsigned NOT NULL,
  `banner_id` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jos_categories`
--

CREATE TABLE IF NOT EXISTS `jos_categories` (
  `id` int(11) NOT NULL auto_increment,
  `parent_id` int(11) NOT NULL default '0',
  `title` text NOT NULL,
  `name` text NOT NULL,
  `alias` varchar(255) NOT NULL default '',
  `image` varchar(255) NOT NULL default '',
  `section` varchar(150) NOT NULL default '',
  `image_position` varchar(90) NOT NULL default '',
  `description` text NOT NULL,
  `published` tinyint(1) NOT NULL default '0',
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `editor` varchar(150) default NULL,
  `ordering` int(11) NOT NULL default '0',
  `access` tinyint(3) unsigned NOT NULL default '0',
  `count` int(11) NOT NULL default '0',
  `params` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `cat_idx` (`section`,`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=43 ;

--
-- Dumping data for table `jos_categories`
--

INSERT INTO `jos_categories` (`id`, `parent_id`, `title`, `name`, `alias`, `image`, `section`, `image_position`, `description`, `published`, `checked_out`, `checked_out_time`, `editor`, `ordering`, `access`, `count`, `params`) VALUES
(2, 0, 'Joomla! Specific Links', '', 'joomla-specific-links', 'clock.jpg', 'com_weblinks', 'left', 'A selection of links that are all related to the Joomla! Project.', 1, 0, '0000-00-00 00:00:00', NULL, 1, 0, 0, ''),
(4, 0, 'Joomla!', '', 'joomla', '', 'com_newsfeeds', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 2, 0, 0, ''),
(5, 0, 'General', '', 'general', '', 'com_newsfeeds', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 6, 0, 0, ''),
(6, 0, 'Linux', '', 'linux', '', 'com_newsfeeds', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 1, 0, 0, ''),
(12, 0, 'Contacts', '', 'contacts', '', 'com_contact_details', 'left', 'Contact Details for this Web site', 1, 0, '0000-00-00 00:00:00', NULL, 0, 0, 0, ''),
(13, 0, 'Joomla', '', 'joomla', '', 'com_banner', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 0, 0, 0, ''),
(15, 0, 'Features', '', 'features', '', 'com_content', 'left', '', 0, 0, '0000-00-00 00:00:00', NULL, 6, 0, 0, ''),
(17, 0, 'Benefits', '', 'benefits', '', 'com_content', 'left', '', 0, 0, '0000-00-00 00:00:00', NULL, 4, 0, 0, ''),
(18, 0, 'Platforms', '', 'platforms', '', 'com_content', 'left', '', 0, 0, '0000-00-00 00:00:00', NULL, 3, 0, 0, ''),
(19, 0, 'Other Resources', '', 'other-resources', '', 'com_weblinks', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 2, 0, 0, ''),
(29, 0, 'The CMS', '', 'the-cms', 'powered_by.png', '4', 'right', 'Joomla! provides plenty of flexibility when displaying your Web content. Whether you are using Joomla! for a blog site, news or a Web site for a company, you''ll find one or more content styles to showcase your information. You can also change the style of content dynamically depending on your preferences. Joomla! calls how a page is laid out a layout. Use the guide below to understand which layouts are available and how you might use them.', 1, 0, '0000-00-00 00:00:00', NULL, 2, 0, 0, ''),
(34, 0, 'YOOtheme', '', 'yootheme', '', '5', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 1, 0, 0, ''),
(35, 0, 'YOOcarousel', '', 'yoocarousel', '', '5', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 2, 0, 0, ''),
(36, 0, 'YOOscroller', '', 'yooscroller', '', '5', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 3, 0, 0, ''),
(37, 0, 'Profile', '', 'profile', '', '7', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 3, 0, 0, ''),
(38, 0, 'MTs', '', 'mts', '', '6', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 1, 0, 0, ''),
(39, 0, 'MDA', '', 'mda', '', '6', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 2, 0, 0, ''),
(40, 0, 'Raudhotul Atfal', '', 'raudhotul-atfal', '', '6', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 3, 0, 0, ''),
(41, 0, 'TPA', '', 'tpa', '', '6', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 4, 0, 0, ''),
(42, 0, 'Badan Wakaf', '', 'badan-wakaf', '', '7', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 4, 0, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `jos_components`
--

CREATE TABLE IF NOT EXISTS `jos_components` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(150) NOT NULL default '',
  `link` varchar(255) NOT NULL default '',
  `menuid` int(11) unsigned NOT NULL default '0',
  `parent` int(11) unsigned NOT NULL default '0',
  `admin_menu_link` varchar(255) NOT NULL default '',
  `admin_menu_alt` text NOT NULL,
  `option` varchar(50) NOT NULL default '',
  `ordering` int(11) NOT NULL default '0',
  `admin_menu_img` varchar(255) NOT NULL default '',
  `iscore` tinyint(4) NOT NULL default '0',
  `params` text NOT NULL,
  `enabled` tinyint(4) NOT NULL default '1',
  PRIMARY KEY  (`id`),
  KEY `parent_option` (`parent`,`option`(32))
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=57 ;

--
-- Dumping data for table `jos_components`
--

INSERT INTO `jos_components` (`id`, `name`, `link`, `menuid`, `parent`, `admin_menu_link`, `admin_menu_alt`, `option`, `ordering`, `admin_menu_img`, `iscore`, `params`, `enabled`) VALUES
(1, 'Banners', '', 0, 0, '', 'Banner Management', 'com_banners', 0, 'js/ThemeOffice/component.png', 0, 'track_impressions=0\ntrack_clicks=0\ntag_prefix=\n\n', 1),
(2, 'Banners', '', 0, 1, 'option=com_banners', 'Active Banners', 'com_banners', 1, 'js/ThemeOffice/edit.png', 0, '', 1),
(3, 'Clients', '', 0, 1, 'option=com_banners&c=client', 'Manage Clients', 'com_banners', 2, 'js/ThemeOffice/categories.png', 0, '', 1),
(4, 'Web Links', 'option=com_weblinks', 0, 0, '', 'Manage Weblinks', 'com_weblinks', 0, 'js/ThemeOffice/component.png', 0, 'show_comp_description=1\ncomp_description=\nshow_link_hits=1\nshow_link_description=1\nshow_other_cats=1\nshow_headings=1\nshow_page_title=1\nlink_target=0\nlink_icons=\n\n', 1),
(5, 'Links', '', 0, 4, 'option=com_weblinks', 'View existing weblinks', 'com_weblinks', 1, 'js/ThemeOffice/edit.png', 0, '', 1),
(6, 'Categories', '', 0, 4, 'option=com_categories&section=com_weblinks', 'Manage weblink categories', '', 2, 'js/ThemeOffice/categories.png', 0, '', 1),
(7, 'Contacts', 'option=com_contact', 0, 0, '', 'Edit contact details', 'com_contact', 0, 'js/ThemeOffice/component.png', 1, 'contact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_fax=\nicon_misc=\nshow_headings=1\nshow_position=1\nshow_email=0\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nbannedEmail=\nbannedSubject=\nbannedText=\nsession=1\ncustomReply=0\n\n', 1),
(8, 'Contacts', '', 0, 7, 'option=com_contact', 'Edit contact details', 'com_contact', 0, 'js/ThemeOffice/edit.png', 1, '', 1),
(9, 'Categories', '', 0, 7, 'option=com_categories&section=com_contact_details', 'Manage contact categories', '', 2, 'js/ThemeOffice/categories.png', 1, '', 1),
(10, 'Polls', 'option=com_poll', 0, 0, 'option=com_poll', 'Manage Polls', 'com_poll', 0, 'js/ThemeOffice/component.png', 0, '', 1),
(11, 'News Feeds', 'option=com_newsfeeds', 0, 0, '', 'News Feeds Management', 'com_newsfeeds', 0, 'js/ThemeOffice/component.png', 0, '', 1),
(12, 'Feeds', '', 0, 11, 'option=com_newsfeeds', 'Manage News Feeds', 'com_newsfeeds', 1, 'js/ThemeOffice/edit.png', 0, '', 1),
(13, 'Categories', '', 0, 11, 'option=com_categories&section=com_newsfeeds', 'Manage Categories', '', 2, 'js/ThemeOffice/categories.png', 0, '', 1),
(14, 'User', 'option=com_user', 0, 0, '', '', 'com_user', 0, '', 1, '', 1),
(15, 'Search', 'option=com_search', 0, 0, 'option=com_search', 'Search Statistics', 'com_search', 0, 'js/ThemeOffice/component.png', 1, 'enabled=0\n\n', 1),
(16, 'Categories', '', 0, 1, 'option=com_categories&section=com_banner', 'Categories', '', 3, '', 1, '', 1),
(17, 'Wrapper', 'option=com_wrapper', 0, 0, '', 'Wrapper', 'com_wrapper', 0, '', 1, '', 1),
(18, 'Mail To', '', 0, 0, '', '', 'com_mailto', 0, '', 1, '', 1),
(19, 'Media Manager', '', 0, 0, 'option=com_media', 'Media Manager', 'com_media', 0, '', 1, 'upload_extensions=bmp,csv,doc,epg,gif,ico,jpg,odg,odp,ods,odt,pdf,png,ppt,swf,txt,xcf,xls,BMP,CSV,DOC,EPG,GIF,ICO,JPG,ODG,ODP,ODS,ODT,PDF,PNG,PPT,SWF,TXT,XCF,XLS\nupload_maxsize=10000000\nfile_path=images\nimage_path=images/stories\nrestrict_uploads=1\nallowed_media_usergroup=3\ncheck_mime=1\nimage_extensions=bmp,gif,jpg,png\nignore_extensions=\nupload_mime=image/jpeg,image/gif,image/png,image/bmp,application/x-shockwave-flash,application/msword,application/excel,application/pdf,application/powerpoint,text/plain,application/x-zip\nupload_mime_illegal=text/html\nenable_flash=1\n\n', 1),
(20, 'Articles', 'option=com_content', 0, 0, '', '', 'com_content', 0, '', 1, 'show_noauth=0\nshow_title=1\nlink_titles=1\nshow_intro=1\nshow_section=0\nlink_section=1\nshow_category=0\nlink_category=1\nshow_author=1\nshow_create_date=1\nshow_modify_date=1\nshow_item_navigation=0\nshow_readmore=1\nshow_vote=0\nshow_icons=1\nshow_pdf_icon=1\nshow_print_icon=1\nshow_email_icon=1\nshow_hits=1\nfeed_summary=0\nfilter_groups=29|18|19|20|21|30|23|24\nfilter_type=BL\nfilter_tags=\nfilter_attritbutes=\n\n', 1),
(21, 'Configuration Manager', '', 0, 0, '', 'Configuration', 'com_config', 0, '', 1, '', 1),
(22, 'Installation Manager', '', 0, 0, '', 'Installer', 'com_installer', 0, '', 1, '', 1),
(23, 'Language Manager', '', 0, 0, '', 'Languages', 'com_languages', 0, '', 1, '', 1),
(24, 'Mass mail', '', 0, 0, '', 'Mass Mail', 'com_massmail', 0, '', 1, 'mailSubjectPrefix=\nmailBodySuffix=\n\n', 1),
(25, 'Menu Editor', '', 0, 0, '', 'Menu Editor', 'com_menus', 0, '', 1, '', 1),
(27, 'Messaging', '', 0, 0, '', 'Messages', 'com_messages', 0, '', 1, '', 1),
(28, 'Modules Manager', '', 0, 0, '', 'Modules', 'com_modules', 0, '', 1, '', 1),
(29, 'Plugin Manager', '', 0, 0, '', 'Plugins', 'com_plugins', 0, '', 1, '', 1),
(30, 'Template Manager', '', 0, 0, '', 'Templates', 'com_templates', 0, '', 1, '', 1),
(31, 'User Manager', '', 0, 0, '', 'Users', 'com_users', 0, '', 1, 'allowUserRegistration=0\nnew_usertype=Registered\nuseractivation=1\nfrontend_userparams=1\n\n', 1),
(32, 'Cache Manager', '', 0, 0, '', 'Cache', 'com_cache', 0, '', 1, '', 1),
(33, 'Control Panel', '', 0, 0, '', 'Control Panel', 'com_cpanel', 0, '', 1, '', 1),
(35, 'Zoo', 'option=com_zoo', 0, 0, 'option=com_zoo', 'Zoo', 'com_zoo', 0, 'components/com_zoo/assets/images/zoo_16.png', 0, '', 1),
(36, 'JCE', 'option=com_jce', 0, 0, 'option=com_jce', 'JCE', 'com_jce', 0, 'components/com_jce/media/img/menu/logo.png', 0, '', 1),
(37, 'WF_MENU_CPANEL', '', 0, 36, 'option=com_jce', 'WF_MENU_CPANEL', 'com_jce', 0, 'components/com_jce/media/img/menu/jce-cpanel.png', 0, '', 1),
(38, 'WF_MENU_CONFIG', '', 0, 36, 'option=com_jce&view=config', 'WF_MENU_CONFIG', 'com_jce', 1, 'components/com_jce/media/img/menu/jce-config.png', 0, '', 1),
(39, 'WF_MENU_PROFILES', '', 0, 36, 'option=com_jce&view=profiles', 'WF_MENU_PROFILES', 'com_jce', 2, 'components/com_jce/media/img/menu/jce-profiles.png', 0, '', 1),
(40, 'WF_MENU_INSTALL', '', 0, 36, 'option=com_jce&view=installer', 'WF_MENU_INSTALL', 'com_jce', 3, 'components/com_jce/media/img/menu/jce-install.png', 0, '', 1),
(47, 'eXtplorer', 'option=com_extplorer', 0, 0, 'option=com_extplorer', 'eXtplorer', 'com_extplorer', 0, '../administrator/components/com_extplorer/images/joomla_x_icon.png', 0, '', 1),
(48, 'Joomshopping', 'option=com_jshopping', 0, 0, 'option=com_jshopping', 'Joomshopping', 'com_jshopping', 0, 'components/com_jshopping/images/jshop_logo_s.png', 0, '', 1),
(43, 'virtuemart_version', '', 0, 9999, '', '', '', 0, '', 0, 'RELEASE=1.1.9\nDEV_STATUS=stable', 1),
(50, 'Products', '', 0, 48, 'option=com_jshopping&controller=products&category_id=0', 'Products', 'com_jshopping', 1, 'components/com_jshopping/images/jshop_products_s.png', 0, '', 1),
(51, 'Orders', '', 0, 48, 'option=com_jshopping&controller=orders', 'Orders', 'com_jshopping', 2, 'components/com_jshopping/images/jshop_orders_s.png', 0, '', 1),
(52, 'Clients', '', 0, 48, 'option=com_jshopping&controller=users', 'Clients', 'com_jshopping', 3, 'components/com_jshopping/images/jshop_users_s.png', 0, '', 1),
(53, 'Options', '', 0, 48, 'option=com_jshopping&controller=other', 'Options', 'com_jshopping', 4, 'components/com_jshopping/images/jshop_options_s.png', 0, '', 1),
(54, 'Configuration', '', 0, 48, 'option=com_jshopping&controller=config', 'Configuration', 'com_jshopping', 5, 'components/com_jshopping/images/jshop_configuration_s.png', 0, '', 1),
(55, 'Install & Update', '', 0, 48, 'option=com_jshopping&controller=update', 'Install & Update', 'com_jshopping', 6, 'components/com_jshopping/images/jshop_update_s.png', 0, '', 1),
(49, 'Categories', '', 0, 48, 'option=com_jshopping&controller=categories&catid=0', 'Categories', 'com_jshopping', 0, 'components/com_jshopping/images/jshop_categories_s.png', 0, '', 1),
(56, 'About us', '', 0, 48, 'option=com_jshopping&controller=info', 'About us', 'com_jshopping', 7, 'components/com_jshopping/images/jshop_info_s.png', 0, '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `jos_contact_details`
--

CREATE TABLE IF NOT EXISTS `jos_contact_details` (
  `id` int(11) NOT NULL auto_increment,
  `name` text NOT NULL,
  `alias` varchar(255) NOT NULL default '',
  `con_position` text,
  `address` text,
  `suburb` text,
  `state` text,
  `country` text,
  `postcode` varchar(255) default NULL,
  `telephone` varchar(255) default NULL,
  `fax` varchar(255) default NULL,
  `misc` mediumtext,
  `image` varchar(255) default NULL,
  `imagepos` varchar(60) default NULL,
  `email_to` varchar(255) default NULL,
  `default_con` tinyint(1) unsigned NOT NULL default '0',
  `published` tinyint(1) unsigned NOT NULL default '0',
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL default '0',
  `params` text NOT NULL,
  `user_id` int(11) NOT NULL default '0',
  `catid` int(11) NOT NULL default '0',
  `access` tinyint(3) unsigned NOT NULL default '0',
  `mobile` varchar(255) NOT NULL default '',
  `webpage` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `jos_contact_details`
--

INSERT INTO `jos_contact_details` (`id`, `name`, `alias`, `con_position`, `address`, `suburb`, `state`, `country`, `postcode`, `telephone`, `fax`, `misc`, `image`, `imagepos`, `email_to`, `default_con`, `published`, `checked_out`, `checked_out_time`, `ordering`, `params`, `user_id`, `catid`, `access`, `mobile`, `webpage`) VALUES
(1, 'Name 1', 'name-1', 'Position', 'Street', 'Suburb', 'State', 'Country', 'Zip Code', 'Telephone', 'Fax', 'Miscellanous info', 'articles.jpg', 'top', 'email@email.com', 0, 1, 62, '2008-12-15 15:46:45', 1, 'show_name=1\nshow_position=1\nshow_email=1\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=1\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=1\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 12, 0, '', ''),
(2, 'Name 2', 'name-2', '', 'Street Address', 'Town', 'State', 'Country', 'Postal Code', 'Telephone', 'Fax', 'Informations', 'clock.jpg', NULL, '', 0, 1, 0, '0000-00-00 00:00:00', 2, 'show_name=1\nshow_position=1\nshow_email=1\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=1\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 12, 0, 'Mobile Phone', 'http://Web URL');

-- --------------------------------------------------------

--
-- Table structure for table `jos_content`
--

CREATE TABLE IF NOT EXISTS `jos_content` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `title` text NOT NULL,
  `alias` varchar(255) NOT NULL default '',
  `title_alias` text NOT NULL,
  `introtext` mediumtext NOT NULL,
  `fulltext` mediumtext NOT NULL,
  `state` tinyint(3) NOT NULL default '0',
  `sectionid` int(11) unsigned NOT NULL default '0',
  `mask` int(11) unsigned NOT NULL default '0',
  `catid` int(11) unsigned NOT NULL default '0',
  `created` datetime NOT NULL default '0000-00-00 00:00:00',
  `created_by` int(11) unsigned NOT NULL default '0',
  `created_by_alias` text NOT NULL,
  `modified` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` int(11) unsigned NOT NULL default '0',
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL default '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL default '0000-00-00 00:00:00',
  `images` text NOT NULL,
  `urls` text NOT NULL,
  `attribs` text NOT NULL,
  `version` int(11) unsigned NOT NULL default '1',
  `parentid` int(11) unsigned NOT NULL default '0',
  `ordering` int(11) NOT NULL default '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `access` int(11) unsigned NOT NULL default '0',
  `hits` int(11) unsigned NOT NULL default '0',
  `metadata` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `idx_section` (`sectionid`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=92 ;

--
-- Dumping data for table `jos_content`
--

INSERT INTO `jos_content` (`id`, `title`, `alias`, `title_alias`, `introtext`, `fulltext`, `state`, `sectionid`, `mask`, `catid`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `images`, `urls`, `attribs`, `version`, `parentid`, `ordering`, `metakey`, `metadesc`, `access`, `hits`, `metadata`) VALUES
(1, 'Welcome to Joomla!', 'welcome-to-joomla', '', '<strong>Joomla! is a free open source framework and content publishing system designed for quickly creating highly interactive multi-language Web sites, online communities, media portals, blogs and eCommerce applications.</strong>\r\n\r\n<p>Joomla! provides an easy-to-use graphical user interface that simplifies the management and publishing of large volumes of content including HTML, documents, and rich media.  Joomla! is used by organisations of all sizes for Public Web sites, Intranets, and Extranets and is supported by a community of thousands of users.</p>\r\n', '\r\nWith a fully documented library of developer resources, Joomla! allows the customisation of every aspect of a Web site including presentation, layout, administration, and the rapid integration with third-party applications.\r\n\r\n<p>Joomla! has a rich heritage and has been crowned CMS king many times over.  Now with more power under the hood, Joomla! is shifting gear and provides developer power while making the user experience all the more friendly.  For those who always wanted increased extensibility, Joomla! 1.5 can make this happen.</p>\r\n\r\n<p>A new framework, ground-up refactoring, and a highly-active development team brings the excitement of ''the next generation CMS'' to your fingertips.  Whether you are a systems architect or a complete ''noob'' Joomla! can take you to the next level of content delivery. ''More than a CMS'' is something we have been playing with as a catchcry because the new Joomla! API has such incredible power and flexibility, you are free to take whatever direction your creative mind takes you and Joomla! can help you get there so much more easily than ever before.</p>\r\n\r\n<p>Thinking Web publishing? Think Joomla!</p>', 1, 4, 0, 29, '2006-10-13 10:00:00', 62, '', '2008-12-16 15:36:38', 62, 0, '0000-00-00 00:00:00', '2006-01-03 01:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 40, 0, 1, '', '', 0, 109, 'robots=\nauthor='),
(5, 'Joomla! License Guidelines', 'joomla-license-guidelines', 'joomla-license-guidelines', '<p>This Web site is powered by <a href="http://www.joomla.org/">Joomla!</a> The software and default templates on which it runs are Copyright 2005-2007 <a href="http://www.opensourcematters.org/">Open Source Matters</a>.  All other content and data, including data entered into this Web site and templates added after installation, are copyrighted by their respective copyright owners.</p>\r\n\r\n<p>If you want to distribute, copy, or modify Joomla!, you are welcome to do so under the terms of the <a href="http://www.gnu.org/licenses/old-licenses/gpl-2.0.html#SEC1">GNU General Public License</a>.  If you are unfamiliar with this license, you might want to read <a href="http://www.gnu.org/licenses/old-licenses/gpl-2.0.html#SEC4">''How To Apply These Terms To Your Program''</a> and the <a href="http://www.gnu.org/licenses/old-licenses/gpl-2.0-faq.html">''GNU General Public License FAQ''</a>.</p>\r\n', '\r\n<p>Joomla! documentation is released under the terms of the <a href="http://creativecommons.org/licenses/by-nc-sa/2.5/" title="Creative Commons ">Creative Commons Attribution-Non-Commercial-Share-Alike License 2.5</a> or by the specific license of their respective copyright owners.</p>\r\n\r\n<p>The Joomla! licence has always been GPL.</p>', 1, 4, 0, 29, '2004-08-20 10:11:07', 62, '', '2008-12-16 15:45:30', 62, 0, '0000-00-00 00:00:00', '2004-08-19 06:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 9, 0, 5, '', '', 0, 127, 'robots=\nauthor='),
(18, 'Joomla! Features', 'joomla-features', '', '<h4>Joomla! features:</h4>\r\n<ul>\r\n	<li>Completely database driven site engines </li>\r\n	<li>News, products, or services sections fully editable and manageable</li>\r\n	<li>Topics sections can be added to by contributing Authors </li>\r\n	<li>Fully customisable layouts including <em>left</em>, <em>center</em>, and <em>right </em>Menu boxes </li>\r\n	<li>Browser upload of images to your own library for use anywhere in the site </li>\r\n	<li>Dynamic Forum/Poll/Voting booth for on-the-spot results </li>\r\n	<li>Runs on Linux, FreeBSD, MacOSX server, Solaris, and AIX</li>\r\n</ul>\r\n', '\r\n<h4>Extensive Administration:</h4>\r\n<ul>\r\n	<li>Change order of objects including news, FAQs, Articles etc. </li>\r\n	<li>Random Newsflash generator </li>\r\n	<li>Remote Author submission Module for News, Articles, FAQs, and Links </li>\r\n	<li>Object hierarchy - as many Sections, departments, divisions, and pages as you want </li>\r\n	<li>Image library - store all your PNGs, PDFs, DOCs, XLSs, GIFs, and JPEGs online for easy use </li>\r\n	<li>Automatic Path-Finder. Place a picture and let Joomla! fix the link </li>\r\n	<li>News Feed Manager. Choose from over 360 News Feeds from around the world </li>\r\n	<li>E-mail a friend and Print format available for every story and Article </li>\r\n	<li>In-line Text editor similar to any basic word processor software </li>\r\n	<li>User editable look and feel </li>\r\n	<li>Polls/Surveys - Now put a different one on each page </li>\r\n	<li>Custom Page Modules. Download custom page Modules to spice up your site </li>\r\n	<li>Template Manager. Download Templates and implement them in seconds </li>\r\n	<li>Layout preview. See how it looks before going live </li>\r\n	<li>Banner Manager. Make money out of your site</li>\r\n</ul>', 1, 4, 0, 29, '2006-10-08 23:32:45', 62, '', '2008-12-16 15:41:08', 62, 0, '0000-00-00 00:00:00', '2006-10-07 06:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 15, 0, 3, '', '', 0, 74, 'robots=\nauthor='),
(19, 'Joomla! Overview', 'joomla-overview', '', '<p>If you''re new to Web publishing systems, you''ll find that Joomla! delivers sophisticated solutions to your online needs. It can deliver a robust enterprise-level Web site, empowered by endless extensibility for your bespoke publishing needs. Moreover, it is often the system of choice for small business or home users who want a professional looking site that''s simple to deploy and use. <em>We do content right</em>.<br />\r\n</p>\r\n\r\n<p><strong>So what''s the catch? How much does this system cost?</strong></p>\r\n\r\n<p> Well, there''s good news ... and more good news! Joomla! 1.5 is free, it is released under an Open Source license - the GNU/General Public License v 2.0. Had you invested in a mainstream, commercial alternative, there''d be nothing but moths left in your wallet and to add new functionality would probably mean taking out a second mortgage each time you wanted something adding!</p>\r\n\r\n', '\r\n\r\n<p>Joomla! changes all that ... <br />\r\n	Joomla! is different from the normal models for content management software. For a start, it''s not complicated. Joomla! has been developed for everybody, and anybody can develop it further. It is designed to work (primarily) with other Open Source, free, software such as PHP, MySQL, and Apache. </p>\r\n	\r\n<p>It is easy to install and administer, and is reliable. </p>\r\n\r\n<p>Joomla! doesn''t even require the user or administrator of the system to know HTML to operate it once it''s up and running.</p>\r\n\r\n<p>To get the perfect Web site with all the functionality that you require for your particular application may take additional time and effort, but with the Joomla! Community support that is available and the many Third Party Developers actively creating and releasing new Extensions for the 1.5 platform on an almost daily basis, there is likely to be something out there to meet your needs. Or you could develop your own Extensions and make these available to the rest of the community. </p>', 1, 4, 0, 29, '2006-10-13 07:49:20', 62, '', '2008-12-16 15:47:44', 62, 0, '0000-00-00 00:00:00', '2006-10-07 10:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 22, 0, 2, '', '', 0, 245, 'robots=\nauthor='),
(20, 'Support and Documentation', 'support-and-documentation', '', '<h3>Support</h3>\r\n\r\n<p>Support for the Joomla! CMS can be found on several places. The best place to start would be the official <a href="http://help.joomla.org/" target="_blank">Help Site</a>. Here you can help yourself to the information that is regularly published and updated as Joomla! develops. There is much more to come too! </p>\r\n<p>Of course you should not forget the Help System of the CMS itself. On the <em>topmenu </em>in the Back-end Control panel you find the Help button which will provide you with lots of explanation on features. </p>\r\n\r\n<p>Another great place would of course be the <a href="http://forum.joomla.org/" target="_blank">Forum</a> . On the Joomla! Forum you can find help and support from Community members as well as from Joomla! Core members and Working Group members. The forum contains a lot of information, FAQ''s, just about anything you are looking for in terms of support.</p>\r\n', '\r\n<p>Two other resources for Support are the <a href="http://dev.joomla.org/" target="_blank">Joomla! Developer Network</a> (JDN) and the <a href="http://extensions.joomla.org/" target="_blank">Joomla! Extensions Directory</a> (JED). The Developer Network for example provides lots of technical information for the experienced Developer as well as those new to Joomla! and development work in general. The JED whilst not a support site in the strictest sense has many of the Extensions that you will need as you develop your own Web site. </p>\r\n\r\n<p>The Joomla! Core members are regularly posting their blog reports about several topics such as programming techniques used in Joomla!, Security, Events and more. You can even subscribe to get notified by e-mail when a new blog post is made! </p>\r\n\r\n<h3>Documentation </h3>\r\n\r\n<p>Joomla! Documentation can of course be found on the <a href="http://help.joomla.org/" target="_blank">Help Site</a>. You can find information such as an Installation Guide, User and Administrator manuals, Frequently Asked Questions and a lot more. The User Documentation Team are the guardians of the documentation relating to the practical use of Joomla!. The Developer Documentation Team are the stalwarts behind detailing how Joomla! works from the ground up and how you can develop your own Extensions and Templates and much more.</p>\r\n\r\n<p>Other than the documentation provided by the Joomla! Documentation Work Groups there are also books written about Joomla! You can find a listing of these books in the <a href="http://help.joomla.org/content/section/44/254/" target="_blank">Joomla! Bookshelf</a> .</p>\r\n\r\n<h1>Want to help? </h1>\r\n\r\n<p>If you want to help in the documentation project for Joomla! then please post your details on the <a href="http://forum.joomla.org/index.php/board,62.0.html" title="The Joomla! User Documentation Forums">User Documentation Forum</a> or the <a href="http://forum.joomla.org/index.php/board,60.0.html" title="The Joomla! Developer Documentation Forum">Developer Documentation Forum</a> </p>\r\n\r\n<p><a class="urlextern" href="http://forum.joomla.org/index.php/board,391.0.html" target="_blank" title="http://forum.joomla.org/index.php/board,59.0.html" onclick="return svchk()"><br />\r\n	</a></p>', 0, 4, 0, 29, '2006-10-09 08:33:57', 62, '', '2008-12-22 19:39:55', 62, 0, '0000-00-00 00:00:00', '2006-10-07 10:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 16, 0, 7, '', '', 0, 9, 'robots=\nauthor='),
(23, 'Platforms and Open Standards', 'platforms-and-open-standards', '', '<p>Joomla! runs on any platform including Windows, most flavours of Linux, several Unix versions, and the Apple OS/X platform.  Joomla! depends on PHP and the MySQL database to deliver dynamic content. </p>\r\n<p>The minimum requirements are:</p>\r\n<ul>\r\n	<li>Apache 1.x, 2.x and higher</li>\r\n	<li>PHP 4.3 and higher</li>\r\n	<li>MySQL 3.23 and higher</li>\r\n</ul>\r\nIt will also run on alternative server platforms such as Windows IIS - provided they support PHP and MySQL - but these require additional configuration in order for the Joomla! core package to be successful installed and operated.', '', 1, 4, 0, 29, '2006-10-11 04:22:14', 62, '', '2008-12-16 15:34:16', 62, 0, '0000-00-00 00:00:00', '2006-10-10 08:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 8, 0, 6, '', '', 0, 17, 'robots=\nauthor='),
(27, 'The Joomla! Community', 'the-joomla-community', '', '<p><strong>Got a question? </strong>With more than 140,000 members, the online forums at <a href="http://forum.joomla.org/" target="_blank">forum.joomla.org</a> are a great resource for both new and experienced users. Go ahead, ask your toughest questions, the community is waiting to see what you''re going to do with your Joomla! site.</p>\r\n\r\n<p><strong>Do you want to show off your new Joomla! Web site?</strong> Go ahead, we have a section dedicated to that on our forum. </p>\r\n', '\r\n<p><strong>Do you want to join in?</strong></p>\r\n\r\n<p>If you think working with Joomla! is fun, wait until you start working on it. We''re passionate about helping Joomla! Users make the jump to becoming contributing members of the community, so there are many ways you can help Joomla!''s development:</p>\r\n\r\n<ul>\r\n	<li>Submit news about Joomla!. We syndicate all Joomla! related news on our <a href="http://news.joomla.org" title="Joomla! News Portal">news portal</a>. If you have some Joomla! news that you would like to share with the community, please submit your short story, article, announcement or review <a href="http://www.joomla.org/component/option,com_submissions/Itemid,75" title="Submit News">here</a>.</li>\r\n	<li>Report bugs and request features in our <a href="http://joomlacode.org/gf/project/joomla/tracker/" title="Joomla! developement trackers">trackers</a>. Please read <a href="http://dev.joomla.org/content/view/1450/89/">Reporting Bugs</a>, for details on how we like our bug reports served up</li>\r\n	<li>Submit patches for new and/or fixed behaviour. Please read <a href="http://dev.joomla.org/content/view/14/55/">Submitting Patches</a>, for details on how to submit a patch.</li>\r\n	<li>Join the <a href="http://forum.joomla.org/index.php/board,126.0.html" title="Joomla! development forums">developer forums</a> and share your ideas for how to improve Joomla!. We''re always open to suggestions, although we''re likely to be sceptical of large-scale suggestions without some code to back it up.</li>\r\n	<li>Join any of the <a href="http://dev.joomla.org/content/view/13/53/" title="Joomla! working groups">Joomla!  Working Groups</a> and bring your personal expertise to  the Joomla! community. More info about the different working groups can be found <a href="http://dev.joomla.org/content/view/13/53/" title="Joomla! working groups">on the Working Group Roll Call</a>. </li>\r\n</ul>\r\n\r\n<p> That''s all you need to know if you''d like to join the Joomla! development community. </p>', 1, 4, 0, 29, '2006-10-12 16:50:48', 62, '', '2008-12-16 15:44:55', 62, 0, '0000-00-00 00:00:00', '2006-10-11 02:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 13, 0, 4, '', '', 0, 57, 'robots=\nauthor='),
(45, 'Template', 'template', '', '<h2>Warp5 Framework</h2>\r\n<p>This template is based on the Warp5 framework. Warp5 is a fast and powerful template framework for Joomla that lets you create sophisticated Joomla templates in no time. It provides a hybrid fluid-pixel grid and all the elaborate functionalities that make our templates easy to edit, nice to look at and super fast, in every browser. Visit the <a href="http://warp.yootheme.com" target="_blank">Warp5 website</a> and take a look at all <a href="http://warp.yootheme.com/features" target="_blank">the features...</a></p>\r\n\r\n<div class="floatbox">\r\n\r\n	<div class="float-left width50">\r\n		<div class="correct-png ie6-zoom" style="margin-right: 15px; padding-left: 60px; background: transparent url(images/yootheme/icon_menusystem.png) no-repeat scroll 0 0;">\r\n			<h3 style="padding-top: 5px; margin-top: 0px;">Menu System</h3>\r\n			<p>The menu system enhances Joomla''s menu functions to create clearly arranged interfaces even for comprehensive sites. <a href="http://warp.yootheme.com/menu-system" target="_blank">Learn more...</a></p>\r\n		</div>\r\n	</div>\r\n	\r\n	<div class="float-left width50">\r\n		<div class="correct-png ie6-zoom" style="padding-left: 60px; background: transparent url(images/yootheme/icon_modulesystem.png) no-repeat scroll 0 0;">\r\n			<h3 style="padding-top: 5px; margin-top: 0px;">Module System</h3>\r\n			<p>The module system provides a clear grid for Joomla modules and a wide diversity of templates for module variations. <a href="http://warp.yootheme.com/module-system" target="_blank">Learn more...</a></p>\r\n		</div>\r\n	</div>\r\n	\r\n</div>\r\n\r\n<hr class="dotted" />\r\n\r\n<h2>Design and Styles</h2>\r\n<p>We included a lot of different module and typography styles. So you can give your site a unique look and it will also ease your work when setting up your content.</p>\r\n\r\n<div class="floatbox">\r\n\r\n	<div class="float-left width50">\r\n		<div class="correct-png ie6-zoom" style="margin-right: 15px; padding-left: 60px; background: transparent url(images/yootheme/icon_modulevariations.png) no-repeat scroll 0 0;">\r\n			<h3 style="padding-top: 5px; margin-top: 0px;">Module Variations</h3>\r\n			<p>This template comes with a wide variety of module stylings in many different shapes and colours. Take a look at all the different <a href="index.php?option=com_content&view=article&id=48&Itemid=58">module variations.</a></p>\r\n		</div>\r\n	</div>\r\n	\r\n	<div class="float-left width50">\r\n		<div class="correct-png ie6-zoom" style="padding-left: 60px; background: transparent url(images/yootheme/icon_typography.png) no-repeat scroll 0 0;">\r\n			<h3 style="padding-top: 5px; margin-top: 0px;">Typography</h3>\r\n			<p>This templates delivers you sophisticated typography and various stylings. Take a look at the <a href="index.php?option=com_content&view=article&id=46&Itemid=55">style guide</a> about all possible HTML tag styles.</p>\r\n		</div>\r\n	</div>\r\n	\r\n</div>\r\n\r\n<hr class="dotted" />\r\n\r\n<h2>Installation and Customization</h2>\r\n<p>New to YOOtheme? Don''t worry! We provide a lot help to install and cutomize our tempaltes to get you started right away with your web project.</p>\r\n\r\n<div class="floatbox">\r\n\r\n	<div class="float-left width50">\r\n		<div class="correct-png ie6-zoom" style="margin-right: 15px; padding-left: 60px; background: transparent url(images/yootheme/icon_installation.png) no-repeat scroll 0 0;">\r\n			<h3 style="padding-top: 5px; margin-top: 0px;">Installation Package</h3>\r\n			<p>We provide a full Joomla installation package with the demo content of the website for this template. So you can take a look at how everything is set up in the Joomla backend.</p>\r\n			<div class="info">Make sure you click "Install Sample Data" during the installation process.</div>\r\n		</div>\r\n	</div>\r\n	\r\n	<div class="float-left width50">\r\n		<div class="correct-png ie6-zoom" style="padding-left: 60px; background: transparent url(images/yootheme/icon_fireworks.png) no-repeat scroll 0 0;">\r\n			<h3 style="padding-top: 5px; margin-top: 0px;">Sliced Image Source Files</h3>\r\n			<p>The editable fully sliced image source files of this template are available as download. With them you can completely customise your template''s look to match your or your client''s corporate identity.</p>\r\n			<div class="info">Adobe Fireworks CS4 is required to edit the image source files.</div>\r\n		</div>\r\n	</div>\r\n	\r\n</div>\r\n\r\n<hr class="dotted" />\r\n\r\n<h2>Compatibility</h2>\r\n\r\n<p>This template is fully compatible with all YOOtheme products like the <a target="_blank" href="http://tools.yootheme.com/">YOOtools</a>, the <a target="_blank" href="http://zoo.yootheme.com/">ZOO</a> and the <a target="_blank" href="http://teamlog.yootheme.com/">Teamlog extension</a>.</p>\r\n\r\n<div class="tip ie6-zoom" style="overflow: hidden;">\r\n	\r\n	<p style="margin: 0px;">All YOOtools extensions are working right out of the box. Take a look at the demo pages and watch the video tutorials.</p>\r\n	\r\n	<div class="float-left width50">\r\n		<ul class="checkbox">\r\n			<li style="margin-bottom: 4px; overflow: hidden;">\r\n				<a style="display: block; float: left; width: 100px;" target="_blank" href="http://tools.yootheme.com/extensions/yooaccordion" title="YOOaccordion">YOOaccordion</a>\r\n				<a target="_blank" href="http://tools.yootheme.com/extensions/yooaccordion" title="YOOaccordion">\r\n					<img class="correct-png" style="margin: 0px 0px 0px 5px" src="images/yootheme/features_demo.png" alt="See the live demo" title="See the live demo" width="17" height="17" align="absmiddle"/>\r\n				</a>\r\n				<a href="http://tools.yootheme.com/documentation/item/root/how-to-set-up-the-yooaccordion" target="_blank">\r\n					<img class="correct-png" style="margin: 0px 0px 0px 3px" src="images/yootheme/features_tutorial.png" alt="Watch the video tutorial" title="Watch the video tutorial" width="17" height="17" align="absmiddle"/>\r\n				</a>\r\n			</li>\r\n			<li style="margin-bottom: 4px; overflow: hidden;">\r\n				<a style="display: block; float: left; width: 100px;" target="_blank" href="http://tools.yootheme.com/extensions/yoocarousel" title="YOOcarousel">YOOcarousel</a>\r\n				<a target="_blank" href="http://tools.yootheme.com/extensions/yoocarousel" title="YOOcarousel">\r\n					<img class="correct-png" style="margin: 0px 0px 0px 5px" src="images/yootheme/features_demo.png" alt="See the live demo" title="See the live demo" width="17" height="17" align="absmiddle"/>\r\n				</a>\r\n				<a href="http://tools.yootheme.com/documentation/item/root/how-to-set-up-the-yoocarousel" target="_blank">\r\n					<img class="correct-png" style="margin: 0px 0px 0px 3px" src="images/yootheme/features_tutorial.png" alt="Watch the video tutorial" title="Watch the video tutorial" width="17" height="17" align="absmiddle"/>\r\n				</a>\r\n			</li>\r\n			<li style="margin-bottom: 4px; overflow: hidden;">\r\n				<a style="display: block; float: left; width: 100px;" target="_blank" href="http://tools.yootheme.com/extensions/yoodrawer" title="YOOdrawer">YOOdrawer</a>\r\n				<a target="_blank" href="http://tools.yootheme.com/extensions/yoodrawer" title="YOOdrawer">\r\n					<img class="correct-png" style="margin: 0px 0px 0px 5px" src="images/yootheme/features_demo.png" alt="See the live demo" title="See the live demo" width="17" height="17" align="absmiddle"/>\r\n				</a>\r\n				<a href="http://tools.yootheme.com/documentation/item/root/how-to-set-up-the-yoodrawer" target="_blank">\r\n					<img class="correct-png" style="margin: 0px 0px 0px 3px" src="images/yootheme/features_tutorial.png" alt="Watch the video tutorial" title="Watch the video tutorial" width="17" height="17" align="absmiddle"/>\r\n				</a>\r\n			</li>\r\n			<li style="margin-bottom: 4px; overflow: hidden;">\r\n				<a style="display: block; float: left; width: 100px;" target="_blank" href="http://tools.yootheme.com/extensions/yooslider" title="YOOslider">YOOslider</a>\r\n				<a target="_blank" href="http://tools.yootheme.com/extensions/yooslider" title="YOOslider">\r\n					<img class="correct-png" style="margin: 0px 0px 0px 5px" src="images/yootheme/features_demo.png" alt="See the live demo" title="See the live demo" width="17" height="17" align="absmiddle"/>\r\n				</a>\r\n				<a href="http://tools.yootheme.com/documentation/item/root/how-to-set-up-the-yooslider" target="_blank">\r\n					<img class="correct-png" style="margin: 0px 0px 0px 3px" src="images/yootheme/features_tutorial.png" alt="Watch the video tutorial" title="Watch the video tutorial" width="17" height="17" align="absmiddle"/>\r\n				</a>\r\n			</li>\r\n			<li style="margin-bottom: 4px; overflow: hidden;">\r\n				<a style="display: block; float: left; width: 100px;" target="_blank" href="http://tools.yootheme.com/extensions/yooscroller" title="YOOscroller">YOOscroller</a>\r\n				<a target="_blank" href="http://tools.yootheme.com/extensions/yooscroller" title="YOOscroller">\r\n					<img class="correct-png" style="margin: 0px 0px 0px 5px" src="images/yootheme/features_demo.png" alt="See the live demo" title="See the live demo" width="17" height="17" align="absmiddle"/>\r\n				</a>\r\n				<a href="http://tools.yootheme.com/documentation/item/root/how-to-set-up-the-yooscroller" target="_blank">\r\n					<img class="correct-png" style="margin: 0px 0px 0px 3px" src="images/yootheme/features_tutorial.png" alt="Watch the video tutorial" title="Watch the video tutorial" width="17" height="17" align="absmiddle"/>\r\n				</a>\r\n			</li>\r\n			<li style="margin-bottom: 4px; overflow: hidden;">\r\n				<a style="display: block; float: left; width: 100px;" target="_blank" href="http://tools.yootheme.com/extensions/yoosearch" title="YOOsearch">YOOsearch</a>\r\n				<a target="_blank" href="http://tools.yootheme.com/extensions/yoosearch" title="YOOsearch">\r\n					<img class="correct-png" style="margin: 0px 0px 0px 5px" src="images/yootheme/features_demo.png" alt="See the live demo" title="See the live demo" width="17" height="17" align="absmiddle"/>\r\n				</a>\r\n				<a href="http://tools.yootheme.com/documentation/item/root/how-to-set-up-the-yoosearch" target="_blank">\r\n					<img class="correct-png" style="margin: 0px 0px 0px 3px" src="images/yootheme/features_tutorial.png" alt="Watch the video tutorial" title="Watch the video tutorial" width="17" height="17" align="absmiddle"/>\r\n				</a>\r\n			</li>\r\n			<li style="margin-bottom: 4px; overflow: hidden;">\r\n				<a style="display: block; float: left; width: 100px;" target="_blank" href="http://tools.yootheme.com/extensions/yoogallery" title="YOOgallery">YOOgallery</a>\r\n				<a target="_blank" href="http://tools.yootheme.com/extensions/yoogallery" title="YOOgallery">\r\n					<img class="correct-png" style="margin: 0px 0px 0px 5px" src="images/yootheme/features_demo.png" alt="See the live demo" title="See the live demo" width="17" height="17" align="absmiddle"/>\r\n				</a>\r\n				<a href="http://tools.yootheme.com/documentation/item/root/how-to-set-up-the-yoogallery-module" target="_blank">\r\n				<img class="correct-png" style="margin: 0px 0px 0px 3px" src="images/yootheme/features_tutorial.png" alt="Watch the video tutorial" title="Watch the video tutorial" width="17" height="17" align="absmiddle"/></a></li>\r\n			<li style="margin-bottom: 4px; overflow: hidden;">\r\n				<a style="display: block; float: left; width: 100px;" target="_blank" href="http://tools.yootheme.com/extensions/yoomaps" title="YOOmaps">YOOmaps</a>\r\n				<a target="_blank" href="http://tools.yootheme.com/extensions/yoomaps" title="YOOmaps">\r\n					<img class="correct-png" style="margin: 0px 0px 0px 5px" src="images/yootheme/features_demo.png" alt="See the live demo" title="See the live demo" width="17" height="17" align="absmiddle"/>\r\n				</a>\r\n				<a href="http://tools.yootheme.com/documentation/item/root/how-to-set-up-the-yoomaps" target="_blank">\r\n				<img class="correct-png" style="margin: 0px 0px 0px 3px" src="images/yootheme/features_tutorial.png" alt="Watch the video tutorial" title="Watch the video tutorial" width="17" height="17" align="absmiddle"/>\r\n				</a>\r\n			</li>\r\n		</ul>\r\n	</div>\r\n	<div class="float-left width50">\r\n		<ul class="checkbox">\r\n			<li style="margin-bottom: 4px; overflow: hidden;">\r\n				<a style="display: block; float: left; width: 100px;" target="_blank" href="http://tools.yootheme.com/extensions/yootweet" title="YOOtweet">YOOtweet</a>\r\n				<a target="_blank" href="http://tools.yootheme.com/extensions/yootweet" title="YOOtweet">\r\n					<img class="correct-png" style="margin: 0px 0px 0px 5px" src="images/yootheme/features_demo.png" alt="See the live demo" title="See the live demo" width="17" height="17" align="absmiddle"/>\r\n				</a>\r\n			</li>\r\n			<li style="margin-bottom: 4px; overflow: hidden;">\r\n				<a style="display: block; float: left; width: 100px;" target="_blank" href="http://tools.yootheme.com/extensions/yootooltip" title="YOOtooltip">YOOtooltip</a>\r\n				<a target="_blank" href="http://tools.yootheme.com/extensions/yootooltip" title="YOOtooltip">\r\n					<img class="correct-png" style="margin: 0px 0px 0px 5px" src="images/yootheme/features_demo.png" alt="See the live demo" title="See the live demo" width="17" height="17" align="absmiddle"/>\r\n				</a>\r\n				<a href="http://tools.yootheme.com/documentation/item/root/how-to-set-up-the-yootooltip" target="_blank">\r\n				<img class="correct-png" style="margin: 0px 0px 0px 3px" src="images/yootheme/features_tutorial.png" alt="Watch the video tutorial" title="Watch the video tutorial" width="17" height="17" align="absmiddle"/>\r\n				</a></li>\r\n			<li style="margin-bottom: 4px; overflow: hidden;">\r\n				<a style="display: block; float: left; width: 100px;" target="_blank" href="http://tools.yootheme.com/extensions/yootoppanel" title="YOOtoppanel">YOOtoppanel</a>\r\n				<a target="_blank" href="http://tools.yootheme.com/extensions/yootoppanel" title="YOOtoppanel">\r\n					<img class="correct-png" style="margin: 0px 0px 0px 5px" src="images/yootheme/features_demo.png" alt="See the live demo" title="See the live demo" width="17" height="17" align="absmiddle"/>\r\n				</a>\r\n			</li>\r\n			<li style="margin-bottom: 4px; overflow: hidden;">\r\n				<a style="display: block; float: left; width: 100px;" target="_blank" href="http://tools.yootheme.com/free-stuff/yooeffects" title="YOOeffects">YOOeffects</a>\r\n				<a target="_blank" href="http://tools.yootheme.com/free-stuff/yooeffects" title="YOOeffects">\r\n					<img class="correct-png" style="margin: 0px 0px 0px 5px" src="images/yootheme/features_demo.png" alt="See the live demo" title="See the live demo" width="17" height="17" align="absmiddle"/>\r\n				</a>\r\n			</li>\r\n			<li style="margin-bottom: 4px; overflow: hidden;">\r\n				<a style="display: block; float: left; width: 100px;" target="_blank" href="http://tools.yootheme.com/free-stuff/yoologin" title="YOOlogin">YOOlogin</a>\r\n				<a target="_blank" href="http://tools.yootheme.com/free-stuff/yoologin" title="YOOlogin">\r\n					<img class="correct-png" style="margin: 0px 0px 0px 5px" src="images/yootheme/features_demo.png" alt="See the live demo" title="See the live demo" width="17" height="17" align="absmiddle"/>\r\n				</a>\r\n				<a href="http://tools.yootheme.com/documentation/item/root/how-to-set-up-the-yoologin" target="_blank">\r\n					<img class="correct-png" style="margin: 0px 0px 0px 3px" src="images/yootheme/features_tutorial.png" alt="Watch the video tutorial" title="Watch the video tutorial" width="17" height="17" align="absmiddle"/>\r\n				</a>\r\n			</li>\r\n			<li style="margin-bottom: 4px; overflow: hidden;">\r\n				<a style="display: block; float: left; width: 100px;" target="_blank" href="http://tools.yootheme.com/free-stuff/yooholidays" title="YOOholidays">YOOholidays</a>\r\n				<a target="_blank" href="http://tools.yootheme.com/extensions/free-stuff" title="YOOholidays">\r\n					<img class="correct-png" style="margin: 0px 0px 0px 5px" src="images/yootheme/features_demo.png" alt="See the live demo" title="See the live demo" width="17" height="17" align="absmiddle"/>\r\n				</a>\r\n			</li>\r\n			<li style="margin-bottom: 4px; overflow: hidden;">\r\n				<a style="display: block; float: left; width: 100px;" target="_blank" href="http://tools.yootheme.com/free-stuff/yooiecheck" title="YOOiecheck">YOOiecheck</a>\r\n				<a target="_blank" href="http://tools.yootheme.com/free-stuff/yooiecheck" title="YOOiecheck">\r\n					<img class="correct-png" style="margin: 0px 0px 0px 5px" src="images/yootheme/features_demo.png" alt="See the live demo" title="See the live demo" width="17" height="17" align="absmiddle"/>\r\n				</a>\r\n			</li>\r\n			<li style="margin-bottom: 4px; overflow: hidden;">\r\n				<a style="display: block; float: left; width: 100px;" target="_blank" href="http://tools.yootheme.com/free-stuff/yoosnapshots" title="YOOsnapshots">YOOsnapshots</a>\r\n				<a target="_blank" href="http://tools.yootheme.com/free-stuff/yoosnapshots" title="YOOsnapshots">\r\n					<img class="correct-png" style="margin: 0px 0px 0px 5px" src="images/yootheme/features_demo.png" alt="See the live demo" title="See the live demo" width="17" height="17" align="absmiddle"/>\r\n				</a>\r\n			</li>\r\n		</ul>\r\n	</div>\r\n</div>\r\n\r\n<h2>Basic Help</h2>\r\n<p>Learn more about how to install and set up a YOOtheme template and go to the <a href="http://warp.yootheme.com/documentation" target="_blank" title="How to install and set up a YOOtheme template">Warp5 documentation</a>.</p>', '', 0, 5, 0, 34, '2007-12-19 03:00:00', 62, '', '2010-07-19 13:08:36', 62, 0, '0000-00-00 00:00:00', '2007-12-19 03:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=0\nshow_create_date=0\nshow_modify_date=0\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 117, 0, 4, '', '', 0, 2375, 'robots=\nauthor='),
(46, 'Typography', 'typography', '', '<div class="note">Typography is a key element in web design. This templates delivers you sophisticated typography and various stylings. The style guide gives you an overview about all possible HTML tag stylings provided by the template. It also helps you to set up the available classes for special stylings.</div>\r\n\r\n<h1>This is an H1 Header</h1>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>\r\n\r\n<h2>This is an H2 Header</h2>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>\r\n\r\n<h3>This is an H3 Header</h3>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>\r\n\r\n<h4>This is an H4 Header</h4>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>\r\n\r\n<h5>This is an H5 Header</h5>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>\r\n\r\n<h6>This is an H6 Header</h6>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>\r\n\r\n<p class="dropcap"><strong>Dropcap: use &lt;p class="dropcap"&gt;</strong>. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>\r\n\r\n<hr class="dotted" />\r\n\r\n<strong>Horizontal Rule:</strong> &lt;hr&gt; tag with class="dotted"\r\n\r\n<hr class="dotted" />\r\n\r\n<div class="floatbox">\r\n	<div class="float-left width33">\r\n	\r\n		<h4>Inline Styles</h4>\r\n		<p>\r\n			<a href="#">Default &lt;a&gt; tag</a>\r\n			<br /><a href="#" class="icon-folder">&lt;a&gt; with class="icon-folder"</a>\r\n			<br /><a href="#" class="icon-file">&lt;a&gt; with class="icon-file"</a>\r\n			<br /><a href="#" class="icon-download">&lt;a&gt; with class="icon-download"</a>\r\n			<br /><a href="#" class="icon-external">&lt;a&gt; with class="icon-external"</a>\r\n			<br /><a href="#" class="icon-pdf">&lt;a&gt; with class="icon-pdf"</a>\r\n			<br /><br /><em>Default &lt;em&gt;</em>\r\n			<br /><em class="box">&lt;em&gt; with class="box"</em>\r\n			<br /><br /><acronym title="By marking up acronyms you can give useful information to browsers, spell checkers, translation systems and search-engine indexers.">Default &lt;acronym&gt;</acronym>\r\n			<br /><abbr title="By marking up abbreviations you can give useful information to browsers, spell checkers, translation systems and search-engine indexers.">Default &lt;abbr&gt;</abbr>\r\n		\r\n		</p>\r\n	\r\n	</div>\r\n	<div class="float-left width33">\r\n\r\n		<h4>Unordered List Styles</h4>\r\n\r\n		<ul>\r\n			<li>Default &lt;ul&gt; tag</li>\r\n			<li>Lorem ipsum dolor</li>\r\n			<li>Lorem ipsum dolor</li>\r\n		</ul>\r\n\r\n		<ul class="checkbox">\r\n			<li>&lt;ul&gt; with class="checkbox"</li>\r\n		</ul>\r\n		\r\n		<ul class="arrow">\r\n		  <li>&lt;ul&gt; with class="arrow"</li>\r\n		</ul>\r\n		\r\n		<ul class="star">\r\n		  <li>&lt;ul&gt; with class="star"</li>\r\n		</ul>\r\n		\r\n		<ul class="check">\r\n		  <li>&lt;ul&gt; with class="check"</li>\r\n		</ul>\r\n\r\n	</div>\r\n	<div class="float-left width33">\r\n	\r\n		<h4>Ordered List Styles</h4>\r\n\r\n		<ol>\r\n			<li>Default &lt;ol&gt; tag</li>\r\n			<li>Lorem ipsum dolor</li>\r\n			<li>Lorem ipsum dolor</li>\r\n		</ol>\r\n\r\n		<ol class="disc">\r\n		  <li>&lt;ol&gt; tag with class="disc"</li>\r\n		  <li>Item 2</li>\r\n		  <li>Item 3</li>\r\n		  <li>Item 4</li>\r\n		</ol>\r\n\r\n	</div>\r\n</div>\r\n\r\n<hr class="dotted" />\r\n\r\n<h4>Div and Span Styles</h4>\r\n<div class="note"><strong>&lt;div&gt; or &lt;span&gt; tag with class="note"</strong> Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi.<br />\r\n</div>\r\n<div class="info"><strong>&lt;div&gt; or &lt;span&gt; tag with class="info"</strong> Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi.<br />\r\n</div>\r\n<div class="alert"><strong>&lt;div&gt; or &lt;span&gt; tag with class="alert"</strong> Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi.<br />\r\n</div>\r\n<div class="download"><strong>&lt;div&gt; or &lt;span&gt; tag with class="download"</strong> Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi.<br />\r\n</div>\r\n<div class="tip"><strong>&lt;div&gt; or &lt;span&gt; tag with class="tip"</strong> Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi.<br />\r\n</div>\r\n\r\n<hr class="dotted" />\r\n\r\n<h4>Blockquote and Q Styles</h4>\r\n<strong>Default &lt;q&gt; tag:</strong> <q>This is a quote!</q>\r\n\r\n<br /><br /><strong>Default &lt;blockquote&gt; tag with block element as child:</strong>\r\n\r\n<blockquote><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p></blockquote>\r\n\r\n<strong>&lt;blockquote&gt; tag with class="quotation" and an an additional &lt;p&gt; tag.</strong>\r\n<br />(use &lt;blockquote&gt;&lt;p&gt;....&lt;/p&gt;&lt;/blockquote&gt;)\r\n<blockquote class="quotation">\r\n	<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\r\n	</p>\r\n</blockquote>\r\n\r\n<hr class="dotted" />\r\n\r\n<h4>Combine Styles</h4>\r\n<div class="floatbox">\r\n\r\n	<p class="dropcap" style="margin-top: 5px;">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation <span class="info inset-right width25"><strong>Combine Tags</strong> with class "inset-right" or "inset-left". Example: &lt;span class=" info inset-right width25"&gt;.</span> ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\r\n	</p>\r\n	\r\n	<p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. <q class="blockquote inset-left width25"><strong>Combine Tags</strong> with class "inset-right" or "inset-left". Example: &lt;q class=" blockquote inset-right width25"&gt;.</q> Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\r\n	</p>\r\n	\r\n	<p class="dropcap">Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. <span class="tip inset-right width25"><strong>Possible Width Classes</strong> .width15, .width18, .width20, .width23, .width25, .width33, .width35, .width40, .width45, .width50</span> Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\r\n	</p>\r\n	\r\n	<p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\r\n	</p>\r\n	\r\n</div>\r\n\r\n<hr class="dotted" />\r\n\r\n<div class="floatbox">\r\n	<div class="float-left width50">\r\n		\r\n		<h4>Form Styles</h4>\r\n	\r\n		<form action="#">\r\n		<fieldset style="margin-right: 20px;">\r\n		<legend>Form legend</legend>\r\n		<div><label for="f1">Text input:</label> <input type="text" value="input text" id="f1"/></div>\r\n		<div><label for="f2">Radio input:</label> <input type="radio" id="f2"/></div>\r\n		<div><label for="f3">Checkbox input:</label> <input type="checkbox" id="f3"/></div>\r\n		<div><label for="f4">Select field:</label> <select id="f4"><option>Option 01</option><option>Option 02</option></select></div>\r\n		<div><label for="f5">Textarea:</label><br/><textarea rows="5" cols="30" id="f5">Textarea text</textarea></div>\r\n		<div><label for="f6">Button:</label> <input type="button" value="button text" id="f6"/></div>\r\n		</fieldset>\r\n		</form>\r\n\r\n	</div>\r\n	<div class="float-left width50">\r\n	\r\n		<h4>Preformatted Text Style</h4>\r\n		<pre>\r\npre {\r\n	margin: 10px 0 10px 0px;\r\n	padding: 5px 0 5px 10px;\r\n	border: 1px dotted #aab4be;\r\n	border-left: 20px solid #b4b4b4;\r\n	background: #fafafa;\r\n	font-size: 90%;\r\n	color: #2E8B57;\r\n	font-family: "Courier New", Courier, monospace;\r\n	\r\n	/* Browser specific (not valid) styles */\r\n	/* to make preformatted text wrap */\r\n	 \r\n	white-space: pre-wrap;       /* css-3 */\r\n	white-space: -moz-pre-wrap;  /* Mozilla */\r\n}\r\n		</pre>\r\n			\r\n	</div>\r\n</div>', '', 1, 5, 0, 34, '2007-12-19 05:00:00', 62, '', '2009-05-08 14:29:54', 62, 62, '2009-05-08 14:29:54', '2007-12-19 05:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=0\nshow_create_date=0\nshow_modify_date=0\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 137, 0, 5, '', '', 0, 2068, 'robots=\nauthor='),
(48, 'Dummy Content', 'dummy-content', '', 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.', '', 0, 5, 0, 34, '2007-12-19 05:00:00', 62, '', '2008-10-02 11:28:25', 62, 0, '0000-00-00 00:00:00', '2007-12-19 05:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 9, 0, 6, '', '', 0, 5953, 'robots=\nauthor=');
INSERT INTO `jos_content` (`id`, `title`, `alias`, `title_alias`, `introtext`, `fulltext`, `state`, `sectionid`, `mask`, `catid`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `images`, `urls`, `attribs`, `version`, `parentid`, `ordering`, `metakey`, `metadesc`, `access`, `hits`, `metadata`) VALUES
(58, 'Module Variations', 'module-variations', '', '<p>This template''s module system comes with a wide range of module styles, color variations, badges and icons. Below you can see which module styles come with color variations and with which badges and icons you can combine them.</p>\r\n\r\n<table cellspacing="0" cellpadding="0" border="0" class="listing">\r\n	<thead>\r\n		<tr>\r\n			<th align="left" width="25%">Styles</th>\r\n			<th align="left" width="45%">Colors</th>\r\n			<th align="center" width="30%">Combinable</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr class="odd">\r\n			<td class="bold">glow</td>\r\n			<td>white (default), templatecolor</td>\r\n			<td align="center">Badges/Icons</td>\r\n		</tr>\r\n		<tr class="even">\r\n			<td class="bold">box</td>\r\n			<td>white (default), highlight, dark, hover</td>\r\n			<td align="center">Badges/Icons</td>\r\n		</tr>\r\n		<tr class="odd">\r\n			<td class="bold">glass, embedded, separator</td>\r\n			<td>-</td>\r\n			<td align="center">Badges/Icons</td>\r\n		</tr>\r\n		<tr class="even">\r\n			<td class="bold">line, polaroid, postit</td>\r\n			<td>-</td>\r\n			<td align="center">-</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<table cellspacing="0" cellpadding="0" border="0" class="listing">\r\n	<thead>\r\n		<tr>\r\n			<th align="left" width="25%">Extras</th>\r\n			<th align="left" width="75%">Variations</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr class="odd">\r\n			<td class="bold">Badges</td>\r\n			<td>hot, new, top, pick</td>\r\n		</tr>\r\n		<tr class="even">\r\n			<td class="bold">Icons</td>\r\n			<td>download, users, feed, twitter, mail, message, shopping, lock</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', '', 0, 5, 0, 34, '2007-12-19 05:00:00', 62, '', '2010-07-22 14:20:07', 62, 0, '0000-00-00 00:00:00', '2007-12-19 05:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 40, 0, 3, '', '', 0, 3092, 'robots=\nauthor='),
(59, 'ZOO', 'zoo', '', '<p>\r\n<a rel="shadowbox;width=872;height=480" href="http://zoo.yootheme.com/images/stories/videos/zoo_20_video_tour.flv" style="float: right; display: block; margin-left: 10px;">\r\n<img height="105" width="250" alt="Take the video tour on the ZOO!" title="Take the video tour on the ZOO!" src="images/yootheme/zoo_video_tour.png"/>\r\n</a>ZOO is a flexible and powerful content application builder to manage your content. It offers a lot of cool features like nested categories, content arrangement via drag ''n drop, a clean JavaScript powered user interface and a native comments and tagging system.\r\n</p>\r\n\r\n<p class="readmore"><a href="http://zoo.yootheme.com/" class="readmore" target="_blank">Read more...</a></p>\r\n\r\n<h2>Apps for every Purpose</h2>\r\n\r\n<p>Apps are little extension for ZOO 2.0 which are optimized for different types of content catalogs like blogs, business directories and many more. ZOO 2.0 already has some basic apps on board to create websites and blogs. We developed an comprehensive app bundle to cover all kinds of purposes! All of them work out of the box and get you started right away! We will develop new apps in the near future for ZOO! Our range of apps will constantly grow.</p>\r\n\r\n<p class="readmore"><a href="http://zoo.yootheme.com/app-bundle" class="readmore" target="_blank">Read more...</a></p>\r\n\r\n<h2>Content Builder</h2>\r\n\r\n<p>One of the ZOO''s key features is the ability to create your very own custom content types. For each type you create you can select the elements the type should consist of, like text, images or a file download. Any combination is imaginable! You can also add and remove elements from a custom type at any time, even if you already created items of that type. The elements are completely pluggable and can easily be added to your custom app.</p>\r\n\r\n<p class="readmore"><a href="http://zoo.yootheme.com/content-builder" class="readmore" target="_blank">Read more...</a></p>', '', 0, 5, 0, 34, '2009-07-01 18:40:31', 62, '', '2010-05-27 14:49:20', 62, 0, '0000-00-00 00:00:00', '2009-07-01 18:40:31', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 9, 0, 2, '', '', 0, 305, 'robots=\nauthor='),
(73, 'YOOicons launched', 'icons', '', '<p>YOOtheme is a well-known template and extension provider who helps you to create professional websites. But to make your website or interface design a real eye-catcher we got one thing missing: Icons! Icons are an essential tool to simplify user interfaces. We complete this with our beautiful and handcrafted icon sets for web and print projects. We got commercial icon sets and free stuff. Enjoy browsing through all the icons at <a href="http://icons.yootheme.com/" target="_blank">our new icons website</a>!</p>\r\n\r\n<h2>Icon Club</h2>\r\n\r\n<p>You are looking for some high quality, royalty free, vector stock icons? Join the YOOtheme icon club! You will get full access to all our commercial icon sets which are currently available. Additionally you will also get access to all upcoming icon releases during the term of your membership. You can use our royalty free stock icons for as many clients or websites you wish.</p>\r\n\r\n<div style="background: #FAFAFA; border: 1px solid #C8C8C8; overflow:hidden; padding:10px;">\r\n	<img height="130" width="260" alt="Club Icon Sets" title="Club Icon Sets" src="images/yootheme/icons_club.jpg" style="float: left; margin-right: 15px;" />\r\n	<h3 style="margin-top: 0px;">Club Icon Sets</h3>\r\n	<p>All icon sets are available in the PNG file format and in 8 different standard sizes, ranging from 16x16 to 512x512 pixels. Each icon is handcrafted and optimized for each specific size. Vector PDF files of all icons are also available. They are compatible with Adobe Illustrator and can be rescaled to any size without a single loss to the details.</p>\r\n	<p class="readmore" style="margin-bottom: 0px;"><a href="http://icons.yootheme.com/index.php?option=com_content&amp;view=article&amp;id=5&amp;Itemid=16" class="readmore" target="_blank">Read more...</a></p>\r\n</div>\r\n\r\n<h2>Free Icon Sets</h2>\r\n\r\n<p>The free icon sets are also available in 32-bit transparency PNG and scaleable vector PDF format. They are designed to match with all our commercial icon sets.</p>\r\n\r\n<div style="background: #FAFAFA; border: 1px solid #C8C8C8; overflow:hidden; padding:10px;">\r\n	<img height="130" width="260" alt="Social Bookmarks Icon Set" title="Social Bookmarks Icon Set" src="images/yootheme/icons_freebies.jpg" style="float: left; margin-right: 15px;" />\r\n	<h3 style="margin-top: 0px;">Social Bookmarks Icon Set</h3>\r\n	<p>This free icon set contains 47 high quality social network icons. They are perfect for displaying your social bookmarks on your website or to link to external profiles and services.</p>\r\n	<p class="readmore" style="margin-bottom: 0px;"><a href="http://icons.yootheme.com/index.php?option=com_content&amp;view=article&amp;id=6&amp;Itemid=17" class="readmore" target="_blank">Read more...</a></p>\r\n</div>', '', 1, 5, 0, 34, '2009-07-01 18:40:31', 62, '', '2010-07-01 15:01:50', 62, 62, '2010-07-01 15:03:17', '2009-07-01 18:40:31', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=0\nshow_create_date=0\nshow_modify_date=0\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 25, 0, 1, '', '', 0, 170, 'robots=\nauthor='),
(74, 'Cookbook', 'cookbook', '', '<div style="text-align:center">\r\n	<a href="http://www.yootheme.com/blog/item/root/zoo-20-app-bundle" target="_blank">\r\n		<img class="correct-png" width="157" height="130" title="Cookbook" alt="Cookbook" src="images/yootheme/yooscroller/zoo_cookbook.png"/>\r\n	</a>\r\n	<div style="margin: auto; margin-top: -20px; font-size: 13px;">Cookbook</div>\r\n</div>', '', 0, 5, 0, 36, '2010-06-25 09:02:50', 62, '', '2010-07-20 17:10:38', 62, 0, '0000-00-00 00:00:00', '2010-06-25 09:02:50', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 6, 0, 6, '', '', 0, 0, 'robots=\nauthor='),
(75, 'Movie Database', 'movie-database', '', '<div style="text-align:center">\r\n	<a href="http://www.yootheme.com/blog/item/root/zoo-20-app-bundle" target="_blank">\r\n		<img class="correct-png" width="157" height="130" title="Movie Database" alt="Movie Database" src="images/yootheme/yooscroller/zoo_movie.png"/>\r\n	</a>\r\n	<div style="margin: auto; margin-top: -20px; font-size: 13px;">Movie Database</div>\r\n</div>', '', 1, 5, 0, 36, '2010-06-25 09:02:50', 62, '', '2010-07-20 17:10:33', 62, 0, '0000-00-00 00:00:00', '2010-06-25 09:02:50', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 5, 0, 5, '', '', 0, 0, 'robots=\nauthor='),
(76, 'Business Directory', 'business-directory', '', '<div style="text-align:center">\r\n	<a href="http://www.yootheme.com/blog/item/root/zoo-20-app-bundle" target="_blank">\r\n		<img class="correct-png" width="157" height="130" title="Business Directory" alt="Business Directory" src="images/yootheme/yooscroller/zoo_business.png"/>\r\n	</a>\r\n	<div style="margin: auto; margin-top: -20px; font-size: 13px;">Business Directory</div>\r\n</div>', '', 1, 5, 0, 36, '2010-06-25 09:02:50', 62, '', '2010-07-20 17:10:28', 62, 0, '0000-00-00 00:00:00', '2010-06-25 09:02:50', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 5, 0, 4, '', '', 0, 2, 'robots=\nauthor='),
(77, 'Download Archive', 'download-archive', '', '<div style="text-align:center">\r\n	<a href="http://www.yootheme.com/blog/item/root/zoo-20-app-bundle" target="_blank">\r\n		<img class="correct-png" width="157" height="130" title="Download Archive" alt="Download Archive" src="images/yootheme/yooscroller/zoo_download.png"/>\r\n	</a>\r\n	<div style="margin: auto; margin-top: -20px; font-size: 13px;">Download Archive</div>\r\n</div>', '', 1, 5, 0, 36, '2010-06-25 09:02:50', 62, '', '2010-07-20 17:10:24', 62, 0, '0000-00-00 00:00:00', '2010-06-25 09:02:50', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 7, 0, 3, '', '', 0, 1, 'robots=\nauthor='),
(78, 'Product Catalog', 'product-catalog', '', '<div style="text-align: center;"><a href="http://www.yootheme.com/blog/item/root/zoo-20-app-bundle" target="_blank"> <img class="correct-png" title="Product Catalog" alt="Product Catalog" src="images/yootheme/yooscroller/zoo_product.png" height="130" width="157" /> </a>\r\n<div style="margin: auto; margin-top: -20px; font-size: 13px;">Product Catalog</div>\r\n</div>', '', 0, 7, 0, 42, '2010-06-25 09:02:50', 62, '', '2011-09-09 10:56:28', 63, 0, '0000-00-00 00:00:00', '2010-06-25 09:02:50', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 6, 0, 3, '', '', 0, 2, 'robots=\nauthor='),
(79, 'Blog', 'blog', '', '<div style="text-align:center">\r\n	<a href="http://www.yootheme.com/blog/item/root/zoo-20-app-bundle" target="_blank">\r\n		<img class="correct-png" width="157" height="130" title="Blog" alt="Blog" src="images/yootheme/yooscroller/zoo_blog.png"/>\r\n	</a>\r\n	<div style="margin: auto; margin-top: -20px; font-size: 13px;">Blog</div>\r\n</div>', '', 0, 5, 0, 36, '2010-06-25 09:02:50', 62, '', '2010-07-20 17:10:19', 62, 0, '0000-00-00 00:00:00', '2010-06-25 09:02:50', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 6, 0, 1, '', '', 0, 0, 'robots=\nauthor='),
(80, 'Documentation', 'documentation', '', '<div style="text-align:center">\r\n	<a href="http://www.yootheme.com/blog/item/root/zoo-20-app-bundle" target="_blank">\r\n		<img class="correct-png" width="157" height="130" title="Documentation" alt="Documentation" src="images/yootheme/yooscroller/zoo_documentation.png"/>\r\n	</a>\r\n	<div style="margin: auto; margin-top: -20px; font-size: 13px;">Documentation</div>\r\n</div>', '', 0, 5, 0, 36, '2010-06-25 09:02:50', 62, '', '2010-07-20 17:10:44', 62, 0, '0000-00-00 00:00:00', '2010-06-25 09:02:50', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 7, '', '', 0, 0, 'robots=\nauthor='),
(81, 'Pages', 'pages', '', '<div style="text-align:center">\r\n	<a href="http://www.yootheme.com/blog/item/root/zoo-20-app-bundle" target="_blank">\r\n		<img class="correct-png" width="157" height="130" title="Pages" alt="Pages" src="images/yootheme/yooscroller/zoo_page.png"/>\r\n	</a>\r\n	<div style="margin: auto; margin-top: -20px; font-size: 13px;">Pages</div>\r\n</div>', '', 0, 5, 0, 36, '2010-06-25 09:02:50', 62, '', '2010-07-20 17:10:48', 62, 0, '0000-00-00 00:00:00', '2010-06-25 09:02:50', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 8, '', '', 0, 0, 'robots=\nauthor='),
(82, 'Slider 1', 'slider-1', '', '<p><img style="float: left;" alt="Foto0415 resize" src="images/Slider/Foto0415_resize.jpg" height="600" width="800" /></p>', '', 0, 5, 0, 35, '2011-09-04 23:55:25', 62, '', '2011-09-09 10:55:58', 63, 0, '0000-00-00 00:00:00', '2011-09-04 23:55:25', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 4, 0, 2, '', '', 0, 1, 'robots=\nauthor='),
(83, 'Slider 2', 'slider-2', '', '<p><img style="float: left;" alt="Foto0410 resize" src="images/Slider/Foto0410_resize.jpg" height="600" width="800" /></p>', '', 0, 5, 0, 35, '2011-09-05 00:08:09', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-09-05 00:08:09', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 1, '', '', 0, 0, 'robots=\nauthor='),
(84, 'AL IKHLAS DARI MASA KEMASA', 'al-ikhlas-dari-masa-kemasa', '', '<p style="margin-bottom: 12pt; text-align: justify; line-height: normal;"><span style="font-family: trebuchet ms,geneva;"><b><span style="font-size: 12pt;">PENDAHULUAN</span></b><span style="font-size: 12pt;"></span></span></p>\r\n<p style="margin-bottom: 12pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: trebuchet ms,geneva;"><img style="float: left;" alt="logo" src="images/logo.png" height="231" width="231" />Rentang masa 16 tahun dalam suatu perjuangan, seperti perjuangan Yayasan Al Ikhlas, sesungguhnya belum berarti banyak bila dibandingkan dengan tujuan yang ingin dicapai, nasih banyak kendala yang belum dapat diselesaikan. Akan tetapi,semua itu tidak boleh membuat kabur pandangan kita terhadap berbagai keberhasilan perjuangan dimasa lalu. Banyak yang sudah diperbuat, akan tetapi lebih banyak lagi yang belumsempat diperbuat. Semua itu adalah konsekuensi dari sebuah perjuangan, yang tidak dapat dihindari oleh seorang yangtelah memantapkan dirinya sebagai pejuang untuk gagasan-gagasan besar. Dibutuhkan kiat-kiat yang lebih baik dan tepat untuk mengelola asset perjuangan untuk menjangkau cita-cita dimasa yang akan datang.</span></p>\r\n<p style="margin-bottom: 0.0001pt; line-height: normal;"><span style="font-size: 12pt; font-family: trebuchet ms,geneva;">Pola pikir inilah yang seharusnya dijadikan pedoman dalam perjuangan selanjutnya. Banyak sudah keberhasilan yang telah dicapai, banyak sudah terobosan-terobosan yang telah dilakukan, akan tetapi ada juga kegagalan atau ketidak berhasilan yang dialami. Kita tidak boleh menyesali atau melecehkan kegagalan yang dialami, akan tetapi mari kita pahami karena kegagalan itu hadis justru untuk kita jadikan guru dalam merancang strategi yang akan dilaksanakan. Dalam perjuangan kita harus rela menempuh berbagai onak dan cita-cita mencari ridlo ilahi.</span></p>\r\n<p style="margin-bottom: 0.0001pt; line-height: normal;"><span style="font-family: trebuchet ms,geneva;"><span style="font-size: 12pt;"></span><b><span style="font-size: 12pt;">SEKILAS SEJARAH</span></b><span style="font-size: 12pt;"></span></span></p>\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: trebuchet ms,geneva;">Memandang Al Ikhlas dengan keberadaannya saat ini, bukanlah hal yang bijak tanpa menoleh kebelakang. Membalik lembaran-lembaran sejarah Al Ikhlas, harus diakui bahwa cikal bakallembaga ini adalah sebuah pengajian anak-anak yang penuh dengan keprihatinan dan fasilitas darurat yang tidak mempunyai tempat khusus, berawal dari empat orang anak yang belajar mengaji dengan metode tradisional. Pada tanggal 22 Mei 1993 dimulailah kegiatan pengajian itu dibawah asuhan sekaligus pendiri yaitu ibunda Hj.Suaedah binti AsikudinSulaiman,pengajian diberi nama "Al Ikhlas" oleh kakanda Ahmad Sirojuddin dengan berbekal keikhlasan mulailah ibunda Hj.Suaedah melangkah dengan dibantu putranya Damanhuri yang baru pulang dariPerguruan Islam As Syafi''iyah Jakarta.</span></p>\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: trebuchet ms,geneva;">Bertempat diruang yang seadanya yaitu ruang makan yang dimulti fungsikan, mulailah kami berkiprah mendidik anak-anak, berbekal ilmu dari Perguruan IslamAs Syafi''iyah, sesuai pesan guru kami KH.Abdullah Syafi''i (Alm), kami mulai menata program-program pengajian dalam bentuk diniyah, ternyataprogram ini mendapat sambutan yang sangat luar biasa, hal ini dapat dibuktikan dengan pertumbuhan jumlah santri yang semakin hari semakin banyak dalam waktu yang relatif singkat, sehingga kapasitas ruangan yang tersedia sudah tidak sesuai lagi dengan jumlah santri yang bertambah.</span></p>\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: trebuchet ms,geneva;">Sehubungan kami tidak memiliki dana, karena pengajian ini tidak dipungut biaya, dana hanya dari keikhlasan atau sukarela orangtua santri yang masih mempunyai rasa kepedulian terhadap perjuangan ini, karena tidak semua orang tua santri memberikan dukungannya terhadap program kami, maka untuk menambah ruangan dirubahlah paviliun rumah dan dapur untuk menjadi ruangan belajar, dengan hanya beralas tikar yang sudah lusuh dan bolong-bolong kami terus berkiprah walau dengan sarana yang sangat memprihatinkan.</span></p>\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: trebuchet ms,geneva;">Berbagai kesulitan, halangan dan berbagai rintangan datang silih berganti, dengan modal utama keyakinan dan keikhlasan,"<b><i>Bahwa setelah kesulitan akan datang suatu kemudahan</i></b>'''', langkah terus kami mantapkan, seiring dengan berkembangnya lembaga maka kami mulai mencanangkan program kedepan untuk menjadi sebuah lembaga yang dapat melayani umat, makakami mulai mengaktifkan adik-adik kami dalam perjuangan ini yaitu : Rahmat S Wijaya dan Mimin Mintarsih</span></p>\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-family: trebuchet ms,geneva;"><span style="font-size: 12pt;"></span><b><span style="font-size: 12pt;">1. BERDIRINYA TKA/TPA AL IKHLAS</span></b><span style="font-size: 12pt;"></span></span></p>\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: trebuchet ms,geneva;">Berbekal surat ijin operasional dari Lembaga Pembinaan dan Pengembangan TK Al Qur''an- Badan Komunikasi Pemuda RemajaMasjid Indonesia (LPPTKA-BKPRMI) daerah khusus ibukota Jakarta No.015.B/LPPTKA.09/07/1993, pada tanggal 20 Juli 1993 resmilah berdiri Taman Kanak-Kanak Al Qur''an dan Taman Pendidikan Al Qur''an (TKA/TPA), dengan nomor unit keanggotaan 290.</span></p>\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: trebuchet ms,geneva;">Dengan terdaftarnya TKA/TPA Al Ikhlas dibawah koordinasi LPPTKA-BKPRMI, yang merupakan TKA/TPA pertama dikabupaten Bogor yang berkoordinasi dengan LPPTKA-BKPRMI, mulailah kami banyak belajar managemen pengelolaan TKA/TPA yang baikdan benar.</span></p>\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: trebuchet ms,geneva;">Satu tahun kemudian yaitu tahun 1994, kami buktikan hasil kinerja kami dengan mengikuti berbagai event dalam acara Festival Anak Shaleh Indonesia &amp; MTQ tingkat daerah Bekasi, Depok, ternyata hasilnya sangat memuaskan. Kontingen Al Ikhlas merupakan&nbsp;kontingen terbesar yang masuk ketingkat propinsi DKI Jakarta.</span></p>\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: trebuchet ms,geneva;">Ditingkat propinsi DKI Jakarta kontingen Al Ikhlas diluar dugaan para pembinanya dapat membuktikan prestasinya dengan masuk ketingkat nasional. Sebanyak 14 orang santri yang merupakan utusan terbesar dari unit&nbsp;se- JABOTABEK yang mewakili propinsi DKI Jakarta.</span></p>\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: trebuchet ms,geneva;">Akhirnya buah dari perjuangan setahun dapat kami petik di Jakarta Hilton Convention Centre , santri-santri Al Ikhlas dapat hadir ditengah-tengan ibu negara waktu itu&nbsp; ibu Tien Soeharto (Almh) dan dengan ibu wakil presiden ibu Tuty Tri Sutrisno di Asrama Haji Pondok Gede, dengan memboyong 3 piala tingkat Nasional, sehingga kontingen Al Ikhlas disambut dan diundang khusus oleh para pembina diantaranya : ibunda Reineda Ritongga, Roy Irza Farabi Azwar Anas di kediaman Ketua DPRD DKI Jakarta Bpk. May Jend Pol HM.Ritongga.</span></p>\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: trebuchet ms,geneva;">Keberhasilan dan kesuksesan yang kami raih ini tidaklah membuat kami terlena, bahkan menjadi awal bagi kami untuk merancang misi kedepan yang lebih besar. Maka dicanangkanlah pembentukan TK Islam dalam wadah Raudhatul Athfal (RA) dengan kepala sekolah pertama ibu Hj.Mimin Mintarsih.</span></p>\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-family: trebuchet ms,geneva;"><span style="font-size: 12pt;"></span><b><span style="font-size: 12pt;">2. PEMBANGUNAN GEDUNG AL IKHLAS</span></b><span style="font-size: 12pt;"></span></span></p>\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: trebuchet ms,geneva;">Tahun datang silih berganti, seiring dengan itu pertambahan santri sangat cepat bertambah mencapai jumlah 500 orang, sehingga yang daftarpun dengan sangat terpaksa harus kami lakukan seleksi, mengingat keterbatasan ruang belajar yang ada, bahkan ruangan dapur ibunda kami Hj.Suaedah pun mengalami 3 kali pindah diisi dengan santri-santri yang jumlahnya semakin bertambah.</span></p>\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: trebuchet ms,geneva;">Melihat keadaan yang serba memprihatinkan ini kami tetap oftimis bahwa Allah beserta hamba-hambanya yang sedang menegakkan kalimat ilahi dimuka bumi ini, dengan berpedoman kepada firman Allah dalam :</span></p>\r\n<ol>\r\n<li style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: trebuchet ms,geneva;"><span style="font-size: 12pt;">QS. Al Insyiroh : 5 yang artinya : "<em>Maka sesungguhnya setelah kesulitan akan datang suatu kemudahan</em>".</span></span></li>\r\n<li style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: trebuchet ms,geneva;"><span style="font-size: 12pt;">QS.Arra''du : 11 yang artinya : "<em>Sesungguhnya Allah tidak akan merubah nasib suatu kaum kalau kaum itu sendiri yang merubahnya</em>".</span></span></li>\r\n<li style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: trebuchet ms,geneva;"><span style="font-size: 12pt;">QS.Al Mu''Min : 60 yang: "<em>Berdo''alah kamu kepada-Ku niscaya akan aku kabulkan</em>".</span></span></li>\r\n</ol>\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: trebuchet ms,geneva;">Segala usaha untuk mendapatkan dana dari usaha yang halal dilakukan oleh kami untuk mewujudkan cita-cita yaitu mempunyai sebuah gedung tempat berteduhnya para santri dan guru yang refresentatif, dengan bermodalkan uang ratusan ribu rupiah dan keyakinan bahwa Allah akan menolong hamba-hamba-Nya berupa rizki yang tak diduga-duga sesuai dengan firman Nya dalam surat At Tahalak : 3, kami memulai pembanguan gedung pada bulan Desember 1997.</span></p>\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: trebuchet ms,geneva;">Memang terasa mustahil dengan&nbsp;bermodalkan ratusan ribu rupiah&nbsp;saja kami merencanakan pembangunan 2 lantai, namun apabila Allah meridloinya apapun rencana yang mustahil menurut pandangan alam pikir manusia dapat dibuktikan dengan mudahnya. Subhanallah ditengah tengah pembangunan yang sedang berjalan kami diajak bermitra bisnis dengan salah seorang pengusaha lewat perkenalan singkat, kami diberikan kepercayaan untuk memegang kendali perusahan wilayah Bogor, dalam hitungan bulan proyekpun selesai dan mendapatkan keuntungan yang dapat menambah dana untuk menyelesaikan satu lokal dibawah termasuk pengecoran lantai atas, pada bulan juli 1998 rencana inipun dapat terwujud..</span></p>\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: trebuchet ms,geneva;">Setelah satu lokal selesai, program pembangunan terus kami mantapkan, seluruh tenaga dan pikiran kami konsentrasikan kepada pengembangan sarana pendidikan, mulailah kami membentuk divisi usaha yang bertujuan untuk menopang pembangunan selain dari dana-dana infaq yang didapat dari orang tua santri.</span></p>\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: trebuchet ms,geneva;">Dengan adanya divisi usaha ini cukup membuat kami dapat bertahan dalam pembangunan walaupun situasi ekonomi negara pada saat itu dilanda krisis moneter, namun alhamdulillah pembangunan gedung tetap berjalan dengan baik.</span></p>\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: trebuchet ms,geneva;">Pembangunan tahap pertama gedung Al Ikhlas, walaupun berjalan merayap alhamdulillah dapat diselesaikan dengan dua lantai, pada bulan Desember tahun 2000 dengan&nbsp;jumlah : 5 lokal kelas, 1 Laboratorium, 1 kantor, 1 kantin dan 1 aula sebagai ruang serba guna tempat pertemuan dan Majlis Ta''lim Kaum Ibu.</span></p>\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-family: trebuchet ms,geneva;"><span style="font-size: 12pt;"></span><b><span style="font-size: 12pt;">3. BERDIRINYA RAUDHATUL ATHFAL (RA) AL IKHLAS </span></b><span style="font-size: 12pt;"></span></span></p>\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: trebuchet ms,geneva;">Penantian dengan rentang masa yang cukup panjang akan kehadiran TK Islam ditengah-tengah masyarakat terjawab dengan telah diberikannya ijin operasional dari Departemen Agama pada tanggal 24 Juli 1998 dengan SK No. MI.10/I/KP.08.8/22/1998 No. Piagam pengesahan : D/MI-10/RA/88.044/02/98 dan Nomor Statistik Madrasah (NSM) No. 0123014126.</span></p>\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: trebuchet ms,geneva;">Regenerasi kepemimpinan sangatlah kami perhatikan, maka kepala sekolah beralih dari Hj.Mimin Mintarsi kepada Rahmat Slamet Wijaya S.Pd.I dengan harapan agar konsentrasi penuh dalam mewujudkan TK yang dapat disejajarkan dengan dengan TK TK umum lainnya.</span></p>\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-family: trebuchet ms,geneva;"><span style="font-size: 12pt;"></span><b><span style="font-size: 12pt;">4. BERDIRINYA MADRASAH DINIYAH AWALIYAH (MDA) AL IKHLAS</span></b><span style="font-size: 12pt;"></span></span></p>\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: trebuchet ms,geneva;">Dalam rangka menjawab perkembangan lingkungan dimasa mendatang, khusunya diwilayah Gunungputri yang masih membutuhkan hadirnya lembaga keagamaan yang terprogam baik, maka kami mendirikan Madrasah Diniyah Awaliyah Al Ikhlas, dengan ijin operasional / pengesahan dari Departemen Agama pada tanggal 18 Juli 2005, dengan nomor SK: Kd.10.01/5/PP.008/029/2005 Nomor piagam pengesahan : D.MI-10/MDA/076/2005 dan nomor statistik Madrasah (NSM) : 4123203190008. Sebagai kepala sekolah Madrasah Diniyah Awaliyah di jabat oleh Haryadi S.Pd.I.</span></p>\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-family: trebuchet ms,geneva;"><span style="font-size: 12pt;"></span><b><span style="font-size: 12pt;">5. BERDIRINYA PENDIDIKAN DAN LATIHAN (DIKLAT) KOMPUTER AL IKHLAS</span></b><span style="font-size: 12pt;"></span></span></p>\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: trebuchet ms,geneva;">Kebutuhan akan penguasaan tekhnologi dan informasi menjadi perhatian kami yang sangat besar, agar umat ini tidak buta dan gagp terhadap penguasaan tekhnologi, dengan penerapan pendidikan komputer bagi santri-santri Al Ikhlas diharapkan dapat dikuasainya tekhnologi sejak dini dalam menyongsong hari esok yang lebih gemilang.</span></p>\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-family: trebuchet ms,geneva;"><span style="font-size: 12pt;"></span><b><span style="font-size: 12pt;">6. BERDIRINYA MADRASAH TSANAWIYAH (MTs) AL IKHLAS</span></b><span style="font-size: 12pt;"></span></span></p>\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: trebuchet ms,geneva;">Kebutuhan sekolah setingkat SLTP, disekitar lingkungan yayasan Al Ikhlas dan sekitarnya sangatlah dibutuhkan oleh karena itu kami dengan sumber daya yang tersedia memulai untuk merintis pendirian MTs setingkat SLTP bagi masyarakat gunungputri dan sekitarnya. Pada tahun&nbsp;2008 dimulailah pendidikan jenjang MTs ini dengan ruangan yang baru kami bangun dilantai dua dengan kapasitas kelas 30 orang dan ber AC.</span></p>\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-family: trebuchet ms,geneva;"><span style="font-size: 12pt;"></span><b><span style="font-size: 12pt;">7. MENGUKIR PRESTASI MENATAP MASA DEPAN GEMILANG</span></b><span style="font-size: 12pt;"></span></span></p>\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: trebuchet ms,geneva;">Dalam rentang masa yang cukup panjang eksistensi yayasan Al Ikhlas, dapatlah dibuktikan dengan sederetan prestasi yang diraih oleh para santrinya dengan ratusan tropi tetap dan bergilir, mulai dari tingkat daerah, propinsi bahkan sampai tingkat nasional, diantara rekaman peristiwa dapat disaksikan dalam urutan prestasi dibawah ini diantaranya adalah :</span></p>\r\n<ul>\r\n<li style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-family: trebuchet ms,geneva;"><span style="font-size: 12pt;"></span><span style="font-size: 12pt;"><span style="font-size: 12pt;">Juara umum MTQ &amp; Festival Anak Shakeh Indonesia I tingkat daerah Depok, dengan piala bergilir wali kota(Tahun 1994).</span></span></span></li>\r\n<li><span style="font-size: 12pt; font-family: trebuchet ms,geneva;"><span style="font-size: 12pt;">Juara umum MTQ &amp; Festival Anak Shaleh Indonesia II tingkat daerah Depok, dengan piala bergilir wali kota Depok (Tahun 1996).</span></span></li>\r\n<li><span style="font-size: 12pt; font-family: trebuchet ms,geneva;"><span style="font-size: 12pt;">Juara umum MTQ &amp; Festival Anak Shaleh Indonesia I tingkat kabupaten Bogor, dengan piala bergilir Bupati Bogor (Tahun 1996)</span></span></li>\r\n<li><span style="font-size: 12pt; font-family: trebuchet ms,geneva;"><span style="font-size: 12pt;">Juara umum MTQ &amp; Festival Anak Shaleh Indonesia III tingkat daerah Depok, dengan piala bergilir Walikota Depok (Tahun 2002)</span></span></li>\r\n<li><span style="font-size: 12pt; font-family: trebuchet ms,geneva;"><span style="font-size: 12pt;">Juara umum MTQ &amp; Festival Anak Shaleh Indonesia IV tingkat daerah Depok (Tahun 2002)</span></span></li>\r\n<li><span style="font-size: 12pt; font-family: trebuchet ms,geneva;"><span style="font-size: 12pt;">Juara ditingkat propinsi DKI Jakarta (Tahun 1994, 1996, 1998,2002)</span></span></li>\r\n</ul>\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-family: trebuchet ms,geneva;"><b><span style="font-size: 12pt;"></span></b><b><span style="font-size: 12pt;"></span></b><b><span style="font-size: 12pt;">Juara-Juara ditingkat Nasional</span></b></span></p>\r\n<ul>\r\n<li style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-family: trebuchet ms,geneva;"><span style="font-size: 12pt;"></span><span style="font-size: 12pt;"><span style="font-size: 12pt;">Juara II Cerdas Cermat TPA tingkat Nasional (Tahun 1994) di Jakarta.</span></span></span></li>\r\n<li><span style="font-size: 12pt; font-family: trebuchet ms,geneva;"><span style="font-size: 12pt;">Juara IITQA Putra tingkat Nasional (Tahun 1994) di Jakarta.</span></span></li>\r\n<li><span style="font-size: 12pt; font-family: trebuchet ms,geneva;"><span style="font-size: 12pt;">Juara II Kaligrafi Putri TQA tingkat Nasional (Tahun1994) di Jakarta.</span></span></li>\r\n<li><span style="font-size: 12pt; font-family: trebuchet ms,geneva;"><span style="font-size: 12pt;">Finalis Nasyid Islami TPA tingkat Nasional (Tahun 1994) di Jakarta.</span></span></li>\r\n<li><span style="font-size: 12pt; font-family: trebuchet ms,geneva;"><span style="font-size: 12pt;">Peserta Tarjamah Lafdziah TQA tingkat Nasional (Tahun 1994) di Jakarta</span></span></li>\r\n<li><span style="font-size: 12pt; font-family: trebuchet ms,geneva;"><span style="font-size: 12pt;">Peserta Nasyid Islami TKA tingkat Nasional (Tahun 1996) di Surabaya</span></span></li>\r\n<li><span style="font-size: 12pt; font-family: trebuchet ms,geneva;"><span style="font-size: 12pt;">Peserta Kaligrafi Putra-putri TQA tingkat Nasional (Tahun 1996) di Surabaya.</span></span></li>\r\n<li><span style="font-size: 12pt; font-family: trebuchet ms,geneva;"><span style="font-size: 12pt;">Peserta Tarjamah Lafdziah TQA Tingkat Nasional (Tahun 1996) di Surabaya.</span></span></li>\r\n<li><span style="font-size: 12pt; font-family: trebuchet ms,geneva;"><span style="font-size: 12pt;">Juara I Cerdas Cermat TKA tingkat Nasional (Tahun 2002) di Jogjakarta.</span></span></li>\r\n</ul>', '', 1, 7, 0, 37, '2011-09-06 08:40:52', 63, '', '2011-09-07 07:19:22', 63, 0, '0000-00-00 00:00:00', '2011-09-06 08:40:52', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 3, 0, 3, '', '', 0, 46, 'robots=\nauthor='),
(85, 'OSIS MTs AL-IKHLAS', 'osis-mts-al-ikhlas', '', '<p>OSIS ( Organisasi Siswa Intra Sekolah ) merupakan satu-satunya organisasi kesiswaan yang berada di lingkungan sekolah. Tujuan didirikannya OSIS adalah untuk melatih siswa dalam berorganisasi dengan baik dan menjalankan kegiatan sekolah yang berhubungan dengan siswa. Kegiatan yang dilaksanakan oleh OSIS dapat dibagi atas 2 macam kegiatan, yaitu <strong>kegiatan rutin</strong> dan <strong>kegiatan insidentil</strong>.</p>\r\n<p>Contoh kegiatan rutin adalah melaksanakan peringatan Hari Besar Agama, peringatan Hari Nasional, Latihan Kepemimpinan, Peringatan hari Jadi Sekolah, dan Masa Orientasi Siswa baru. Sedangkan contoh kegiatan insidentil yang pernah dilaksanakan adalah kegiatan Pekan Muharram 1431 H dengan tema "Bhakti Sosial OSIS MTs Al-Ikhlas terhadap anak yatim piatu serta janda jompo di Masyarakat sekitar Yayasan Al-Ikhlas. Hal ini tidak lain merupakan salah satu bentuk kepedulian OSIS Mts Al-Ikhlas terhadap Masyarakt tidak mampu.</p>\r\n<p>Sementara itu susunan pengurus OSIS terdiri atas Pengurus Inti dan beberapa Seksi. Kepengurusan OSIS ini selalu diganti setiap tahun karena siswa kelas IX diharapkan tidak disibukkan dengan kegiatan ini karena mereka harus lebih konsentrasi untuk persiapan ujian akhir. Semoga OSIS akan selalu tetap maksimal dalam mengembangkan kemampuan dan kreatifitasnya dalam menjalankan kegiatannya, karena dari organisasi di tingkat sekolah ini kelak akan lahir calon-calon pemimpin bangsa di masa depan.</p>', '', 1, 6, 0, 38, '2011-09-06 09:43:11', 63, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-09-06 09:43:11', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 2, '', '', 0, 8, 'robots=\nauthor='),
(86, 'Garis Besar Program Kegiatan OSIS MTs Al-Ikhlas', 'garis-besar-program-kegiatan-osis-mts-al-ikhlas', '', '<p><span style="color: #3366ff; font-weight: bold;">1. Pembinaan Ketakwaan Terhadap Tuhan Yang Maha Esa</span></p>\r\n<ul>\r\n<li>Mengadakan Latihan Qiro''ah dan Pidato</li>\r\n<li>Memperingati hari besar Islam</li>\r\n<li>Melaksanakan perbuatan amaliah sesuai dengan norma agama</li>\r\n<li>Mengadakan kegiatan lomba yang bersifat keagamaan</li>\r\n<li>Menyelenggarakan kegiatan seni yang bernafaskan keagamaan</li>\r\n</ul>\r\n<p><span class="fullpost"><span class="fullpost"><br /><span style="color: #3366ff; font-weight: bold;">2. Pembinaan Kehidupan Berbangsa dan Bernegara<br /></span></span></span></p>\r\n<ul>\r\n<li>Melaksanakan upacara bendera pada setiap hari senin dan hari-hari besar nasional</li>\r\n<li>Melaksanakan bakti sosial-masyarakat</li>\r\n<li>Meningkatkan ketertiban, kerapian, kedisiplinan, dan tata tertib sekolah</li>\r\n</ul>\r\n<p><span class="fullpost"><span class="fullpost"><span style="color: #3366ff; font-weight: bold;"><span class="fullpost"><span class="fullpost"><br /><span style="color: #3366ff; font-weight: bold;">3. Pembinaan Pendidikan Pendahuluan Belanegara<br /></span></span></span></span></span></span></p>\r\n<ul>\r\n<li>Mengadakan latihan pramuka</li>\r\n<li>Mengadakan perkemahan pada akhir semester</li>\r\n<li>Menggiatkan kedisiplinan dan keterampilan siswa dalam pendidikan kepramukaan melalui latihan dan perlombaan</li>\r\n<li>Melaksanakan wisata siswa/study tour, pecinta alam, kelestarian alam dan lingkungan</li>\r\n<li>Mempelajari dan menghayati semangat perjuangan para pahlawan bangsa (napak tilas)</li>\r\n</ul>\r\n<p><span class="fullpost"><span class="fullpost"><span style="color: #3366ff; font-weight: bold;"><span class="fullpost"><span class="fullpost"><span style="color: #3366ff; font-weight: bold;"><span class="fullpost"><span class="fullpost"><br /><span style="color: #3366ff; font-weight: bold;">4. Pembinaan Kepribadian dan Budi Pekerti Luhur<br /></span></span></span></span></span></span></span></span></span></p>\r\n<ul>\r\n<li>Mengadakan kegiatan bhakti sosial setahun sekali</li>\r\n<li>Mengadakan kerja bakti di lingkungan sekolah setiap 2 minggu sekali</li>\r\n<li>Memberikan bantuan kepada fakir miskin dan yatim-piatu</li>\r\n<li>Memberikan bantuan terhadap korban bencana alam</li>\r\n</ul>\r\n<p><span class="fullpost"><span class="fullpost"><span style="color: #3366ff; font-weight: bold;"><span class="fullpost"><span class="fullpost"><span style="color: #3366ff; font-weight: bold;"><span class="fullpost"><span class="fullpost"><span style="color: #3366ff; font-weight: bold;"><span class="fullpost"><span class="fullpost"><br /><span style="color: #3366ff; font-weight: bold;">5. Pembinaan Berorganisasi, Pendidikan Politik dan Kepemimpinan<br /></span></span></span></span></span></span></span></span></span></span></span></span></p>\r\n<ul>\r\n<li>Mengadakan latihan pengibaran bendera untuk hari senin</li>\r\n<li>Melaksanakan kepemimpinan siswa</li>\r\n<li>Mengadakan forum diskusi ilmiah</li>\r\n<li>Mengadakan media komunikasi OSIS ( Buletin, Majalah Dinding dan Sebagainya )</li>\r\n<li>Mengadakan pertemuan/musyawarah setiap sebulan sekali bagi semua pengurus OSIS</li>\r\n</ul>\r\n<p><span class="fullpost"><span class="fullpost"><span style="color: #3366ff; font-weight: bold;"><span class="fullpost"><span class="fullpost"><span style="color: #3366ff; font-weight: bold;"><span class="fullpost"><span class="fullpost"><span style="color: #3366ff; font-weight: bold;"><span class="fullpost"><span class="fullpost"><span style="color: #3366ff; font-weight: bold;"><span class="fullpost"><span class="fullpost"><br /><span style="color: #3366ff; font-weight: bold;">6. Pembinaan Keterampilan dan Kewiraswastaan<br /></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>\r\n<ul>\r\n<li>Meningkatkan usaha keterampilan tangan (hasta karya)</li>\r\n<li>Meningkatkan penyelenggaraan perpustakaan sekolah</li>\r\n</ul>\r\n<p><span class="fullpost"><span class="fullpost"><span style="color: #3366ff; font-weight: bold;"><span class="fullpost"><span class="fullpost"><span style="color: #3366ff; font-weight: bold;"><span class="fullpost"><span class="fullpost"><span style="color: #3366ff; font-weight: bold;"><span class="fullpost"><span class="fullpost"><span style="color: #3366ff; font-weight: bold;"><span class="fullpost"><span class="fullpost"><span style="color: #3366ff; font-weight: bold;"></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></p>', '', 1, 6, 0, 38, '2011-09-06 09:48:15', 63, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-09-06 09:48:15', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 1, '', '', 0, 10, 'robots=\nauthor='),
(87, 'Misi, Visi dan Motto', 'misi-visi-dan-motto', '', '<p><strong>Visi AL-IKHLAS CITRA UTAMA</strong></p>\r\n<p>Menciptakan Generasi Muda Berakhlak Islami dan Memiliki Kompetensi Guna Bersaing di Kancah Internasional</p>\r\n<p><strong>Misi AL-IKHLAS CITRA UTAMA</strong></p>\r\n<ul>\r\n<li>Menciptakan dan Menyelenggarakan Proses Belajar Mengajar yang Terutama di Prioritaskan Kepada Masyarakat Dhuafa, Dengan Meminimalkan Biaya Pendidikan Demi Terwujudnya Pemerataan Pendidikan Bagi Masyarakat.</li>\r\n<li>Ikut Mencerdaskan Kehidupan Bangsa dan Ikut Melaksanakan Pendidikan dalam Meningkatkan Harkat dan Martabat Manusia Indonesia Seutuhnya.</li>\r\n<li>Menyelenggarakan Bhakti Sosial Kepada Anak Yatim Serta Masyarakat Kurang Mampu Sebagai Bentuk Kepedulian AL-IKHLAS CITRA UTAMA Terhadap Masyarakat Luas.</li>\r\n<li>Memadukan Kompetensi Islami, Teknologi Serta Modernisasi Sebagai Bekal Generasi Muda di Masa Mendatang</li>\r\n</ul>\r\n<p><strong>Motto AL-IKHLAS CITRA UTAMA</strong></p>\r\n<p>Maju Bersama Membangun Ummat</p>', '', 1, 7, 0, 37, '2011-09-06 17:23:59', 63, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-09-06 17:23:59', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 2, '', '', 0, 15, 'robots=\nauthor=');
INSERT INTO `jos_content` (`id`, `title`, `alias`, `title_alias`, `introtext`, `fulltext`, `state`, `sectionid`, `mask`, `catid`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `images`, `urls`, `attribs`, `version`, `parentid`, `ordering`, `metakey`, `metadesc`, `access`, `hits`, `metadata`) VALUES
(88, 'Kontektualisasi dan Reposisi Fungsi Wakaf', 'kontektualisasi-dan-reposisi-fungsi-wakaf', '', '<p style="margin-bottom: 0.0001pt; text-indent: 36pt; line-height: normal; text-align: center;"><span style="text-decoration: underline; font-family: trebuchet ms,geneva; font-size: 12pt;"><b>BADAN WAKAF ALIKHLAS</b></span></p>\r\n<p class="float-left float-right floatbox" style="margin-bottom: 0.0001pt; text-indent: 36pt; line-height: normal; text-align: center;"><span style="font-family: trebuchet ms,geneva; font-size: 12pt;"><b><br /></b></span></p>\r\n<p class="float-left float-right floatbox" style="margin-bottom: 0.0001pt; text-indent: 36pt; line-height: normal; text-align: center;"><span style="font-family: trebuchet ms,geneva; font-size: 12pt;"><b><br /></b></span></p>\r\n<p class="float-left float-right floatbox" style="margin-bottom: 0.0001pt; text-indent: 36pt; line-height: normal; text-align: center;"><span style="font-family: trebuchet ms,geneva; font-size: 12pt;"><b><br /></b></span></p>\r\n<p class="float-left float-right floatbox" style="margin-bottom: 0.0001pt; text-indent: 36pt; line-height: normal; text-align: center;"><span style="font-family: trebuchet ms,geneva; font-size: 12pt;"><b><br /></b></span></p>\r\n<p class="float-left float-right floatbox" style="margin-bottom: 0.0001pt; text-indent: 36pt; line-height: normal; text-align: center;"><span style="font-family: trebuchet ms,geneva; font-size: 12pt;"><b><br /></b></span></p>\r\n<p class="float-left float-right floatbox" style="margin-bottom: 0.0001pt; text-indent: 36pt; line-height: normal; text-align: center;"><span style="font-family: trebuchet ms,geneva; font-size: 12pt;"><b><br /></b></span></p>\r\n<p class="float-left float-right floatbox" style="margin-bottom: 0.0001pt; text-indent: 36pt; line-height: normal; text-align: center;"><span style="font-family: trebuchet ms,geneva; font-size: 12pt;"><b>Kontektualisasi dan Reposisi Fungsi Wakaf</b></span></p>\r\n<p class="float-left float-right floatbox" style="margin-bottom: 0.0001pt; text-indent: 36pt; line-height: normal; text-align: center;"><span style="font-family: trebuchet ms,geneva; font-size: 12pt;"><b><br /></b></span></p>\r\n<p style="margin-bottom: 0.0001pt; text-indent: 36pt;" class="float-left"><span style="font-family: ''Trebuchet MS'',''sans-serif''; font-size: 12pt;"><img style="float: left;" alt="logo-wakap" src="images/logo-wakap.png" height="140" width="140" />Wacana tentang <b>wakaf</b>, belakangan muncul kembali ke permukaan. Tidak lagi sekedar membincangkan tentang pandangan para ulama fiqh yang belum seragam tentang pengertian dan <b>hakikat wakaf </b>itu sendiri, tetapi lebih pada bagaimana mereposisi <b>institus</b><b>i wa</b><b>kaf </b>agar lebih berperan dalam kancah problem sosial masyarakat terkait dengan kesejahteraan ekonomi. Karena disamping sebagai salah satu bentuk ajaran yang berdimensi spiritual, wakaf merupakan ajaran Islam yang berdimensi sosial, atau dalam bahasa agama disebut sebagai ibadah ijtimaiyyah. Karenanya redefinisi terhadap wakaf ,- agar lebih memiliki makna yang relevan dengan kondisi riil persoalan kesejahteraan umat menjadi suatu yang sangat strategis.</span></p>\r\n<p> </p>\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; text-indent: 36pt;" class="float-left"><span style="font-family: ''Trebuchet MS'',''sans-serif''; font-size: 12pt;">Merujuk pada praktek pelaksanaan wakaf yang dianjurkan oleh Nabi dan dicontohkan oleh para Shahabat, dimana sangat menekankan pada pentingnya menahan eksistensi benda wakaf, dan diperintahkan untuk menyedekahkan hasil dari pengelolaan benda tersebut. Pemahaman yang mudah dicerna dari kondisi tersebut adalah bahwa substansi wakaf itu tidak semata-mata terletak pada pemeliharaan bendanya (wakaf) tetapi yang jauh lebih penting adalah nilai manfaat dari benda tersebut untuk kepentingan umum. Institusi wakaf ini sesungguhnya telah dipraktikan dalam masyarakat jauh sebelum Islam masuk ke Indonesia, ia telah menjadi suatu bentuk adat kebiasaan yang melembaga di beberapa komunitas masyarakat di Indonesia. Sebut saja “Huma Serang”, praktik serupa wakaf dalam ajaran Islam ini telah lama dikenal di Banten, di Lombok ada “Tanah Pareman”, atau “Tanah Perdikan” di Jawa Timur, .bentuk-bentuk tersebut hampir menyerupai wakaf keluarga apabila dilihat fungsi dan pemanfaatannya yang tidak boleh diperjual belikan<b>.</b></span></p>\r\n<p><span style="font-size: 12pt;"><strong><br /></strong></span></p>\r\n<p><span style="font-size: 12pt;"><strong>Kronologi History Wakaf</strong></span></p>\r\n<p class="float-left float-right floatbox" style="margin-bottom: 0.0001pt; text-align: justify; text-indent: 36pt; line-height: normal;"><span style="font-size: 12pt;">Sejak datangnya Islam, wakaf dilaksanakan berdasarkan paham yang dianut oleh mayoritas masyarakat Islam Indonesia, yaitu paham Syafi’iyyah dan adat kebiasaan setempat. Pola pelaksanaan wakaf sebelum lahirnya peraturan perundang-undangan yang mengatur wakaf.</span></p>\r\n<p class="float-left float-right floatbox" style="margin-bottom: 0.0001pt; text-align: justify; text-indent: 36pt; line-height: normal;"> </p>\r\n<p class="float-left float-right floatbox" style="margin-bottom: 0.0001pt; text-align: justify; text-indent: 36pt; line-height: normal;"> </p>\r\n<p class="float-left float-right floatbox" style="margin-bottom: 0.0001pt; text-align: justify; text-indent: 36pt; line-height: normal;"> </p>\r\n<p class="float-left float-right floatbox" style="margin-bottom: 0.0001pt; text-align: justify; text-indent: 36pt; line-height: normal;"> </p>\r\n<p class="float-left float-right floatbox" style="margin-bottom: 0.0001pt; text-align: justify; text-indent: 36pt; line-height: normal;"> </p>\r\n<p><span style="font-family: trebuchet ms,geneva; font-size: 12pt;"><b><br /></b></span></p>\r\n<p><span style="font-family: trebuchet ms,geneva; font-size: 12pt;"><b>Kontektualisasi dan Reposisi Fungsi Wakaf</b></span></p>\r\n<p class="float-left float-right floatbox" style="margin-bottom: 0.0001pt; text-align: justify; text-indent: 36pt; line-height: normal;"><span style="font-family: trebuchet ms,geneva; font-size: 12pt;">Masih menggunakan kebiasaan-kebiasaan keagamaan seperti mewakafkan tanah secara lisan dan atas dasar saling percaya kepada seseorang atau lembaga tertentu tanpa melalui prosedur administratif karena dianggap sebagai suatu amalan ibadah semata dan harta wakaf merupakan milik Allah semata yang siapapun tidak akan berani menggugat. Jika selama ini masalah wakaf kurang intensif dibahas bisa jadi karena umat Islam mulai hampir melupakan kegaiatan-kegiatan yang berasal dari lembaga perwakafan, selain itu adanya mismanagemen dan korupsi dalam pengelolaan wakaf menyebabkan pamor lembaga wakaf makin terlupakan. Padahal, potensi wakaf sebagai salah satu instrumen dalam membangun sosial ekonomi kehidupan umat, sesungguhnya tidak dapat dipandang sebelah mata. Wakaf telah memberikan kontribusi yang tidak sedikit di beberapa negara Islam lain.</span></p>\r\n<p class="float-left float-right floatbox" style="margin-bottom: 0.0001pt; text-align: justify; text-indent: 36pt; line-height: normal;"><span style="font-family: trebuchet ms,geneva; font-size: 12pt;">Dengan pengelolaan aset <b>wakaf yang professional, </b>Mesir telah berhasil membangun sektor pendidikan dan medis dari dana hasil pengelolaan wakaf. <b>Universitas Al-Azhar Cairo</b>, rumah-rumah sakit, pendidikan dan pemberdayaan tenaga pendidik serta beasiswa bagi para mahasiswa dibiayai dari hasil wakaf. Bahkan sebagai gambaran di Amerika Serikat, sebuah negara sekuler terbesar telah mengelola wakaf dari <b>warga muslim minoritasnya secara professional oleh lembaga keuangan Islam, Kuwait Awqaf Pubilc Foundation (KADF).</b></span></p>\r\n<p class="float-left float-right floatbox" style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-family: trebuchet ms,geneva; font-size: 12pt;">Potensi wakaf di Indonesia sendiri sesungguhnya dapat menjadi tumpuan harapan peningkatan kesejahteraan sosial masyarakat serta pengentasan kemiskinan -di samping zakat, infak dan shadaqah,- apabila dapat dikelola secara baik dan professional. Dalam praktiknya di Indonesia, perwakafan amat lekat dengan wakaf tanah meskipun pada hakikatnya benda yang dapat diwakafkan tidak terbatas pada tanah. Menurut data yang ada di Departemen Agama RI, sampai dengan bulan September 2002, jumlah seluruh tanah wakaf di Indonesia sebanyak 362,471 lokasi dengan luas 1.535.198.586,59 m2. Namun data tersebut belumlah akurat mengingat data-data tentang asset wakaf tidak terkoordinir dengan baik dan terpusat dalam satu institusi yang professional. Dan umumnya tanah-tanah tersebut dikelola secara tradisional dan tidak produktif. Sehingga kurang terasa kontribusi dan manfaatnya bagi peningkatan kualitas hidup umat. Ironisnya disamping tidak terurus dan terbengkalai, banyak tanah wakaf yang belum bersertifikat sehingga sering menjadi objek sengketa bahkan diperjualbelikan oleh oknum-oknum yang tidak bertanggung jawab.</span></p>\r\n<p class="float-left float-right floatbox" style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-family: trebuchet ms,geneva; font-size: 12pt;">Mengantisipasi kondisi tersebut, pemerintah telah mencanangkan beberapa tindakan antara lain : pertama, melakukan sertifikasi tanah wakaf yang ada di seluruh tanah air. Secara teknis hal ini tidaklah mudah dan membutuhkan biaya yang tidak sedikit maka penting untuk melibatkan instansi terkait seperti Badan Pertanahan Nasional (BPN) dalam proses pembuatan.</span></p>\r\n<p class="float-left float-right floatbox" style="margin-bottom: 0.0001pt; text-align: justify; text-indent: 36pt; line-height: normal;"><span style="font-family: trebuchet ms,geneva; font-size: 12pt;">Sertifikat dan Pemerintah Daerah setempat guna menanggulangi pembiayaan sertifikasi, pengelolaan, pemberdayaan dan pengembangan tanah-tanah wakaf yang ada. Kedua, memberikan advokasi penuh terhadap tanah-tanah wakaf yang menjadi sengketa. Ketiga, menyusun suatu peraturan perundang-undangan yang komprehensif tentang wakaf, dalam bentuk Undang-undang. Keempat, pemanfaatan dan pemberdayaan tanah wakaf secara produktif.</span></p>\r\n<p class="float-left float-right floatbox" style="margin-bottom: 0.0001pt; text-align: justify; text-indent: 36pt; line-height: normal;"><span style="font-family: trebuchet ms,geneva; font-size: 12pt;"><br /></span></p>\r\n<p class="float-left float-right floatbox" style="margin-bottom: 0.0001pt; text-align: justify; text-indent: 36pt; line-height: normal;"><span style="font-family: trebuchet ms,geneva; font-size: 12pt;"><br /></span></p>\r\n<p class="float-left float-right floatbox" style="margin-bottom: 0.0001pt; text-align: justify; text-indent: 36pt; line-height: normal;"><span style="font-family: trebuchet ms,geneva; font-size: 12pt;"><br /></span></p>\r\n<p class="float-left float-right floatbox" style="margin-bottom: 0.0001pt; text-align: justify; text-indent: 36pt; line-height: normal;"><span style="font-family: trebuchet ms,geneva; font-size: 12pt;"><br /></span></p>\r\n<p class="float-left float-right floatbox" style="margin-bottom: 0.0001pt; text-align: justify; text-indent: 36pt; line-height: normal;"><span style="font-family: trebuchet ms,geneva; font-size: 12pt;"><br /></span></p>\r\n<p class="float-left float-right floatbox" style="margin-bottom: 0.0001pt; text-align: justify; text-indent: 36pt; line-height: normal;"><span style="font-family: trebuchet ms,geneva; font-size: 12pt;"><br /></span></p>\r\n<p class="float-left float-right floatbox" style="margin-bottom: 0.0001pt; text-align: justify; text-indent: 36pt; line-height: normal;"><span style="font-family: trebuchet ms,geneva; font-size: 12pt;"><br /></span></p>\r\n<p class="float-left float-right floatbox" style="margin-bottom: 0.0001pt; text-align: justify; text-indent: 36pt; line-height: normal;"><span style="font-family: trebuchet ms,geneva; font-size: 12pt;"><br /></span></p>\r\n<p class="float-left float-right floatbox" style="margin-bottom: 0.0001pt; text-align: justify; text-indent: 36pt; line-height: normal;"><span style="font-family: trebuchet ms,geneva; font-size: 12pt;"><br /></span></p>\r\n<p class="float-left float-right floatbox" style="margin-bottom: 0.0001pt; text-align: justify; text-indent: 36pt; line-height: normal;"><span style="font-family: trebuchet ms,geneva; font-size: 12pt;"><span style="font-family: trebuchet ms,geneva;"><span style="font-family: trebuchet ms,geneva;"><span style="font-family: trebuchet ms,geneva;"><b><br /></b></span></span></span></span></p>\r\n<p class="float-left float-right floatbox" style="margin-bottom: 0.0001pt; text-align: justify; text-indent: 36pt; line-height: normal;"><span style="font-family: trebuchet ms,geneva; font-size: 12pt;"><span style="font-family: trebuchet ms,geneva;"><span style="font-family: trebuchet ms,geneva;"><span style="font-family: trebuchet ms,geneva;"><b><br /></b></span></span></span></span></p>\r\n<p class="float-left float-right floatbox" style="margin-bottom: 0.0001pt; text-align: justify; text-indent: 36pt; line-height: normal;"><span style="font-family: trebuchet ms,geneva; font-size: 12pt;"><span style="font-family: trebuchet ms,geneva;"><span style="font-family: trebuchet ms,geneva;"><span style="font-family: trebuchet ms,geneva;"><b><br /></b></span></span></span></span></p>\r\n<p><span style="font-family: trebuchet ms,geneva; font-size: 12pt;"><span style="font-family: trebuchet ms,geneva;"><span style="font-family: trebuchet ms,geneva;"><span style="font-family: trebuchet ms,geneva;"><b><br /></b></span></span></span></span></p>\r\n<p><span style="font-family: trebuchet ms,geneva; font-size: 12pt;"><span style="font-family: trebuchet ms,geneva;"><span style="font-family: trebuchet ms,geneva;"><span style="font-family: trebuchet ms,geneva;"><b>Tela''ah Yuridis Formil Undang –Undang Wakaf</b></span></span></span><span style="font-family: trebuchet ms,geneva;"><span style="font-family: trebuchet ms,geneva;"></span></span></span></p>\r\n<p class="float-left float-right floatbox" style="margin-bottom: 0.0001pt; text-align: justify; text-indent: 36pt; line-height: normal;"><span style="font-family: trebuchet ms,geneva; font-size: 12pt;">Peraturan perundang-undangan yang selama ini mengatur masalah perwakafan masih tersebar dalam berbagai peraturan perundang-undangan antara lain: UU No.5 tahun 1960 tentang Undang-undang Pokok Agraria, PP No.28 tahun 1977 Tentang Perwakafan Tanah Milik, Peraturan Menteri Agama RI No.1 Tahun 1978 Tentang Pelaksanaan PP No.28 Tahun 1977, Peraturan Dirjen Bimas Islam DEPAG RI No. Kep/D/75/1978 dan Inpres RI No. 1 Tahun 1991 Tentang Kompilasi Hukum Islam (KHI) dianggap belum memadai dan masih menjadi persoalan yang belum terselesaikan dengan baik, sehingga kemauan kuat dari umat Islam untuk memaksimalkan peran kelembagaan dalam bidang perwakafan masih mengalami kendala-kendala formil. Berkaca dari peraturan tentang zakat, kelembagaan dan pengelolaan wakaf masih jauh dari professional dan hanya diatur dengan beberapa peraturan yang belum integral.</span></p>\r\n<p style="text-align: justify;" class="float-left float-right floatbox"><span style="font-family: trebuchet ms,geneva; font-size: 12pt;">Sejalan dengan Undang-undang No. 25 tahun 2000 tentang Program Pembangunan Nasional Propenas tahun 2000-2004 dan TAP MPR No.IV/MPR/1999 tentang GBHN Tahun 1999-2004 yang antara lain menetapkan arah kebijakan pembangunan hukum, maka dipandang perlu dan inhenren untuk menyusun suatu Rancangan Undang-undang tentang wakaf . Undang –undang wakaf yang telah dihasilkan oleh DPR dan Pemerintah kita sesungguhnya menyiratkan satu harapan lahirnya suatu Undang-undang yang komprehensif tentang wakaf sehingga kendala-kendala formil yang menghambat pemberdayaan wakaf dapat segera teratasi.</span></p>\r\n<p style="text-align: justify;" class="float-left float-right floatbox"><span style="font-family: trebuchet ms,geneva; font-size: 12pt;">         Disadari bahwa masih belum terintegrasinya peraturan teknis pengelolaan wakaf, kelemahan pengaturan hukum persoalan wakaf terkait dengan kepastian perlindungan rasa aman bagi pihak-pihak terkait seperti wakif (orang yang mewakafkan); Nadzir (pengelola wakaf) dan maukuf alaihi (peruntukan wakaf) baik perseorangan maupun badan hukum, dan keterbatasan aturan mengenai perwakafan merupakan kelemahan dan kendala formil yang mengurangi optimalisasi pemberdayaan wakaf secara keseluruhan. Wakaf merupakan perbuatan hokum yang hanya dimiliki oleh Islam, maka potensial untuk dikembangakan sesuai dengan fungsinya dimana sekalipun berbentuk kebendaan tetapi tetap pada posisi sebagai perbuatan ibadah, karenanya penting untuk menyusun substansi yang komprehensif dan mewakili ruh yang hakiki</span></p>\r\n<p style="text-align: justify;" class="float-left float-right floatbox"><span style="font-family: trebuchet ms,geneva; font-size: 12pt;">       Dari lembaga wakaf ini mengingat ia adalah produk fiqh yang tidak lepas dari khilafiyah, sehingga penting untuk mencapai satu kesepakatan hukum agar dapat diterapkan. Disanalah peran legalisasi dari pihak yang berwenang dlam mengatasi perbedaan persepsi tentang wakaf. Hal ini sejalan dengan kaidah fiqh "hukmu al hakim yarfa''u al-khilaf" (Keputusan pemerintah akan menghilangkan perbedaan).<b></b><span style="text-transform: uppercase;"></span></span></p>\r\n<p class="float-left float-right floatbox" style="margin-bottom: 0.0001pt; text-align: justify; text-indent: 36pt; line-height: normal;"><span style="font-family: trebuchet ms,geneva; font-size: 12pt;"><span style="text-transform: uppercase;"></span> Poin Poin Penting Dalam Undang –undang Wakaf Yang Melingkupi Materi Yang Mengatur Masalah Wakaf Mulai Dari Ketentuan Umum Mengenai</span></p>\r\n<p class="float-left float-right floatbox" style="margin-bottom: 0.0001pt; text-align: justify; text-indent: 36pt; line-height: normal;"><span style="font-family: trebuchet ms,geneva; font-size: 12pt;">Definisi dari wakaf dan hal-hal mendasar lainnya sampai pada ketentuan pidana dan sanksi administratif bagi pelanggaran terhadap ketentuan-ketentuan dalam pasal-pasal iru. Sistematika Undang undang ini tampak lebih sempurna dibanding aturan tentang wakaf yang ada dalam KHI. Munculnya beberapa substansi baru yang diatur dalam undang-undang ini tampaknya merupakan jawaban dan solusi atas fenomena lembaga perwakafan di Indonesia sebagaimana digambarkan sebelumnya. Beberapa catatan penting Undang undang tentang wakaf ini diantaranya ketentuan mengenai Wakif, jika dalam KHI disebutkan wakif sebagai orang atau orang-orang ataupun badan hukum yang mewakafkan benda miliknya. Dalam dalam salah salah satu pasalnya, undang-undang wakaf telah mengalami penyempurnaan terutama yang mnyebutkan bahwa selain perseorangan, baik WNI maupun WNA, organisasi, badan hukum Indonesia maupun asing dapat mewakafkan hartanya.</span></p>\r\n<p class="float-left float-right floatbox" style="margin-bottom: 0.0001pt; text-align: justify; text-indent: 36pt; line-height: normal;"><span style="font-family: trebuchet ms,geneva; font-size: 12pt;">Tampaknya undang-undang wakaf ini berusaha menjaring pihak-pihak yang lebih luas guna mengoptimalkan potensi wakaf. Ketentuan mengenai nazhir sebagai pengelola wakaf memang tidak banyak mengalami perubahan, tetapi tampak ada penekanan persyaratan professional dan job description yang lebih jelas bagi nazhir, tidak semata pada persyaratan normative. Hal ini mengarah pada pengelolaan wakaf yang professional dan bertanggungjawab. Selanjutnya reinterpretasi konsep wakaf yang dilatarbelakangi oleh perkembangan persoalan yang makin kompleks, perubahan sosial, perkembangan teori ekonomi dan moneter serta teori pembangunan memunculkan konsep wakaf tunai (cash waqaf) yang diprakarsai oleh Prof M.A. Mannan, <i>- pakar ekonomi dari Bangladesh,-</i>.</span></p>\r\n<p class="float-left float-right floatbox" style="margin-bottom: 0.0001pt; text-align: justify; text-indent: 36pt; line-height: normal;"><span style="font-family: trebuchet ms,geneva; font-size: 12pt;">Dalam upaya optimalissai pengelolaan potensi wakaf dan perluasan cakupan harta wakaf. Undang-undang ini mengakomodir fenomena diatas dengan memungkinkan adanya waqaf dari benda bergerak berupa uang, logam mulia, surat berharga , kendaraan, HAKI, hak sewa bahkan membuka kemungkinan adanya bentuk benda/objek wakaf yang lain. Hal ini merupakan tuntutan dari stimulus riil dalam perkembangan ekonomi dan tidak lagi sekedar menjadi wacana karena telah dipraktekkan di negara-negara muslim lainnya seperti Bangladesh, Mesir, Qatar, Saudi Arabia, Kuawait dan lain-lainnya. Komisi fatwa MUI sendiri telah mengeluarkan fatwa mengenai wakaf tunai ini sejak Mei 2002. Ketentuan mengenai wakaf tunai ini dapat memungkinkan timbulnya pembaharuan tentang keberlakuan wakaf yang permanen menuju wakaf dengan jangka waktu (berjangka) seperti tanah HGB, uang deposito, saham dan lain sebagainya. Walaupun udang-undang ini memang tidak menyebutkan jenis wakaf seperti ini secara eksplisit tapi tidak menutup kemungkinan dalam peraturan pelaksanaannya diatur mengenai hal tersebut. Konsep ini. pada hakikatnya bertujuan untuk menjaring potensi wakaf sedemikian rupa agar dapat dimanfaatkan secara maksimal. Wakaf tunai juga melibatkan lembaga keuangan syariah sebagai mediator, namun yang mungkin belum diatur adalah adanya lembaga penjamin untuk mengantisipasi kemungkinan habisnya harta wakaf apabila terjadi pailit. Harus disadari pula bahwa pengelolaan dana wakaf tunai ini merupakan dana publik yang harus dipertanggungjawabkan secara trasparan dan accountable. Suatu peraturan Undang-undang yang baik selain tergali dari nilai-nilai sosiologis masyarakat juga harus dapat diimplementasikan dan memiliki daya tegak. Karenanya undang-undang ini perlu mendelegasikan peran-peran teknis tertentu kepada peraturan dibawahnya agar ketentuan dan norma-norma dalam undang-undang dapat teraplikasi dan menghindari undang-undang ini kelak dari kemandulan, sehingga perlu segera disiapkan peraturan pelaksana dan perangkat-perangkat penunjangnya. Disusunnya undang-undang ini juga dalam rangka menjamin kepastian hukum dan menjadi koridor kebijakan dalam advokasi dan penyelesaian sengketa wakaf. Undang undang wakaf ini mengamanatkan dibentuknya sebuah badan independen dan berskala nasional yang bertugas melakukan pembinaan dan pengawasan terhadap nazhir, memberikan persetujuan dan perubahan peruntukkan status wakaf, mengelola dan mengembangkan wakaf serta berwenang memberikan saran dan pertimbangan kepada pemerintah dalam hal penyusunan kebijakan di bidang perwakafan. Badan Independen ini pula yang bertugas mengembangkan wakaf secara produktif dan sesuai syari’at Islam melalui penggalian konsep fiqh wakaf. Tampaknya tugas inilah yang paling penting untuk segera direalisasikan. Pengawasan terhadap badan ini dilakukan melalui audit oleh lembaga audit yang juga independent dan hasilnya diumumkan pada khalayak.</span></p>\r\n<p class="float-left float-right floatbox" style="margin-bottom: 0.0001pt; text-align: justify; text-indent: 36pt; line-height: normal;"><span style="font-family: trebuchet ms,geneva; font-size: 12pt;">Sosialisasi pengembangan wakaf produktif kepada masyarakat juga bukan masalah yang sederhana, pemahaman yang sudah melekat di masyarakat tentang bentuk wakaf yang tidak produktif dan terbatas pada fungsi-fungsi tertentu membutuhkan proses pembelajaran sekaligus pembuktian yang membutuhkan energi yang tidak sedikit. Disanalah peran strategis BWI (Badan Wakaf Indonesia) dalam mereposisi peran wakaf agar mampu menjawab probelmatika sosial yang dialami umat.</span></p>\r\n<p><span style="font-size: 12pt;">Dengan lahirnya undang-undang trentang wakaf, maka peran dan tugas pemerintah sebagai pelaksana undang-undang ini tidaklah mudah. Kesungguhan dan profesionalitas harus benar-benar dapat dipertanggungjawabkan agar tujuan wakaf yang hakiki dapat terwujud. Dan bahwa undang-undang ini tidak sekedar menjawab kendala-kendala formil terkait dengan wakaf tapi menunjukkan kesungguhan kita untuk membangun kembali kesejahteraan umat melalui potensi umat.</span></p>\r\n<p><span style="font-family: trebuchet ms,geneva; font-size: 12pt;"><span style="font-family: trebuchet ms,geneva; font-size: 12pt;"><span style="font-family: trebuchet ms,geneva; font-size: 12pt;"><b>Penutup</b></span></span></span></p>\r\n<p class="float-left float-right floatbox" style="margin-bottom: 0.0001pt; text-align: justify; text-indent: 36pt; line-height: normal;"><span style="font-size: 12pt;"></span><span style="font-family: trebuchet ms,geneva; font-size: 12pt;">Undang-undang wakaf ini merupakan salah satu perangkat untuk mengembangkan wakaf produktif namun keberhasilan pengembangan wakaf tersebut juga sangat bergantung pada political will dari pemerintah dan komitmen seluruh umat Islam. Sungguh ini bukan proses yang ringan karena menyangkut banyak aspek dan terkait dengan pola pemahaman keberagamaan yang sudah berjalan berpuluh-puluh tahun. Selain kemaun dan kemampuan, dibutuhkan pula modal yang tidak sedikit.</span></p>\r\n<p class="float-left float-right floatbox" style="margin-bottom: 0.0001pt; text-align: justify; text-indent: 36pt; line-height: normal;"><span style="font-family: trebuchet ms,geneva; font-size: 12pt;"> </span></p>\r\n<p class="float-left float-right floatbox" style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-family: trebuchet ms,geneva; font-size: 12pt;">Wallahu a’lam bi alshawab </span></p>\r\n<p class="float-left float-right floatbox" style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-family: trebuchet ms,geneva; font-size: 12pt;">Ditulis Oleh Achmad Khaliq</span></p>\r\n<p> </p>', '', 1, 7, 0, 42, '2011-09-08 13:44:40', 63, '', '2011-09-13 07:57:49', 63, 0, '0000-00-00 00:00:00', '2011-09-08 13:44:40', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 16, 0, 2, '', '', 0, 31, 'robots=\nauthor='),
(89, 'Data Kondisi Pendidikan', 'data-kondisi-pendidikan', '', '<div class="MsoNormal" style="text-align: center;" align="center"><b><span style="font-size: 16pt; font-family: ''Times New Roman'',''serif'';" lang="EN-US">DATA KONDISI PENDIDIKAN</span></b></div>\r\n<div class="MsoNormal" style="text-align: center;" align="center"><b><span style="font-size: 16pt; font-family: ''Times New Roman'',''serif'';" lang="EN-US">JENJANG PENDIDIKAN SEKOLAH RA</span></b></div>\r\n<p> </p>\r\n<div class="MsoListParagraphCxSpMiddle" style="text-indent: -18pt; line-height: 150%;"><span style="font-size: 12pt; line-height: 150%; font-family: ''Times New Roman'',''serif'';" lang="EN-US"><span>       01.<span style="font: 7pt ''Times New Roman'';">  </span></span></span><span style="font-size: 12pt; line-height: 150%; font-family: ''Times New Roman'',''serif'';" lang="EN-US">Nama Sekolah<span>             </span>: </span><b><span style="font-size: 14pt; line-height: 150%; font-family: ''Times New Roman'',''serif'';" lang="EN-US">RA AL IKHLAS 290</span></b><span style="font-size: 12pt; line-height: 150%; font-family: ''Times New Roman'',''serif'';" lang="EN-US"><span><span style="font: 7pt ''Times New Roman'';"></span></span></span></div>\r\n<div class="MsoListParagraphCxSpMiddle" style="text-indent: -18pt; line-height: 150%;"><span style="font-size: 12pt; line-height: 150%; font-family: ''Times New Roman'',''serif'';" lang="EN-US"><span><span style="font: 7pt ''Times New Roman'';">            </span></span></span><span style="font-size: 12pt; line-height: 150%; font-family: ''Times New Roman'',''serif'';" lang="EN-US">02. Alamat Sekolah<span>           </span>: Jl. Gunung Putri Selatan no 28 Citeureup Bogor 16810</span></div>\r\n<div class="MsoListParagraphCxSpMiddle" style="text-indent: -18pt; line-height: 150%;"><span style="font-size: 12pt; line-height: 150%; font-family: ''Times New Roman'',''serif'';" lang="EN-US">       03.<span style="font: 7pt ''Times New Roman'';">  </span></span><span style="font-size: 12pt; line-height: 150%; font-family: ''Times New Roman'',''serif'';" lang="EN-US">Status Sekolah<span>             </span>: <b>Swasta</b></span></div>\r\n<div class="MsoListParagraphCxSpMiddle" style="text-indent: -18pt; line-height: 150%;"><span style="font-size: 12pt; line-height: 150%; font-family: ''Times New Roman'',''serif'';" lang="EN-US"><span>       04.<span style="font: 7pt ''Times New Roman'';">  </span></span></span><span style="font-size: 12pt; line-height: 150%; font-family: ''Times New Roman'',''serif'';" lang="EN-US">Jumlah Siswa<span>              </span>: 0 - 2 Th : 0<span>                     </span><span> </span>L : 0<span>                             </span><span> </span>P : 0</span></div>\r\n<div class="MsoListParagraphCxSpMiddle" style="margin-left: 144pt; line-height: 150%;"><span style="font-size: 12pt; line-height: 150%; font-family: ''Times New Roman'',''serif'';" lang="EN-US"><span>  </span>3 – 4 Th : <b>3</b> Siswa<span>           </span>L : <b>1</b> Siswa<span>                  </span><span> </span>P : <b>2</b> Siswa</span></div>\r\n<div class="MsoListParagraphCxSpMiddle" style="margin-left: 144pt; line-height: 150%;"><span style="font-size: 12pt; line-height: 150%; font-family: ''Times New Roman'',''serif'';" lang="EN-US"><span>  </span>5 - 6 Th : <b>113</b> Siswa<span>       </span>L : <b>52</b> Siswa<span>                 </span><span> </span>P : <b>61</b> Siswa</span></div>\r\n<div class="MsoListParagraphCxSpMiddle" style="text-indent: -18pt; line-height: 150%;"><span style="font-size: 12pt; line-height: 150%; font-family: ''Times New Roman'',''serif'';" lang="EN-US"><span>       05.<span style="font: 7pt ''Times New Roman'';">  </span></span></span><span style="font-size: 12pt; line-height: 150%; font-family: ''Times New Roman'',''serif'';" lang="EN-US">Jumlah Rombel <span>          </span>: 0 – 2 Th : 0<span>                    </span>3 – 4 Th : <b>1<span>     </span></b><span>              </span><span> </span>5 – 6 Th : <b>5</b></span></div>\r\n<div class="MsoListParagraphCxSpMiddle" style="text-indent: -18pt; line-height: 150%;"><span style="font-size: 12pt; line-height: 150%; font-family: ''Times New Roman'',''serif'';" lang="EN-US"><span>       06.<span style="font: 7pt ''Times New Roman'';">  </span></span></span><span style="font-size: 12pt; line-height: 150%; font-family: ''Times New Roman'',''serif'';" lang="EN-US">Jumlah Ruang Kelas<span>   </span>: <b>6</b> Kelas</span></div>\r\n<div class="MsoListParagraphCxSpMiddle" style="text-indent: -18pt; line-height: 150%;"><span style="font-size: 12pt; line-height: 150%; font-family: ''Times New Roman'',''serif'';" lang="EN-US"><span>       07.<span style="font: 7pt ''Times New Roman'';">  </span></span></span><span style="font-size: 12pt; line-height: 150%; font-family: ''Times New Roman'',''serif'';" lang="EN-US">Jumlah Guru<span>                </span>: PNS : 0<span>                      </span><span>    </span>Non PNS : <b>13</b> Guru</span></div>\r\n<div class="MsoListParagraphCxSpMiddle" style="text-indent: -18pt; line-height: 150%;"><span style="font-size: 12pt; line-height: 150%; font-family: ''Times New Roman'',''serif'';" lang="EN-US"><span>       08.<span style="font: 7pt ''Times New Roman'';">  </span></span></span><span style="font-size: 12pt; line-height: 150%; font-family: ''Times New Roman'',''serif'';" lang="EN-US">Pendidikan Guru<span>         </span>: Keguruan :<span>                </span><span>    </span>Non Keguruan :<span>  </span></span></div>\r\n<div class="MsoListParagraphCxSpMiddle" style="margin-left: 162pt; text-indent: -18pt; line-height: 150%;"><span style="font-size: 12pt; line-height: 150%; font-family: ''Times New Roman'',''serif'';" lang="EN-US"><span>-<span style="font: 7pt ''Times New Roman'';">          </span></span></span><span style="font-size: 12pt; line-height: 150%; font-family: ''Times New Roman'',''serif'';" lang="EN-US">SLTA : <span>                 </span><span>   </span><span> </span><span> </span>- SLTA : <b>1</b> Guru</span></div>\r\n<div class="MsoListParagraphCxSpMiddle" style="margin-left: 162pt; text-indent: -18pt; line-height: 150%;"><span style="font-size: 12pt; line-height: 150%; font-family: ''Times New Roman'',''serif'';" lang="EN-US"><span>-<span style="font: 7pt ''Times New Roman'';">          </span></span></span><span style="font-size: 12pt; line-height: 150%; font-family: ''Times New Roman'',''serif'';" lang="EN-US">D1<span> </span><span>     </span>: <b>3</b> Guru<span>      </span><span>    </span><span> </span>- D1<span>      </span>: 0</span></div>\r\n<div class="MsoListParagraphCxSpMiddle" style="margin-left: 162pt; text-indent: -18pt; line-height: 150%;"><span style="font-size: 12pt; line-height: 150%; font-family: ''Times New Roman'',''serif'';" lang="EN-US"><span>-<span style="font: 7pt ''Times New Roman'';">          </span></span></span><span style="font-size: 12pt; line-height: 150%; font-family: ''Times New Roman'',''serif'';" lang="EN-US">D2<span>      </span>: <b>4</b> Guru<span>         </span><span>  </span>- D2<span>     </span><span> </span>: 0</span></div>\r\n<div class="MsoListParagraphCxSpMiddle" style="margin-left: 162pt; text-indent: -18pt; line-height: 150%;"><span style="font-size: 12pt; line-height: 150%; font-family: ''Times New Roman'',''serif'';" lang="EN-US"><span>-<span style="font: 7pt ''Times New Roman'';">          </span></span></span><span style="font-size: 12pt; line-height: 150%; font-family: ''Times New Roman'',''serif'';" lang="EN-US">D3<span>      </span>: 0<span>                  </span><span> </span><span> </span>- D3<span>      </span>: 0</span></div>\r\n<div class="MsoListParagraphCxSpMiddle" style="margin-left: 162pt; text-indent: -18pt; line-height: 150%;"><span style="font-size: 12pt; line-height: 150%; font-family: ''Times New Roman'',''serif'';" lang="EN-US"><span>-<span style="font: 7pt ''Times New Roman'';">          </span></span></span><span style="font-size: 12pt; line-height: 150%; font-family: ''Times New Roman'',''serif'';" lang="EN-US">D4/S1 : <b>2</b> Guru<span>      </span><span>  </span><span>  </span><span> </span>- D4/S1<span>  </span>: <b>3 </b>Guru</span></div>\r\n<div class="MsoListParagraphCxSpMiddle" style="margin-left: 162pt; text-indent: -18pt; line-height: 150%;"><span style="font-size: 12pt; line-height: 150%; font-family: ''Times New Roman'',''serif'';" lang="EN-US"><span>-<span style="font: 7pt ''Times New Roman'';">          </span></span></span><span style="font-size: 12pt; line-height: 150%; font-family: ''Times New Roman'',''serif'';" lang="EN-US">S2<span>       </span>: 0<span>               </span><span>  </span><span>  </span><span> </span>- S2<span>        </span>: 0</span></div>\r\n<div class="MsoListParagraphCxSpMiddle" style="margin-left: 162pt; text-indent: -18pt; line-height: 150%;"><span style="font-size: 12pt; line-height: 150%; font-family: ''Times New Roman'',''serif'';" lang="EN-US"><span>-<span style="font: 7pt ''Times New Roman'';">          </span></span></span><span style="font-size: 12pt; line-height: 150%; font-family: ''Times New Roman'',''serif'';" lang="EN-US">S3<span>       </span>: 0<span>                  </span><span>  </span>- S2<span>        </span>: 0</span></div>\r\n<div class="MsoListParagraphCxSpMiddle" style="text-indent: -18pt; line-height: 150%;"><span style="font-size: 12pt; line-height: 150%; font-family: ''Times New Roman'',''serif'';" lang="EN-US"><span>      09.<span style="font: 7pt ''Times New Roman'';">  </span></span></span><span style="font-size: 12pt; line-height: 150%; font-family: ''Times New Roman'',''serif'';" lang="EN-US">Jumlah Guru yang memiliki NUPTK<span>  </span>: <b>10</b> Guru</span></div>\r\n<div class="MsoListParagraphCxSpMiddle" style="text-indent: -18pt; line-height: 150%;"><span style="font-size: 12pt; line-height: 150%; font-family: ''Times New Roman'',''serif'';" lang="EN-US"><span>      10.<span style="font: 7pt ''Times New Roman'';">  </span></span></span><span style="font-size: 12pt; line-height: 150%; font-family: ''Times New Roman'',''serif'';" lang="EN-US">Jumlah Guru Bersertifikasi<span>                  </span>: 0</span></div>\r\n<div class="MsoListParagraphCxSpMiddle" style="text-indent: -18pt; line-height: 150%;"><span style="font-size: 12pt; line-height: 150%; font-family: ''Times New Roman'',''serif'';" lang="EN-US"><span>      11.<span style="font: 7pt ''Times New Roman'';">  </span></span></span><span style="font-size: 12pt; line-height: 150%; font-family: ''Times New Roman'',''serif'';" lang="EN-US">Jumlah Lulusan<span>                                    </span>: <b>92</b> Siswa</span></div>\r\n<div class="MsoListParagraphCxSpMiddle" style="text-indent: -18pt; line-height: 150%;"><span style="font-size: 12pt; line-height: 150%; font-family: ''Times New Roman'',''serif'';" lang="EN-US"><span>      12.<span style="font: 7pt ''Times New Roman'';">  </span></span></span><span style="font-size: 12pt; line-height: 150%; font-family: ''Times New Roman'',''serif'';" lang="EN-US">Jam KBM<span>                                             </span>: <b>3</b> Jam / Hari, <b>17</b> Jam / 1 minggu</span></div>\r\n<div class="MsoListParagraphCxSpMiddle" style="text-indent: -18pt; line-height: 150%;"><span style="font-size: 12pt; line-height: 150%; font-family: ''Times New Roman'',''serif'';" lang="EN-US"><span>      13.<span style="font: 7pt ''Times New Roman'';">  </span></span></span><span style="font-size: 12pt; line-height: 150%; font-family: ''Times New Roman'',''serif'';" lang="EN-US">Hari penyelenggara KBM<span>                    </span>: <b>6</b> Hari (Senin s/d Sabtu)</span></div>\r\n<div class="MsoListParagraphCxSpMiddle" style="text-indent: -18pt; line-height: 150%;"><span style="font-size: 12pt; line-height: 150%; font-family: ''Times New Roman'',''serif'';" lang="EN-US"><span>      14.<span style="font: 7pt ''Times New Roman'';">  </span></span></span><span style="font-size: 12pt; line-height: 150%; font-family: ''Times New Roman'',''serif'';" lang="EN-US">Jumlah Ruang Perpustakaan<span>                </span>: 0</span></div>\r\n<div class="MsoListParagraphCxSpMiddle" style="text-indent: -18pt; line-height: 150%;"><span style="font-size: 12pt; line-height: 150%; font-family: ''Times New Roman'',''serif'';" lang="EN-US"><span>      15.<span style="font: 7pt ''Times New Roman'';">  </span></span></span><span style="font-size: 12pt; line-height: 150%; font-family: ''Times New Roman'',''serif'';" lang="EN-US">Jumlah Ruang Laboratorium<span>               </span>: <b>1</b> Ruang</span></div>\r\n<div class="MsoListParagraphCxSpMiddle" style="text-indent: -18pt; line-height: 150%;"><span style="font-size: 12pt; line-height: 150%; font-family: ''Times New Roman'',''serif'';" lang="EN-US"><span>      16.<span style="font: 7pt ''Times New Roman'';">  </span></span></span><span style="font-size: 12pt; line-height: 150%; font-family: ''Times New Roman'',''serif'';" lang="EN-US">Jumlah Jamban Sekolah<span>                      </span>: <b>5</b></span></div>\r\n<div class="MsoListParagraphCxSpMiddle" style="text-indent: -18pt; line-height: 150%;"><span style="font-size: 12pt; line-height: 150%; font-family: ''Times New Roman'',''serif'';" lang="EN-US"><span>      17.<span style="font: 7pt ''Times New Roman'';">  </span></span></span><span style="font-size: 12pt; line-height: 150%; font-family: ''Times New Roman'',''serif'';" lang="EN-US">Sarana air bersih Pam / Sumur<span>            </span>: Sumur</span></div>\r\n<div class="MsoListParagraphCxSpMiddle" style="text-indent: -18pt; line-height: 150%;"><span style="font-size: 12pt; line-height: 150%; font-family: ''Times New Roman'',''serif'';" lang="EN-US"><span>      18.<span style="font: 7pt ''Times New Roman'';">  </span></span></span><span style="font-size: 12pt; line-height: 150%; font-family: ''Times New Roman'',''serif'';" lang="EN-US">Status Lahan Hak milik<span>                       </span>: Hak milik Yayasan</span></div>\r\n<div class="MsoListParagraphCxSpMiddle" style="text-indent: -18pt; line-height: 150%;"><span style="font-size: 12pt; line-height: 150%; font-family: ''Times New Roman'',''serif'';" lang="EN-US"><span>      19.<span style="font: 7pt ''Times New Roman'';">  </span></span></span><span style="font-size: 12pt; line-height: 150%; font-family: ''Times New Roman'',''serif'';" lang="EN-US">Status Akreditasi<span>                                 </span>: </span></div>\r\n<div class="MsoListParagraphCxSpMiddle" style="text-indent: -18pt; line-height: 150%;"><span style="font-size: 12pt; line-height: 150%; font-family: ''Times New Roman'',''serif'';" lang="EN-US"><span>      20.<span style="font: 7pt ''Times New Roman'';">  </span></span></span><span style="font-size: 12pt; line-height: 150%; font-family: ''Times New Roman'',''serif'';" lang="EN-US">Katagori Standar Penyelenggaraan<span>     </span>: Pendidikan</span></div>\r\n<p> </p>\r\n<div class="MsoListParagraphCxSpMiddle" style="margin-left: 288.0pt; mso-add-space: auto; line-height: 150%;"><span style="font-size: 12pt; line-height: 150%; font-family: ''Times New Roman'',''serif'';" lang="EN-US">Gunung Putri, 05 Agustus 2010</span></div>\r\n<div class="MsoListParagraphCxSpMiddle" style="margin-left: 288.0pt; mso-add-space: auto; line-height: 150%;"><span style="font-size: 12pt; line-height: 150%; font-family: ''Times New Roman'',''serif'';" lang="EN-US">         Kepala Sekolah</span><span style="font-size: 12pt; line-height: 150%; font-family: ''Times New Roman'',''serif'';" lang="EN-US"> <br /></span></div>\r\n<p>  </p>\r\n<div class="MsoListParagraphCxSpLast" style="margin-left: 288pt; line-height: 150%;"><span style="font-size: 12pt; line-height: 150%; font-family: ''Times New Roman'',''serif'';" lang="EN-US">     Irma Maidinah,S.Sos.I</span></div>\r\n<p> </p>', '', 1, 6, 0, 40, '2011-09-13 06:36:35', 63, '', '2011-09-13 06:49:52', 63, 0, '0000-00-00 00:00:00', '2011-09-13 06:36:35', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 4, 0, 1, '', '', 0, 7, 'robots=\nauthor=');
INSERT INTO `jos_content` (`id`, `title`, `alias`, `title_alias`, `introtext`, `fulltext`, `state`, `sectionid`, `mask`, `catid`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `images`, `urls`, `attribs`, `version`, `parentid`, `ordering`, `metakey`, `metadesc`, `access`, `hits`, `metadata`) VALUES
(90, 'Proposal Wakaf Tunai dan Badan Wakaf Al-Ikhlas', 'proposal-wakaf-tunai-dan-badan-wakaf-al-ikhlas', '', '<p><span style="font-size: 12pt;"><b><span class="fullpost"><img style="float: left;" alt="logo-wakap" src="images/logo-wakap.png" height="115" width="115" />PENDAHULUAN </span></b></span></p>\r\n<div style="text-align: justify;"><span style="font-size: 12pt;" class="fullpost"><span style="font-family: Arial,Helvetica,sans-serif;">Hakikat pembangunan Nasional adalah pembangunan manusia seutuhnya yang bertujuan untuk membangun sebuah masyarakat yang adil dan makmur, yang tidak hanya mengejar kemajuan fisik saja tetapi juga membangun mental dan spiritual yang selaras lahir dan bathin.</span></span></div>\r\n<div style="text-align: justify;"></div>\r\n<div style="text-align: justify;"><span style="font-size: 12pt;" class="fullpost"><span style="font-family: Arial,Helvetica,sans-serif;">Pendidikan dengan pola pengajaran yang berbasis agama merupakan salah satu instrumen infrastruktur pembangunan mental dan spiritual yang sudah dirasakan manfaatnya oleh berbagai generasi sejak pra kemerdekaan RI hingga sekarang. </span></span></div>\r\n<div style="text-align: justify;"></div>\r\n<div style="text-align: justify;"><span style="font-size: 12pt;" class="fullpost"><span style="font-family: Arial,Helvetica,sans-serif;">Yayasan Al ikhlas Citra Utama tetap berupaya mempertahankan lembaga ini dan meningkatkan kualitas pelayanannya kepada masyarakat dengan mendirikan TK Islam, TK AL qur''an, TP AL qur''an. Madrasah Diniyah Takmiliyah, Madrasah Tsanawiyah, Majlis Ta''lim, Diklat Komputer&Bahasa, Pondok pesantren dan Panti Asuhan.</span></span></div>\r\n<div style="text-align: justify;"></div>\r\n<div style="text-align: justify;"><span style="font-size: 12pt;" class="fullpost"><span style="font-family: Arial,Helvetica,sans-serif;">Untuk mempertahankan keberadaan lembaga pendidikan yang menjadi salah satu alternatif dan menjadi pilihan masyarakat muslim indonesia untuk pendidikan anak-anaknya ini, tentu saja dibutuhkan perhatian dari pemerintah dan partisipasi dari seluruh unsur dan warga masyarakat agar institusi pendidikan ini mampu bertahan dan tetap dapat memberikan kontribusi bagi pembangunan generasi yang memiliki sikap moral dan akhlak yang mulia.</span></span></div>\r\n<div style="text-align: justify;"></div>\r\n<div style="text-align: justify;"><span style="font-size: 12pt;" class="fullpost"><span style="font-family: Arial,Helvetica,sans-serif;">Namun mengingat keterbatasan kemampuan finansial yang dimiliki pengelola ditambah dengan mendesaknya pemenuhan kebutuhan penambahan lokasi dan lokal gedung untuk sarana belajar, pengurus Yayasan Al ikhlas Citra Utama sebagai lembaga formal tempat bernaung seluruh institusi dibawahnya bermaksud untuk membeli/membebaskan tanah guna perluasan sarana pendidikan.  </span><b><span style="font-family: Arial,Helvetica,sans-serif;"></span></b></span></div>\r\n<div style="text-align: justify;"><span style="font-size: 12pt;" class="fullpost"><b><span style="font-family: Arial,Helvetica,sans-serif;"><br /></span></b></span></div>\r\n<div style="text-align: justify;"><span style="font-size: 12pt;" class="fullpost"><b><span style="font-family: Arial,Helvetica,sans-serif;">DASAR PEMIKIRAN  </span></b></span></div>\r\n<div style="text-align: justify;"><span style="font-size: 12pt;" class="fullpost"><b><span style="font-family: Arial,Helvetica,sans-serif;"><br /></span></b></span></div>\r\n<div style="text-align: justify;"><span style="font-size: 12pt;" class="fullpost"><b><span style="font-family: Arial,Helvetica,sans-serif;">a. Al qur''an Surat Annisa ayat : 9</span></b></span></div>\r\n<div style="text-align: justify;"><span style="font-size: 12pt;" class="fullpost"><span style="font-family: Arial,Helvetica,sans-serif;">   " Dan hendaklah takut kepada Allah orang-orang yang seandainya meninggalkan dibelakang mereka anak-anak yang lemah, yang khawatir terhadap (kesejahteraan) mereka, oleh sebab itu hendaklah mereka bertaqwa kepada Allah dan hendaklah mereka mengucapkan perkataan yang benar."</span></span></div>\r\n<div style="text-align: justify;"><span style="font-size: 12pt;" class="fullpost"><span style="font-family: Arial,Helvetica,sans-serif;"> <b><span style="font-family: Arial,Helvetica,sans-serif;"><br /> </span></b></span></span></div>\r\n<div style="text-align: justify;"><span style="font-size: 12pt;" class="fullpost"><span style="font-family: Arial,Helvetica,sans-serif;"> <b><span style="font-family: Arial,Helvetica,sans-serif;">b. Al Qur''an Surat Ali Imran ayat : 92</span></b></span></span></div>\r\n<div style="text-align: justify;"><span style="font-size: 12pt;" class="fullpost"><span style="font-family: Arial,Helvetica,sans-serif;">   "Kamu sekali-kali tidak sampai kepada kebajikan (yang sempurna), sebelum kamu menafkahkan sebagian harta yang kamu cintai, dan apa saja yang kamu nafkahkan maka sesungguhnya Allah mengetahuinya.</span></span></div>\r\n<div style="text-align: justify;"><span style="font-size: 12pt;" class="fullpost"><span style="font-family: Arial,Helvetica,sans-serif;"><br /> </span></span></div>\r\n<div style="text-align: justify;"><span style="font-size: 12pt;"><b><span class="fullpost"><span style="font-family: Arial,Helvetica,sans-serif;">c. Hadits Nabi Muhammad SAW</span></span></b></span></div>\r\n<div style="text-align: justify;"><span style="font-size: 12pt;" class="fullpost"><span style="font-family: Arial,Helvetica,sans-serif;">   " Jika telah mati seorang anak adam, maka terputuslah amal ibadahnya kecuali tiga hal : Shodaqoh Jariah (Wakaf), Ilmu yang bermanfaat, dan anak sholeh yang selalu mendo''akannya. (HR Muslim).</span></span></div>\r\n<div style="text-align: justify;"></div>\r\n<div style="text-align: justify;"><span style="font-size: 12pt;" class="fullpost"><span style="font-family: Arial,Helvetica,sans-serif;"><b>d. Peraturan Pemerintah </b> </span></span></div>\r\n<ol>\r\n<li><span style="font-size: 12pt;" class="fullpost"><span style="font-family: Arial,Helvetica,sans-serif;">Undang-unang Nomor 41 tahun 2004 tentangh wakaf dan peraturan pemerintah nomor 42 tahun 2006 tentang pelaksanaan Undang-unang no 41 tahun 2004.<span class="fullpost"><span style="font-family: Arial,Helvetica,sans-serif;"> </span></span></span></span></li>\r\n<li><span style="font-size: 12pt;" class="fullpost"><span style="font-family: Arial,Helvetica,sans-serif;">Fatwa Majelis Ulama Indonesia (MUI) tentang kebolehan wakag uang pada 11 mei 2002<b> </b> </span></span></li>\r\n</ol>\r\n<div style="text-align: justify;"><span style="font-size: 12pt;" class="fullpost"><span style="font-family: Arial,Helvetica,sans-serif;"><b>TUJUAN PENAMBAHAN SARANA</b></span></span></div>\r\n<div style="text-align: justify;"><ol>\r\n<li><span style="font-size: 12pt;" class="fullpost"><span style="font-family: Arial,Helvetica,sans-serif;">Peningkatan kualitas pendidikan dilingkungan Yayasan Al Ikhlas Citra Utama Gunungputri  Bogor.</span></span></li>\r\n<li><span style="font-size: 12pt;" class="fullpost"><span style="font-family: Arial,Helvetica,sans-serif;">Untuk memenuhi kebutuhan akan sarana belajar yang memadai, refresentatif yang mendukung terhadap pembinaan kualitas sumber daya manusia.</span></span></li>\r\n<li><span style="font-size: 12pt;" class="fullpost"><span style="font-family: Arial,Helvetica,sans-serif;">Untuk menampung minat belajar warga sekitar, dan membantu memberikan pendidikan kepada anak-anak yatim dan kurang mampu.</span></span></li>\r\n<li style="text-align: left;"><span style="font-size: 12pt;" class="fullpost"><span style="font-family: Arial,Helvetica,sans-serif;">Membangun dan mempersiapkan tumbuh dan berkembangnya generasi muslim yang memiliki sikap terhadap moral yang baik, berakhlak mulia serta diridloi Allah SWT.</span></span></li>\r\n</ol><span style="font-size: 12pt;"><b><span class="fullpost"><span style="font-family: Arial,Helvetica,sans-serif;">UPAYA YANG DILAKUKAN</span></span></b></span></div>\r\n<div style="text-align: justify;"><span style="font-size: 12pt;" class="fullpost"><span style="font-family: Arial,Helvetica,sans-serif;">Untuk merealisasikan hal-hal tersebut diatas, pengurus berusaha meningkatkan jaringan donasi dari alumnus, simpatisan, dan jamaah Majlis Ta''lim, membina hubungan kelembagaan yang baik, dengan pemerintah dan instansi terkait, serta meningkatkan kualitas pelayanan pendidikan efektif dan bermanfaat bagi Negara Republik Indonesia dan berusaha meningkatkan persatuan dan kesatuan bangsa Indonesia.</span></span></div>\r\n<div style="text-align: justify;"></div>\r\n<div style="text-align: justify;"><span style="font-size: 12pt;" class="fullpost"><span style="font-family: Arial,Helvetica,sans-serif;"><b>RENCANA PEMBEBASA TANAH</b></span></span></div>\r\n<div style="text-align: justify;"><span style="font-size: 12pt;" class="fullpost"><span style="font-family: Arial,Helvetica,sans-serif;">Dalam rencana pembangunan induk yang kami buat sebagai prioritas adalah pembebasan tanah seluas 800 M2 dengan harga Rp.1.000.000 / M2, dengan total harga Rp. 800.000.000 (Delapan ratus juta rupiah).</span></span></div>\r\n<div style="text-align: justify;"><span style="font-size: 12pt;" class="fullpost"><span style="font-family: Arial,Helvetica,sans-serif;">Besarnya wakaf uang disesuaikan dengan kemampuan dan keikhlasan yang mewakafkan , hasil pembelian tanah wakaf akan langsung disertifikatkan wakaf yang tidak bisa diperjual belikan dan dimiliki oleh pribadi.</span></span></div>\r\n<div style="text-align: justify;"><span style="font-size: 12pt;" class="fullpost"><span style="font-family: Arial,Helvetica,sans-serif;"><b><br /> </b></span></span></div>\r\n<div style="text-align: justify;"><span style="font-size: 12pt;" class="fullpost"><span style="font-family: Arial,Helvetica,sans-serif;">Dana wakaf anda dapat disampaikan melalkui :</span></span></div>\r\n<div style="text-align: justify;">\r\n<ul>\r\n<li><span style="font-size: 12pt;" class="fullpost"><span style="font-family: Arial,Helvetica,sans-serif;">Langsung ke sekretariat : Badan Wakaf AlIKhlas, Jl.Raya Gunungputri Selatan Rt.02/04 No.28 Ctr 16810 Bogor Tlp. 021-8762579, 92183392</span></span></li>\r\n<li><span style="font-size: 12pt;" class="fullpost"><span style="font-family: Arial,Helvetica,sans-serif;">Transfer ke rekening Badan Wakaf Al Ikhlas : Bank JABAR Cab.Cibinong atas nama : MD Al Ikhlas/Hariyadi. No.Rekening: 0002082462100. konfirmasi transfer di Tlp : 021-876.2579, 921.83392.</span></span></li>\r\n<li><span style="font-size: 12pt;" class="fullpost"><span style="font-family: Arial,Helvetica,sans-serif;">Via Telpon dan petugas amanah kami yang akan datang menjemput ketempat donatur, kami persilahkan  anda menghubungi kami di nomor tlp: 021.876.2579, 921.83392, 08174827781, 0812846976</span></span></li>\r\n</ul>\r\n<p><span style="font-size: 12pt;" class="fullpost"><span style="font-family: Arial,Helvetica,sans-serif;"><b><br /></b></span></span></p>\r\n<p><span style="font-size: 12pt;" class="fullpost"><span style="font-family: Arial,Helvetica,sans-serif;"><b>LOKASI TANAH</b></span></span></p>\r\n</div>\r\n<div style="text-align: justify;"><span style="font-size: 12pt;" class="fullpost"><span style="font-family: Arial,Helvetica,sans-serif;"><b> </b>Adapun lokasi tanah yang akan dijadikan sebagai tanah wakaf diutamakan berlokasi diwilayah Gunungputri Selatan Rt.02/04 Gunungputri Bogor.</span></span></div>\r\n<div style="text-align: justify;"><span style="font-size: 12pt;" class="fullpost"><span style="font-family: Arial,Helvetica,sans-serif;"><b><br /></b></span></span></div>\r\n<div style="text-align: justify;"><span style="font-size: 12pt;" class="fullpost"><span style="font-family: Arial,Helvetica,sans-serif;"><b><br /></b></span></span></div>\r\n<div style="text-align: justify;"><span style="font-size: 12pt;" class="fullpost"><span style="font-family: Arial,Helvetica,sans-serif;"><b>PENUTUP</b></span></span></div>\r\n<div style="text-align: justify;"><ol>\r\n<li><span style="font-size: 12pt;" class="fullpost"><span style="font-family: Arial,Helvetica,sans-serif;">Hal hal lain yang belum termasuk dalam proposal ini akan diatur kemudian dan merupakan bagian yang tidak terpisahkan dengan proposal ini.</span></span></li>\r\n<li><span style="font-size: 12pt;" class="fullpost"><span style="font-family: Arial,Helvetica,sans-serif;">Diharapkan partisifasi aktif kaum muslimin dan muslimat terhadap rencana pengembangan Yayasan Al Ikhlas Citra Utama. Akhirnya kepada Allah SWT, kita memohon taufdiq dan hidayah-Nya. Semoga rencana ini terlaksana dan mendapat ridho dan rahmat Allah SWT, Amin.</span></span></li>\r\n</ol><span style="font-size: 12pt;" class="fullpost"><span style="font-family: Arial,Helvetica,sans-serif;">Demikian proposal ini kami sampaikan untuk menjadi periksa dan atas perhatian serta bantuannya kami haturkan terimakasih.</span></span></div>\r\n<div style="text-align: justify;"><span style="font-size: 12pt;" class="fullpost"><span style="font-family: Arial,Helvetica,sans-serif;">Billaahi fii sabilil haq.</span></span></div>\r\n<div style="text-align: justify;"><span style="font-size: 12pt;" class="fullpost"><span style="font-family: Arial,Helvetica,sans-serif;">Wassalamu''alaikum Wr.Wb.</span></span></div>\r\n<div style="text-align: justify;"><span style="font-size: 12pt;" class="fullpost"><span style="font-family: Arial,Helvetica,sans-serif;"><br /> </span></span></div>\r\n<div style="text-align: right;"><span style="font-size: 12pt;" class="fullpost"><span style="font-family: Arial,Helvetica,sans-serif;">Gunungputri, Agustus 2010</span></span></div>\r\n<div style="text-align: justify;"><span style="font-size: 12pt;" class="fullpost"><span style="font-family: Arial,Helvetica,sans-serif;">Ketua                                                                                                            Sekretaris</span></span></div>\r\n<div style="text-align: justify;"><span style="font-size: 12pt;" class="fullpost"><span style="font-family: Arial,Helvetica,sans-serif;"><br /> </span></span></div>\r\n<div style="text-align: justify;"><span style="font-size: 12pt;" class="fullpost"><span style="font-family: Arial,Helvetica,sans-serif;"><br /> </span></span></div>\r\n<div style="text-align: justify;"><span style="font-size: 12pt;" class="fullpost"><span style="font-family: Arial,Helvetica,sans-serif;">Hariyadi S.Ag                                                                                               Wawan Setiawan S.Th.I</span></span></div>\r\n<div style="text-align: center;"><span style="font-size: 12pt;" class="fullpost"><span style="font-family: Arial,Helvetica,sans-serif;">Pimpinan<br /> <span class="fullpost"><span style="font-family: Arial,Helvetica,sans-serif;">Yayasan Al Ikhlas Citra Utama<br /> <span class="fullpost"><span style="font-family: Arial,Helvetica,sans-serif;"><br /> <span class="fullpost"><span style="font-family: Arial,Helvetica,sans-serif;"><br /> <br /> <span class="fullpost"><span style="font-family: Arial,Helvetica,sans-serif;"><span class="fullpost"><span style="font-family: Arial,Helvetica,sans-serif;">Damanhuri</span></span></span></span></span></span></span></span></span></span></span></span></div>', '', 1, 7, 0, 42, '2011-09-13 08:03:25', 63, '', '2011-09-13 08:31:30', 63, 0, '0000-00-00 00:00:00', '2011-09-13 08:03:25', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 5, 0, 1, '', '', 0, 6, 'robots=\nauthor='),
(91, 'Struktur Organisasi Yayasan', 'struktur-organisasi-yayasan', '', '<p><span style="font-size: 12pt;"><img style="float: left;" alt="logo 1" src="images/logo_1.jpg" height="164" width="164" />           Pengawas                    : Ibu Nunung Nurjanah</span></p>\r\n<p style="margin-left: 210px;"><span style="font-size: 12pt;">Pendiri                          : Hj. Suaedah</span></p>\r\n<p style="margin-left: 210px;"><span style="font-size: 12pt;">                                         Ahmad Sirojudin</span></p>\r\n<p style="margin-left: 210px;"><span style="font-size: 12pt;">Ketua                            : Damanhuri</span></p>\r\n<p style="margin-left: 210px;"><span style="font-size: 12pt;">Wakil Ketua                  : Rahmat S. Wijaya, S.Ag<br /></span></p>\r\n<p style="margin-left: 210px;"><span style="font-size: 12pt;">Sekretaris                     : Deddy Haryadi, S.Ag<br /></span></p>\r\n<p style="margin-left: 210px;"><span style="font-size: 12pt;">Bendahara                    : Kiki Zawiyyah, S.PdI<br /></span></p>\r\n<div style="margin-left: 210px;"><span style="font-size: 12pt;">Akta Notaris                  : Mirda Octaviani SH. M.kn No. 1 (04 Pebruari 2010)</span></div>\r\n<div style="margin-left: 364px;"><span style="font-size: 12pt;">   SK Menteri Hukum dan Hak Asasi Manusia Republik Indonesia</span></div>\r\n<div style="margin-left: 364px;"><span style="font-size: 12pt;">   No. AHU-1266.AH.01.04 Tahun 2010</span></div>', '', 1, 7, 0, 37, '2011-09-13 11:44:36', 63, '', '2011-09-13 15:05:10', 63, 63, '2011-09-13 15:05:12', '2011-09-13 11:44:36', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 1, '', '', 0, 9, 'robots=\nauthor=');

-- --------------------------------------------------------

--
-- Table structure for table `jos_content_frontpage`
--

CREATE TABLE IF NOT EXISTS `jos_content_frontpage` (
  `content_id` int(11) NOT NULL default '0',
  `ordering` int(11) NOT NULL default '0',
  PRIMARY KEY  (`content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_content_frontpage`
--

INSERT INTO `jos_content_frontpage` (`content_id`, `ordering`) VALUES
(23, 14),
(5, 13),
(1, 9),
(27, 12),
(19, 10),
(18, 11),
(84, 8),
(85, 7),
(86, 6),
(90, 2),
(89, 3),
(87, 5),
(88, 4),
(91, 1);

-- --------------------------------------------------------

--
-- Table structure for table `jos_content_rating`
--

CREATE TABLE IF NOT EXISTS `jos_content_rating` (
  `content_id` int(11) NOT NULL default '0',
  `rating_sum` int(11) unsigned NOT NULL default '0',
  `rating_count` int(11) unsigned NOT NULL default '0',
  `lastip` varchar(150) NOT NULL default '',
  PRIMARY KEY  (`content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jos_core_acl_aro`
--

CREATE TABLE IF NOT EXISTS `jos_core_acl_aro` (
  `id` int(11) NOT NULL auto_increment,
  `section_value` varchar(240) NOT NULL default '0',
  `value` varchar(240) NOT NULL default '',
  `order_value` int(11) NOT NULL default '0',
  `name` varchar(255) NOT NULL default '',
  `hidden` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `__section_value_value_aro` (`section_value`(100),`value`(100)),
  KEY `jos_gacl_hidden_aro` (`hidden`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `jos_core_acl_aro`
--

INSERT INTO `jos_core_acl_aro` (`id`, `section_value`, `value`, `order_value`, `name`, `hidden`) VALUES
(10, 'users', '62', 0, 'Administrator', 0),
(11, 'users', '63', 0, 'Alikhlas', 0);

-- --------------------------------------------------------

--
-- Table structure for table `jos_core_acl_aro_groups`
--

CREATE TABLE IF NOT EXISTS `jos_core_acl_aro_groups` (
  `id` int(11) NOT NULL auto_increment,
  `parent_id` int(11) NOT NULL default '0',
  `name` varchar(255) NOT NULL default '',
  `lft` int(11) NOT NULL default '0',
  `rgt` int(11) NOT NULL default '0',
  `value` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `jos_gacl_parent_id_aro_groups` (`parent_id`),
  KEY `jos_gacl_lft_rgt_aro_groups` (`lft`,`rgt`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=31 ;

--
-- Dumping data for table `jos_core_acl_aro_groups`
--

INSERT INTO `jos_core_acl_aro_groups` (`id`, `parent_id`, `name`, `lft`, `rgt`, `value`) VALUES
(17, 0, 'ROOT', 1, 22, 'ROOT'),
(28, 17, 'USERS', 2, 21, 'USERS'),
(29, 28, 'Public Frontend', 3, 12, 'Public Frontend'),
(18, 29, 'Registered', 4, 11, 'Registered'),
(19, 18, 'Author', 5, 10, 'Author'),
(20, 19, 'Editor', 6, 9, 'Editor'),
(21, 20, 'Publisher', 7, 8, 'Publisher'),
(30, 28, 'Public Backend', 13, 20, 'Public Backend'),
(23, 30, 'Manager', 14, 19, 'Manager'),
(24, 23, 'Administrator', 15, 18, 'Administrator'),
(25, 24, 'Super Administrator', 16, 17, 'Super Administrator');

-- --------------------------------------------------------

--
-- Table structure for table `jos_core_acl_aro_map`
--

CREATE TABLE IF NOT EXISTS `jos_core_acl_aro_map` (
  `acl_id` int(11) NOT NULL default '0',
  `section_value` varchar(230) NOT NULL default '0',
  `value` varchar(100) NOT NULL,
  PRIMARY KEY  (`acl_id`,`section_value`,`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jos_core_acl_aro_sections`
--

CREATE TABLE IF NOT EXISTS `jos_core_acl_aro_sections` (
  `section_id` int(11) NOT NULL auto_increment,
  `value` varchar(230) NOT NULL default '',
  `order_value` int(11) NOT NULL default '0',
  `name` varchar(230) NOT NULL default '',
  `hidden` int(11) NOT NULL default '0',
  PRIMARY KEY  (`section_id`),
  UNIQUE KEY `jos_gacl_value_aro_sections` (`value`),
  KEY `jos_gacl_hidden_aro_sections` (`hidden`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `jos_core_acl_aro_sections`
--

INSERT INTO `jos_core_acl_aro_sections` (`section_id`, `value`, `order_value`, `name`, `hidden`) VALUES
(10, 'users', 1, 'Users', 0);

-- --------------------------------------------------------

--
-- Table structure for table `jos_core_acl_groups_aro_map`
--

CREATE TABLE IF NOT EXISTS `jos_core_acl_groups_aro_map` (
  `group_id` int(11) NOT NULL default '0',
  `section_value` varchar(240) NOT NULL default '',
  `aro_id` int(11) NOT NULL default '0',
  UNIQUE KEY `group_id_aro_id_groups_aro_map` (`group_id`,`section_value`,`aro_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_core_acl_groups_aro_map`
--

INSERT INTO `jos_core_acl_groups_aro_map` (`group_id`, `section_value`, `aro_id`) VALUES
(24, '', 11),
(25, '', 10);

-- --------------------------------------------------------

--
-- Table structure for table `jos_core_log_items`
--

CREATE TABLE IF NOT EXISTS `jos_core_log_items` (
  `time_stamp` date NOT NULL default '0000-00-00',
  `item_table` varchar(50) NOT NULL default '',
  `item_id` int(11) unsigned NOT NULL default '0',
  `hits` int(11) unsigned NOT NULL default '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jos_core_log_searches`
--

CREATE TABLE IF NOT EXISTS `jos_core_log_searches` (
  `search_term` text NOT NULL,
  `hits` int(11) unsigned NOT NULL default '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jos_extwebdav_locks`
--

CREATE TABLE IF NOT EXISTS `jos_extwebdav_locks` (
  `token` varchar(255) NOT NULL default '',
  `path` varchar(200) NOT NULL default '',
  `expires` int(11) NOT NULL default '0',
  `owner` varchar(200) default NULL,
  `recursive` int(11) default '0',
  `writelock` int(11) default '0',
  `exclusivelock` int(11) NOT NULL default '0',
  PRIMARY KEY  (`token`),
  UNIQUE KEY `token` (`token`),
  KEY `path` (`path`),
  KEY `expires` (`expires`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `jos_extwebdav_properties`
--

CREATE TABLE IF NOT EXISTS `jos_extwebdav_properties` (
  `path` varchar(255) NOT NULL default '',
  `name` varchar(120) NOT NULL default '',
  `ns` varchar(120) NOT NULL default 'DAV:',
  `value` text,
  PRIMARY KEY  (`ns`(100),`path`(100),`name`(50)),
  KEY `path` (`path`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `jos_groups`
--

CREATE TABLE IF NOT EXISTS `jos_groups` (
  `id` tinyint(3) unsigned NOT NULL default '0',
  `name` varchar(150) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_groups`
--

INSERT INTO `jos_groups` (`id`, `name`) VALUES
(0, 'Public'),
(1, 'Registered'),
(2, 'Special');

-- --------------------------------------------------------

--
-- Table structure for table `jos_jshopping_addons`
--

CREATE TABLE IF NOT EXISTS `jos_jshopping_addons` (
  `id` int(11) NOT NULL auto_increment,
  `alias` varchar(255) NOT NULL,
  `key` text NOT NULL,
  `version` varchar(255) NOT NULL,
  `params` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `jos_jshopping_attr`
--

CREATE TABLE IF NOT EXISTS `jos_jshopping_attr` (
  `attr_id` int(11) NOT NULL auto_increment,
  `attr_ordering` int(11) NOT NULL default '0',
  `attr_type` tinyint(1) NOT NULL,
  `independent` tinyint(1) NOT NULL,
  `name_en-GB` varchar(255) NOT NULL,
  PRIMARY KEY  (`attr_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `jos_jshopping_attr_values`
--

CREATE TABLE IF NOT EXISTS `jos_jshopping_attr_values` (
  `value_id` int(11) NOT NULL auto_increment,
  `attr_id` int(11) NOT NULL,
  `value_ordering` int(11) NOT NULL default '0',
  `image` varchar(255) NOT NULL,
  `name_en-GB` varchar(255) NOT NULL,
  PRIMARY KEY  (`value_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `jos_jshopping_cart_temp`
--

CREATE TABLE IF NOT EXISTS `jos_jshopping_cart_temp` (
  `id` int(11) NOT NULL auto_increment,
  `id_cookie` varchar(255) NOT NULL,
  `cart` text NOT NULL,
  `type_cart` varchar(32) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `jos_jshopping_cart_temp`
--

INSERT INTO `jos_jshopping_cart_temp` (`id`, `id_cookie`, `cart`, `type_cart`) VALUES
(1, 'a51d4a5cc686591a9c04334becb1fa7f', 'a:1:{i:0;a:17:{s:8:"quantity";i:1;s:10:"product_id";s:1:"1";s:11:"category_id";s:1:"1";s:5:"price";d:350;s:3:"tax";s:5:"19.00";s:6:"tax_id";s:1:"1";s:11:"description";s:25:"Macbook Pro - Bla bla bla";s:12:"product_name";s:11:"Macbook Pro";s:11:"thumb_image";s:42:"thumb_95e9f412e2f7d8a3c3c96c445e980abb.jpg";s:3:"ean";s:0:"";s:10:"attributes";s:6:"a:0:{}";s:16:"attributes_value";a:0:{}s:6:"weight";s:6:"0.0000";s:9:"vendor_id";s:1:"0";s:5:"files";s:6:"a:0:{}";s:14:"freeattributes";s:6:"a:0:{}";s:25:"dependent_attr_serrialize";s:6:"a:0:{}";}}', 'wishlist'),
(2, 'dc48d6ff8b296de2a7423e1aa2a788cb', 'a:1:{i:0;a:17:{s:8:"quantity";i:1;s:10:"product_id";s:1:"4";s:11:"category_id";s:1:"3";s:5:"price";d:12;s:3:"tax";s:5:"19.00";s:6:"tax_id";s:1:"1";s:11:"description";s:9:"Home Care";s:12:"product_name";s:9:"Home Care";s:11:"thumb_image";s:42:"thumb_cef4b74a741f02a47943267937dc5567.jpg";s:3:"ean";s:0:"";s:10:"attributes";s:6:"a:0:{}";s:16:"attributes_value";a:0:{}s:6:"weight";s:6:"0.0000";s:9:"vendor_id";s:1:"0";s:5:"files";s:6:"a:0:{}";s:14:"freeattributes";s:6:"a:0:{}";s:25:"dependent_attr_serrialize";s:6:"a:0:{}";}}', 'wishlist');

-- --------------------------------------------------------

--
-- Table structure for table `jos_jshopping_categories`
--

CREATE TABLE IF NOT EXISTS `jos_jshopping_categories` (
  `category_id` int(11) NOT NULL auto_increment,
  `category_image` varchar(255) default NULL,
  `category_parent_id` int(11) NOT NULL default '0',
  `category_publish` tinyint(1) unsigned NOT NULL default '1',
  `category_ordertype` tinyint(1) unsigned NOT NULL default '1',
  `category_template` varchar(64) default NULL,
  `ordering` int(3) NOT NULL,
  `category_add_date` datetime default '0000-00-00 00:00:00',
  `products_page` int(8) NOT NULL default '12',
  `products_row` int(3) NOT NULL default '3',
  `name_en-GB` varchar(255) NOT NULL,
  `alias_en-GB` varchar(255) NOT NULL,
  `short_description_en-GB` text NOT NULL,
  `description_en-GB` text NOT NULL,
  `meta_title_en-GB` varchar(255) NOT NULL,
  `meta_description_en-GB` text NOT NULL,
  `meta_keyword_en-GB` text NOT NULL,
  PRIMARY KEY  (`category_id`),
  KEY `sort_add_date` (`category_add_date`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `jos_jshopping_categories`
--

INSERT INTO `jos_jshopping_categories` (`category_id`, `category_image`, `category_parent_id`, `category_publish`, `category_ordertype`, `category_template`, `ordering`, `category_add_date`, `products_page`, `products_row`, `name_en-GB`, `alias_en-GB`, `short_description_en-GB`, `description_en-GB`, `meta_title_en-GB`, `meta_description_en-GB`, `meta_keyword_en-GB`) VALUES
(1, NULL, 0, 1, 1, NULL, 1, '2011-09-12 16:31:05', 12, 3, 'Our Product', '', '', '', '', '', ''),
(2, NULL, 0, 1, 1, NULL, 2, '2011-09-13 11:14:46', 12, 3, 'Product 2', '', '', '', '', '', ''),
(3, NULL, 0, 1, 1, NULL, 4, '2011-09-13 15:38:23', 12, 3, 'Dental Care Product', '', '', '', '', '', ''),
(4, NULL, 0, 1, 1, NULL, 5, '2011-09-13 22:57:15', 12, 3, 'Suplemen', '', 'MELILEA GREENFIELD ORGANIC', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `jos_jshopping_config`
--

CREATE TABLE IF NOT EXISTS `jos_jshopping_config` (
  `id` tinyint(1) NOT NULL default '0',
  `count_products_to_page` int(4) NOT NULL default '0',
  `count_products_to_row` int(2) NOT NULL default '0',
  `count_category_to_row` int(2) NOT NULL default '0',
  `image_category_width` int(4) NOT NULL default '0',
  `image_category_height` int(4) NOT NULL default '0',
  `image_product_width` int(4) NOT NULL default '0',
  `image_product_height` int(4) NOT NULL default '0',
  `image_product_full_width` int(4) NOT NULL default '0',
  `image_product_full_height` int(4) NOT NULL default '0',
  `video_product_width` int(4) NOT NULL default '0',
  `video_product_height` int(4) NOT NULL default '0',
  `adminLanguage` varchar(8) NOT NULL default '',
  `defaultLanguage` varchar(8) NOT NULL default '',
  `mainCurrency` int(4) NOT NULL,
  `decimal_count` tinyint(1) NOT NULL,
  `decimal_symbol` varchar(5) NOT NULL,
  `thousand_separator` varchar(5) NOT NULL,
  `currency_format` tinyint(1) NOT NULL,
  `use_rabatt_code` tinyint(1) NOT NULL,
  `enable_wishlist` tinyint(1) NOT NULL,
  `default_status_order` tinyint(1) NOT NULL,
  `order_number_type` varchar(50) NOT NULL,
  `store_name` varchar(64) NOT NULL,
  `store_company_name` varchar(64) NOT NULL,
  `store_url` varchar(255) NOT NULL,
  `store_address` varchar(64) NOT NULL,
  `store_city` varchar(64) NOT NULL,
  `store_country` int(8) NOT NULL,
  `store_state` varchar(64) NOT NULL,
  `store_zip` varchar(12) NOT NULL,
  `store_address_format` varchar(64) NOT NULL,
  `store_date_format` varchar(64) NOT NULL,
  `contact_firstname` varchar(64) NOT NULL,
  `contact_lastname` varchar(64) NOT NULL,
  `contact_middlename` varchar(64) NOT NULL,
  `contact_phone` varchar(64) NOT NULL,
  `contact_fax` varchar(64) NOT NULL,
  `contact_email` varchar(128) NOT NULL,
  `store_logo` varchar(128) NOT NULL,
  `store_email` varchar(128) NOT NULL,
  `benef_bank_name` varchar(64) NOT NULL,
  `benef_bank_info` varchar(64) NOT NULL,
  `benef_bic` varchar(64) NOT NULL,
  `benef_conto` varchar(64) NOT NULL,
  `benef_payee` varchar(64) NOT NULL,
  `benef_iban` varchar(64) NOT NULL,
  `benef_swift` varchar(64) NOT NULL,
  `interm_name` varchar(64) NOT NULL,
  `interm_swift` varchar(64) NOT NULL,
  `identification_number` varchar(32) NOT NULL,
  `tax_number` varchar(32) NOT NULL,
  `allow_reviews_prod` tinyint(1) NOT NULL,
  `allow_reviews_only_registered` tinyint(1) NOT NULL,
  `allow_reviews_manuf` tinyint(1) NOT NULL,
  `max_mark` int(11) NOT NULL,
  `summ_null_shipping` decimal(12,2) NOT NULL,
  `without_shipping` tinyint(1) NOT NULL,
  `without_payment` tinyint(1) NOT NULL,
  `shop_special_type` varchar(64) NOT NULL,
  `pdf_parameters` varchar(255) NOT NULL,
  `next_order_number` int(11) NOT NULL default '1',
  `shop_user_guest` tinyint(1) NOT NULL,
  `hide_product_not_avaible_stock` tinyint(1) NOT NULL,
  `show_buy_in_category` tinyint(1) NOT NULL,
  `user_as_catalog` tinyint(1) NOT NULL,
  `show_tax_in_product` tinyint(1) NOT NULL,
  `show_tax_product_in_cart` tinyint(1) NOT NULL,
  `show_plus_shipping_in_product` tinyint(1) NOT NULL,
  `hide_buy_not_avaible_stock` tinyint(1) NOT NULL,
  `show_sort_product` tinyint(1) NOT NULL,
  `show_count_select_products` tinyint(1) NOT NULL,
  `order_send_pdf_client` tinyint(1) NOT NULL,
  `order_send_pdf_admin` tinyint(1) NOT NULL,
  `show_delivery_time` tinyint(1) NOT NULL,
  `securitykey` varchar(200) NOT NULL,
  `demo_type` tinyint(1) NOT NULL,
  `product_show_manufacturer_logo` tinyint(1) NOT NULL,
  `product_show_weight` tinyint(1) NOT NULL,
  `max_count_order_one_product` int(11) NOT NULL,
  `min_count_order_one_product` int(11) NOT NULL,
  `min_price_order` int(11) NOT NULL,
  `max_price_order` int(11) NOT NULL,
  `hide_tax` tinyint(1) NOT NULL,
  `licensekod` text NOT NULL,
  `product_attribut_first_value_empty` tinyint(1) NOT NULL,
  `show_hits` tinyint(1) NOT NULL,
  `show_registerform_in_logintemplate` tinyint(1) NOT NULL,
  `admin_show_product_basic_price` tinyint(1) NOT NULL,
  `admin_show_attributes` tinyint(1) NOT NULL,
  `admin_show_delivery_time` tinyint(1) NOT NULL,
  `admin_show_languages` tinyint(1) NOT NULL,
  `use_different_templates_cat_prod` tinyint(1) NOT NULL,
  `admin_show_product_video` tinyint(1) NOT NULL,
  `admin_show_product_related` tinyint(1) NOT NULL,
  `admin_show_product_files` tinyint(1) NOT NULL,
  `admin_show_product_bay_price` tinyint(1) NOT NULL,
  `admin_show_product_labels` tinyint(1) NOT NULL,
  `sorting_country_in_alphabet` tinyint(1) NOT NULL,
  `hide_text_product_not_available` tinyint(1) NOT NULL,
  `show_weight_order` tinyint(1) NOT NULL,
  `discount_use_full_sum` tinyint(1) NOT NULL,
  `show_cart_all_step_checkout` tinyint(1) NOT NULL,
  `use_plugin_content` tinyint(1) NOT NULL,
  `display_price_admin` tinyint(1) NOT NULL,
  `display_price_front` tinyint(1) NOT NULL,
  `product_list_show_weight` tinyint(1) NOT NULL,
  `product_list_show_manufacturer` tinyint(1) NOT NULL,
  `use_extend_tax_rule` tinyint(4) NOT NULL,
  `use_extend_display_price_rule` tinyint(4) NOT NULL,
  `fields_register` text NOT NULL,
  `template` varchar(255) NOT NULL,
  `show_product_code` tinyint(1) NOT NULL,
  `show_product_code_in_cart` tinyint(1) NOT NULL,
  `savelog` tinyint(1) NOT NULL,
  `savelogpaymentdata` tinyint(1) NOT NULL,
  `product_list_show_min_price` tinyint(1) NOT NULL,
  `product_count_related_in_row` tinyint(4) NOT NULL,
  `category_sorting` tinyint(1) NOT NULL default '1',
  `product_sorting` tinyint(1) NOT NULL default '1',
  `product_sorting_direction` tinyint(1) NOT NULL default '0',
  `show_product_list_filters` tinyint(1) NOT NULL,
  `admin_show_product_extra_field` tinyint(1) NOT NULL,
  `product_list_display_extra_fields` text NOT NULL,
  `filter_display_extra_fields` text NOT NULL,
  `product_hide_extra_fields` text NOT NULL,
  `default_country` int(11) NOT NULL,
  `show_return_policy_in_email_order` tinyint(1) NOT NULL,
  `client_allow_cancel_order` tinyint(1) NOT NULL,
  `admin_show_vendors` tinyint(1) NOT NULL,
  `vendor_order_message_type` tinyint(1) NOT NULL,
  `admin_not_send_email_order_vendor_order` tinyint(1) NOT NULL,
  `not_redirect_in_cart_after_buy` tinyint(1) NOT NULL,
  `product_show_vendor` tinyint(1) NOT NULL,
  `product_show_vendor_detail` tinyint(1) NOT NULL,
  `product_list_show_vendor` tinyint(1) NOT NULL,
  `admin_show_freeattributes` tinyint(1) NOT NULL,
  `product_show_button_back` tinyint(1) NOT NULL,
  `calcule_tax_after_discount` tinyint(1) NOT NULL,
  `product_list_show_product_code` tinyint(1) NOT NULL,
  `radio_attr_value_vertical` tinyint(1) NOT NULL,
  `attr_display_addprice` tinyint(1) NOT NULL,
  `use_ssl` tinyint(1) NOT NULL,
  `product_list_show_price_description` tinyint(1) NOT NULL,
  `display_button_print` tinyint(1) NOT NULL,
  `hide_shipping_step` tinyint(1) NOT NULL,
  `hide_payment_step` tinyint(1) NOT NULL,
  `image_resize_type` tinyint(1) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_jshopping_config`
--

INSERT INTO `jos_jshopping_config` (`id`, `count_products_to_page`, `count_products_to_row`, `count_category_to_row`, `image_category_width`, `image_category_height`, `image_product_width`, `image_product_height`, `image_product_full_width`, `image_product_full_height`, `video_product_width`, `video_product_height`, `adminLanguage`, `defaultLanguage`, `mainCurrency`, `decimal_count`, `decimal_symbol`, `thousand_separator`, `currency_format`, `use_rabatt_code`, `enable_wishlist`, `default_status_order`, `order_number_type`, `store_name`, `store_company_name`, `store_url`, `store_address`, `store_city`, `store_country`, `store_state`, `store_zip`, `store_address_format`, `store_date_format`, `contact_firstname`, `contact_lastname`, `contact_middlename`, `contact_phone`, `contact_fax`, `contact_email`, `store_logo`, `store_email`, `benef_bank_name`, `benef_bank_info`, `benef_bic`, `benef_conto`, `benef_payee`, `benef_iban`, `benef_swift`, `interm_name`, `interm_swift`, `identification_number`, `tax_number`, `allow_reviews_prod`, `allow_reviews_only_registered`, `allow_reviews_manuf`, `max_mark`, `summ_null_shipping`, `without_shipping`, `without_payment`, `shop_special_type`, `pdf_parameters`, `next_order_number`, `shop_user_guest`, `hide_product_not_avaible_stock`, `show_buy_in_category`, `user_as_catalog`, `show_tax_in_product`, `show_tax_product_in_cart`, `show_plus_shipping_in_product`, `hide_buy_not_avaible_stock`, `show_sort_product`, `show_count_select_products`, `order_send_pdf_client`, `order_send_pdf_admin`, `show_delivery_time`, `securitykey`, `demo_type`, `product_show_manufacturer_logo`, `product_show_weight`, `max_count_order_one_product`, `min_count_order_one_product`, `min_price_order`, `max_price_order`, `hide_tax`, `licensekod`, `product_attribut_first_value_empty`, `show_hits`, `show_registerform_in_logintemplate`, `admin_show_product_basic_price`, `admin_show_attributes`, `admin_show_delivery_time`, `admin_show_languages`, `use_different_templates_cat_prod`, `admin_show_product_video`, `admin_show_product_related`, `admin_show_product_files`, `admin_show_product_bay_price`, `admin_show_product_labels`, `sorting_country_in_alphabet`, `hide_text_product_not_available`, `show_weight_order`, `discount_use_full_sum`, `show_cart_all_step_checkout`, `use_plugin_content`, `display_price_admin`, `display_price_front`, `product_list_show_weight`, `product_list_show_manufacturer`, `use_extend_tax_rule`, `use_extend_display_price_rule`, `fields_register`, `template`, `show_product_code`, `show_product_code_in_cart`, `savelog`, `savelogpaymentdata`, `product_list_show_min_price`, `product_count_related_in_row`, `category_sorting`, `product_sorting`, `product_sorting_direction`, `show_product_list_filters`, `admin_show_product_extra_field`, `product_list_display_extra_fields`, `filter_display_extra_fields`, `product_hide_extra_fields`, `default_country`, `show_return_policy_in_email_order`, `client_allow_cancel_order`, `admin_show_vendors`, `vendor_order_message_type`, `admin_not_send_email_order_vendor_order`, `not_redirect_in_cart_after_buy`, `product_show_vendor`, `product_show_vendor_detail`, `product_list_show_vendor`, `admin_show_freeattributes`, `product_show_button_back`, `calcule_tax_after_discount`, `product_list_show_product_code`, `radio_attr_value_vertical`, `attr_display_addprice`, `use_ssl`, `product_list_show_price_description`, `display_button_print`, `hide_shipping_step`, `hide_payment_step`, `image_resize_type`) VALUES
(1, 12, 3, 1, 160, 0, 280, 0, 200, 0, 320, 240, 'en-GB', 'en-GB', 1, 2, '.', '', 2, 1, 1, 1, '1', 'test_store_name', 'test_company_name', 'http://test_url.com', 'test_address', 'test_city', 0, 'test_state', '111111', '%storename %address %city %zip', '%d.%m.%Y', 'firstname', 'lastname', 'middlename', '111-111-111', '111-111-111', 'admin@admin.com', '', '', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', '', '', 1, 1, 0, 10, '-1.00', 0, 0, '', '208:65:208:30', 1, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, '6ea35daadd3c0db052ff3fcf18c93a7a', 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 1, 1, 1, 0, 1, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'a:3:{s:8:"register";a:15:{s:5:"title";a:2:{s:7:"display";s:1:"1";s:7:"require";s:1:"1";}s:6:"l_name";a:2:{s:7:"display";s:1:"1";s:7:"require";s:1:"1";}s:10:"firma_name";a:1:{s:7:"display";s:1:"1";}s:6:"street";a:2:{s:7:"display";s:1:"1";s:7:"require";s:1:"1";}s:3:"zip";a:2:{s:7:"display";s:1:"1";s:7:"require";s:1:"1";}s:4:"city";a:2:{s:7:"display";s:1:"1";s:7:"require";s:1:"1";}s:5:"state";a:1:{s:7:"display";s:1:"1";}s:7:"country";a:2:{s:7:"display";s:1:"1";s:7:"require";s:1:"1";}s:5:"phone";a:2:{s:7:"display";s:1:"1";s:7:"require";s:1:"1";}s:3:"fax";a:1:{s:7:"display";s:1:"1";}s:6:"f_name";a:2:{s:7:"require";i:1;s:7:"display";i:1;}s:5:"email";a:2:{s:7:"require";i:1;s:7:"display";i:1;}s:6:"u_name";a:2:{s:7:"require";i:1;s:7:"display";i:1;}s:8:"password";a:2:{s:7:"require";i:1;s:7:"display";i:1;}s:10:"password_2";a:2:{s:7:"require";i:1;s:7:"display";i:1;}}s:7:"address";a:22:{s:5:"title";a:2:{s:7:"display";s:1:"1";s:7:"require";s:1:"1";}s:6:"l_name";a:2:{s:7:"display";s:1:"1";s:7:"require";s:1:"1";}s:10:"firma_name";a:1:{s:7:"display";s:1:"1";}s:6:"street";a:2:{s:7:"display";s:1:"1";s:7:"require";s:1:"1";}s:3:"zip";a:2:{s:7:"display";s:1:"1";s:7:"require";s:1:"1";}s:4:"city";a:2:{s:7:"display";s:1:"1";s:7:"require";s:1:"1";}s:5:"state";a:1:{s:7:"display";s:1:"1";}s:7:"country";a:2:{s:7:"display";s:1:"1";s:7:"require";s:1:"1";}s:5:"phone";a:2:{s:7:"display";s:1:"1";s:7:"require";s:1:"1";}s:3:"fax";a:1:{s:7:"display";s:1:"1";}s:7:"d_title";a:2:{s:7:"display";s:1:"1";s:7:"require";s:1:"1";}s:8:"d_f_name";a:2:{s:7:"display";s:1:"1";s:7:"require";s:1:"1";}s:8:"d_l_name";a:2:{s:7:"display";s:1:"1";s:7:"require";s:1:"1";}s:12:"d_firma_name";a:1:{s:7:"display";s:1:"1";}s:8:"d_street";a:2:{s:7:"display";s:1:"1";s:7:"require";s:1:"1";}s:5:"d_zip";a:2:{s:7:"display";s:1:"1";s:7:"require";s:1:"1";}s:6:"d_city";a:2:{s:7:"display";s:1:"1";s:7:"require";s:1:"1";}s:7:"d_state";a:1:{s:7:"display";s:1:"1";}s:9:"d_country";a:2:{s:7:"display";s:1:"1";s:7:"require";s:1:"1";}s:7:"d_phone";a:2:{s:7:"display";s:1:"1";s:7:"require";s:1:"1";}s:6:"f_name";a:2:{s:7:"require";i:1;s:7:"display";i:1;}s:5:"email";a:2:{s:7:"require";i:1;s:7:"display";i:1;}}s:11:"editaccount";a:22:{s:5:"title";a:2:{s:7:"display";s:1:"1";s:7:"require";s:1:"1";}s:6:"l_name";a:2:{s:7:"display";s:1:"1";s:7:"require";s:1:"1";}s:10:"firma_name";a:1:{s:7:"display";s:1:"1";}s:6:"street";a:2:{s:7:"display";s:1:"1";s:7:"require";s:1:"1";}s:3:"zip";a:2:{s:7:"display";s:1:"1";s:7:"require";s:1:"1";}s:4:"city";a:2:{s:7:"display";s:1:"1";s:7:"require";s:1:"1";}s:5:"state";a:1:{s:7:"display";s:1:"1";}s:7:"country";a:2:{s:7:"display";s:1:"1";s:7:"require";s:1:"1";}s:5:"phone";a:2:{s:7:"display";s:1:"1";s:7:"require";s:1:"1";}s:3:"fax";a:1:{s:7:"display";s:1:"1";}s:7:"d_title";a:2:{s:7:"display";s:1:"1";s:7:"require";s:1:"1";}s:8:"d_f_name";a:2:{s:7:"display";s:1:"1";s:7:"require";s:1:"1";}s:8:"d_l_name";a:2:{s:7:"display";s:1:"1";s:7:"require";s:1:"1";}s:12:"d_firma_name";a:1:{s:7:"display";s:1:"1";}s:8:"d_street";a:2:{s:7:"display";s:1:"1";s:7:"require";s:1:"1";}s:5:"d_zip";a:2:{s:7:"display";s:1:"1";s:7:"require";s:1:"1";}s:6:"d_city";a:2:{s:7:"display";s:1:"1";s:7:"require";s:1:"1";}s:7:"d_state";a:1:{s:7:"display";s:1:"1";}s:9:"d_country";a:2:{s:7:"display";s:1:"1";s:7:"require";s:1:"1";}s:7:"d_phone";a:2:{s:7:"display";s:1:"1";s:7:"require";s:1:"1";}s:6:"f_name";a:2:{s:7:"require";i:1;s:7:"display";i:1;}s:5:"email";a:2:{s:7:"require";i:1;s:7:"display";i:1;}}}', '', 1, 0, 0, 0, 0, 3, 1, 1, 0, 0, 0, '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `jos_jshopping_config_display_prices`
--

CREATE TABLE IF NOT EXISTS `jos_jshopping_config_display_prices` (
  `id` int(11) NOT NULL auto_increment,
  `zones` text NOT NULL,
  `display_price` tinyint(1) NOT NULL,
  `display_price_firma` tinyint(1) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `jos_jshopping_config_seo`
--

CREATE TABLE IF NOT EXISTS `jos_jshopping_config_seo` (
  `id` int(11) NOT NULL auto_increment,
  `alias` varchar(64) NOT NULL,
  `ordering` int(11) NOT NULL,
  `title_en-GB` varchar(255) NOT NULL,
  `keyword_en-GB` text NOT NULL,
  `description_en-GB` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=28 ;

--
-- Dumping data for table `jos_jshopping_config_seo`
--

INSERT INTO `jos_jshopping_config_seo` (`id`, `alias`, `ordering`, `title_en-GB`, `keyword_en-GB`, `description_en-GB`) VALUES
(1, 'category', 10, '', '', ''),
(2, 'manufacturers', 20, '', '', ''),
(3, 'cart', 30, '', '', ''),
(4, 'wishlist', 40, '', '', ''),
(5, 'login', 50, '', '', ''),
(6, 'register', 60, '', '', ''),
(7, 'editaccount', 70, '', '', ''),
(8, 'myorders', 80, '', '', ''),
(9, 'myaccount', 90, '', '', ''),
(10, 'search', 100, '', '', ''),
(11, 'search-result', 110, '', '', ''),
(12, 'myorder-detail', 120, '', '', ''),
(13, 'vendors', 130, '', '', ''),
(14, 'content-agb', 140, '', '', ''),
(15, 'content-return_policy', 150, '', '', ''),
(16, 'content-shipping', 160, '', '', ''),
(17, 'checkout-address', 170, '', '', ''),
(18, 'checkout-payment', 180, '', '', ''),
(19, 'checkout-shipping', 190, '', '', ''),
(20, 'checkout-preview', 200, '', '', ''),
(21, 'lastproducts', 210, '', '', ''),
(22, 'randomproducts', 220, '', '', ''),
(23, 'bestsellerproducts', 230, '', '', ''),
(24, 'labelproducts', 240, '', '', ''),
(25, 'topratingproducts', 250, '', '', ''),
(26, 'tophitsproducts', 260, '', '', ''),
(27, 'all-products', 270, '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `jos_jshopping_config_statictext`
--

CREATE TABLE IF NOT EXISTS `jos_jshopping_config_statictext` (
  `id` int(11) NOT NULL auto_increment,
  `alias` varchar(64) NOT NULL,
  `text_en-GB` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `jos_jshopping_config_statictext`
--

INSERT INTO `jos_jshopping_config_statictext` (`id`, `alias`, `text_en-GB`) VALUES
(1, 'home', ''),
(2, 'manufacturer', ''),
(3, 'agb', ''),
(4, 'return_policy', ''),
(5, 'order_email_descr', ''),
(6, 'order_finish_descr', ''),
(7, 'shipping', '');

-- --------------------------------------------------------

--
-- Table structure for table `jos_jshopping_countries`
--

CREATE TABLE IF NOT EXISTS `jos_jshopping_countries` (
  `country_id` int(11) NOT NULL auto_increment,
  `country_publish` tinyint(4) NOT NULL,
  `ordering` smallint(6) NOT NULL,
  `country_code` varchar(5) NOT NULL,
  `country_code_2` varchar(5) NOT NULL,
  `name_en-GB` varchar(255) NOT NULL,
  `name_de-DE` varchar(255) NOT NULL,
  PRIMARY KEY  (`country_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=240 ;

--
-- Dumping data for table `jos_jshopping_countries`
--

INSERT INTO `jos_jshopping_countries` (`country_id`, `country_publish`, `ordering`, `country_code`, `country_code_2`, `name_en-GB`, `name_de-DE`) VALUES
(1, 1, 1, 'AFG', 'AF', 'Afghanistan', 'Afghanistan'),
(2, 1, 2, 'ALB', 'AL', 'Albania', 'Albanien'),
(3, 1, 3, 'DZA', 'DZ', 'Algeria', 'Algerien'),
(4, 1, 4, 'ASM', 'AS', 'American Samoa', 'Amerikanisch-Samoa'),
(5, 1, 5, 'AND', 'AD', 'Andorra', 'Andorra'),
(6, 1, 6, 'AGO', 'AO', 'Angola', 'Angola'),
(7, 1, 7, 'AIA', 'AI', 'Anguilla', 'Anguilla'),
(8, 1, 8, 'ATA', 'AQ', 'Antarctica', 'Antarktis'),
(9, 1, 9, 'ATG', 'AG', 'Antigua and Barbuda', 'Antigua und Barbuda'),
(10, 1, 10, 'ARG', 'AR', 'Argentina', 'Argentinien'),
(11, 1, 11, 'ARM', 'AM', 'Armenia', 'Armenien'),
(12, 1, 12, 'ABW', 'AW', 'Aruba', 'Aruba'),
(13, 1, 13, 'AUS', 'AU', 'Australia', 'Australien'),
(14, 1, 14, 'AUT', 'AT', 'Austria', 'Österreich'),
(15, 1, 15, 'AZE', 'AZ', 'Azerbaijan', 'Aserbaidschan'),
(16, 1, 16, 'BHS', 'BS', 'Bahamas', 'Bahamas'),
(17, 1, 17, 'BHR', 'BH', 'Bahrain', 'Bahrain'),
(18, 1, 18, 'BGD', 'BD', 'Bangladesh', 'Bangladesch'),
(19, 1, 19, 'BRB', 'BB', 'Barbados', 'Barbados'),
(20, 1, 20, 'BLR', 'BY', 'Belarus', 'Weissrussland'),
(21, 1, 21, 'BEL', 'BE', 'Belgium', 'Belgien'),
(22, 1, 22, 'BLZ', 'BZ', 'Belize', 'Belize'),
(23, 1, 23, 'BEN', 'BJ', 'Benin', 'Benin'),
(24, 1, 24, 'BMU', 'BM', 'Bermuda', 'Bermuda'),
(25, 1, 25, 'BTN', 'BT', 'Bhutan', 'Bhutan'),
(26, 1, 26, 'BOL', 'BO', 'Bolivia', 'Bolivien'),
(27, 1, 27, 'BIH', 'BA', 'Bosnia and Herzegowina', 'Bosnien und Herzegowina'),
(28, 1, 28, 'BWA', 'BW', 'Botswana', 'Botsuana'),
(29, 1, 29, 'BVT', 'BV', 'Bouvet Island', 'Bouvetinsel'),
(30, 1, 30, 'BRA', 'BR', 'Brazil', 'Brasilien'),
(31, 1, 31, 'IOT', 'IO', 'British Indian Ocean Territory', 'Britisches Territorium im Indischen Ozean'),
(32, 1, 32, 'BRN', 'BN', 'Brunei Darussalam', 'Brunei'),
(33, 1, 33, 'BGR', 'BG', 'Bulgaria', 'Bulgarien'),
(34, 1, 34, 'BFA', 'BF', 'Burkina Faso', 'Burkina Faso'),
(35, 1, 35, 'BDI', 'BI', 'Burundi', 'Burundi'),
(36, 1, 36, 'KHM', 'KH', 'Cambodia', 'Kambodscha'),
(37, 1, 37, 'CMR', 'CM', 'Cameroon', 'Kamerun'),
(38, 1, 38, 'CAN', 'CA', 'Canada', 'Kanada'),
(39, 1, 39, 'CPV', 'CV', 'Cape Verde', 'Kap Verde'),
(40, 1, 40, 'CYM', 'KY', 'Cayman Islands', 'Cayman-Inseln'),
(41, 1, 41, 'CAF', 'CF', 'Central African Republic', 'Zentralafrikanische Republik'),
(42, 1, 42, 'TCD', 'TD', 'Chad', 'Tschad'),
(43, 1, 43, 'CHL', 'CL', 'Chile', 'Chile'),
(44, 1, 44, 'CHN', 'CN', 'China', 'China'),
(45, 1, 45, 'CXR', 'CX', 'Christmas Island', 'Christmas Island'),
(46, 1, 46, 'CCK', 'CC', 'Cocos (Keeling) Islands', 'Kokosinseln (Keeling)'),
(47, 1, 47, 'COL', 'CO', 'Colombia', 'Kolumbien'),
(48, 1, 48, 'COM', 'KM', 'Comoros', 'Komoren'),
(49, 1, 49, 'COG', 'CG', 'Congo', 'Kongo, Republik'),
(50, 1, 50, 'COK', 'CK', 'Cook Islands', 'Cookinseln'),
(51, 1, 51, 'CRI', 'CR', 'Costa Rica', 'Costa Rica'),
(52, 1, 52, 'CIV', 'CI', 'Cote D''Ivoire', 'Elfenbeinküste'),
(53, 1, 53, 'HRV', 'HR', 'Croatia', 'Kroatien'),
(54, 1, 54, 'CUB', 'CU', 'Cuba', 'Kuba'),
(55, 1, 55, 'CYP', 'CY', 'Cyprus', 'Zypern'),
(56, 1, 56, 'CZE', 'CZ', 'Czech Republic', 'Tschechien'),
(57, 1, 57, 'DNK', 'DK', 'Denmark', 'Dänemark'),
(58, 1, 58, 'DJI', 'DJ', 'Djibouti', 'Dschibuti'),
(59, 1, 59, 'DMA', 'DM', 'Dominica', 'Dominica'),
(60, 1, 60, 'DOM', 'DO', 'Dominican Republic', 'Dominikanische Republik'),
(61, 1, 61, 'TMP', 'TL', 'East Timor', 'Osttimor'),
(62, 1, 62, 'ECU', 'EC', 'Ecuador', 'Ecuador'),
(63, 1, 63, 'EGY', 'EG', 'Egypt', 'Ägypten'),
(64, 1, 64, 'SLV', 'SV', 'El Salvador', 'El Salvador'),
(65, 1, 65, 'GNQ', 'GQ', 'Equatorial Guinea', 'Äquatorial-Guinea'),
(66, 1, 66, 'ERI', 'ER', 'Eritrea', 'Eritrea'),
(67, 1, 67, 'EST', 'EE', 'Estonia', 'Estland'),
(68, 1, 68, 'ETH', 'ET', 'Ethiopia', 'Äthiopien'),
(69, 1, 69, 'FLK', 'FK', 'Falkland Islands (Malvinas)', 'Falklandinseln'),
(70, 1, 70, 'FRO', 'FO', 'Faroe Islands', 'Färöer'),
(71, 1, 71, 'FJI', 'FJ', 'Fiji', 'Fidschi'),
(72, 1, 72, 'FIN', 'FI', 'Finland', 'Finnland'),
(73, 1, 73, 'FRA', 'FR', 'France', 'Frankreich'),
(74, 1, 74, 'FXX', 'FX', 'France Metropolitan', 'Frankreich, Metropolitan'),
(75, 1, 75, 'GUF', 'GF', 'French Guiana', 'Französisch-Guyana'),
(76, 1, 76, 'PYF', 'PF', 'French Polynesia', 'Franz. Polynesien'),
(77, 1, 77, 'ATF', 'TF', 'French Southern Territories', 'Französiche Süd- und Antarktisgebiete'),
(78, 1, 78, 'GAB', 'GA', 'Gabon', 'Gabun'),
(79, 1, 79, 'GMB', 'GM', 'Gambia', 'Gambia'),
(80, 1, 80, 'GEO', 'GE', 'Georgia', 'Georgien'),
(81, 1, 81, 'DEU', 'DE', 'Germany', 'Deutschland'),
(82, 1, 82, 'GHA', 'GH', 'Ghana', 'Ghana'),
(83, 1, 83, 'GIB', 'GI', 'Gibraltar', 'Gibraltar'),
(84, 1, 84, 'GRC', 'GR', 'Greece', 'Griechenland'),
(85, 1, 85, 'GRL', 'GL', 'Greenland', 'Grönland'),
(86, 1, 86, 'GRD', 'GD', 'Grenada', 'Grenada'),
(87, 1, 87, 'GLP', 'GP', 'Guadeloupe', 'Guadeloupe'),
(88, 1, 88, 'GUM', 'GU', 'Guam', 'Guam'),
(89, 1, 89, 'GTM', 'GT', 'Guatemala', 'Guatemala'),
(90, 1, 90, 'GIN', 'GN', 'Guinea', 'Guinea'),
(91, 1, 91, 'GNB', 'GW', 'Guinea-bissau', 'Guinea-Bissau'),
(92, 1, 92, 'GUY', 'GY', 'Guyana', 'Guyana'),
(93, 1, 93, 'HTI', 'HT', 'Haiti', 'Haiti'),
(94, 1, 94, 'HMD', 'HM', 'Heard and Mc Donald Islands', 'Heard und McDonaldinseln'),
(95, 1, 95, 'HND', 'HN', 'Honduras', 'Honduras'),
(96, 1, 96, 'HKG', 'HK', 'Hong Kong', 'Hong Kong'),
(97, 1, 97, 'HUN', 'HU', 'Hungary', 'Ungarn'),
(98, 1, 98, 'ISL', 'IS', 'Iceland', 'Island'),
(99, 1, 99, 'IND', 'IN', 'India', 'Indien'),
(100, 1, 100, 'IDN', 'ID', 'Indonesia', 'Indonesien'),
(101, 1, 101, 'IRN', 'IR', 'Iran (Islamic Republic of)', 'Iran'),
(102, 1, 102, 'IRQ', 'IQ', 'Iraq', 'Irak'),
(103, 1, 103, 'IRL', 'IE', 'Ireland', 'Irland'),
(104, 1, 104, 'ISR', 'IL', 'Israel', 'Israel'),
(105, 1, 105, 'ITA', 'IT', 'Italy', 'Italien'),
(106, 1, 106, 'JAM', 'JM', 'Jamaica', 'Jamaika'),
(107, 1, 107, 'JPN', 'JP', 'Japan', 'Japan'),
(108, 1, 108, 'JOR', 'JO', 'Jordan', 'Jordanien'),
(109, 1, 109, 'KAZ', 'KZ', 'Kazakhstan', 'Kasachstan'),
(110, 1, 110, 'KEN', 'KE', 'Kenya', 'Kenia'),
(111, 1, 111, 'KIR', 'KI', 'Kiribati', 'Kiribati'),
(112, 1, 112, 'PRK', 'KP', 'Korea Democratic People''s Republic of', 'Korea Demokratische Volksrepublik'),
(113, 1, 113, 'KOR', 'KR', 'Korea Republic of', 'Korea'),
(114, 1, 114, 'KWT', 'KW', 'Kuwait', 'Kuwait'),
(115, 1, 115, 'KGZ', 'KG', 'Kyrgyzstan', 'Kirgistan'),
(116, 1, 116, 'LAO', 'LA', 'Lao People''s Democratic Republic', 'Laos'),
(117, 1, 117, 'LVA', 'LV', 'Latvia', 'Lettland'),
(118, 1, 118, 'LBN', 'LB', 'Lebanon', 'Libanon'),
(119, 1, 119, 'LSO', 'LS', 'Lesotho', 'Lesotho'),
(120, 1, 120, 'LBR', 'LR', 'Liberia', 'Liberia'),
(121, 1, 121, 'LBY', 'LY', 'Libyan Arab Jamahiriya', 'Libyen'),
(122, 1, 122, 'LIE', 'LI', 'Liechtenstein', 'Liechtenstein'),
(123, 1, 123, 'LTU', 'LT', 'Lithuania', 'Litauen'),
(124, 1, 124, 'LUX', 'LU', 'Luxembourg', 'Luxemburg'),
(125, 1, 125, 'MAC', 'MO', 'Macau', 'Makao'),
(126, 1, 126, 'MKD', 'MK', 'Macedonia The Former Yugoslav Republic of', 'Mazedonien'),
(127, 1, 127, 'MDG', 'MG', 'Madagascar', 'Madagaskar'),
(128, 1, 128, 'MWI', 'MW', 'Malawi', 'Malawi'),
(129, 1, 129, 'MYS', 'MY', 'Malaysia', 'Malaysia'),
(130, 1, 130, 'MDV', 'MV', 'Maldives', 'Malediven'),
(131, 1, 131, 'MLI', 'ML', 'Mali', 'Mali'),
(132, 1, 132, 'MLT', 'MT', 'Malta', 'Malta'),
(133, 1, 133, 'MHL', 'MH', 'Marshall Islands', 'Marshallinseln'),
(134, 1, 134, 'MTQ', 'MQ', 'Martinique', 'Martinique'),
(135, 1, 135, 'MRT', 'MR', 'Mauritania', 'Mauretanien'),
(136, 1, 136, 'MUS', 'MU', 'Mauritius', 'Mauritius'),
(137, 1, 137, 'MYT', 'YT', 'Mayotte', 'Mayott'),
(138, 1, 138, 'MEX', 'MX', 'Mexico', 'Mexiko'),
(139, 1, 139, 'FSM', 'FM', 'Micronesia Federated States of', 'Mikronesien'),
(140, 1, 140, 'MDA', 'MD', 'Moldova Republic of', 'Moldawien'),
(141, 1, 141, 'MCO', 'MC', 'Monaco', 'Monaco'),
(142, 1, 142, 'MNG', 'MN', 'Mongolia', 'Mongolei'),
(143, 1, 143, 'MSR', 'MS', 'Montserrat', 'Montserrat'),
(144, 1, 144, 'MAR', 'MA', 'Morocco', 'Marokko'),
(145, 1, 145, 'MOZ', 'MZ', 'Mozambique', 'Mosambik'),
(146, 1, 146, 'MMR', 'MM', 'Myanmar', 'Myanmar'),
(147, 1, 147, 'NAM', 'NA', 'Namibia', 'Namibia'),
(148, 1, 148, 'NRU', 'NR', 'Nauru', 'Nauru'),
(149, 1, 149, 'NPL', 'NP', 'Nepal', 'Nepal'),
(150, 1, 150, 'NLD', 'NL', 'Netherlands', 'Niederlande'),
(151, 1, 151, 'ANT', 'AN', 'Netherlands Antilles', 'Niederländisch-Antillen'),
(152, 1, 152, 'NCL', 'NC', 'New Caledonia', 'Neukaledonien'),
(153, 1, 153, 'NZL', 'NZ', 'New Zealand', 'Neuseeland'),
(154, 1, 154, 'NIC', 'NI', 'Nicaragua', 'Nicaragua'),
(155, 1, 155, 'NER', 'NE', 'Niger', 'Niger'),
(156, 1, 156, 'NGA', 'NG', 'Nigeria', 'Nigeria'),
(157, 1, 157, 'NIU', 'NU', 'Niue', 'Niue'),
(158, 1, 158, 'NFK', 'NF', 'Norfolk Island', 'Norfolkinsel'),
(159, 1, 159, 'MNP', 'MP', 'Northern Mariana Islands', 'Nördliche Marianen'),
(160, 1, 160, 'NOR', 'NO', 'Norway', 'Norwegen'),
(161, 1, 161, 'OMN', 'OM', 'Oman', 'Oman'),
(162, 1, 162, 'PAK', 'PK', 'Pakistan', 'Pakistan'),
(163, 1, 163, 'PLW', 'PW', 'Palau', 'Palau'),
(164, 1, 164, 'PAN', 'PA', 'Panama', 'Panama'),
(165, 1, 165, 'PNG', 'PG', 'Papua New Guinea', 'Papua-Neuguinea'),
(166, 1, 166, 'PRY', 'PY', 'Paraguay', 'Paraguay'),
(167, 1, 167, 'PER', 'PE', 'Peru', 'Peru'),
(168, 1, 168, 'PHL', 'PH', 'Philippines', 'Philippinen'),
(169, 1, 169, 'PCN', 'PN', 'Pitcairn', 'Pitcairn'),
(170, 1, 170, 'POL', 'PL', 'Poland', 'Polen'),
(171, 1, 171, 'PRT', 'PT', 'Portugal', 'Portugal'),
(172, 1, 172, 'PRI', 'PR', 'Puerto Rico', 'Puerto Rico'),
(173, 1, 173, 'QAT', 'QA', 'Qatar', 'Katar'),
(174, 1, 174, 'REU', 'RE', 'Reunion', 'Reunion'),
(175, 1, 175, 'ROM', 'RO', 'Romania', 'Rumänien'),
(176, 1, 176, 'RUS', 'RU', 'Russian Federation', 'Russische Föderation'),
(177, 1, 177, 'RWA', 'RW', 'Rwanda', 'Ruanda'),
(178, 1, 178, 'KNA', 'KN', 'Saint Kitts and Nevis', 'St. Kitts und Nevis'),
(179, 1, 179, 'LCA', 'LC', 'Saint Lucia', 'St. Lucia'),
(180, 1, 180, 'VCT', 'VC', 'Saint Vincent and the Grenadines', 'St. Vincent und die Grenadinen'),
(181, 1, 181, 'WSM', 'WS', 'Samoa', 'Samoa'),
(182, 1, 182, 'SMR', 'SM', 'San Marino', 'San Marino'),
(183, 1, 183, 'STP', 'ST', 'Sao Tome and Principe', 'Sao Tomé und Príncipe'),
(184, 1, 184, 'SAU', 'SA', 'Saudi Arabia', 'Saudi-Arabien'),
(185, 1, 185, 'SEN', 'SN', 'Senegal', 'Senegal'),
(186, 1, 186, 'SYC', 'SC', 'Seychelles', 'Seychellen'),
(187, 1, 187, 'SLE', 'SL', 'Sierra Leone', 'Sierra Leone'),
(188, 1, 188, 'SGP', 'SG', 'Singapore', 'Singapur'),
(189, 1, 189, 'SVK', 'SK', 'Slovakia (Slovak Republic)', 'Slowakei'),
(190, 1, 190, 'SVN', 'SI', 'Slovenia', 'Slowenien'),
(191, 1, 191, 'SLB', 'SB', 'Solomon Islands', 'Salomonen'),
(192, 1, 192, 'SOM', 'SO', 'Somalia', 'Somalia'),
(193, 1, 193, 'ZAF', 'ZA', 'South Africa', 'Republik Südafrika'),
(194, 1, 194, 'SGS', 'GS', 'South Georgia and the South Sandwich Islands', 'Südgeorgien und die Südlichen Sandwichinseln'),
(195, 1, 195, 'ESP', 'ES', 'Spain', 'Spanien'),
(196, 1, 196, 'LKA', 'LK', 'Sri Lanka', 'Sri Lanka'),
(197, 1, 197, 'SHN', 'SH', 'St. Helena', 'St. Helena'),
(198, 1, 198, 'SPM', 'PM', 'St. Pierre and Miquelon', 'St. Pierre und Miquelon'),
(199, 1, 199, 'SDN', 'SD', 'Sudan', 'Sudan'),
(200, 1, 200, 'SUR', 'SR', 'Suriname', 'Suriname'),
(201, 1, 201, 'SJM', 'SJ', 'Svalbard and Jan Mayen Islands', 'Svalbard und Jan Mayen'),
(202, 1, 202, 'SWZ', 'SZ', 'Swaziland', 'Swasiland'),
(203, 1, 203, 'SWE', 'SE', 'Sweden', 'Schweden'),
(204, 1, 204, 'CHE', 'CH', 'Switzerland', 'Schweiz'),
(205, 1, 205, 'SYR', 'SY', 'Syrian Arab Republic', 'Syrien'),
(206, 1, 206, 'TWN', 'TW', 'Taiwan', 'Taiwan'),
(207, 1, 207, 'TJK', 'TJ', 'Tajikistan', 'Tadschikistan'),
(208, 1, 208, 'TZA', 'TZ', 'Tanzania United Republic of', 'Tansania'),
(209, 1, 209, 'THA', 'TH', 'Thailand', 'Thailand'),
(210, 1, 210, 'TGO', 'TG', 'Togo', 'Togo'),
(211, 1, 211, 'TKL', 'TK', 'Tokelau', 'Tokelau'),
(212, 1, 212, 'TON', 'TO', 'Tonga', 'Tonga'),
(213, 1, 213, 'TTO', 'TT', 'Trinidad and Tobago', 'Trinidad und Tobago'),
(214, 1, 214, 'TUN', 'TN', 'Tunisia', 'Tunesien'),
(215, 1, 215, 'TUR', 'TR', 'Turkey', 'Türkei'),
(216, 1, 216, 'TKM', 'TM', 'Turkmenistan', 'Turkmenistan'),
(217, 1, 217, 'TCA', 'TC', 'Turks and Caicos Islands', 'Turks- und Caicosinseln'),
(218, 1, 218, 'TUV', 'TV', 'Tuvalu', 'Tuvalu'),
(219, 1, 219, 'UGA', 'UG', 'Uganda', 'Uganda'),
(220, 1, 220, 'UKR', 'UA', 'Ukraine', 'Ukraine'),
(221, 1, 221, 'ARE', 'AE', 'United Arab Emirates', 'Vereinigte Arabische Emirate'),
(222, 1, 222, 'GBR', 'GB', 'United Kingdom', 'Vereinigtes Königreich'),
(223, 1, 223, 'USA', 'US', 'United States', 'USA'),
(224, 1, 224, 'UMI', 'UM', 'United States Minor Outlying Islands', 'United States Minor Outlying Islands'),
(225, 1, 225, 'URY', 'UY', 'Uruguay', 'Uruguay'),
(226, 1, 226, 'UZB', 'UZ', 'Uzbekistan', 'Usbekistan'),
(227, 1, 227, 'VUT', 'VU', 'Vanuatu', 'Vanuatu'),
(228, 1, 228, 'VAT', 'VA', 'Vatican City State (Holy See)', 'Vatikanstadt'),
(229, 1, 229, 'VEN', 'VE', 'Venezuela', 'Venezuela'),
(230, 1, 230, 'VNM', 'VN', 'Viet Nam', 'Vietnam'),
(231, 1, 231, 'VGB', 'VG', 'Virgin Islands (British)', 'Britische Jungferninseln'),
(232, 1, 232, 'VIR', 'VI', 'Virgin Islands (U.S.)', 'Vereinigte Staaten von Amerika'),
(233, 1, 233, 'WLF', 'WF', 'Wallis and Futuna Islands', 'Wallis und Futuna'),
(234, 1, 234, 'ESH', 'EH', 'Western Sahara', 'Westsahara'),
(235, 1, 235, 'YEM', 'YE', 'Yemen', 'Jemen'),
(236, 1, 236, 'YUG', 'YU', 'Yugoslavia', 'Yugoslavia'),
(237, 1, 237, 'ZAR', 'ZR', 'Zaire', 'Zaire'),
(238, 1, 238, 'ZMB', 'ZM', 'Zambia', 'Sambia'),
(239, 1, 239, 'ZWE', 'ZW', 'Zimbabwe', 'Simbabwe');

-- --------------------------------------------------------

--
-- Table structure for table `jos_jshopping_coupons`
--

CREATE TABLE IF NOT EXISTS `jos_jshopping_coupons` (
  `coupon_id` int(11) NOT NULL auto_increment,
  `coupon_type` tinyint(4) NOT NULL default '0' COMMENT 'value_or_percent',
  `coupon_code` varchar(100) NOT NULL default '',
  `coupon_value` decimal(12,2) NOT NULL default '0.00',
  `tax_id` int(11) NOT NULL,
  `used` int(11) NOT NULL,
  `for_user_id` int(11) NOT NULL,
  `coupon_start_date` date NOT NULL default '0000-00-00',
  `coupon_expire_date` date NOT NULL default '0000-00-00',
  `finished_after_used` int(11) NOT NULL,
  `coupon_publish` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`coupon_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `jos_jshopping_currencies`
--

CREATE TABLE IF NOT EXISTS `jos_jshopping_currencies` (
  `currency_id` int(11) NOT NULL auto_increment,
  `currency_name` varchar(64) NOT NULL default '',
  `currency_code` varchar(20) NOT NULL default '',
  `currency_code_iso` varchar(3) NOT NULL default '',
  `currency_ordering` int(11) NOT NULL default '0',
  `currency_value` decimal(14,6) NOT NULL default '0.000000',
  `currency_publish` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`currency_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `jos_jshopping_currencies`
--

INSERT INTO `jos_jshopping_currencies` (`currency_id`, `currency_name`, `currency_code`, `currency_code_iso`, `currency_ordering`, `currency_value`, `currency_publish`) VALUES
(1, 'Euro', 'EUR', 'EUR', 1, '1.000000', 1);

-- --------------------------------------------------------

--
-- Table structure for table `jos_jshopping_delivery_times`
--

CREATE TABLE IF NOT EXISTS `jos_jshopping_delivery_times` (
  `id` int(11) NOT NULL auto_increment,
  `name_en-GB` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `jos_jshopping_free_attr`
--

CREATE TABLE IF NOT EXISTS `jos_jshopping_free_attr` (
  `id` int(11) NOT NULL auto_increment,
  `ordering` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL,
  `name_en-GB` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `jos_jshopping_import_export`
--

CREATE TABLE IF NOT EXISTS `jos_jshopping_import_export` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `params` text NOT NULL,
  `endstart` int(11) NOT NULL,
  `steptime` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `jos_jshopping_import_export`
--

INSERT INTO `jos_jshopping_import_export` (`id`, `name`, `alias`, `description`, `params`, `endstart`, `steptime`) VALUES
(1, 'Simple Export', 'simpleexport', 'Simple Export in CSV iso-8859-1', 'filename=export', 0, 1),
(2, 'Simple Import', 'simpleimport', 'Simple Import in CSV iso-8859-1', '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `jos_jshopping_languages`
--

CREATE TABLE IF NOT EXISTS `jos_jshopping_languages` (
  `id` int(11) NOT NULL auto_increment,
  `language` varchar(32) default NULL,
  `name` varchar(255) NOT NULL,
  `publish` int(11) NOT NULL,
  `ordering` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `jos_jshopping_languages`
--

INSERT INTO `jos_jshopping_languages` (`id`, `language`, `name`, `publish`, `ordering`) VALUES
(1, 'en-GB', 'English', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `jos_jshopping_manufacturers`
--

CREATE TABLE IF NOT EXISTS `jos_jshopping_manufacturers` (
  `manufacturer_id` int(11) NOT NULL auto_increment,
  `manufacturer_url` varchar(255) NOT NULL,
  `manufacturer_logo` varchar(255) NOT NULL,
  `manufacturer_publish` tinyint(1) NOT NULL,
  `products_page` int(11) NOT NULL,
  `products_row` int(11) NOT NULL,
  `ordering` int(6) NOT NULL,
  `name_en-GB` varchar(255) NOT NULL,
  `alias_en-GB` varchar(255) NOT NULL,
  `short_description_en-GB` text NOT NULL,
  `description_en-GB` text NOT NULL,
  `meta_title_en-GB` varchar(255) NOT NULL,
  `meta_description_en-GB` text NOT NULL,
  `meta_keyword_en-GB` text NOT NULL,
  PRIMARY KEY  (`manufacturer_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `jos_jshopping_orders`
--

CREATE TABLE IF NOT EXISTS `jos_jshopping_orders` (
  `order_id` int(11) NOT NULL auto_increment,
  `order_number` varchar(50) NOT NULL default '0',
  `user_id` int(11) NOT NULL default '0',
  `order_total` decimal(12,2) NOT NULL default '0.00',
  `order_subtotal` decimal(12,2) NOT NULL default '0.00',
  `order_tax` decimal(12,2) NOT NULL default '0.00',
  `order_tax_ext` text NOT NULL,
  `order_shipping` decimal(12,2) NOT NULL default '0.00',
  `order_payment` decimal(12,2) NOT NULL default '0.00',
  `order_discount` decimal(12,2) NOT NULL default '0.00',
  `currency_code` varchar(20) NOT NULL default '',
  `currency_code_iso` varchar(3) NOT NULL default '',
  `currency_exchange` decimal(14,6) NOT NULL default '0.000000',
  `order_status` varchar(1) NOT NULL default '',
  `order_created` tinyint(1) NOT NULL,
  `order_date` datetime NOT NULL default '0000-00-00 00:00:00',
  `order_m_date` datetime NOT NULL default '0000-00-00 00:00:00',
  `shipping_method_id` int(11) NOT NULL default '0',
  `payment_method_id` int(11) NOT NULL default '0',
  `payment_params` text NOT NULL,
  `payment_params_data` text NOT NULL,
  `ip_address` varchar(15) NOT NULL default '',
  `order_add_info` text NOT NULL,
  `title` tinyint(1) NOT NULL default '0',
  `f_name` varchar(255) NOT NULL default '',
  `l_name` varchar(255) NOT NULL default '',
  `firma_name` varchar(255) NOT NULL default '',
  `client_type` tinyint(1) NOT NULL,
  `client_type_name` varchar(100) NOT NULL,
  `firma_code` varchar(100) NOT NULL,
  `tax_number` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL default '',
  `street` varchar(100) NOT NULL default '',
  `zip` varchar(20) NOT NULL default '',
  `city` varchar(100) NOT NULL default '',
  `state` varchar(100) NOT NULL default '',
  `country` int(11) NOT NULL,
  `phone` varchar(20) NOT NULL default '',
  `mobil_phone` varchar(20) NOT NULL,
  `fax` varchar(20) NOT NULL default '',
  `ext_field_1` varchar(255) NOT NULL,
  `ext_field_2` varchar(255) NOT NULL,
  `ext_field_3` varchar(255) NOT NULL,
  `d_title` tinyint(1) NOT NULL default '0',
  `d_f_name` varchar(255) NOT NULL default '',
  `d_l_name` varchar(255) NOT NULL default '',
  `d_firma_name` varchar(255) NOT NULL default '',
  `d_email` varchar(255) NOT NULL default '',
  `d_street` varchar(100) NOT NULL default '',
  `d_zip` varchar(20) NOT NULL default '',
  `d_city` varchar(100) NOT NULL default '',
  `d_state` varchar(100) NOT NULL default '',
  `d_country` int(11) NOT NULL,
  `d_phone` varchar(30) NOT NULL default '',
  `d_mobil_phone` varchar(20) NOT NULL,
  `d_fax` varchar(20) NOT NULL default '',
  `d_ext_field_1` varchar(255) NOT NULL,
  `d_ext_field_2` varchar(255) NOT NULL,
  `d_ext_field_3` varchar(255) NOT NULL,
  `pdf_file` varchar(50) NOT NULL,
  `order_hash` varchar(32) NOT NULL default '',
  `file_hash` varchar(64) NOT NULL default '',
  `file_stat_downloads` text NOT NULL,
  `order_custom_info` text NOT NULL,
  `display_price` tinyint(1) NOT NULL,
  `vendor_type` tinyint(1) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `lang` varchar(16) NOT NULL,
  `transaction` text NOT NULL,
  PRIMARY KEY  (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `jos_jshopping_order_history`
--

CREATE TABLE IF NOT EXISTS `jos_jshopping_order_history` (
  `order_history_id` int(11) NOT NULL auto_increment,
  `order_id` int(11) NOT NULL default '0',
  `order_status_id` tinyint(1) NOT NULL default '0',
  `status_date_added` datetime NOT NULL default '0000-00-00 00:00:00',
  `customer_notify` int(1) default '0',
  `comments` text,
  PRIMARY KEY  (`order_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `jos_jshopping_order_item`
--

CREATE TABLE IF NOT EXISTS `jos_jshopping_order_item` (
  `order_item_id` int(11) NOT NULL auto_increment,
  `order_id` int(11) NOT NULL default '0',
  `product_id` int(11) NOT NULL default '0',
  `product_ean` varchar(50) NOT NULL default '',
  `product_name` varchar(100) NOT NULL default '',
  `product_quantity` int(11) NOT NULL default '0',
  `product_item_price` decimal(12,2) NOT NULL,
  `product_tax` decimal(12,2) NOT NULL default '0.00',
  `product_attributes` text NOT NULL,
  `product_freeattributes` text NOT NULL,
  `attributes` text NOT NULL,
  `freeattributes` text NOT NULL,
  `files` text NOT NULL,
  `weight` float(8,4) NOT NULL default '0.0000',
  `vendor_id` int(11) NOT NULL,
  PRIMARY KEY  (`order_item_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `jos_jshopping_order_status`
--

CREATE TABLE IF NOT EXISTS `jos_jshopping_order_status` (
  `status_id` int(11) NOT NULL auto_increment,
  `status_code` char(1) NOT NULL default '',
  `name_en-GB` varchar(100) NOT NULL default '',
  `name_de-DE` varchar(100) NOT NULL default '',
  PRIMARY KEY  (`status_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `jos_jshopping_order_status`
--

INSERT INTO `jos_jshopping_order_status` (`status_id`, `status_code`, `name_en-GB`, `name_de-DE`) VALUES
(1, 'P', 'Pending', 'Offen'),
(2, 'C', 'Confirmed', 'Bestätigt'),
(3, 'X', 'Cancelled', 'Abgebrochen'),
(4, 'R', 'Refunded', 'Gutschrift'),
(5, 'S', 'Shipped', 'Gesendet'),
(6, 'O', 'Paid', 'Bezahlt'),
(7, 'F', 'Complete', 'Abgeschlossen');

-- --------------------------------------------------------

--
-- Table structure for table `jos_jshopping_payment_method`
--

CREATE TABLE IF NOT EXISTS `jos_jshopping_payment_method` (
  `payment_id` int(11) NOT NULL auto_increment,
  `name_en-GB` varchar(100) NOT NULL,
  `description_en-GB` text NOT NULL,
  `name_de-DE` varchar(100) NOT NULL,
  `description_de-DE` text NOT NULL,
  `payment_code` varchar(32) NOT NULL,
  `payment_class` varchar(100) NOT NULL,
  `payment_publish` tinyint(1) NOT NULL,
  `payment_ordering` int(11) NOT NULL,
  `payment_params` text NOT NULL,
  `payment_type` tinyint(4) NOT NULL,
  `price` decimal(12,2) NOT NULL,
  `price_type` tinyint(1) NOT NULL,
  `tax_id` int(11) NOT NULL,
  `show_descr_in_email` tinyint(1) NOT NULL,
  PRIMARY KEY  (`payment_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `jos_jshopping_payment_method`
--

INSERT INTO `jos_jshopping_payment_method` (`payment_id`, `name_en-GB`, `description_en-GB`, `name_de-DE`, `description_de-DE`, `payment_code`, `payment_class`, `payment_publish`, `payment_ordering`, `payment_params`, `payment_type`, `price`, `price_type`, `tax_id`, `show_descr_in_email`) VALUES
(1, 'Cash on delivery', '', 'Nachnahme', '', 'bank', 'pm_bank', 1, 1, '', 1, '4.00', 0, 1, 0),
(2, 'Advance payment', '', 'Vorauskasse', '', 'PO', 'pm_purchase_order', 1, 2, '', 1, '0.00', 0, 1, 1),
(3, 'Paypal', '', 'Paypal', '', 'paypal', 'pm_paypal', 1, 3, 'testmode=1\n email_received=test@testing.com\n transaction_end_status=6\n transaction_pending_status=1\n transaction_failed_status=3\n checkdatareturn=0', 2, '0.00', 0, 1, 0),
(4, 'Debit', 'Please insert your bankdata.', 'Lastschrift', 'Bitte tragen Sie hier Ihre Bankdaten für den Abbuchungsauftrag ein.', 'debit', 'pm_debit', 1, 4, '', 1, '0.00', 0, 1, 0),
(5, 'Sofortueberweisung', '', 'Sofortueberweisung', '', 'ST', 'pm_sofortueberweisung', 0, 5, 'user_id=00000\nproject_id=00000\nproject_password=00000\ntransaction_end_status=6\ntransaction_pending_status=1\ntransaction_failed_status=3\n', 2, '0.00', 0, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `jos_jshopping_products`
--

CREATE TABLE IF NOT EXISTS `jos_jshopping_products` (
  `product_id` int(11) NOT NULL auto_increment,
  `product_ean` varchar(32) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `unlimited` tinyint(1) NOT NULL,
  `product_availability` varchar(128) NOT NULL,
  `product_date_added` datetime NOT NULL default '0000-00-00 00:00:00',
  `date_modify` datetime NOT NULL default '0000-00-00 00:00:00',
  `product_publish` tinyint(1) NOT NULL default '0',
  `product_tax_id` int(11) NOT NULL default '0',
  `product_template` varchar(64) NOT NULL default 'default',
  `product_url` varchar(255) NOT NULL default '',
  `product_old_price` decimal(12,2) NOT NULL default '0.00',
  `product_buy_price` decimal(12,2) NOT NULL default '0.00',
  `product_price` decimal(12,2) NOT NULL default '0.00',
  `min_price` decimal(12,2) NOT NULL default '0.00',
  `different_prices` tinyint(1) NOT NULL default '0',
  `product_weight` decimal(14,4) NOT NULL default '0.0000',
  `product_thumb_image` varchar(255) NOT NULL,
  `product_name_image` varchar(255) NOT NULL,
  `product_full_image` varchar(255) NOT NULL,
  `product_manufacturer_id` int(11) NOT NULL default '0',
  `product_is_add_price` tinyint(1) NOT NULL default '0',
  `average_rating` float(4,2) NOT NULL default '0.00',
  `reviews_count` int(11) NOT NULL default '0',
  `delivery_times_id` int(11) NOT NULL default '0',
  `hits` int(11) NOT NULL default '0',
  `weight_volume_units` decimal(14,4) NOT NULL default '0.0000',
  `basic_price_unit_id` int(11) NOT NULL default '0',
  `label_id` int(11) NOT NULL default '0',
  `vendor_id` int(11) NOT NULL default '0',
  `name_en-GB` varchar(255) NOT NULL,
  `alias_en-GB` varchar(255) NOT NULL,
  `short_description_en-GB` text NOT NULL,
  `description_en-GB` text NOT NULL,
  `meta_title_en-GB` varchar(255) NOT NULL,
  `meta_description_en-GB` text NOT NULL,
  `meta_keyword_en-GB` text NOT NULL,
  PRIMARY KEY  (`product_id`),
  KEY `product_manufacturer_id` (`product_manufacturer_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `jos_jshopping_products`
--

INSERT INTO `jos_jshopping_products` (`product_id`, `product_ean`, `product_quantity`, `unlimited`, `product_availability`, `product_date_added`, `date_modify`, `product_publish`, `product_tax_id`, `product_template`, `product_url`, `product_old_price`, `product_buy_price`, `product_price`, `min_price`, `different_prices`, `product_weight`, `product_thumb_image`, `product_name_image`, `product_full_image`, `product_manufacturer_id`, `product_is_add_price`, `average_rating`, `reviews_count`, `delivery_times_id`, `hits`, `weight_volume_units`, `basic_price_unit_id`, `label_id`, `vendor_id`, `name_en-GB`, `alias_en-GB`, `short_description_en-GB`, `description_en-GB`, `meta_title_en-GB`, `meta_description_en-GB`, `meta_keyword_en-GB`) VALUES
(1, '', 1, 0, '', '2011-09-12 16:34:23', '2011-09-13 11:26:15', 1, 1, 'default', '', '0.00', '0.00', '350.00', '350.00', 0, '0.0000', 'thumb_396a2664c3b817758355194521a78630.png', '396a2664c3b817758355194521a78630.png', 'full_396a2664c3b817758355194521a78630.png', 0, 0, 0.00, 0, 0, 8, '0.0000', 0, 0, 0, 'Macbook Pro', '', 'Macbook Pro - Bla bla bla', '<p>Macbook Pro - Bla bla bla</p>', '', '', ''),
(2, '', 1, 0, '', '2011-09-13 11:11:13', '2011-09-13 11:15:59', 1, 1, 'default', '', '0.00', '0.00', '120.00', '120.00', 0, '0.0000', 'thumb_8307874f275317b87f1ca54ae2d1e42a.png', '8307874f275317b87f1ca54ae2d1e42a.png', 'full_8307874f275317b87f1ca54ae2d1e42a.png', 0, 0, 0.00, 0, 0, 1, '0.0000', 0, 0, 0, 'Ipad', '', 'This is short descrption', '<p>This is long descrption</p>', '', '', ''),
(3, '', 1, 0, '', '2011-09-13 15:49:09', '2011-09-13 15:50:26', 1, 1, 'default', '', '0.00', '0.00', '20.00', '20.00', 0, '0.0000', 'thumb_15d6741c26c0d748abe6692ec001a7a3.jpg', '15d6741c26c0d748abe6692ec001a7a3.jpg', 'full_15d6741c26c0d748abe6692ec001a7a3.jpg', 0, 0, 0.00, 0, 0, 2, '0.0000', 0, 1, 0, 'CarCare', '', '', '<div style="font-family: Arial,Helvetica,sans-serif;"><span style="font-size: small;"><span style="font-size: small;"><b>CAR CARE PRODUCT,</b> Adalah produk-produk khusus untuk perawatan Kendaraan kesayangan anda, produk ini dibawah lisensi Gefragt Stets GMBH &amp; Co GERMANY. Terdiri dari :</span></span><hr id="system-readmore" /><span style="font-size: small;"></span></div>\r\n<ol style="font-family: Arial,Helvetica,sans-serif;">\r\n<li><span style="font-size: small;">Diamond Glaze : Obat Poles Finishing yang mengandung polymer dan wax melindungi cat kendaraan dari noda dan kotoran. Produk ini mengandung Abrasive pilihan yang dapat membuat cat kusam menjadi mengkilap.</span></li>\r\n<li><span style="font-size: small;">Stubborn Stain Cleaner : Membersihkan kerak dan jamur body dari cat mobil, paling bagus bila digunakan sebelum memoles cat mobil untuk menghemat waktu dan tenaga.</span></li>\r\n<li><span style="font-size: small;">Engine Cleaner : Produk ini untuk membersihkan bagian luar mesin mobil yang biasanya sangat kotor karena oli, hanya dengan menggunakan kuas dan semprot dengan air.</span></li>\r\n<li><span style="font-size: small;">Mould : Produk ini membersihkan jamur pada kaca mobil&nbsp; yang membandel.</span></li>\r\n<li><span style="font-size: small;">Wipe &amp; Glaze : Produk ini membersihkan dan mengkilapkan Vinyl, Kulit, ban dan karet, dan melindungi dari retak karena panas matahari.</span></li>\r\n<li><span style="font-size: small;">Car Seat Cleaner : Produk ini membersihkan interior mobil, sangat effective bila digunakan dengan Steamer dan Vacuum Cleaner.</span></li>\r\n<li>\r\n<div style="line-height: normal; margin-bottom: 0.0001pt;"><span style="font-size: small;">Shampoo mobil<span style="text-decoration: none;"> : <span style="font-size: small;">Produk ini diformulasikan dengan bahan yang sangat lembut, sampo ini berfungsi/berguna membersihkan dari kotoran tanpa memberikan efek pada mobil seperti:noda keputihan , tidak memudarkan warna cat mobil, dll.<b><span style="text-decoration: underline;"> </span></b>ini telah diuji pada berbagai macam cat, dan ter bukti aman.</span></span></span></div>\r\n</li>\r\n</ol>\r\n<div style="line-height: normal; margin-bottom: 0.0001pt;"><strong><span style="font-size: small;">Shampoo mobil + wax</span></strong></div>\r\n<p>&nbsp;<span style="font-size: small; line-height: 115%;">Produk ini diformulasikan dengan bahan yang sangat lembut, sampo ini berfungsi/berguna membersihkan dari kotoran tanpa memberikan efek pada mobil seperti: noda keputihan,tidak memudarkan warna cat mobil.</span></p>', 'CarCare Product', '', ''),
(4, '', 1, 0, '', '2011-09-13 16:21:26', '2011-09-13 16:24:18', 1, 1, 'default', '', '0.00', '0.00', '12.00', '12.00', 0, '0.0000', 'thumb_cef4b74a741f02a47943267937dc5567.jpg', 'cef4b74a741f02a47943267937dc5567.jpg', 'full_cef4b74a741f02a47943267937dc5567.jpg', 0, 0, 0.00, 0, 0, 4, '0.0000', 0, 2, 0, 'Home Care', '', 'Home Care', '<div><span style="font-size: 10pt; line-height: 115%;">JENIS PRODUK </span></div>\r\n<div style="margin-left: 21.3pt; text-indent: -18pt;"><span style="font-size: 10pt; line-height: 115%;">1.<span style="font: 7pt ''Times New Roman'';">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span style="font-size: 10pt; line-height: 115%;">SOFTENER PAKAIAN </span></span></span></div>\r\n<div style="margin-left: 21.3pt; text-indent: -18pt;"><span style="font-size: 10pt; line-height: 115%;">2.<span style="font: 7pt ''Times New Roman'';">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span style="font-size: 10pt; line-height: 115%;">SOFTENER ULTRA</span></span></span></div>\r\n<div style="margin-left: 21.3pt; text-indent: -18pt;"><span style="font-size: 10pt; line-height: 115%;">3.<span style="font: 7pt ''Times New Roman'';">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span style="font-size: 10pt; line-height: 115%;">DETERGENT CAIR </span></span></span></div>\r\n<div style="margin-left: 21.3pt; text-indent: -18pt;"><span style="font-size: 10pt; line-height: 115%;">4.<span style="font: 7pt ''Times New Roman'';">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span style="font-size: 10pt; line-height: 115%;">PELICIN PAKAIAN </span></span></span></div>\r\n<div style="margin-left: 21.3pt; text-indent: -18pt;"><span style="font-size: 10pt; line-height: 115%;">5.<span style="font: 7pt ''Times New Roman'';">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span style="font-size: 10pt; line-height: 115%;">HAND SOAP (SABUN CUCI TANGAN)</span></span></span></div>\r\n<div style="margin-left: 21.3pt; text-indent: -18pt;"><span style="font-size: 10pt; line-height: 115%;">6.<span style="font: 7pt ''Times New Roman'';">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span style="font-size: 10pt; line-height: 115%;">SABUN CUCI PIRING</span></span></span></div>\r\n<div style="margin-left: 21.3pt; text-indent: -18pt;"><span style="font-size: 10pt; line-height: 115%;">7.<span style="font: 7pt ''Times New Roman'';">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span style="font-size: 10pt; line-height: 115%;">SABUN CUCI PIRING EXTRA BUSA</span></span></span></div>\r\n<div style="margin-left: 21.3pt; text-indent: -18pt;"><span style="font-size: 10pt; line-height: 115%;">8.<span style="font: 7pt ''Times New Roman'';">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span style="font-size: 10pt; line-height: 115%;">PEMBERSIH LANTAI</span></span></span></div>\r\n<div style="margin-left: 21.3pt; text-indent: -18pt;"><span style="font-size: 10pt; line-height: 115%;">9.<span style="font: 7pt ''Times New Roman'';">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span style="font-size: 10pt; line-height: 115%;">KARBOL</span></span></span></div>\r\n<div style="margin-left: 21.3pt; text-indent: -18pt;"><span style="font-size: 10pt; line-height: 115%;">10.<span style="font: 7pt ''Times New Roman'';">&nbsp;&nbsp;&nbsp; <span style="font-size: 10pt; line-height: 115%;">PEMBERSIH KACA</span></span></span></div>\r\n<div style="margin-left: 21.3pt; text-indent: -18pt;"><span style="font-size: 10pt; line-height: 115%;">11.<span style="font: 7pt ''Times New Roman'';">&nbsp;&nbsp;&nbsp; <span style="font-size: 10pt; line-height: 115%;">SHAMPO 3 IN 1</span></span></span></div>\r\n<div style="margin-left: 21.3pt; text-indent: -18pt;"><span style="font-size: 10pt; line-height: 115%;">12.<span style="font: 7pt ''Times New Roman'';">&nbsp;&nbsp;&nbsp; <span style="font-size: 10pt; line-height: 115%;">SHAMPO 3 IN 1 ANTI KETOMBE</span></span></span></div>\r\n<div style="margin-left: 21.3pt; text-indent: -18pt;"><span style="font-size: 10pt; line-height: 115%;">13.<span style="font: 7pt ''Times New Roman'';">&nbsp;&nbsp;&nbsp; <span style="font-size: 10pt; line-height: 115%;">BODY FOAM (SABUN MANDI CAIR)</span></span></span></div>\r\n<div style="margin-left: 21.3pt; text-indent: -18pt;"><span style="font-size: 10pt; line-height: 115%;">14.<span style="font: 7pt ''Times New Roman'';">&nbsp;&nbsp;&nbsp; <span style="font-size: 10pt; line-height: 115%;">PARFUM SHOLAT NON AL KOHOL.</span></span></span></div>\r\n<div style="margin-left: 21.3pt; text-indent: -18pt; text-align: center;"></div>\r\n<table style="border-collapse: collapse; margin-left: auto; margin-right: auto;" border="1" cellpadding="0" cellspacing="0">\r\n<tbody>\r\n<tr>\r\n<td style="border: 1pt solid black; padding: 0cm 5.4pt; width: 27.9pt;" valign="top" width="37">\r\n<div style="text-align: justify;"><span style="font-size: 12pt;">No</span></div>\r\n</td>\r\n<td style="border-color: black black black -moz-use-text-color; border-style: solid solid solid none; border-width: 1pt 1pt 1pt medium; padding: 0cm 5.4pt; width: 220.5pt;" valign="top" width="294">\r\n<div style="text-align: justify;"><span style="font-size: 12pt;">Nama Produk</span></div>\r\n</td>\r\n<td style="border-color: black black black -moz-use-text-color; border-style: solid solid solid none; border-width: 1pt 1pt 1pt medium; padding: 0cm 5.4pt; width: 76.5pt;" valign="top" width="102">\r\n<div style="text-align: justify;"><span style="font-size: 12pt;">Kemasan</span></div>\r\n</td>\r\n<td style="border-color: black black black -moz-use-text-color; border-style: solid solid solid none; border-width: 1pt 1pt 1pt medium; padding: 0cm 5.4pt; width: 119.7pt;" valign="top" width="160">\r\n<div style="text-align: justify;"><span style="font-size: 12pt;">Izin DEPKES RI No.</span></div>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style="border-color: -moz-use-text-color black black; border-style: none solid solid; border-width: medium 1pt 1pt; padding: 0cm 5.4pt; width: 27.9pt;" valign="top" width="37">\r\n<div style="text-align: justify;"><span style="font-size: 12pt;">1</span></div>\r\n</td>\r\n<td style="border-color: -moz-use-text-color black black -moz-use-text-color; border-style: none solid solid none; border-width: medium 1pt 1pt medium; padding: 0cm 5.4pt; width: 220.5pt;" valign="top" width="294">\r\n<div style="text-align: justify;"><span style="font-size: 12pt;">Softener</span></div>\r\n<div style="text-align: justify;"><span style="font-size: 12pt;">Variant: Pink, Blue</span></div>\r\n</td>\r\n<td style="border-color: -moz-use-text-color black black -moz-use-text-color; border-style: none solid solid none; border-width: medium 1pt 1pt medium; padding: 0cm 5.4pt; width: 76.5pt;" valign="top" width="102">\r\n<div style="text-align: justify;"><span style="font-size: 12pt;">Botol 400 Ml</span></div>\r\n<div style="text-align: justify;"><span style="font-size: 12pt;">Jerigen 20 Ltr</span></div>\r\n<div style="text-align: justify;"><span style="font-size: 12pt;">Sachet 80 Ml</span></div>\r\n</td>\r\n<td style="border-color: -moz-use-text-color black black -moz-use-text-color; border-style: none solid solid none; border-width: medium 1pt 1pt medium; padding: 0cm 5.4pt; width: 119.7pt;" valign="top" width="160">\r\n<div style="text-align: justify;"><span style="font-size: 12pt;">PKD 20203600230</span></div>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style="border-color: -moz-use-text-color black black; border-style: none solid solid; border-width: medium 1pt 1pt; padding: 0cm 5.4pt; width: 27.9pt;" valign="top" width="37">\r\n<div style="text-align: justify;"><span style="font-size: 12pt;">2</span></div>\r\n</td>\r\n<td style="border-color: -moz-use-text-color black black -moz-use-text-color; border-style: none solid solid none; border-width: medium 1pt 1pt medium; padding: 0cm 5.4pt; width: 220.5pt;" valign="top" width="294">\r\n<div style="text-align: justify;"><span style="font-size: 12pt;">Softener Ultra</span></div>\r\n<div style="text-align: justify;"><span style="font-size: 12pt;">Variant: Orange, Green, Yellow</span></div>\r\n</td>\r\n<td style="border-color: -moz-use-text-color black black -moz-use-text-color; border-style: none solid solid none; border-width: medium 1pt 1pt medium; padding: 0cm 5.4pt; width: 76.5pt;" valign="top" width="102">\r\n<div style="text-align: justify;"><span style="font-size: 12pt;">Botol 400 Ml</span></div>\r\n<div style="text-align: justify;"><span style="font-size: 12pt;">Jerigen 20 Ltr</span></div>\r\n<div style="text-align: justify;"><span style="font-size: 12pt;">Sachet 80 Ml </span></div>\r\n</td>\r\n<td style="border-color: -moz-use-text-color black black -moz-use-text-color; border-style: none solid solid none; border-width: medium 1pt 1pt medium; padding: 0cm 5.4pt; width: 119.7pt;" valign="top" width="160">\r\n<div style="text-align: justify;"><span style="font-size: 12pt;">PKD 20203600230</span></div>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style="border-color: -moz-use-text-color black black; border-style: none solid solid; border-width: medium 1pt 1pt; padding: 0cm 5.4pt; width: 27.9pt;" valign="top" width="37">\r\n<div style="text-align: justify;"><span style="font-size: 12pt;">3</span></div>\r\n</td>\r\n<td style="border-color: -moz-use-text-color black black -moz-use-text-color; border-style: none solid solid none; border-width: medium 1pt 1pt medium; padding: 0cm 5.4pt; width: 220.5pt;" valign="top" width="294">\r\n<div style="text-align: justify;"><span style="font-size: 12pt;">Deterjen Cair</span></div>\r\n</td>\r\n<td style="border-color: -moz-use-text-color black black -moz-use-text-color; border-style: none solid solid none; border-width: medium 1pt 1pt medium; padding: 0cm 5.4pt; width: 76.5pt;" valign="top" width="102">\r\n<div style="text-align: justify;"><span style="font-size: 12pt;">Botol 400 Ml</span></div>\r\n<div style="text-align: justify;"><span style="font-size: 12pt;">Jerigen 20 Ltr</span></div>\r\n<div style="text-align: justify;"><span style="font-size: 12pt;">Sachet 80 Ml </span></div>\r\n</td>\r\n<td style="border-color: -moz-use-text-color black black -moz-use-text-color; border-style: none solid solid none; border-width: medium 1pt 1pt medium; padding: 0cm 5.4pt; width: 119.7pt;" valign="top" width="160">\r\n<div style="text-align: justify;"><span style="font-size: 12pt;">PKD 20202600229</span></div>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style="border-color: -moz-use-text-color black black; border-style: none solid solid; border-width: medium 1pt 1pt; padding: 0cm 5.4pt; width: 27.9pt;" valign="top" width="37">\r\n<div style="text-align: justify;"><span style="font-size: 12pt;">4</span></div>\r\n</td>\r\n<td style="border-color: -moz-use-text-color black black -moz-use-text-color; border-style: none solid solid none; border-width: medium 1pt 1pt medium; padding: 0cm 5.4pt; width: 220.5pt;" valign="top" width="294">\r\n<div style="text-align: justify;"><span style="font-size: 12pt;">Pelicin Pakaian</span></div>\r\n</td>\r\n<td style="border-color: -moz-use-text-color black black -moz-use-text-color; border-style: none solid solid none; border-width: medium 1pt 1pt medium; padding: 0cm 5.4pt; width: 76.5pt;" valign="top" width="102">\r\n<div style="text-align: justify;"><span style="font-size: 12pt;">Botol 400 Ml</span></div>\r\n<div style="text-align: justify;"><span style="font-size: 12pt;">Jerigen 20 Ltr</span></div>\r\n<div style="text-align: justify;"><span style="font-size: 12pt;">Sachet 80 Ml </span></div>\r\n</td>\r\n<td style="border-color: -moz-use-text-color black black -moz-use-text-color; border-style: none solid solid none; border-width: medium 1pt 1pt medium; padding: 0cm 5.4pt; width: 119.7pt;" valign="top" width="160">\r\n<div style="text-align: justify;"><span style="font-size: 12pt;">PKD 20203600224</span></div>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style="border-color: -moz-use-text-color black black; border-style: none solid solid; border-width: medium 1pt 1pt; padding: 0cm 5.4pt; width: 27.9pt;" valign="top" width="37">\r\n<div style="text-align: justify;"><span style="font-size: 12pt;">5</span></div>\r\n</td>\r\n<td style="border-color: -moz-use-text-color black black -moz-use-text-color; border-style: none solid solid none; border-width: medium 1pt 1pt medium; padding: 0cm 5.4pt; width: 220.5pt;" valign="top" width="294">\r\n<div style="text-align: justify;"><span style="font-size: 12pt;">Hand Soap (Sabun cuci tangan)</span></div>\r\n</td>\r\n<td style="border-color: -moz-use-text-color black black -moz-use-text-color; border-style: none solid solid none; border-width: medium 1pt 1pt medium; padding: 0cm 5.4pt; width: 76.5pt;" valign="top" width="102">\r\n<div style="text-align: justify;"><span style="font-size: 12pt;">Botol 400 Ml</span></div>\r\n<div style="text-align: justify;"><span style="font-size: 12pt;">Jerigen 20 Ltr</span></div>\r\n<div style="text-align: justify;"><span style="font-size: 12pt;">Sachet 80 Ml </span></div>\r\n</td>\r\n<td style="border-color: -moz-use-text-color black black -moz-use-text-color; border-style: none solid solid none; border-width: medium 1pt 1pt medium; padding: 0cm 5.4pt; width: 119.7pt;" valign="top" width="160">\r\n<div style="text-align: justify;"><span style="font-size: 12pt;">PKD 20206600231</span></div>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style="border-color: -moz-use-text-color black black; border-style: none solid solid; border-width: medium 1pt 1pt; padding: 0cm 5.4pt; width: 27.9pt;" valign="top" width="37">\r\n<div style="text-align: justify;"><span style="font-size: 12pt;">6</span></div>\r\n</td>\r\n<td style="border-color: -moz-use-text-color black black -moz-use-text-color; border-style: none solid solid none; border-width: medium 1pt 1pt medium; padding: 0cm 5.4pt; width: 220.5pt;" valign="top" width="294">\r\n<div style="text-align: justify;"><span style="font-size: 12pt;">Dishwashing&nbsp; (Sabun Cuci Piring)</span></div>\r\n</td>\r\n<td style="border-color: -moz-use-text-color black black -moz-use-text-color; border-style: none solid solid none; border-width: medium 1pt 1pt medium; padding: 0cm 5.4pt; width: 76.5pt;" valign="top" width="102">\r\n<div style="text-align: justify;"><span style="font-size: 12pt;">Botol 400 Ml</span></div>\r\n<div style="text-align: justify;"><span style="font-size: 12pt;">Jerigen 20 Ltr</span></div>\r\n<div style="text-align: justify;"><span style="font-size: 12pt;">Sachet 80 Ml </span></div>\r\n</td>\r\n<td style="border-color: -moz-use-text-color black black -moz-use-text-color; border-style: none solid solid none; border-width: medium 1pt 1pt medium; padding: 0cm 5.4pt; width: 119.7pt;" valign="top" width="160">\r\n<div style="text-align: justify;"><span style="font-size: 12pt;">PKD 203016002324</span></div>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style="border-color: -moz-use-text-color black black; border-style: none solid solid; border-width: medium 1pt 1pt; padding: 0cm 5.4pt; width: 27.9pt;" valign="top" width="37">\r\n<div style="text-align: justify;"><span style="font-size: 12pt;">7</span></div>\r\n</td>\r\n<td style="border-color: -moz-use-text-color black black -moz-use-text-color; border-style: none solid solid none; border-width: medium 1pt 1pt medium; padding: 0cm 5.4pt; width: 220.5pt;" valign="top" width="294">\r\n<div style="text-align: justify;"><span style="font-size: 12pt;">Dishwashing Extra Busa</span></div>\r\n</td>\r\n<td style="border-color: -moz-use-text-color black black -moz-use-text-color; border-style: none solid solid none; border-width: medium 1pt 1pt medium; padding: 0cm 5.4pt; width: 76.5pt;" valign="top" width="102">\r\n<div style="text-align: justify;"><span style="font-size: 12pt;">Botol 400 Ml</span></div>\r\n<div style="text-align: justify;"><span style="font-size: 12pt;">Jerigen 20 Ltr</span></div>\r\n<div style="text-align: justify;"><span style="font-size: 12pt;">Sachet 80 Ml </span></div>\r\n</td>\r\n<td style="border-color: -moz-use-text-color black black -moz-use-text-color; border-style: none solid solid none; border-width: medium 1pt 1pt medium; padding: 0cm 5.4pt; width: 119.7pt;" valign="top" width="160">\r\n<div style="text-align: justify;"><span style="font-size: 12pt;">PKD 203016002324</span></div>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style="border-color: -moz-use-text-color black black; border-style: none solid solid; border-width: medium 1pt 1pt; padding: 0cm 5.4pt; width: 27.9pt;" valign="top" width="37">\r\n<div style="text-align: justify;"><span style="font-size: 12pt;">8</span></div>\r\n</td>\r\n<td style="border-color: -moz-use-text-color black black -moz-use-text-color; border-style: none solid solid none; border-width: medium 1pt 1pt medium; padding: 0cm 5.4pt; width: 220.5pt;" valign="top" width="294">\r\n<div style="text-align: justify;"><span style="font-size: 12pt;">Floor Cleaner (Pembersih Lantai)</span></div>\r\n<div style="text-align: justify;"><span style="font-size: 12pt;">Variant: blue, orange, yellow, green &amp;&nbsp; red</span></div>\r\n</td>\r\n<td style="border-color: -moz-use-text-color black black -moz-use-text-color; border-style: none solid solid none; border-width: medium 1pt 1pt medium; padding: 0cm 5.4pt; width: 76.5pt;" valign="top" width="102">\r\n<div style="text-align: justify;"><span style="font-size: 12pt;">Botol 400 Ml</span></div>\r\n<div style="text-align: justify;"><span style="font-size: 12pt;">Jerigen 20 Ltr</span></div>\r\n<div style="text-align: justify;"><span style="font-size: 12pt;">Sachet 80 Ml </span></div>\r\n</td>\r\n<td style="border-color: -moz-use-text-color black black -moz-use-text-color; border-style: none solid solid none; border-width: medium 1pt 1pt medium; padding: 0cm 5.4pt; width: 119.7pt;" valign="top" width="160">\r\n<div style="text-align: justify;"><span style="font-size: 12pt;">PKD 20303600226</span></div>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style="border-color: -moz-use-text-color black black; border-style: none solid solid; border-width: medium 1pt 1pt; padding: 0cm 5.4pt; width: 27.9pt;" valign="top" width="37">\r\n<div style="text-align: justify;"><span style="font-size: 12pt;">9</span></div>\r\n</td>\r\n<td style="border-color: -moz-use-text-color black black -moz-use-text-color; border-style: none solid solid none; border-width: medium 1pt 1pt medium; padding: 0cm 5.4pt; width: 220.5pt;" valign="top" width="294">\r\n<div style="text-align: justify;"><span style="font-size: 12pt;">Karbol</span></div>\r\n</td>\r\n<td style="border-color: -moz-use-text-color black black -moz-use-text-color; border-style: none solid solid none; border-width: medium 1pt 1pt medium; padding: 0cm 5.4pt; width: 76.5pt;" valign="top" width="102">\r\n<div style="text-align: justify;"><span style="font-size: 12pt;">Botol 400 Ml</span></div>\r\n<div style="text-align: justify;"><span style="font-size: 12pt;">Jerigen 20 Ltr</span></div>\r\n<div style="text-align: justify;"><span style="font-size: 12pt;">Sachet 80 Ml </span></div>\r\n</td>\r\n<td style="border-color: -moz-use-text-color black black -moz-use-text-color; border-style: none solid solid none; border-width: medium 1pt 1pt medium; padding: 0cm 5.4pt; width: 119.7pt;" valign="top" width="160">\r\n<div style="text-align: justify;"><span style="font-size: 12pt;">PKD 20502600228</span></div>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style="border-color: -moz-use-text-color black black; border-style: none solid solid; border-width: medium 1pt 1pt; padding: 0cm 5.4pt; width: 27.9pt;" valign="top" width="37">\r\n<div style="text-align: justify;"><span style="font-size: 12pt;">10</span></div>\r\n</td>\r\n<td style="border-color: -moz-use-text-color black black -moz-use-text-color; border-style: none solid solid none; border-width: medium 1pt 1pt medium; padding: 0cm 5.4pt; width: 220.5pt;" valign="top" width="294">\r\n<div style="text-align: justify;"><span style="font-size: 12pt;">Pembersih Kaca</span></div>\r\n</td>\r\n<td style="border-color: -moz-use-text-color black black -moz-use-text-color; border-style: none solid solid none; border-width: medium 1pt 1pt medium; padding: 0cm 5.4pt; width: 76.5pt;" valign="top" width="102">\r\n<div style="text-align: justify;"><span style="font-size: 12pt;">Botol 400 Ml</span></div>\r\n<div style="text-align: justify;"><span style="font-size: 12pt;">Jerigen 20 Ltr</span></div>\r\n<div style="text-align: justify;"><span style="font-size: 12pt;">Sachet 80 Ml </span></div>\r\n</td>\r\n<td style="border-color: -moz-use-text-color black black -moz-use-text-color; border-style: none solid solid none; border-width: medium 1pt 1pt medium; padding: 0cm 5.4pt; width: 119.7pt;" valign="top" width="160">\r\n<div style="text-align: justify;"><span style="font-size: 12pt;">PKD 20302600233</span></div>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style="border-color: -moz-use-text-color black black; border-style: none solid solid; border-width: medium 1pt 1pt; padding: 0cm 5.4pt; width: 27.9pt;" valign="top" width="37">\r\n<div style="text-align: justify;"><span style="font-size: 12pt;">11</span></div>\r\n</td>\r\n<td style="border-color: -moz-use-text-color black black -moz-use-text-color; border-style: none solid solid none; border-width: medium 1pt 1pt medium; padding: 0cm 5.4pt; width: 220.5pt;" valign="top" width="294">\r\n<div style="text-align: justify;"><span style="font-size: 12pt;">Shampo 2 in 1</span></div>\r\n</td>\r\n<td style="border-color: -moz-use-text-color black black -moz-use-text-color; border-style: none solid solid none; border-width: medium 1pt 1pt medium; padding: 0cm 5.4pt; width: 76.5pt;" valign="top" width="102">\r\n<div style="text-align: justify;"><span style="font-size: 12pt;">Botol 400 Ml</span></div>\r\n<div style="text-align: justify;"><span style="font-size: 12pt;">Jerigen 20 Ltr</span></div>\r\n<div style="text-align: justify;"><span style="font-size: 12pt;">Sachet 80 Ml </span></div>\r\n</td>\r\n<td style="border-color: -moz-use-text-color black black -moz-use-text-color; border-style: none solid solid none; border-width: medium 1pt 1pt medium; padding: 0cm 5.4pt; width: 119.7pt;" valign="top" width="160">\r\n<div style="text-align: justify;"></div>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style="border-color: -moz-use-text-color black black; border-style: none solid solid; border-width: medium 1pt 1pt; padding: 0cm 5.4pt; width: 27.9pt;" valign="top" width="37">\r\n<div style="text-align: justify;"><span style="font-size: 12pt;">12</span></div>\r\n</td>\r\n<td style="border-color: -moz-use-text-color black black -moz-use-text-color; border-style: none solid solid none; border-width: medium 1pt 1pt medium; padding: 0cm 5.4pt; width: 220.5pt;" valign="top" width="294">\r\n<div style="text-align: justify;"><span style="font-size: 12pt;">Shampo 2 in 1 + Anti Ketombe</span></div>\r\n</td>\r\n<td style="border-color: -moz-use-text-color black black -moz-use-text-color; border-style: none solid solid none; border-width: medium 1pt 1pt medium; padding: 0cm 5.4pt; width: 76.5pt;" valign="top" width="102">\r\n<div style="text-align: justify;"><span style="font-size: 12pt;">Botol 400 Ml</span></div>\r\n<div style="text-align: justify;"><span style="font-size: 12pt;">Jerigen 20 Ltr</span></div>\r\n<div style="text-align: justify;"><span style="font-size: 12pt;">Sachet 80 Ml</span></div>\r\n</td>\r\n<td style="border-color: -moz-use-text-color black black -moz-use-text-color; border-style: none solid solid none; border-width: medium 1pt 1pt medium; padding: 0cm 5.4pt; width: 119.7pt;" valign="top" width="160">\r\n<div style="text-align: justify;"></div>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style="border-color: -moz-use-text-color black black; border-style: none solid solid; border-width: medium 1pt 1pt; padding: 0cm 5.4pt; width: 27.9pt;" valign="top" width="37">\r\n<div style="text-align: justify;"><span style="font-size: 12pt;">13</span></div>\r\n</td>\r\n<td style="border-color: -moz-use-text-color black black -moz-use-text-color; border-style: none solid solid none; border-width: medium 1pt 1pt medium; padding: 0cm 5.4pt; width: 220.5pt;" valign="top" width="294">\r\n<div style="text-align: justify;"><span style="font-size: 12pt;">Body Foam</span></div>\r\n<div style="text-align: justify;"><span style="font-size: 12pt;">Variant: Misty blue &amp; Green Tea</span></div>\r\n</td>\r\n<td style="border-color: -moz-use-text-color black black -moz-use-text-color; border-style: none solid solid none; border-width: medium 1pt 1pt medium; padding: 0cm 5.4pt; width: 76.5pt;" valign="top" width="102">\r\n<div style="text-align: justify;"><span style="font-size: 12pt;">Botol 400 Ml</span></div>\r\n<div style="text-align: justify;"><span style="font-size: 12pt;">Jerigen 20 Ltr</span></div>\r\n<div style="text-align: justify;"><span style="font-size: 12pt;">Sachet 80 Ml</span></div>\r\n</td>\r\n<td style="border-color: -moz-use-text-color black black -moz-use-text-color; border-style: none solid solid none; border-width: medium 1pt 1pt medium; padding: 0cm 5.4pt; width: 119.7pt;" valign="top" width="160">\r\n<div style="text-align: justify;"></div>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style="border-color: -moz-use-text-color black black; border-style: none solid solid; border-width: medium 1pt 1pt; padding: 0cm 5.4pt; width: 27.9pt;" valign="top" width="37">\r\n<div style="text-align: justify;"><span style="font-size: 12pt;">14</span></div>\r\n</td>\r\n<td style="border-color: -moz-use-text-color black black -moz-use-text-color; border-style: none solid solid none; border-width: medium 1pt 1pt medium; padding: 0cm 5.4pt; width: 220.5pt;" valign="top" width="294">\r\n<div style="text-align: justify;"><span style="font-size: 12pt;">Minyak wangi untuk sholat non alcohol Variant : Jasmine, Agarwood, sandalwood</span></div>\r\n</td>\r\n<td style="border-color: -moz-use-text-color black black -moz-use-text-color; border-style: none solid solid none; border-width: medium 1pt 1pt medium; padding: 0cm 5.4pt; width: 76.5pt;" valign="top" width="102">\r\n<div style="text-align: justify;"><span style="font-size: 12pt;">Botol 10 Ml</span></div>\r\n</td>\r\n<td style="border-color: -moz-use-text-color black black -moz-use-text-color; border-style: none solid solid none; border-width: medium 1pt 1pt medium; padding: 0cm 5.4pt; width: 119.7pt;" valign="top" width="160">\r\n<div style="text-align: justify;"></div>\r\n<div style="text-align: justify;"></div>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>', 'Home Care', '', ''),
(5, '', 1, 0, '', '2011-09-13 23:02:51', '2011-09-13 23:02:51', 1, 1, 'default', '', '0.00', '0.00', '0.50', '0.50', 0, '0.0000', 'thumb_ed4aa6f0e5b25a05b19ba1c3b563b16d.jpg', 'ed4aa6f0e5b25a05b19ba1c3b563b16d.jpg', 'full_ed4aa6f0e5b25a05b19ba1c3b563b16d.jpg', 0, 0, 0.00, 0, 0, 1, '0.0000', 0, 2, 0, 'MELILEA GREENFIELD ORGANIC', '', '', '', 'Suplemen Kesehatan Organik', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `jos_jshopping_products_attr`
--

CREATE TABLE IF NOT EXISTS `jos_jshopping_products_attr` (
  `product_attr_id` int(11) NOT NULL auto_increment,
  `product_id` int(11) NOT NULL,
  `buy_price` decimal(12,2) NOT NULL,
  `price` decimal(12,2) NOT NULL,
  `count` int(11) NOT NULL,
  `ean` varchar(100) NOT NULL,
  `weight` decimal(12,4) NOT NULL,
  `weight_volume_units` decimal(12,2) NOT NULL,
  PRIMARY KEY  (`product_attr_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `jos_jshopping_products_attr2`
--

CREATE TABLE IF NOT EXISTS `jos_jshopping_products_attr2` (
  `id` int(11) NOT NULL auto_increment,
  `product_id` int(11) NOT NULL,
  `attr_id` int(11) NOT NULL,
  `attr_value_id` int(11) NOT NULL,
  `price_mod` char(1) NOT NULL,
  `addprice` decimal(12,2) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `jos_jshopping_products_extra_fields`
--

CREATE TABLE IF NOT EXISTS `jos_jshopping_products_extra_fields` (
  `id` int(11) NOT NULL auto_increment,
  `allcats` tinyint(1) NOT NULL,
  `cats` text NOT NULL,
  `ordering` int(6) NOT NULL,
  `name_en-GB` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `jos_jshopping_products_extra_field_values`
--

CREATE TABLE IF NOT EXISTS `jos_jshopping_products_extra_field_values` (
  `id` int(11) NOT NULL auto_increment,
  `field_id` int(11) NOT NULL,
  `ordering` int(6) NOT NULL,
  `name_en-GB` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `jos_jshopping_products_files`
--

CREATE TABLE IF NOT EXISTS `jos_jshopping_products_files` (
  `id` int(11) NOT NULL auto_increment,
  `product_id` int(11) NOT NULL,
  `demo` varchar(255) NOT NULL,
  `demo_descr` varchar(255) NOT NULL,
  `file` varchar(255) NOT NULL,
  `file_descr` varchar(255) NOT NULL,
  `ordering` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `jos_jshopping_products_free_attr`
--

CREATE TABLE IF NOT EXISTS `jos_jshopping_products_free_attr` (
  `id` int(11) NOT NULL auto_increment,
  `product_id` int(11) NOT NULL,
  `attr_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `product_id` (`product_id`),
  KEY `attr_id` (`attr_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `jos_jshopping_products_images`
--

CREATE TABLE IF NOT EXISTS `jos_jshopping_products_images` (
  `image_id` int(11) NOT NULL auto_increment,
  `product_id` int(11) NOT NULL default '0',
  `image_thumb` varchar(255) NOT NULL default '',
  `image_name` varchar(255) NOT NULL default '',
  `image_full` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`image_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `jos_jshopping_products_images`
--

INSERT INTO `jos_jshopping_products_images` (`image_id`, `product_id`, `image_thumb`, `image_name`, `image_full`) VALUES
(1, 1, 'thumb_95e9f412e2f7d8a3c3c96c445e980abb.jpg', '95e9f412e2f7d8a3c3c96c445e980abb.jpg', 'full_95e9f412e2f7d8a3c3c96c445e980abb.jpg'),
(2, 1, 'thumb_853f000a3a8da2cba6b0b142fb140d9d.jpg', '853f000a3a8da2cba6b0b142fb140d9d.jpg', 'full_853f000a3a8da2cba6b0b142fb140d9d.jpg'),
(3, 2, 'thumb_8307874f275317b87f1ca54ae2d1e42a.png', '8307874f275317b87f1ca54ae2d1e42a.png', 'full_8307874f275317b87f1ca54ae2d1e42a.png'),
(4, 2, 'thumb_4c1e966394beb1f3416b09b915b7667a.jpeg', '4c1e966394beb1f3416b09b915b7667a.jpeg', 'full_4c1e966394beb1f3416b09b915b7667a.jpeg'),
(5, 1, 'thumb_2d0c424cf4e0962e7d8d6fd557d256fd.jpg', '2d0c424cf4e0962e7d8d6fd557d256fd.jpg', 'full_2d0c424cf4e0962e7d8d6fd557d256fd.jpg'),
(6, 1, 'thumb_396a2664c3b817758355194521a78630.png', '396a2664c3b817758355194521a78630.png', 'full_396a2664c3b817758355194521a78630.png'),
(7, 3, 'thumb_15d6741c26c0d748abe6692ec001a7a3.jpg', '15d6741c26c0d748abe6692ec001a7a3.jpg', 'full_15d6741c26c0d748abe6692ec001a7a3.jpg'),
(8, 3, 'thumb_01f67f0e097cdc5e78b194a2d47bf9bf.jpg', '01f67f0e097cdc5e78b194a2d47bf9bf.jpg', 'full_01f67f0e097cdc5e78b194a2d47bf9bf.jpg'),
(9, 3, 'thumb_783709fd1746ee763c68ed3b5a091662.jpg', '783709fd1746ee763c68ed3b5a091662.jpg', 'full_783709fd1746ee763c68ed3b5a091662.jpg'),
(10, 3, 'thumb_1063e6583b0fdf9b802caa39fcc770f7.jpg', '1063e6583b0fdf9b802caa39fcc770f7.jpg', 'full_1063e6583b0fdf9b802caa39fcc770f7.jpg'),
(11, 4, 'thumb_cef4b74a741f02a47943267937dc5567.jpg', 'cef4b74a741f02a47943267937dc5567.jpg', 'full_cef4b74a741f02a47943267937dc5567.jpg'),
(12, 4, 'thumb_86f54d1264059201ce76fc03c40c7a85.jpg', '86f54d1264059201ce76fc03c40c7a85.jpg', 'full_86f54d1264059201ce76fc03c40c7a85.jpg'),
(13, 4, 'thumb_d0c3500763321db17d9c484e32b0c5c0.jpg', 'd0c3500763321db17d9c484e32b0c5c0.jpg', 'full_d0c3500763321db17d9c484e32b0c5c0.jpg'),
(14, 5, 'thumb_ed4aa6f0e5b25a05b19ba1c3b563b16d.jpg', 'ed4aa6f0e5b25a05b19ba1c3b563b16d.jpg', 'full_ed4aa6f0e5b25a05b19ba1c3b563b16d.jpg'),
(15, 5, 'thumb_d14d17524bbd40431f7b5358713a953a.jpg', 'd14d17524bbd40431f7b5358713a953a.jpg', 'full_d14d17524bbd40431f7b5358713a953a.jpg'),
(16, 5, 'thumb_d11049dbdf9bd9b43fe8f69ed72bf9e8.jpg', 'd11049dbdf9bd9b43fe8f69ed72bf9e8.jpg', 'full_d11049dbdf9bd9b43fe8f69ed72bf9e8.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `jos_jshopping_products_prices`
--

CREATE TABLE IF NOT EXISTS `jos_jshopping_products_prices` (
  `price_id` int(11) NOT NULL auto_increment,
  `product_id` int(11) NOT NULL,
  `discount` decimal(16,6) NOT NULL,
  `product_quantity_start` int(11) NOT NULL,
  `product_quantity_finish` int(11) NOT NULL,
  PRIMARY KEY  (`price_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `jos_jshopping_products_relations`
--

CREATE TABLE IF NOT EXISTS `jos_jshopping_products_relations` (
  `product_id` int(11) NOT NULL default '0',
  `product_related_id` int(11) NOT NULL default '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jos_jshopping_products_reviews`
--

CREATE TABLE IF NOT EXISTS `jos_jshopping_products_reviews` (
  `review_id` int(11) NOT NULL auto_increment,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `time` date NOT NULL,
  `review` text NOT NULL,
  `mark` int(11) NOT NULL,
  `publish` tinyint(1) NOT NULL,
  `ip` varchar(20) NOT NULL,
  PRIMARY KEY  (`review_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `jos_jshopping_products_to_categories`
--

CREATE TABLE IF NOT EXISTS `jos_jshopping_products_to_categories` (
  `product_id` int(11) NOT NULL default '0',
  `category_id` int(11) NOT NULL default '0',
  `product_ordering` int(11) NOT NULL default '0',
  PRIMARY KEY  (`product_id`,`category_id`),
  KEY `category_id` (`category_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_jshopping_products_to_categories`
--

INSERT INTO `jos_jshopping_products_to_categories` (`product_id`, `category_id`, `product_ordering`) VALUES
(1, 1, 1),
(3, 3, 1),
(2, 2, 1),
(4, 3, 2),
(5, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `jos_jshopping_products_videos`
--

CREATE TABLE IF NOT EXISTS `jos_jshopping_products_videos` (
  `video_id` int(11) NOT NULL auto_increment,
  `product_id` int(11) NOT NULL default '0',
  `video_name` varchar(255) NOT NULL default '',
  `video_preview` varchar(255) NOT NULL,
  PRIMARY KEY  (`video_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `jos_jshopping_product_labels`
--

CREATE TABLE IF NOT EXISTS `jos_jshopping_product_labels` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `jos_jshopping_product_labels`
--

INSERT INTO `jos_jshopping_product_labels` (`id`, `name`, `image`) VALUES
(1, 'New', 'new.png'),
(2, 'Sale', 'sale.png');

-- --------------------------------------------------------

--
-- Table structure for table `jos_jshopping_shipping_method`
--

CREATE TABLE IF NOT EXISTS `jos_jshopping_shipping_method` (
  `shipping_id` int(11) NOT NULL auto_increment,
  `name_en-GB` varchar(100) NOT NULL default '',
  `description_en-GB` text NOT NULL,
  `name_de-DE` varchar(100) NOT NULL default '',
  `description_de-DE` text NOT NULL,
  `shipping_publish` tinyint(1) NOT NULL default '0',
  `shipping_ordering` int(11) NOT NULL default '0',
  PRIMARY KEY  (`shipping_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `jos_jshopping_shipping_method`
--

INSERT INTO `jos_jshopping_shipping_method` (`shipping_id`, `name_en-GB`, `description_en-GB`, `name_de-DE`, `description_de-DE`, `shipping_publish`, `shipping_ordering`) VALUES
(1, 'Standard', '', 'Standardversand', '', 1, 1),
(2, 'Express', '', 'Express', '', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `jos_jshopping_shipping_method_price`
--

CREATE TABLE IF NOT EXISTS `jos_jshopping_shipping_method_price` (
  `sh_pr_method_id` int(11) NOT NULL auto_increment,
  `shipping_method_id` int(11) NOT NULL,
  `shipping_tax_id` int(11) NOT NULL default '0',
  `shipping_stand_price` decimal(12,2) NOT NULL,
  PRIMARY KEY  (`sh_pr_method_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `jos_jshopping_shipping_method_price`
--

INSERT INTO `jos_jshopping_shipping_method_price` (`sh_pr_method_id`, `shipping_method_id`, `shipping_tax_id`, `shipping_stand_price`) VALUES
(1, 1, 1, '10.00'),
(2, 2, 1, '25.00');

-- --------------------------------------------------------

--
-- Table structure for table `jos_jshopping_shipping_method_price_countries`
--

CREATE TABLE IF NOT EXISTS `jos_jshopping_shipping_method_price_countries` (
  `sh_method_country_id` int(11) NOT NULL auto_increment,
  `country_id` int(11) NOT NULL,
  `sh_pr_method_id` int(11) NOT NULL,
  PRIMARY KEY  (`sh_method_country_id`),
  KEY `country_id` (`country_id`),
  KEY `sh_pr_method_id` (`sh_pr_method_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=479 ;

--
-- Dumping data for table `jos_jshopping_shipping_method_price_countries`
--

INSERT INTO `jos_jshopping_shipping_method_price_countries` (`sh_method_country_id`, `country_id`, `sh_pr_method_id`) VALUES
(1, 239, 1),
(2, 238, 1),
(3, 237, 1),
(4, 236, 1),
(5, 235, 1),
(6, 234, 1),
(7, 233, 1),
(8, 232, 1),
(9, 231, 1),
(10, 230, 1),
(11, 229, 1),
(12, 228, 1),
(13, 227, 1),
(14, 226, 1),
(15, 225, 1),
(16, 224, 1),
(17, 223, 1),
(18, 222, 1),
(19, 221, 1),
(20, 220, 1),
(21, 219, 1),
(22, 218, 1),
(23, 217, 1),
(24, 216, 1),
(25, 215, 1),
(26, 214, 1),
(27, 213, 1),
(28, 212, 1),
(29, 211, 1),
(30, 210, 1),
(31, 209, 1),
(32, 208, 1),
(33, 207, 1),
(34, 206, 1),
(35, 205, 1),
(36, 204, 1),
(37, 203, 1),
(38, 202, 1),
(39, 201, 1),
(40, 200, 1),
(41, 199, 1),
(42, 198, 1),
(43, 197, 1),
(44, 196, 1),
(45, 195, 1),
(46, 194, 1),
(47, 193, 1),
(48, 192, 1),
(49, 191, 1),
(50, 190, 1),
(51, 189, 1),
(52, 188, 1),
(53, 187, 1),
(54, 186, 1),
(55, 185, 1),
(56, 184, 1),
(57, 183, 1),
(58, 182, 1),
(59, 181, 1),
(60, 180, 1),
(61, 179, 1),
(62, 178, 1),
(63, 177, 1),
(64, 176, 1),
(65, 175, 1),
(66, 174, 1),
(67, 173, 1),
(68, 172, 1),
(69, 171, 1),
(70, 170, 1),
(71, 169, 1),
(72, 168, 1),
(73, 167, 1),
(74, 166, 1),
(75, 165, 1),
(76, 164, 1),
(77, 163, 1),
(78, 162, 1),
(79, 161, 1),
(80, 160, 1),
(81, 159, 1),
(82, 158, 1),
(83, 157, 1),
(84, 156, 1),
(85, 155, 1),
(86, 154, 1),
(87, 153, 1),
(88, 152, 1),
(89, 151, 1),
(90, 150, 1),
(91, 149, 1),
(92, 148, 1),
(93, 147, 1),
(94, 146, 1),
(95, 145, 1),
(96, 144, 1),
(97, 143, 1),
(98, 142, 1),
(99, 141, 1),
(100, 140, 1),
(101, 139, 1),
(102, 138, 1),
(103, 137, 1),
(104, 136, 1),
(105, 135, 1),
(106, 134, 1),
(107, 133, 1),
(108, 132, 1),
(109, 131, 1),
(110, 130, 1),
(111, 129, 1),
(112, 128, 1),
(113, 127, 1),
(114, 126, 1),
(115, 125, 1),
(116, 124, 1),
(117, 123, 1),
(118, 122, 1),
(119, 121, 1),
(120, 120, 1),
(121, 119, 1),
(122, 118, 1),
(123, 117, 1),
(124, 116, 1),
(125, 115, 1),
(126, 114, 1),
(127, 113, 1),
(128, 112, 1),
(129, 111, 1),
(130, 110, 1),
(131, 109, 1),
(132, 108, 1),
(133, 107, 1),
(134, 106, 1),
(135, 105, 1),
(136, 104, 1),
(137, 103, 1),
(138, 102, 1),
(139, 101, 1),
(140, 100, 1),
(141, 99, 1),
(142, 98, 1),
(143, 97, 1),
(144, 96, 1),
(145, 95, 1),
(146, 94, 1),
(147, 93, 1),
(148, 92, 1),
(149, 91, 1),
(150, 90, 1),
(151, 89, 1),
(152, 88, 1),
(153, 87, 1),
(154, 86, 1),
(155, 85, 1),
(156, 84, 1),
(157, 83, 1),
(158, 82, 1),
(159, 81, 1),
(160, 80, 1),
(161, 79, 1),
(162, 78, 1),
(163, 77, 1),
(164, 76, 1),
(165, 75, 1),
(166, 74, 1),
(167, 73, 1),
(168, 72, 1),
(169, 71, 1),
(170, 70, 1),
(171, 69, 1),
(172, 68, 1),
(173, 67, 1),
(174, 66, 1),
(175, 65, 1),
(176, 64, 1),
(177, 63, 1),
(178, 62, 1),
(179, 61, 1),
(180, 60, 1),
(181, 59, 1),
(182, 58, 1),
(183, 57, 1),
(184, 56, 1),
(185, 55, 1),
(186, 54, 1),
(187, 53, 1),
(188, 52, 1),
(189, 51, 1),
(190, 50, 1),
(191, 49, 1),
(192, 48, 1),
(193, 47, 1),
(194, 46, 1),
(195, 45, 1),
(196, 44, 1),
(197, 43, 1),
(198, 42, 1),
(199, 41, 1),
(200, 40, 1),
(201, 39, 1),
(202, 38, 1),
(203, 37, 1),
(204, 36, 1),
(205, 35, 1),
(206, 34, 1),
(207, 33, 1),
(208, 32, 1),
(209, 31, 1),
(210, 30, 1),
(211, 29, 1),
(212, 28, 1),
(213, 27, 1),
(214, 26, 1),
(215, 25, 1),
(216, 24, 1),
(217, 23, 1),
(218, 22, 1),
(219, 21, 1),
(220, 20, 1),
(221, 19, 1),
(222, 18, 1),
(223, 17, 1),
(224, 16, 1),
(225, 15, 1),
(226, 14, 1),
(227, 13, 1),
(228, 12, 1),
(229, 11, 1),
(230, 10, 1),
(231, 9, 1),
(232, 8, 1),
(233, 7, 1),
(234, 6, 1),
(235, 5, 1),
(236, 4, 1),
(237, 3, 1),
(238, 2, 1),
(239, 1, 1),
(240, 239, 2),
(241, 238, 2),
(242, 237, 2),
(243, 236, 2),
(244, 235, 2),
(245, 234, 2),
(246, 233, 2),
(247, 232, 2),
(248, 231, 2),
(249, 230, 2),
(250, 229, 2),
(251, 228, 2),
(252, 227, 2),
(253, 226, 2),
(254, 225, 2),
(255, 224, 2),
(256, 223, 2),
(257, 222, 2),
(258, 221, 2),
(259, 220, 2),
(260, 219, 2),
(261, 218, 2),
(262, 217, 2),
(263, 216, 2),
(264, 215, 2),
(265, 214, 2),
(266, 213, 2),
(267, 212, 2),
(268, 211, 2),
(269, 210, 2),
(270, 209, 2),
(271, 208, 2),
(272, 207, 2),
(273, 206, 2),
(274, 205, 2),
(275, 204, 2),
(276, 203, 2),
(277, 202, 2),
(278, 201, 2),
(279, 200, 2),
(280, 199, 2),
(281, 198, 2),
(282, 197, 2),
(283, 196, 2),
(284, 195, 2),
(285, 194, 2),
(286, 193, 2),
(287, 192, 2),
(288, 191, 2),
(289, 190, 2),
(290, 189, 2),
(291, 188, 2),
(292, 187, 2),
(293, 186, 2),
(294, 185, 2),
(295, 184, 2),
(296, 183, 2),
(297, 182, 2),
(298, 181, 2),
(299, 180, 2),
(300, 179, 2),
(301, 178, 2),
(302, 177, 2),
(303, 176, 2),
(304, 175, 2),
(305, 174, 2),
(306, 173, 2),
(307, 172, 2),
(308, 171, 2),
(309, 170, 2),
(310, 169, 2),
(311, 168, 2),
(312, 167, 2),
(313, 166, 2),
(314, 165, 2),
(315, 164, 2),
(316, 163, 2),
(317, 162, 2),
(318, 161, 2),
(319, 160, 2),
(320, 159, 2),
(321, 158, 2),
(322, 157, 2),
(323, 156, 2),
(324, 155, 2),
(325, 154, 2),
(326, 153, 2),
(327, 152, 2),
(328, 151, 2),
(329, 150, 2),
(330, 149, 2),
(331, 148, 2),
(332, 147, 2),
(333, 146, 2),
(334, 145, 2),
(335, 144, 2),
(336, 143, 2),
(337, 142, 2),
(338, 141, 2),
(339, 140, 2),
(340, 139, 2),
(341, 138, 2),
(342, 137, 2),
(343, 136, 2),
(344, 135, 2),
(345, 134, 2),
(346, 133, 2),
(347, 132, 2),
(348, 131, 2),
(349, 130, 2),
(350, 129, 2),
(351, 128, 2),
(352, 127, 2),
(353, 126, 2),
(354, 125, 2),
(355, 124, 2),
(356, 123, 2),
(357, 122, 2),
(358, 121, 2),
(359, 120, 2),
(360, 119, 2),
(361, 118, 2),
(362, 117, 2),
(363, 116, 2),
(364, 115, 2),
(365, 114, 2),
(366, 113, 2),
(367, 112, 2),
(368, 111, 2),
(369, 110, 2),
(370, 109, 2),
(371, 108, 2),
(372, 107, 2),
(373, 106, 2),
(374, 105, 2),
(375, 104, 2),
(376, 103, 2),
(377, 102, 2),
(378, 101, 2),
(379, 100, 2),
(380, 99, 2),
(381, 98, 2),
(382, 97, 2),
(383, 96, 2),
(384, 95, 2),
(385, 94, 2),
(386, 93, 2),
(387, 92, 2),
(388, 91, 2),
(389, 90, 2),
(390, 89, 2),
(391, 88, 2),
(392, 87, 2),
(393, 86, 2),
(394, 85, 2),
(395, 84, 2),
(396, 83, 2),
(397, 82, 2),
(398, 81, 2),
(399, 80, 2),
(400, 79, 2),
(401, 78, 2),
(402, 77, 2),
(403, 76, 2),
(404, 75, 2),
(405, 74, 2),
(406, 73, 2),
(407, 72, 2),
(408, 71, 2),
(409, 70, 2),
(410, 69, 2),
(411, 68, 2),
(412, 67, 2),
(413, 66, 2),
(414, 65, 2),
(415, 64, 2),
(416, 63, 2),
(417, 62, 2),
(418, 61, 2),
(419, 60, 2),
(420, 59, 2),
(421, 58, 2),
(422, 57, 2),
(423, 56, 2),
(424, 55, 2),
(425, 54, 2),
(426, 53, 2),
(427, 52, 2),
(428, 51, 2),
(429, 50, 2),
(430, 49, 2),
(431, 48, 2),
(432, 47, 2),
(433, 46, 2),
(434, 45, 2),
(435, 44, 2),
(436, 43, 2),
(437, 42, 2),
(438, 41, 2),
(439, 40, 2),
(440, 39, 2),
(441, 38, 2),
(442, 37, 2),
(443, 36, 2),
(444, 35, 2),
(445, 34, 2),
(446, 33, 2),
(447, 32, 2),
(448, 31, 2),
(449, 30, 2),
(450, 29, 2),
(451, 28, 2),
(452, 27, 2),
(453, 26, 2),
(454, 25, 2),
(455, 24, 2),
(456, 23, 2),
(457, 22, 2),
(458, 21, 2),
(459, 20, 2),
(460, 19, 2),
(461, 18, 2),
(462, 17, 2),
(463, 16, 2),
(464, 15, 2),
(465, 14, 2),
(466, 13, 2),
(467, 12, 2),
(468, 11, 2),
(469, 10, 2),
(470, 9, 2),
(471, 8, 2),
(472, 7, 2),
(473, 6, 2),
(474, 5, 2),
(475, 4, 2),
(476, 3, 2),
(477, 2, 2),
(478, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `jos_jshopping_shipping_method_price_weight`
--

CREATE TABLE IF NOT EXISTS `jos_jshopping_shipping_method_price_weight` (
  `sh_pr_weight_id` int(11) NOT NULL auto_increment,
  `sh_pr_method_id` int(11) NOT NULL,
  `shipping_price` decimal(12,2) NOT NULL,
  `shipping_weight_from` decimal(14,4) NOT NULL,
  `shipping_weight_to` decimal(14,4) NOT NULL,
  `shipping_package_price` decimal(12,2) NOT NULL,
  PRIMARY KEY  (`sh_pr_weight_id`),
  KEY `sh_pr_method_id` (`sh_pr_method_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `jos_jshopping_taxes`
--

CREATE TABLE IF NOT EXISTS `jos_jshopping_taxes` (
  `tax_id` int(11) NOT NULL auto_increment,
  `tax_name` varchar(50) NOT NULL default '',
  `tax_value` decimal(12,2) NOT NULL default '0.00',
  PRIMARY KEY  (`tax_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `jos_jshopping_taxes`
--

INSERT INTO `jos_jshopping_taxes` (`tax_id`, `tax_name`, `tax_value`) VALUES
(1, 'Normal', '19.00');

-- --------------------------------------------------------

--
-- Table structure for table `jos_jshopping_taxes_ext`
--

CREATE TABLE IF NOT EXISTS `jos_jshopping_taxes_ext` (
  `id` int(11) NOT NULL auto_increment,
  `tax_id` int(11) NOT NULL,
  `zones` text NOT NULL,
  `tax` decimal(12,2) NOT NULL,
  `firma_tax` decimal(12,2) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `jos_jshopping_unit`
--

CREATE TABLE IF NOT EXISTS `jos_jshopping_unit` (
  `id` int(11) NOT NULL auto_increment,
  `qty` int(11) NOT NULL default '1',
  `name_de-DE` varchar(255) NOT NULL,
  `name_en-GB` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `jos_jshopping_unit`
--

INSERT INTO `jos_jshopping_unit` (`id`, `qty`, `name_de-DE`, `name_en-GB`) VALUES
(1, 1, 'Liter', 'Liter');

-- --------------------------------------------------------

--
-- Table structure for table `jos_jshopping_usergroups`
--

CREATE TABLE IF NOT EXISTS `jos_jshopping_usergroups` (
  `usergroup_id` int(11) NOT NULL auto_increment,
  `usergroup_name` varchar(64) NOT NULL,
  `usergroup_discount` decimal(12,2) NOT NULL,
  `usergroup_description` text NOT NULL,
  `usergroup_is_default` tinyint(1) NOT NULL,
  PRIMARY KEY  (`usergroup_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `jos_jshopping_usergroups`
--

INSERT INTO `jos_jshopping_usergroups` (`usergroup_id`, `usergroup_name`, `usergroup_discount`, `usergroup_description`, `usergroup_is_default`) VALUES
(1, 'Default', '0.00', 'Default', 1);

-- --------------------------------------------------------

--
-- Table structure for table `jos_jshopping_users`
--

CREATE TABLE IF NOT EXISTS `jos_jshopping_users` (
  `user_id` int(11) NOT NULL,
  `usergroup_id` int(11) NOT NULL,
  `payment_id` int(11) NOT NULL,
  `shipping_id` int(11) NOT NULL,
  `u_name` varchar(150) NOT NULL,
  `title` tinyint(1) NOT NULL,
  `f_name` varchar(255) NOT NULL,
  `l_name` varchar(255) NOT NULL,
  `firma_name` varchar(100) NOT NULL,
  `client_type` tinyint(1) NOT NULL,
  `firma_code` varchar(100) NOT NULL,
  `tax_number` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `street` varchar(255) NOT NULL,
  `zip` varchar(20) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `country` int(11) default NULL,
  `phone` varchar(20) NOT NULL,
  `mobil_phone` varchar(20) NOT NULL,
  `fax` varchar(20) NOT NULL,
  `ext_field_1` varchar(255) NOT NULL,
  `ext_field_2` varchar(255) NOT NULL,
  `ext_field_3` varchar(255) NOT NULL,
  `delivery_adress` tinyint(1) NOT NULL,
  `d_title` tinyint(1) NOT NULL,
  `d_f_name` varchar(255) NOT NULL,
  `d_l_name` varchar(255) NOT NULL,
  `d_firma_name` varchar(100) NOT NULL,
  `d_email` varchar(255) NOT NULL,
  `d_street` varchar(255) NOT NULL,
  `d_zip` varchar(20) NOT NULL,
  `d_city` varchar(100) NOT NULL,
  `d_state` varchar(100) NOT NULL,
  `d_country` int(11) NOT NULL,
  `d_phone` varchar(20) NOT NULL,
  `d_mobil_phone` varchar(20) NOT NULL,
  `d_fax` varchar(20) NOT NULL,
  `d_ext_field_1` varchar(255) NOT NULL,
  `d_ext_field_2` varchar(255) NOT NULL,
  `d_ext_field_3` varchar(255) NOT NULL,
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jos_jshopping_vendors`
--

CREATE TABLE IF NOT EXISTS `jos_jshopping_vendors` (
  `id` int(11) NOT NULL auto_increment,
  `shop_name` varchar(255) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `adress` varchar(255) NOT NULL,
  `city` varchar(100) NOT NULL,
  `zip` varchar(20) NOT NULL,
  `state` varchar(100) NOT NULL,
  `country` int(11) NOT NULL,
  `f_name` varchar(255) NOT NULL,
  `l_name` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `fax` varchar(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `publish` tinyint(1) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `jos_menu`
--

CREATE TABLE IF NOT EXISTS `jos_menu` (
  `id` int(11) NOT NULL auto_increment,
  `menutype` varchar(225) default NULL,
  `name` text,
  `alias` varchar(255) NOT NULL default '',
  `link` text,
  `type` varchar(150) NOT NULL default '',
  `published` tinyint(1) NOT NULL default '0',
  `parent` int(11) unsigned NOT NULL default '0',
  `componentid` int(11) unsigned NOT NULL default '0',
  `sublevel` int(11) default '0',
  `ordering` int(11) default '0',
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `pollid` int(11) NOT NULL default '0',
  `browserNav` tinyint(4) default '0',
  `access` tinyint(3) unsigned NOT NULL default '0',
  `utaccess` tinyint(3) unsigned NOT NULL default '0',
  `params` text NOT NULL,
  `lft` int(11) unsigned NOT NULL default '0',
  `rgt` int(11) unsigned NOT NULL default '0',
  `home` int(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `componentid` (`componentid`,`menutype`,`published`,`access`),
  KEY `menutype` (`menutype`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=216 ;

--
-- Dumping data for table `jos_menu`
--

INSERT INTO `jos_menu` (`id`, `menutype`, `name`, `alias`, `link`, `type`, `published`, `parent`, `componentid`, `sublevel`, `ordering`, `checked_out`, `checked_out_time`, `pollid`, `browserNav`, `access`, `utaccess`, `params`, `lft`, `rgt`, `home`) VALUES
(1, 'mainmenu', 'Joomla || subline possible', 'joomla', 'index.php?option=com_content&view=frontpage', 'component', 0, 0, 20, 0, 7, 62, '2010-07-12 12:35:37', 0, 0, 0, 3, 'num_leading_articles=1\nnum_intro_articles=6\nnum_columns=1\nnum_links=4\norderby_pri=\norderby_sec=front\nmulti_column_order=1\nshow_pagination=2\nshow_pagination_results=1\nshow_feed_link=1\nshow_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=Welcome to the Frontpage\nshow_page_title=0\npageclass_sfx=columnwidth-200\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(135, 'mainmenu', 'Category List', 'category-list', 'index.php?option=com_content&view=category&id=29', 'component', 1, 156, 20, 2, 4, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'display_num=10\nshow_headings=1\nshow_date=1\ndate_format=\nfilter=1\nfilter_type=title\norderby_sec=\nshow_pagination=1\nshow_pagination_limit=1\nshow_feed_link=1\nshow_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(136, 'mainmenu', 'Section List', 'section-list', 'index.php?option=com_content&view=section&id=4', 'component', 1, 156, 20, 2, 3, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_description=1\nshow_description_image=1\nshow_categories=1\nshow_empty_categories=0\nshow_cat_num_articles=1\nshow_category_description=1\norderby=\norderby_sec=\nshow_feed_link=1\nshow_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(11, 'othermenu', 'Joomla! Home', 'joomla-home', 'http://www.joomla.org', 'url', 1, 0, 0, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 3, 'menu_image=-1\n\n', 0, 0, 0),
(12, 'othermenu', 'Joomla! Forums', 'joomla-forums', 'http://forum.joomla.org', 'url', 1, 0, 0, 0, 2, 0, '0000-00-00 00:00:00', 0, 0, 0, 3, 'menu_image=-1\n\n', 0, 0, 0),
(13, 'othermenu', 'Joomla! Help', 'joomla-help', 'http://help.joomla.org', 'url', 1, 0, 0, 0, 3, 0, '0000-00-00 00:00:00', 0, 0, 0, 3, 'menu_image=-1\n\n', 0, 0, 0),
(20, 'usermenu', 'Your Details', 'your-details', 'index.php?option=com_user&view=user&task=edit', 'component', 1, 0, 14, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 1, 3, '', 0, 0, 0),
(24, 'usermenu', 'Logout', 'logout', 'index.php?option=com_user&view=login', 'component', 1, 0, 14, 0, 4, 0, '0000-00-00 00:00:00', 0, 0, 1, 3, '', 0, 0, 0),
(90, 'othermenu', 'Level 2', 'level-2', 'index.php?option=com_content&view=article&id=48', 'component', 1, 89, 20, 1, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(134, 'mainmenu', 'Section Blog', 'section-blog', 'index.php?option=com_content&view=section&layout=blog&id=4', 'component', 1, 156, 20, 2, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_description=1\nshow_description_image=1\nnum_leading_articles=1\nnum_intro_articles=4\nnum_columns=2\nnum_links=4\norderby_pri=\norderby_sec=order\nmulti_column_order=1\nshow_pagination=2\nshow_pagination_results=1\nshow_feed_link=1\nshow_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=1\nlink_section=\nshow_category=1\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(171, 'mainmenu', 'ZOO', 'zoo', 'index.php?option=com_content&view=article&id=59', 'component', 0, 0, 20, 0, 5, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=columns-2 columnwidth-225\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(86, 'mainmenu', 'Separator || separator', 'separator', '', 'separator', 0, 0, 0, 0, 8, 62, '2008-07-08 10:39:29', 0, 0, 0, 0, 'menu_image=-1\n\n', 0, 0, 0),
(87, 'mainmenu', 'Level 2', 'level-2', 'index.php?option=com_content&view=article&id=48', 'component', 1, 86, 20, 1, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=0\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(88, 'mainmenu', 'Level 2', 'level-2', 'index.php?option=com_content&view=article&id=48', 'component', 1, 86, 20, 1, 2, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=0\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(89, 'othermenu', 'Sample Levels', 'deeper-levels-examples', 'index.php?option=com_content&view=article&id=48', 'component', 1, 0, 20, 0, 4, 62, '2007-12-21 16:40:26', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(48, 'mainmenu', 'Web Links', 'web-links', 'index.php?option=com_weblinks&view=categories', 'component', 1, 158, 4, 2, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'image=-1\nimage_align=right\nshow_feed_link=1\nshow_comp_description=1\ncomp_description=\nshow_link_hits=1\nshow_link_description=1\nshow_other_cats=1\nshow_headings=1\ntarget=\nlink_icons=\npage_title=Weblinks\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(49, 'mainmenu', 'News Feeds', 'news-feeds', 'index.php?option=com_newsfeeds&view=categories', 'component', 1, 158, 11, 2, 3, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_limit=1\nshow_comp_description=1\ncomp_description=\nimage=-1\nimage_align=right\nshow_headings=1\nshow_name=1\nshow_articles=1\nshow_link=1\nshow_cat_description=1\nshow_cat_items=1\nshow_feed_image=1\nshow_feed_description=1\nshow_item_description=1\nfeed_word_count=0\npage_title=Newsfeeds\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(145, 'mainmenu', 'Category Blog', 'category-blog', 'index.php?option=com_content&view=category&layout=blog&id=29', 'component', 1, 156, 20, 2, 2, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_description=1\nshow_description_image=1\nnum_leading_articles=1\nnum_intro_articles=4\nnum_columns=2\nnum_links=4\norderby_pri=\norderby_sec=order\nmulti_column_order=1\nshow_pagination=2\nshow_pagination_results=1\nshow_feed_link=1\nshow_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=1\nlink_section=\nshow_category=1\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(51, 'usermenu', 'Submit an Article', 'submit-an-article', 'index.php?option=com_content&view=article&layout=form', 'component', 1, 0, 20, 0, 2, 0, '0000-00-00 00:00:00', 0, 0, 1, 0, '', 0, 0, 0),
(52, 'usermenu', 'Submit a Web Link', 'submit-a-web-link', 'index.php?option=com_weblinks&view=weblink&layout=form', 'component', 1, 0, 4, 0, 3, 0, '0000-00-00 00:00:00', 0, 0, 1, 0, '', 0, 0, 0),
(53, 'mainmenu', 'Page', 'page', 'index.php?option=com_zoo&view=frontpage', 'component', 0, 0, 35, 0, 3, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'application=11\npage_title=\nshow_page_title=0\npageclass_sfx=columns-2 columnwidth-200 custom-nobox\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(195, 'mainmenu', 'Gradient Blue', 'gradient-blue', 'index.php?option=com_zoo&view=frontpage&Itemid=53&preset=gradientblue', 'url', 1, 53, 0, 1, 2, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=icon_gradientblue.png\n\n', 0, 0, 0),
(194, 'mainmenu', 'Retro Paper', 'retro-paper', 'index.php?option=com_zoo&view=frontpage&Itemid=53&preset=retropaper', 'url', 1, 53, 0, 1, 9, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=icon_retropaper.png\n\n', 0, 0, 0),
(54, 'mainmenu', 'Template', 'template', 'index.php?option=com_content&view=article&id=45', 'component', 0, 0, 20, 0, 4, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=0\npageclass_sfx=columnwidth-310\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(55, 'mainmenu', 'Typography', 'typography', 'index.php?option=com_content&view=article&id=46', 'component', 1, 152, 20, 2, 2, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=0\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(156, 'mainmenu', 'Content || All com_content views', 'content--all-comcontent-views', '', 'separator', 1, 1, 0, 1, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\n\n', 0, 0, 0),
(157, 'mainmenu', 'Contact || All com_contact views', 'contact--all-comcontact-views', '', 'separator', 1, 1, 0, 1, 2, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\n\n', 0, 0, 0),
(158, 'mainmenu', 'Other Components || Remaining component views', 'other-components-remaining-component-views', '', 'separator', 1, 1, 0, 1, 3, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\n\n', 0, 0, 0),
(58, 'mainmenu', 'Module Variations', 'module-variations', 'index.php?option=com_content&view=article&id=58', 'component', 1, 152, 20, 2, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=1\nshow_create_date=1\nshow_modify_date=1\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=1\nshow_pdf_icon=1\nshow_print_icon=1\nshow_email_icon=1\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=0\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(91, 'othermenu', 'Level 2', 'level-2', 'index.php?option=com_content&view=article&id=48', 'component', 1, 89, 20, 1, 2, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(92, 'othermenu', 'Level 3', 'level-3', 'index.php?option=com_content&view=article&id=48', 'component', 1, 91, 20, 2, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(93, 'othermenu', 'Level 4', 'level-4', 'index.php?option=com_content&view=article&id=48', 'component', 1, 92, 20, 3, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(94, 'othermenu', 'Level 2', 'level-2', 'index.php?option=com_content&view=article&id=48', 'component', 1, 89, 20, 1, 3, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(95, 'othermenu', 'Accordion A', 'accordion-a', '', 'separator', 1, 0, 0, 0, 5, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\n\n', 0, 0, 0),
(96, 'othermenu', 'Level 2', 'level-2', 'index.php?option=com_content&view=article&id=48', 'component', 1, 95, 20, 1, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(97, 'othermenu', 'Level 2', 'level-2', 'index.php?option=com_content&view=article&id=48', 'component', 1, 95, 20, 1, 2, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(98, 'othermenu', 'Level 2', 'level-2', 'index.php?option=com_content&view=article&id=48', 'component', 1, 95, 20, 1, 3, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(99, 'othermenu', 'Accordion B', 'accordion-b', '', 'separator', 1, 0, 0, 0, 6, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\n\n', 0, 0, 0),
(100, 'othermenu', 'Level 2', 'level-2', 'index.php?option=com_content&view=article&id=48', 'component', 1, 99, 20, 1, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(101, 'othermenu', 'Level 2', 'level-2', 'index.php?option=com_content&view=article&id=48', 'component', 1, 99, 20, 1, 2, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(107, 'mainmenu', 'Level 2', 'level-2', '', 'separator', 1, 86, 0, 1, 3, 62, '2008-07-10 15:21:21', 0, 0, 0, 0, 'menu_image=-1\n\n', 0, 0, 0),
(108, 'mainmenu', 'Level 3', 'level-3', 'index.php?option=com_content&view=article&id=48', 'component', 1, 107, 20, 2, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=0\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(114, 'mainmenu', 'Plain Sky', 'plain-sky', 'index.php?option=com_zoo&view=frontpage&Itemid=53&preset=plainsky', 'url', 1, 53, 0, 1, 4, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=icon_plainsky.png\n\n', 0, 0, 0),
(123, 'topmenu', 'News', 'news', 'index.php?option=com_content&view=frontpage&Itemid=1', 'url', 1, 0, 0, 0, 3, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\n\n', 0, 0, 0),
(124, 'topmenu', 'Features', 'features', 'index.php?option=com_content&view=article&id=18:joomla-features&catid=29:the-cms&Itemid=145', 'url', 1, 0, 0, 0, 2, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\n\n', 0, 0, 0),
(125, 'topmenu', 'About Joomla!', 'about-joomla', 'index.php?option=com_content&view=article&id=1:welcome-to-joomla&catid=29:the-cms&Itemid=145', 'url', 1, 0, 0, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\n\n', 0, 0, 0),
(130, 'mainmenu', 'Retro Beige', 'retro-beige', 'index.php?option=com_zoo&view=frontpage&Itemid=53&preset=retrobeige', 'url', 1, 53, 0, 1, 3, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=icon_retrobeige.png\n\n', 0, 0, 0),
(138, 'mainmenu', 'Poll', 'poll', 'index.php?option=com_poll&view=poll&id=14', 'component', 1, 158, 10, 2, 4, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'page_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(140, 'mainmenu', 'Contact Category', 'contact-category', 'index.php?option=com_contact&view=category&catid=12', 'component', 1, 157, 7, 2, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'display_num=20\nimage=clock.jpg\nimage_align=left\nshow_limit=1\nshow_feed_link=1\ncontact_icons=\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_headings=\nshow_position=\nshow_email=\nshow_telephone=\nshow_mobile=\nshow_fax=\nallow_vcard=\nbanned_email=\nbanned_subject=\nbanned_text=\nvalidate_session=\ncustom_reply=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(141, 'mainmenu', 'Contact Item', 'contact-item', 'index.php?option=com_contact&view=contact&id=1', 'component', 1, 157, 7, 2, 2, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_contact_list=1\nshow_category_crumb=1\ncontact_icons=\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_headings=\nshow_position=\nshow_email=\nshow_telephone=\nshow_mobile=\nshow_fax=\nallow_vcard=\nbanned_email=\nbanned_subject=\nbanned_text=\nvalidate_session=\ncustom_reply=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(142, 'mainmenu', 'Login', 'login', 'index.php?option=com_user&view=login', 'component', 1, 158, 14, 2, 2, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_login_title=1\nheader_login=\nlogin=\nlogin_message=1\ndescription_login=1\ndescription_login_text=\nimage_login=\nimage_login_align=right\nshow_logout_title=1\nheader_logout=\nlogout=\nlogout_message=1\ndescription_logout=1\ndescription_logout_text=\nimage_logout=articles.jpg\npage_title=\nshow_page_title=0\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(166, 'frontpagemenu', 'Template', 'template', 'index.php?option=com_content&view=article&id=45&Itemid=54', 'url', 1, 0, 0, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\n\n', 0, 0, 0),
(167, 'frontpagemenu', 'Icons', 'icons', 'index.php?option=com_content&view=article&id=73&Itemid=193', 'url', 1, 0, 0, 0, 3, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\n\n', 0, 0, 0),
(168, 'frontpagemenu', 'ZOO', 'zoo', 'index.php?option=com_content&view=article&id=59&Itemid=171', 'url', 1, 0, 0, 0, 2, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\n\n', 0, 0, 0),
(169, 'frontpagemenu', 'Joomla', 'joomla', 'index.php?option=com_content&view=frontpage&Itemid=1', 'url', 1, 0, 0, 0, 4, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\n\n', 0, 0, 0),
(152, 'mainmenu', 'Warp5 || Template Framework', 'warp-slick-template-framework', 'index.php?option=com_content&view=article&id=45&Itemid=54', 'url', 1, 54, 0, 1, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=icon_warp5.png\n\n', 0, 0, 0),
(180, 'mainmenu', 'Plain Mosaic', 'plain-mosaic', 'index.php?option=com_zoo&view=frontpage&Itemid=53&preset=plainmosaic', 'url', 1, 53, 0, 1, 11, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=icon_plainmosaic.png\n\n', 0, 0, 0),
(181, 'mainmenu', 'Retro Landscape', 'retro-landscape', 'index.php?option=com_zoo&view=frontpage&Itemid=53&preset=retrolandscape', 'url', 1, 53, 0, 1, 6, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=icon_retrolandscape.png\n\n', 0, 0, 0),
(183, 'mainmenu', 'Plain Flowers', 'plain-flowers', 'index.php?option=com_zoo&view=frontpage&Itemid=53&preset=plainflowers', 'url', 1, 53, 0, 1, 7, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=icon_plainflowers.png\n\n', 0, 0, 0),
(184, 'mainmenu', 'Plain Blue', 'plain-blue', 'index.php?option=com_zoo&view=frontpage&Itemid=53&preset=default', 'url', 1, 53, 0, 1, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=icon_plainblue.png\n\n', 0, 0, 0),
(193, 'mainmenu', 'Icons', 'icons', 'index.php?option=com_content&view=article&id=73', 'component', 0, 0, 20, 0, 6, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(196, 'mainmenu', 'Gradient Business', 'gradient-business', 'index.php?option=com_zoo&view=frontpage&Itemid=53&preset=gradientbusiness', 'url', 1, 53, 0, 1, 8, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=icon_gradientbusiness.png\n\n', 0, 0, 0),
(197, 'mainmenu', 'Gradient Red', 'gradient-red', 'index.php?option=com_zoo&view=frontpage&Itemid=53&preset=gradientred', 'url', 1, 53, 0, 1, 10, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=icon_gradientred.png\n\n', 0, 0, 0),
(198, 'mainmenu', 'Gradient Ribbon', 'gradient-ribbon', 'index.php?option=com_zoo&view=frontpage&Itemid=53&preset=gradientribbon', 'url', 1, 53, 0, 1, 12, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=icon_gradientribbon.png\n\n', 0, 0, 0),
(199, 'mainmenu', 'Gradient Space', 'gradient-space', 'index.php?option=com_zoo&view=frontpage&Itemid=53&preset=gradientspace', 'url', 1, 53, 0, 1, 5, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=icon_gradientspace.png\n\n', 0, 0, 0),
(200, 'mainmenu', 'Home', 'home', 'index.php?option=com_zoo&view=frontpage', 'component', 1, 0, 35, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'application=11\npage_title=\nshow_page_title=0\npageclass_sfx=columns-2 columnwidth-200 custom-nobox\nmenu_image=-1\nsecure=-1\n\n', 0, 0, 1),
(201, 'mainmenu', 'Yayasan', 'yayasan', 'index.php?option=com_content&view=category&layout=blog&id=37', 'component', 1, 0, 20, 0, 9, 63, '2011-09-13 12:14:12', 0, 0, 0, 0, 'show_description=0\nshow_description_image=0\nnum_leading_articles=1\nnum_intro_articles=4\nnum_columns=2\nnum_links=4\norderby_pri=ralpha\norderby_sec=rdate\nmulti_column_order=1\nshow_pagination=2\nshow_pagination_results=1\nshow_feed_link=1\nshow_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(202, 'mainmenu', 'Akademika', 'akademika', 'index.php?option=com_content&view=article&id=86', 'component', 1, 0, 20, 0, 10, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(203, 'mainmenu', 'Staff & Guru', 'staff-a-guru', 'index.php?option=com_content&view=article&id=19', 'component', 1, 0, 20, 0, 11, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(204, 'mainmenu', 'Divisi Usaha', 'divisi-usaha', 'http://usaha.alikhlascitrautama.com/', 'url', 1, 0, 0, 0, 12, 0, '0000-00-00 00:00:00', 0, 1, 0, 0, 'menu_image=-1\n\n', 0, 0, 0),
(205, 'mainmenu', 'Pendidikan', 'pendidikan', 'index.php?Itemid=168', 'menulink', 1, 0, 0, 0, 13, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_item=168\n\n', 0, 0, 0),
(206, 'mainmenu', 'Sejarah', 'sejarah', 'index.php?option=com_content&view=article&id=84', 'component', 1, 201, 20, 1, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(207, 'mainmenu', 'Misi, Visi Dan Motto Al-Ikhlas', 'misi-visi-dan-motto-al-ikhlas', 'index.php?option=com_content&view=article&id=87', 'component', 1, 201, 20, 1, 2, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(208, 'mainmenu', 'MTs Al-Ikhlas', 'mts-al-ikhlas', 'index.php?option=com_content&view=category&id=38', 'component', 1, 205, 20, 1, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'display_num=0\nshow_headings=0\nshow_date=0\ndate_format=\nfilter=1\nfilter_type=title\norderby_sec=alpha\nshow_pagination=0\nshow_pagination_limit=1\nshow_feed_link=1\nshow_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(209, 'mainmenu', 'Madrasah Diniyah', 'madrasah-diniyah', 'index.php?option=com_content&view=category&id=39', 'component', 1, 205, 20, 1, 2, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'display_num=0\nshow_headings=0\nshow_date=0\ndate_format=\nfilter=1\nfilter_type=title\norderby_sec=\nshow_pagination=1\nshow_pagination_limit=1\nshow_feed_link=1\nshow_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(210, 'mainmenu', 'TK Roudhotul Athfal', 'tk-roudhotul-athfal', 'index.php?option=com_content&view=category&id=40', 'component', 1, 205, 20, 1, 3, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'display_num=10\nshow_headings=0\nshow_date=0\ndate_format=\nfilter=1\nfilter_type=title\norderby_sec=\nshow_pagination=1\nshow_pagination_limit=1\nshow_feed_link=1\nshow_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(211, 'mainmenu', 'TPA', 'tpa', 'index.php?option=com_content&view=category&id=41', 'component', 1, 205, 20, 1, 4, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'display_num=0\nshow_headings=0\nshow_date=0\ndate_format=\nfilter=1\nfilter_type=title\norderby_sec=\nshow_pagination=1\nshow_pagination_limit=1\nshow_feed_link=1\nshow_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(212, 'mainmenu', 'Struktur Organisasi', 'struktur-organisasi', 'index.php?option=com_content&view=article&id=91', 'component', 1, 201, 20, 1, 3, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(213, 'mainmenu', 'Badan Wakaf', 'badan-wakaf', 'index.php?option=com_content&view=article&id=88', 'component', 1, 0, 20, 0, 14, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(214, 'mainmenu', 'Home', 'home', 'index.php?option=com_content&view=frontpage', 'component', 0, 0, 20, 0, 2, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'num_leading_articles=0\nnum_intro_articles=0\nnum_columns=4\nnum_links=0\norderby_pri=\norderby_sec=front\nmulti_column_order=1\nshow_pagination=2\nshow_pagination_results=1\nshow_feed_link=1\nshow_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(215, 'topmenu', 'Our Store', 'our-store', 'index.php?option=com_jshopping&controller=products', 'component', 1, 0, 48, 0, 4, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'page_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `jos_menu_types`
--

CREATE TABLE IF NOT EXISTS `jos_menu_types` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `menutype` varchar(225) NOT NULL default '',
  `title` text NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `menutype` (`menutype`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `jos_menu_types`
--

INSERT INTO `jos_menu_types` (`id`, `menutype`, `title`, `description`) VALUES
(1, 'mainmenu', 'Main Menu', 'The main menu for the site'),
(2, 'usermenu', 'User Menu', 'A Menu for logged in Users'),
(3, 'topmenu', 'Top Menu', 'Top level navigation'),
(4, 'othermenu', 'Other Menu', 'Additional links'),
(5, 'frontpagemenu', 'Frontpage Menu', '');

-- --------------------------------------------------------

--
-- Table structure for table `jos_messages`
--

CREATE TABLE IF NOT EXISTS `jos_messages` (
  `message_id` int(10) unsigned NOT NULL auto_increment,
  `user_id_from` int(10) unsigned NOT NULL default '0',
  `user_id_to` int(10) unsigned NOT NULL default '0',
  `folder_id` int(10) unsigned NOT NULL default '0',
  `date_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `state` int(11) NOT NULL default '0',
  `priority` int(1) unsigned NOT NULL default '0',
  `subject` text NOT NULL,
  `message` text NOT NULL,
  PRIMARY KEY  (`message_id`),
  KEY `useridto_state` (`user_id_to`,`state`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `jos_messages_cfg`
--

CREATE TABLE IF NOT EXISTS `jos_messages_cfg` (
  `user_id` int(10) unsigned NOT NULL default '0',
  `cfg_name` text NOT NULL,
  `cfg_value` text NOT NULL,
  UNIQUE KEY `idx_user_var_name` (`user_id`,`cfg_name`(100))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jos_migration_backlinks`
--

CREATE TABLE IF NOT EXISTS `jos_migration_backlinks` (
  `itemid` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `url` text NOT NULL,
  `sefurl` text NOT NULL,
  `newurl` text NOT NULL,
  PRIMARY KEY  (`itemid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jos_modules`
--

CREATE TABLE IF NOT EXISTS `jos_modules` (
  `id` int(11) NOT NULL auto_increment,
  `title` text NOT NULL,
  `content` text NOT NULL,
  `ordering` int(11) NOT NULL default '0',
  `position` varchar(150) default NULL,
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL default '0',
  `module` varchar(150) default NULL,
  `numnews` int(11) NOT NULL default '0',
  `access` tinyint(3) unsigned NOT NULL default '0',
  `showtitle` tinyint(3) unsigned NOT NULL default '1',
  `params` text NOT NULL,
  `iscore` tinyint(4) NOT NULL default '0',
  `client_id` tinyint(4) NOT NULL default '0',
  `control` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `published` (`published`,`access`),
  KEY `newsfeeds` (`module`,`published`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=284 ;

--
-- Dumping data for table `jos_modules`
--

INSERT INTO `jos_modules` (`id`, `title`, `content`, `ordering`, `position`, `checked_out`, `checked_out_time`, `published`, `module`, `numnews`, `access`, `showtitle`, `params`, `iscore`, `client_id`, `control`) VALUES
(1, 'Main Menu', '', 1, 'menu', 0, '0000-00-00 00:00:00', 1, 'mod_mainmenu', 0, 0, 1, 'menutype=mainmenu\nmenu_style=list\nstartLevel=0\nendLevel=3\nshowAllChildren=1\nwindow_open=\nshow_whitespace=0\ncache=0\ntag_id=\nclass_sfx=menu-dropdown\nmoduleclass_sfx=menu\nmaxdepth=10\nmenu_images=0\nmenu_images_align=0\nmenu_images_link=0\nexpand_menu=0\nactivate_parent=0\nfull_active_id=0\nindent_image=0\nindent_image1=\nindent_image2=\nindent_image3=\nindent_image4=\nindent_image5=\nindent_image6=\nspacer=\nend_spacer=\n\n', 1, 0, ''),
(2, 'Login', '', 1, 'login', 0, '0000-00-00 00:00:00', 1, 'mod_login', 0, 0, 1, '', 1, 1, ''),
(3, 'Popular', '', 3, 'cpanel', 0, '0000-00-00 00:00:00', 1, 'mod_popular', 0, 2, 1, '', 0, 1, ''),
(4, 'Recent added Articles', '', 4, 'cpanel', 0, '0000-00-00 00:00:00', 1, 'mod_latest', 0, 2, 1, 'ordering=c_dsc\nuser_id=0\ncache=0\n\n', 0, 1, ''),
(5, 'Menu Stats', '', 5, 'cpanel', 0, '0000-00-00 00:00:00', 1, 'mod_stats', 0, 2, 1, '', 0, 1, ''),
(6, 'Unread Messages', '', 1, 'header', 0, '0000-00-00 00:00:00', 1, 'mod_unread', 0, 2, 1, '', 1, 1, ''),
(7, 'Online Users', '', 2, 'header', 0, '0000-00-00 00:00:00', 1, 'mod_online', 0, 2, 1, '', 1, 1, ''),
(8, 'Toolbar', '', 1, 'toolbar', 0, '0000-00-00 00:00:00', 1, 'mod_toolbar', 0, 2, 1, '', 1, 1, ''),
(9, 'Quick Icons', '', 1, 'icon', 0, '0000-00-00 00:00:00', 1, 'mod_quickicon', 0, 2, 1, '', 1, 1, ''),
(10, 'Logged in Users', '', 2, 'cpanel', 0, '0000-00-00 00:00:00', 1, 'mod_logged', 0, 2, 1, '', 0, 1, ''),
(11, 'Footer', '', 0, 'footer', 0, '0000-00-00 00:00:00', 1, 'mod_footer', 0, 0, 1, '', 1, 1, ''),
(12, 'Admin Menu', '', 1, 'menu', 0, '0000-00-00 00:00:00', 1, 'mod_menu', 0, 2, 1, '', 0, 1, ''),
(13, 'Admin SubMenu', '', 1, 'submenu', 0, '0000-00-00 00:00:00', 1, 'mod_submenu', 0, 2, 1, '', 0, 1, ''),
(14, 'User Status', '', 1, 'status', 0, '0000-00-00 00:00:00', 1, 'mod_status', 0, 2, 1, '', 0, 1, ''),
(15, 'Title', '', 1, 'title', 0, '0000-00-00 00:00:00', 1, 'mod_title', 0, 2, 1, '', 0, 1, ''),
(16, 'Polls || Vote for your favorite CMS', '', 13, 'right', 0, '0000-00-00 00:00:00', 0, 'mod_poll', 0, 0, 1, 'id=14\nmoduleclass_sfx=icon-users\ncache=1\ncache_time=900\n\n', 0, 0, ''),
(17, 'User Menu', '', 8, 'left', 0, '0000-00-00 00:00:00', 1, 'mod_mainmenu', 0, 1, 1, 'menutype=usermenu\nmenu_style=list\nstartLevel=0\nendLevel=5\nshowAllChildren=0\nwindow_open=\nshow_whitespace=0\ncache=0\ntag_id=\nclass_sfx=\nmoduleclass_sfx=menu\nmaxdepth=10\nmenu_images=0\nmenu_images_align=0\nmenu_images_link=0\nexpand_menu=0\nactivate_parent=0\nfull_active_id=0\nindent_image=0\nindent_image1=\nindent_image2=\nindent_image3=\nindent_image4=\nindent_image5=\nindent_image6=\nspacer=\nend_spacer=\n\n', 1, 0, ''),
(18, 'Login Form || Login to Member Area', '', 14, 'right', 0, '0000-00-00 00:00:00', 0, 'mod_login', 0, 0, 1, 'cache=0\nmoduleclass_sfx=icon-lock\npretext=\nposttext=\nlogin=\nlogout=\ngreeting=1\nname=0\nusesecure=0\n\n', 1, 0, ''),
(19, 'Artikel Terbaru:', '', 2, 'contentright', 63, '2011-09-13 05:45:00', 1, 'mod_latestnews', 0, 0, 1, 'count=5\nordering=c_dsc\nuser_id=0\nshow_front=1\nsecid=\ncatid=\nmoduleclass_sfx=style-glow color-templatecolor\ncache=1\ncache_time=900\n\n', 1, 0, ''),
(20, 'Statistics', '', 14, 'left', 0, '0000-00-00 00:00:00', 0, 'mod_stats', 0, 0, 0, 'serverinfo=1\nsiteinfo=1\ncounter=1\nincrease=0\nmoduleclass_sfx=\ncache=0\ncache_time=900\n\n', 0, 0, ''),
(21, 'Who''s Online', '', 6, 'right', 62, '2010-07-20 17:30:50', 0, 'mod_whosonline', 0, 0, 1, 'cache=0\nshowmode=0\nmoduleclass_sfx=style-box color-highlight\n\n', 0, 0, ''),
(22, 'Popular', '', 0, 'contentright', 0, '0000-00-00 00:00:00', 0, 'mod_mostread', 0, 0, 1, 'moduleclass_sfx=style-glow color-templatecolor icon-message\nshow_front=1\ncount=3\ncatid=\nsecid=\ncache=1\ncache_time=900\n\n', 0, 0, ''),
(23, 'Archive', '', 15, 'left', 0, '0000-00-00 00:00:00', 0, 'mod_archive', 0, 0, 1, 'count=10\nmoduleclass_sfx=\ncache=1\n\n', 1, 0, ''),
(24, 'Sections', '', 16, 'left', 0, '0000-00-00 00:00:00', 0, 'mod_sections', 0, 0, 1, 'count=5\nmoduleclass_sfx=\ncache=1\ncache_time=900\n\n', 1, 0, ''),
(25, 'Newsflash', '', 0, 'contentright', 0, '0000-00-00 00:00:00', 0, 'mod_newsflash', 0, 0, 0, 'catid=37\nlayout=vert\nimage=1\nlink_titles=\nshowLastSeparator=1\nreadmore=1\nitem_title=1\nitems=4\nmoduleclass_sfx=style-glow color-templatecolor icon-message\ncache=0\ncache_time=900\n\n', 0, 0, ''),
(26, 'Related Items', '', 17, 'left', 0, '0000-00-00 00:00:00', 0, 'mod_related_items', 0, 0, 1, '', 0, 0, ''),
(27, 'Search', '', 1, 'search', 0, '0000-00-00 00:00:00', 0, 'mod_search', 0, 0, 0, 'moduleclass_sfx=\nwidth=20\ntext=\nbutton=1\nbutton_pos=right\nimagebutton=\nbutton_text=\ncache=1\ncache_time=900\n\n', 0, 0, ''),
(28, 'Random Image', '', 7, 'left', 0, '0000-00-00 00:00:00', 0, 'mod_random_image', 0, 0, 1, 'type=jpg\nfolder=\nlink=\nwidth=\nheight=\nmoduleclass_sfx=\ncache=0\ncache_time=900\n\n', 0, 0, ''),
(29, 'Top Menu', '', 1, 'toolbarleft', 0, '0000-00-00 00:00:00', 0, 'mod_mainmenu', 0, 0, 0, 'menutype=topmenu\nmenu_style=list\nstartLevel=0\nendLevel=0\nshowAllChildren=0\nwindow_open=\nshow_whitespace=0\ncache=0\ntag_id=\nclass_sfx=\nmoduleclass_sfx=menu\nmaxdepth=10\nmenu_images=0\nmenu_images_align=0\nmenu_images_link=0\nexpand_menu=0\nactivate_parent=0\nfull_active_id=0\nindent_image=0\nindent_image1=-1\nindent_image2=-1\nindent_image3=-1\nindent_image4=-1\nindent_image5=-1\nindent_image6=-1\nspacer=\nend_spacer=\n\n', 1, 0, ''),
(30, 'Banners', '', 1, 'banner', 62, '2009-03-05 14:19:19', 0, 'mod_banners', 0, 0, 0, 'target=1\ncount=1\ncid=1\ncatid=33\ntag_search=0\nordering=random\nheader_text=\nfooter_text=\nmoduleclass_sfx=\ncache=1\ncache_time=15\n\n', 1, 0, ''),
(32, 'Wrapper', '', 18, 'left', 0, '0000-00-00 00:00:00', 0, 'mod_wrapper', 0, 0, 1, '', 0, 0, ''),
(33, 'Footer', '', 3, 'footer', 0, '0000-00-00 00:00:00', 0, 'mod_footer', 0, 0, 0, 'cache=1\n\n', 1, 0, ''),
(34, 'Feed Display', '', 19, 'left', 0, '0000-00-00 00:00:00', 0, 'mod_feed', 0, 0, 1, '', 1, 0, ''),
(35, 'Breadcrumbs', '', 0, 'breadcrumbs', 0, '0000-00-00 00:00:00', 0, 'mod_breadcrumbs', 0, 0, 1, 'showHome=1\nhomeText=Home\nshowLast=1\nseparator=\nmoduleclass_sfx=\ncache=0\n\n', 1, 0, ''),
(36, 'Syndication', '', 6, 'left', 0, '0000-00-00 00:00:00', 0, 'mod_syndicate', 0, 0, 0, 'cache=0\ntext=Feed Entries\nformat=rss\nmoduleclass_sfx=\n\n', 1, 0, ''),
(42, 'Sub Menu', '', 12, 'right', 62, '2010-07-20 17:27:07', 0, 'mod_mainmenu', 0, 0, 1, 'menutype=mainmenu\nmenu_style=list\nstartLevel=1\nendLevel=5\nshowAllChildren=0\nwindow_open=\nshow_whitespace=0\ncache=0\ntag_id=\nclass_sfx=menu-accordion images-off\nmoduleclass_sfx=style-menu\nmaxdepth=10\nmenu_images=0\nmenu_images_align=0\nmenu_images_link=0\nexpand_menu=0\nactivate_parent=0\nfull_active_id=0\nindent_image=0\nindent_image1=\nindent_image2=\nindent_image3=\nindent_image4=\nindent_image5=\nindent_image6=\nspacer=\nend_spacer=\n\n', 0, 0, ''),
(177, 'Footer Menu', '', 1, 'footer', 0, '0000-00-00 00:00:00', 0, 'mod_mainmenu', 0, 0, 0, 'menutype=topmenu\nmenu_style=list\nstartLevel=0\nendLevel=0\nshowAllChildren=0\nwindow_open=\nshow_whitespace=0\ncache=0\ntag_id=\nclass_sfx=\nmoduleclass_sfx=menu\nmaxdepth=10\nmenu_images=0\nmenu_images_align=0\nmenu_images_link=0\nexpand_menu=0\nactivate_parent=0\nfull_active_id=0\nindent_image=0\nindent_image1=-1\nindent_image2=-1\nindent_image3=-1\nindent_image4=-1\nindent_image5=-1\nindent_image6=-1\nspacer=\nend_spacer=\n\n', 0, 0, ''),
(41, 'Welcome to Joomla!', '<div style="padding: 5px"><p>Congratulations on choosing Joomla! as your content management system. We hope you are able to create a successful Web site with our program and maybe you will be able to give something back to the community later.</p><p>To make your start with Joomla! as smooth as possible, we want to give you some pointers to documentation, common questions and help on securing your server. A good place to start is the &quot;<a href="http://forum.joomla.org/index.php/topic,47524.0.html" target="_blank">Absolute Beginners Guide to Joomla!</a>&quot;.</p><p>For your most common questions the best place to start looking for answers is the <a href="http://help.joomla.org/component/option,com_easyfaq/Itemid,268/" target="_blank">Frequently Asked Questions (FAQ)</a> area.  If you are stuck on a particular screen in the Administration area of Joomla! (which is where you are now), then try clicking on the Help toolbar button which you will find on almost all screens.  This will take you to a page about that screen on our <a href="http://help.joomla.org" target="_blank">Help Site</a>.  If you still have questions then take a look on our <a href="http://forum.joomla.org" target="_blank">forum</a> which is most likely the biggest resource on Joomla! there is and you will find almost every question answered at least once, so please try using the search function before asking your question.</p><p>Security is a big concern for us, which is why we would like you to subscribe to the <a href="http://forum.joomla.org/index.php/board,8.0.html" target="_blank">announcement forum</a> (by clicking on the Notify button) to always get the latest information on new releases for Joomla! You should also read the <a href="http://help.joomla.org/component/option,com_easyfaq/task,view/id,167/Itemid,268/" target="_blank">Joomla! Administrator''s Security Checklist</a> and regularly check the <a href="http://forum.joomla.org/index.php/board,267.0.html" target="_blank">security forum</a>.</p><p>We hope you have much fun and success with Joomla! and hope to see you in the forum among the hundreds and thousands of contributors.</p><p>Your Joomla! team.<img alt="Smile" border="0" src="../plugins/editors/tinymce/jscripts/tiny_mce/plugins/emotions/images/smiley-smile.gif" title="Smile" /></p><p>P.S.: To remove this message, delete the &quot;Welcome to Joomla!&quot; Module in the Administrator screen of the Module Manager (on the Extensions menu).  Here is a <a href="index.php?option=com_modules&amp;client=1">quick link</a> to this screen.</p></div>', 1, 'cpanel', 0, '0000-00-00 00:00:00', 0, 'mod_custom', 0, 2, 1, 'moduleclass_sfx=\n\n', 1, 1, ''),
(46, 'YOOlogin (Default)', '', 0, 'headerright', 0, '0000-00-00 00:00:00', 1, 'mod_yoo_login', 0, 0, 0, 'style=niftyquick\npretext=\nposttext=\nlogin=51\nlogout=200\ngreeting=1\ntext_mode=input\nlogin_button=icon\nlogout_button=text\nauto_remember=1\nlost_password=1\nlost_username=1\nregistration=0\nmoduleclass_sfx=\ncache=1\ncache_time=900\n\n', 0, 0, ''),
(51, 'Dogear', '<div style="position: absolute; z-index: 20; top: 0px; left: 0px; width: 135px; height: 135px;"><a href="http://www.yootheme.com" target="_blank" title="YOOtheme"><img class="correct-png" style="width: 135px; height: 135px;" src="images/yootheme/absolute_yoodogear.png" alt="YOOtheme" /></a></div>', 0, 'absolute', 0, '0000-00-00 00:00:00', 0, 'mod_custom', 0, 0, 0, 'moduleclass_sfx=\n\n', 0, 0, ''),
(52, 'SLIDE PHOTO KEGIATAN', '<p>Lorem ipsum dolor sit amet. Used Module Class Suffix: <em class="box">style-box </em>Lorem ipsum dolor sit amet. Used Module Class Suffix: <em class="box">style-box</em></p>', 1, 'contenttop', 0, '0000-00-00 00:00:00', 0, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=\n\n', 0, 0, ''),
(53, 'Content Top 2', '<p>Lorem ipsum dolor sit amet. Used Module Class Suffix: <em class="box">style-box</em></p>', 5, 'contenttop', 0, '0000-00-00 00:00:00', 0, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=\n\n', 0, 0, ''),
(156, 'Validating Code', '<p>This template validates to XHTML and CSS web standards and is designed to be compatible with all modern browsers.</p>\r\n<p>\r\n  <img class="correct-png" style="margin-right: 10px" src="images/yootheme/browser_firefox.png" alt="Firefox 3.0+" title="Firefox 3.0+" width="20" height="20" />\r\n  <img class="correct-png" style="margin-right: 10px" src="images/yootheme/browser_ie7.png" alt="Internet Explorer 7+" title="Internet Explorer 7+" width="20" height="20" />\r\n  <img class="correct-png" style="margin-right: 10px" src="images/yootheme/browser_safari.png" alt="Safari 3.1+" title="Safari 3.1+" width="20" height="20" />\r\n  <img class="correct-png" style="margin-right: 10px" src="images/yootheme/browser_opera.png" alt="Opera 9.5+" title="Opera 9.5+" width="20" height="20" />\r\n  <img class="correct-png" style="margin-right: 10px" src="images/yootheme/browser_camino.png" alt="Camino 1.0+" title="Camino 1.0+" width="20" height="20" />\r\n  <img class="correct-png" style="margin-right: 10px" src="images/yootheme/browser_konqueror.png" alt="Konqueror" title="Konqueror" width="20" height="20" />\r\n  <img class="correct-png" style="margin-right: 10px" src="images/yootheme/browser_chrome.png" alt="Chrome 1.0+" title="Chrome 1.0+" width="20" height="20" />\r\n</p>', 11, 'right', 62, '2010-07-20 17:29:04', 0, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=\n\n', 0, 0, ''),
(155, 'Javascript Library', 'All client side effects use the JavaScript framework <a href="http://www.mootools.net" target="_blank">MooTools</a> which offers most reliable functionality and compact size!', 10, 'right', 62, '2010-07-20 17:29:08', 0, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=\n\n', 0, 0, ''),
(56, 'Login || module position', '', 0, 'menu', 0, '0000-00-00 00:00:00', 0, 'mod_yoo_login', 0, 0, 0, 'style=niftyquick\npretext=\nposttext=\nlogin=\nlogout=\ngreeting=1\ntext_mode=input\nlogin_button=icon\nlogout_button=icon\nauto_remember=1\nlost_password=1\nlost_username=1\nregistration=1\nmoduleclass_sfx=dropdownwidth-310\ncache=0\ncache_time=900\n\n', 0, 0, ''),
(57, 'SEKILAS YAYASAN', '<p style="margin-bottom: 0.0001pt; line-height: normal;"><b><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';"><img style="float: left;" alt="logo" src="images/logo.png" height="135" width="135" /></span></b><b><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">Akta Notaris : <span style="font-size: 12pt;">Mirda Octaviani SH. M.kn No. 1 (04 Pebruari 2010)</span></span></b></p>\r\n<p style="margin-bottom: 0.0001pt; line-height: normal;"><b><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';"><span style="font-size: 12pt;">SK MENTERI HUKUM DAN HAK ASASI MANUSIA (HAM) No. <span style="font-size: 12pt;">AHU-1266.AH.01.04 Tahun 2010</span></span></span></b></p>\r\n<p style="margin-bottom: 0.0001pt; line-height: normal;"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';"><span style="font-size: 12pt;">Yayasan Al-Ikhlas Citra Utama bergerak dalam bidang Pendidikan, Divisi Usaha, Badan Wakaf, Wada</span></span><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';"><span style="font-size: 12pt;">h Pengembangan Potensi Siswa-Siswi Isalmi, Teknologi, Pemberdayaan Masyarakat, Sosial serta Ukhuwah Islamiyah.</span></span><b><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';"><span style="font-size: 12pt;"></span></span></b></p>', 0, 'contentbottom', 63, '2011-09-13 17:14:04', 1, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=style-box\n\n', 0, 0, ''),
(58, 'Skyscraper', '', 2, 'banner', 0, '0000-00-00 00:00:00', 0, 'mod_custom', 0, 0, 0, 'moduleclass_sfx=\n\n', 0, 0, ''),
(59, 'Content Bottom 2', 'Lorem ipsum dolor sit amet. Used Module Class Suffix: <em class="box">style-box</em>', 2, 'contentbottom', 0, '0000-00-00 00:00:00', 1, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=style-box\n\n', 0, 0, ''),
(61, 'MTs AL-IKHLAS', '<p style="text-align: justify;"><span style="font-size: 12pt; line-height: 115%; font-family: ''Times New Roman'',''serif'';">Kebut</span><span class="floatbox" style="font-size: 12pt; line-height: 115%; font-family: ''Times New Roman'',''serif'';"><img style="float: left;" alt="logo" src="images/M_images/alikhlas/logo.png" height="127" width="127" /></span><span style="font-size: 12pt; line-height: 115%; font-family: ''Times New Roman'',''serif'';">uhan sekolah setingkat SLTP, disekitar lingkungan yayasan Al Ikhlas dan sekitarnya sangatlah dibutuhkan oleh karena itu kami dengan sumber daya yang tersedia memulai untuk merintis pend</span><span class="floatbox" style="font-size: 12pt; line-height: 115%; font-family: ''Times New Roman'',''serif'';"></span><span style="font-size: 12pt; line-height: 115%; font-family: ''Times New Roman'',''serif'';">irian MTs</span></p>\r\n<p style="text-align: justify;"><span style="font-size: 12pt; line-height: 115%; font-family: ''Times New Roman'',''serif'';">Selengkapnya<br /></span></p>', 1, 'bottom', 0, '0000-00-00 00:00:00', 0, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=style-box\n\n', 0, 0, ''),
(62, 'ROUDHOTUL ATHFAL', '<p>Lorem ipsum dolor sit amet. Used Module Class Suffix: <em class="box">style-embedded</em></p>', 6, 'bottom', 0, '0000-00-00 00:00:00', 0, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=style-box\n\n', 0, 0, ''),
(176, 'ZOO 2.0', '<a href="http://zoo.yootheme.com" target="_blank" style="display: block; text-align: center;">\r\n<img class="correct-png" src="images/yootheme/icon_zoo.png" alt="A flexible and powerful content application builder to manage your content" title="A flexible and powerful content application builder to manage your content" width="140" height="130" />\r\n</a>\r\n<p>A flexible and powerful content application builder to manage your content. Get <a href="http://zoo.yootheme.com" target="_blank">ZOO 2.0</a>.</p>', 8, 'right', 0, '0000-00-00 00:00:00', 0, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=style-box\n\n', 0, 0, ''),
(63, 'MADRASAH DINIYAH', '<p>Lorem ipsum dolor sit amet. Used Module Class Suffix: <em class="box">style-embedded</em></p>', 5, 'bottom', 0, '0000-00-00 00:00:00', 0, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=style-box\n\n', 0, 0, ''),
(64, 'Bottom  4', 'Lorem ipsum dolor sit amet sed tempor. Used Module Class Suffix: <em class="box">style-embedded</em>', 11, 'bottom', 0, '0000-00-00 00:00:00', 1, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=\n\n', 0, 0, ''),
(68, 'Left 1', 'Lorem ipsum dolor sit amet. Used Module Class Suffix: <em class="box">style-line</em> <em class="box">color-highlight</em> <em class="box">icon-mail</em>', 11, 'left', 0, '0000-00-00 00:00:00', 1, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=style-box color-highlight icon-mail\n\n', 0, 0, ''),
(180, 'Polaroid', 'Lorem ipsum dolor sit amet consect adipisic elit. Used Module Class Suffix: style-polaroid', 13, 'left', 0, '0000-00-00 00:00:00', 1, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=style-polaroid\n\n', 0, 0, ''),
(181, 'Post It', 'Lorem ipsum dolor sit amet consect adipisic elit. Used Module Class Suffix: style-postit', 15, 'contentright', 0, '0000-00-00 00:00:00', 1, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=style-postit\n\n', 0, 0, ''),
(182, 'Left 2', 'Lorem ipsum dolor sit amet. Used Module Class Suffix: <em class="box">style-line</em> <em class="box">color-dark</em> <em class="box">icon-twitter</em>', 12, 'left', 0, '0000-00-00 00:00:00', 1, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=style-box color-dark icon-twitter\n\n', 0, 0, ''),
(89, 'Top Block || Sub Title', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Used Module Class Suffix: <em class="box">style-glass</em></p>', 0, 'topblock', 0, '0000-00-00 00:00:00', 0, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=style-glass\n\n', 0, 0, ''),
(72, 'Logo', '<p><img style="float: left;" alt="header yayasan" src="images/logo-web/header_yayasan.png" height="97" width="414" /></p>', 0, 'logo', 0, '0000-00-00 00:00:00', 1, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=\n\n', 0, 0, ''),
(136, 'Sample Flags', '<p><img class="correct-png" src="images/yootheme/toolbar_flags.png" border="0" alt="Languages" width="123" height="15" style="margin-top: 6px;" /></p>', 0, 'toolbarright', 0, '0000-00-00 00:00:00', 0, 'mod_custom', 0, 0, 0, 'moduleclass_sfx=\n\n', 0, 0, ''),
(73, 'Content Right 2', 'Lorem ipsum dolor sit amet. Used Module Class Suffix: <em class="box">style-line</em>', 13, 'contentright', 0, '0000-00-00 00:00:00', 1, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=style-line\n\n', 0, 0, ''),
(75, 'Top 1', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do. Used Module Class Suffix: <em class="box">style-glow</em> <em class="box">badge-hot</em></p>', 11, 'top', 63, '2011-09-09 09:18:05', 0, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=style-glow badge-hot\n\n', 0, 0, ''),
(76, 'Top 2', '<p>Lorem ipsum dolor sit amet. Used Module Class Suffix: <em class="box">style-glow</em> <em class="box">badge-new</em></p>', 12, 'top', 63, '2011-09-09 09:18:12', 0, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=style-glow badge-new\n\n', 0, 0, ''),
(77, 'Top 3', 'Lorem ipsum dolor sit amet. Used Module Class Suffix: <em class="box">style-glow</em> <em class="box">color-templatecolor</em> <em class="box">badge-pick</em>', 13, 'top', 0, '0000-00-00 00:00:00', 0, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=style-glow color-templatecolor badge-pick\n\n', 0, 0, ''),
(78, 'Top 4', '<p>Lorem ipsum dolor sit amet sed tempor. Used Module Class Suffix: <em class="box">style-glow</em> <em class="box">color-templatecolor</em> <em class="box">badge-top</em></p>', 0, 'top', 63, '2011-09-09 09:06:06', 0, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=style-glow color-templatecolor badge-top\n\n', 0, 0, ''),
(121, 'Bottom (YOOtools)', '<a href="http://tools.yootheme.com" target="_blank" style="display: block; text-align: center; padding-top: 5px;">\r\n  <img class="correct-png" src="images/yootheme/bottom_yootools.png" alt="Visit the YOOtools website!" title="Visit the YOOtools website!" width="127" height="35" />\r\n</a>', 8, 'bottom', 0, '0000-00-00 00:00:00', 0, 'mod_custom', 0, 0, 0, 'moduleclass_sfx=\n\n', 0, 0, ''),
(122, 'Warp5 Framework', 'This template is based on the fast and powerful Warp5 framework. We provide a comprehensive documentation how everything work.\r\n\r\n<p class="readmore"><a class="readmore" href="http://warp.yootheme.com/documentation" target="_blank">Take a look...</a></p>', 2, 'right', 0, '0000-00-00 00:00:00', 0, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=\n\n', 0, 0, ''),
(123, 'Module System', 'The module system provides a clear grid for Joomla modules and a wide diversity of templates for module variations.\r\n\r\n<p class="readmore"><a class="readmore" href="http://warp.yootheme.com/module-system" target="_blank">Read more...</a></p>', 5, 'right', 0, '0000-00-00 00:00:00', 0, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=\n\n', 0, 0, ''),
(82, 'Footer', 'Validates to <a href="http://validator.w3.org/check?uri=http://demo.yootheme.com/aug10" target="_blank">XHTML 1.0</a> and <a href="http://jigsaw.w3.org/css-validator/validator?uri=http://demo.yootheme.com/aug10&amp;profile=css3" target="_blank">CSS 3</a><br/>\r\nCopyright &copy; 2010 <a href="http://www.yootheme.com" target="_blank">YOOtheme</a>', 2, 'footer', 0, '0000-00-00 00:00:00', 0, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=\n\n', 0, 0, ''),
(83, 'Main Top 1', 'Lorem ipsum dolor sit amet, consectetur. Used Module Class Suffix: <em class="box">style-box</em> <em class="box">icon-lock</em>', 3, 'maintop', 0, '0000-00-00 00:00:00', 1, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=style-box icon-lock\n\n', 0, 0, ''),
(158, 'Bottom (ZOO)', '<a href="http://zoo.yootheme.com" target="_blank" style="display: block; text-align: center; padding-top: 5px;">\r\n  <img class="correct-png" src="images/yootheme/bottom_zoo.png" alt="Visit the ZOO website!" title="Visit the ZOO website!" width="58" height="35" />\r\n</a>', 9, 'bottom', 0, '0000-00-00 00:00:00', 0, 'mod_custom', 0, 0, 0, 'moduleclass_sfx=\n\n', 0, 0, ''),
(87, 'Other Menu', '', 5, 'contentright', 0, '0000-00-00 00:00:00', 0, 'mod_mainmenu', 0, 0, 1, 'menutype=othermenu\nmenu_style=list\nstartLevel=0\nendLevel=5\nshowAllChildren=0\nwindow_open=\nshow_whitespace=0\ncache=0\ntag_id=\nclass_sfx=menu-accordion\nmoduleclass_sfx=style-menu\nmaxdepth=10\nmenu_images=0\nmenu_images_align=0\nmenu_images_link=0\nexpand_menu=0\nactivate_parent=0\nfull_active_id=0\nindent_image=0\nindent_image1=\nindent_image2=\nindent_image3=\nindent_image4=\nindent_image5=\nindent_image6=\nspacer=\nend_spacer=\n\n', 0, 0, ''),
(84, 'Main Top 2', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt. Used Module Class Suffix: <em class="box">style-box</em> <em class="box">icon-download</em>', 4, 'maintop', 63, '2011-09-06 16:18:42', 1, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=style-box icon-download\n\n', 0, 0, ''),
(85, 'PEROLEHAN SEMENTARA WAKAF AL-IKHLAS', '<div>BADAN W<img style="float: left;" alt="logo-wakap" src="images/logo-wakap.png" height="100" width="99" />AKAF AL IKHLAS merupakan badan pengelola Kegiatan Sosial Yayasan Al Ikhlas Citra Utama yang terdiri dari : Pengembangan Yayasan mulai dari RA/TK, TP/TQA, MDA,MTs, Majlis Ta''lim, Panti Asuhan, Pondok Pesantren dan Al ikhlas Care.</div>\r\n<div class="floatbox" title="Selengkapnya"><span style="background-color: #008000; color: #ffffff;"></span><span style="background-color: #ffffff; color: #003300;">Penghasilan Sementara <span style="background-color: #ffffff; color: #003300;">»</span></span></div>', 0, 'mainbottom', 0, '0000-00-00 00:00:00', 0, 'mod_custom', 0, 0, 0, 'moduleclass_sfx=style-glow color-templatecolor icon-message\n\n', 0, 0, ''),
(86, 'Main Bottom 2', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt. Used Module Class Suffix: <em class="box">style-box</em> <em class="box">icon-users</em></p>', 2, 'mainbottom', 0, '0000-00-00 00:00:00', 0, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=style-box icon-users\n\n', 0, 0, ''),
(117, 'YOOcarousel (Frontpage)', '', 2, 'contenttop', 0, '0000-00-00 00:00:00', 0, 'mod_yoo_carousel', 0, 0, 0, 'catid=35\nstyle=slideshow\nmodule_width=630\nmodule_height=400\ntab_width=200\nautoplay=once\nslide_interval=6000\ntransition_duration=300\ntransition_effect=crossfade\ncontrol_panel=none\nrotate_action=mouseover\nrotate_duration=300\nrotate_effect=crossfade\nbuttons=1\norder=o_asc\nreadmore=0\nitems=10\nmoduleclass_sfx=style-blank\ncache=0\ncache_time=900\n\n', 0, 0, ''),
(91, 'Bottom Block', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Used Module Class Suffix: <em class="box">style-glow</em>', 0, 'bottomblock', 0, '0000-00-00 00:00:00', 1, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=style-glow\n\n', 0, 0, ''),
(175, 'Teamlog', '<a href="http://teamlog.yootheme.com" target="_blank" style="display: block; text-align: center;">\r\n<img class="correct-png" src="images/yootheme/icon_teamlog.png" alt="Web based Time Tracking Solution for Joomla! 1.5 focused on simplicity" title="Web based Time Tracking Solution for Joomla! 1.5 focused on simplicity" width="140" height="150" />\r\n</a>\r\n<p>Web based Time Tracking Solution for Joomla! 1.5 focused on simplicity. Get the <a href="http://teamlog.yootheme.com" target="_blank">Teamlog extension</a> for free.</p>', 9, 'right', 0, '0000-00-00 00:00:00', 0, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=style-box color-dark\n\n', 0, 0, ''),
(125, 'YOOsearch', '', 2, 'search', 0, '0000-00-00 00:00:00', 0, 'mod_yoo_search', 0, 0, 0, 'style=default\nbox_width=280\nchar_limit=130\nres_limit=6\ncat_limit=6\ncategories={cat\\ntitle=[YOOtheme]\\nimage=[yootheme/yoosearch/yootheme.png]\\nurl=[http://www.yootheme.com]\\nkeywords=[yootheme, template, templates, themes, theme]\\n}The YOOtheme template club for Joomla 1.0 and 1.5 offers stylish templates with professional Web 2.0 features.{/cat}\\n\\n{cat\\ntitle=[YOOtools]\\nimage=[yootheme/yoosearch/yootools.png]\\nurl=[http://www.yootools.com]\\nkeywords=[yootheme, yootools, features, feature, yoospotlight, yooreflection, yoolightbox, yoocarousel, yooaccordion, yooslider, yoodrawer, yooscroller, yoomaps, yoosearch, yooeffects, yootoppanel, yoologin, yootooltip, yoosnapshots, spotlight, reflection, lightbox, carousel, accordion, slider, drawer, scroller, maps, search, effects, toppanel, login, tooltip, snapshots]}The YOOtools are new YOOtheme extensions for Joomla 1.0 and 1.5. Exclusive YOOtheme modules, compontent and plugins!{/cat}\\n\\n{cat\\ntitle=[Typography]\\nurl=[index.php?option=com_content&view=article&id=46&Itemid=55]\\nimage=[yootheme/yoosearch/typography.png]\\nkeywords=[typography, joomla, style, stylings, HTML, tag]\\n}Take a look at the typography, the style guide and learn all about the possible HTML tag stylings of this YOOtheme templates.{/cat}\\n\\n{cat\\ntitle=[Layout]\\nimage=[yootheme/yoosearch/layout.png]\\nurl=[index.php?option=com_content&view=article&id=47&Itemid=56]\\nkeywords=[layout, joomla, module, position, positions, variation, variations]\\n}Take a look at the layout options and all possible module positions and variations of this YOOtheme template.{/cat}\\n\\n{cat\\ntitle=[Joomla]\\nimage=[yootheme/yoosearch/joomla.png]\\nurl=[index.php?option=com_content&view=frontpage&Itemid=1]\\nkeywords=[joomla]\\n}Take a look at how this YOOtheme template styles the Joomla core articles, components and modules.{/cat}\nmoduleclass_sfx=-blank\ncache=0\ncache_time=900\n\n', 0, 0, ''),
(118, 'Bottom (YOOtheme)', '<a href="http://www.yootheme.com" target="_blank" style="display: block; text-align: center; padding-top: 5px;">\r\n  <img class="correct-png" src="images/yootheme/bottom_yootheme.png" alt="Visit the YOOtheme website!" title="Visit the YOOtheme website!" width="150" height="35" />\r\n</a>', 7, 'bottom', 0, '0000-00-00 00:00:00', 0, 'mod_custom', 0, 0, 0, 'moduleclass_sfx=\n\n', 0, 0, ''),
(124, 'Menu System', 'The menu system enhances Joomla''s menu functions to create clearly arranged interfaces even for comprehensive sites.\r\n\r\n<p class="readmore"><a class="readmore" href="http://warp.yootheme.com/menu-system" target="_blank">Read more...</a></p>', 4, 'right', 0, '0000-00-00 00:00:00', 0, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=\n\n', 0, 0, ''),
(134, 'YOOiecheck', '', 2, 'absolute', 0, '0000-00-00 00:00:00', 1, 'mod_yoo_iecheck', 0, 0, 0, 'message=You are using Internet Explorer 6. Please upgrade your browser to increase safety and your browsing experience. Choose one of the following links to download a modern browser:\nfirefox=1\nsafari=1\nopera=1\nie=1\nmoduleclass_sfx=-blank\n\n', 0, 0, ''),
(151, 'Fireworks Files', '<div style="overflow: hidden;">\r\n<img height="40" width="42" align="right" src="/YOOtheme/Templates/Next/Website/images/yootheme/top_fireworks.png" alt="Fully sliced Fireworks .png files" title="Fully sliced Fireworks .png files" style="margin-left: 10px;" class="correct-png"/>Fully sliced Fireworks PNGs for customizations.\r\n</div>', 6, 'maintop', 0, '0000-00-00 00:00:00', 0, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=\n\n', 0, 0, ''),
(150, 'YOOtools', '<div style="overflow: hidden">\r\n<img class="correct-png" style="margin-left: 10px;" width="55" height="42" align="right" title="Native version for Joomla 1.5" alt="Native version for Joomla 1.5" src="images/yootheme/top_yootools.png" />This template is fully compatible with all <a href="http://www.yootools.com" target="_blank">YOOtools</a>\r\n</div>', 7, 'maintop', 0, '0000-00-00 00:00:00', 0, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=\n\n', 0, 0, ''),
(178, 'Feeds', '<a class="twitter" title="Follow us on Twitter" href="http://twitter.com/yootheme" target="_blank"><img height="25" width="25" alt="Follow us on Twitter" src="images/yootheme/toolbar_twitter.png" class="correct-png" /></a>\r\n<a class="rss" title="Subscribe to our RSS feed" href="http://www.yootheme.com/rss" target="_blank"><img height="25" width="25" alt="Subscribe to our RSS feed" src="images/yootheme/toolbar_feed.png" class="correct-png" /></a>', 0, 'toolbarright', 0, '0000-00-00 00:00:00', 0, 'mod_custom', 0, 0, 0, 'moduleclass_sfx=\n\n', 0, 0, ''),
(168, 'Latest Tweet', '', 0, 'headerright', 0, '0000-00-00 00:00:00', 0, 'mod_yoo_tweet', 0, 0, 0, 'style=single\nfrom_user=yootheme\nto_user=\nref_user=\nhashtag=\nword=\nimage=0\nauthor=0\ndate=0\nimage_size=42\nnum_tweets=5\nmoduleclass_sfx=style-headerbar\ncache=0\ncache_time=15\n\n', 0, 0, ''),
(183, 'Frontpage Menu', '', 1, 'right', 0, '0000-00-00 00:00:00', 0, 'mod_mainmenu', 0, 0, 1, 'menutype=frontpagemenu\nmenu_style=list\nstartLevel=0\nendLevel=0\nshowAllChildren=0\nwindow_open=\nshow_whitespace=0\ncache=0\ntag_id=\nclass_sfx=menu-accordion\nmoduleclass_sfx=style-menu\nmaxdepth=10\nmenu_images=0\nmenu_images_align=0\nmenu_images_link=0\nexpand_menu=0\nactivate_parent=0\nfull_active_id=0\nindent_image=0\nindent_image1=\nindent_image2=\nindent_image3=\nindent_image4=\nindent_image5=\nindent_image6=\nspacer=\nend_spacer=\n\n', 0, 0, ''),
(170, 'Content Left', 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.', 1, 'contentleft', 62, '2010-05-25 12:46:04', 0, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=\n\n', 0, 0, ''),
(171, 'Content Right 1', 'Lorem ipsum dolor sit amet. Used Module Class Suffix: <em class="box">style-line</em>', 12, 'contentright', 0, '0000-00-00 00:00:00', 1, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=\n\n', 0, 0, ''),
(228, 'Frontpage Movie', '<p><a href="http://zoo.yootheme.com/app-bundle/movie" target="_blank" style="display: block; text-align: center; text-decoration: none;"> <img src="images/yootheme/home_zoo_movie.png" alt="Create great review resource of your favorite movies" title="Create great review resource of your favorite movies" height="85" width="100" /> <span style="display: block; font-size: 16px; line-height: 18px; text-transform: uppercase; margin-top: 5px;">Movie<br />Database</span> </a></p>', 4, 'top', 63, '2011-09-09 09:16:50', 0, 'mod_custom', 0, 0, 0, 'moduleclass_sfx=style-glass\n\n', 0, 0, ''),
(202, 'ZOO Item', '', 10, 'contentright', 0, '0000-00-00 00:00:00', 1, 'mod_zooitem', 0, 0, 1, 'theme=list-v\nlayout=default\nmedia_position=left\napplication=1\nmode=types\ncategory=\ntype=article\nitem_id=0\nsubcategories=0\ncount=4\norder=alpha\nmenu_item=187\nmoduleclass_sfx=\n\n', 0, 0, ''),
(203, 'ZOO Comment', '', 11, 'contentright', 0, '0000-00-00 00:00:00', 1, 'mod_zoocomment', 0, 0, 1, 'theme=bubble-angled-vl\napplication=1\ncategory=\nsubcategories=1\ncount=4\nshow_avatar=1\navatar_size=40\nshow_author=1\nshow_meta=1\nmoduleclass_sfx=\n\n', 0, 0, ''),
(204, 'ZOO Tag', '', 8, 'contentright', 0, '0000-00-00 00:00:00', 1, 'mod_zootag', 0, 0, 1, 'theme=cloud\napplication=1\ncount=10\norder=alpha\nmenu_item=187\nmoduleclass_sfx=\n\n', 0, 0, ''),
(190, 'ZOO Not Included', '<div class="alert">The displayed content is part of the app bundle for ZOO 2.0 and only shown for demonstration purpose. The app bundle is NOT included when purchasing this template. However you can download ZOO 2.0 at <a href="http://zoo.yootheme.com" target="_blank">http://zoo.yootheme.com</a>.</div>', 2, 'topblock', 0, '0000-00-00 00:00:00', 0, 'mod_custom', 0, 0, 0, 'moduleclass_sfx=style-blank\n\n', 0, 0, ''),
(191, 'Content Right 3', 'Lorem ipsum dolor sit amet. Used Module Class Suffix: <em class="box">style-line</em>', 14, 'contentright', 0, '0000-00-00 00:00:00', 1, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=\n\n', 0, 0, ''),
(205, 'ZOO Category', '', 9, 'contentright', 0, '0000-00-00 00:00:00', 1, 'mod_zoocategory', 0, 0, 1, 'theme=flatlist\napplication=1\ncategory=\ndepth=0\nmenu_item=187\nmoduleclass_sfx=\n\n', 0, 0, ''),
(212, 'ZOO 2.0 News', '<ul class="links" style="margin: 0;">\r\n<li><a href="http://www.yootheme.com/blog/item/root/zoo-20-beta-released" target="_blank">Complete feature list</a></li>\r\n<li><a href="http://www.yootheme.com/blog/item/root/native-comments-for-zoo-20" target="_blank">Native comment system</a></li>\r\n<li><a href="http://www.yootheme.com/blog/item/root/zoo-20-frequently-asked-questions" target="_blank">Frequently Asked Questions</a></li>\r\n<li><a href="http://www.yootheme.com/blog/item/root/zoo-20-element-updates" target="_blank">Element Updates</a></li>\r\n<li><a href="http://www.yootheme.com/blog/item/root/zoo-20-usability" target="_blank">Usability Improvements</a></li>\r\n<li><a href="http://www.yootheme.com/blog/item/root/the-zoo-20-app-concept" target="_blank">The App Concept</a></li>\r\n<li><a href="http://www.yootheme.com/blog/item/root/announcing-zoo-20" target="_blank">Announcing ZOO 2.0</a></li>\r\n</ul>', 3, 'right', 62, '2010-07-20 17:28:30', 0, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=\n\n', 0, 0, ''),
(214, 'Bottom (Warp)', '<a href="http://warp.yootheme.com" target="_blank" style="display: block; text-align: center; padding-top: 5px;">\r\n  <img class="correct-png" src="images/yootheme/bottom_warp.png" alt="Visit the Warp5 website!" title="Visit the Warp5 website!" width="91" height="35" />\r\n</a>', 10, 'bottom', 0, '0000-00-00 00:00:00', 0, 'mod_custom', 0, 0, 0, 'moduleclass_sfx=\n\n', 0, 0, ''),
(224, 'Native Tools for ZOO', '', 5, 'top', 63, '2011-09-09 09:17:03', 1, 'mod_yoo_scroller', 0, 0, 0, 'catid=36\nstyle=blank-h\nmodule_width=798\nmodule_height=180\nslide_size=159\nslide_interval=4000\nautoplay=1\norder=o_asc\nreadmore=0\nitems=8\nmoduleclass_sfx=style-glass\ncache=0\ncache_time=900\n\n', 0, 0, ''),
(225, 'Frontpage Cookbook', '<a href="http://zoo.yootheme.com/app-bundle/cookbook" target="_blank" style="display: block; text-align: center; text-decoration: none;">\r\n	<img src="images/yootheme/home_zoo_cookbook.png" width="100" height="85" alt="Create a great online Cookbook" title="Create a great online Cookbook" />\r\n	<span style="display: block; font-size: 16px; line-height: 18px; text-transform: uppercase; margin-top: 5px;">Online<br />Cookbook</span>\r\n</a>', 3, 'top', 63, '2011-09-09 09:16:43', 0, 'mod_custom', 0, 0, 0, 'moduleclass_sfx=style-glass\n\n', 0, 0, ''),
(226, 'Frontpage Business', '<a href="http://zoo.yootheme.com/app-bundle/business" target="_blank" style="display: block; text-align: center; text-decoration: none;">\r\n	<img src="images/yootheme/home_zoo_business.png" width="100" height="85" alt="Manage companies and their employees" title="Manage companies and their employees" />\r\n	<span style="display: block; font-size: 16px; line-height: 18px; text-transform: uppercase; margin-top: 5px;">Business<br />Directory</span>\r\n</a>', 2, 'top', 63, '2011-09-09 09:15:01', 0, 'mod_custom', 0, 0, 0, 'moduleclass_sfx=style-glass\n\n', 0, 0, ''),
(227, 'Frontpage Product', '<p><a href="http://zoo.yootheme.com/app-bundle/product" target="_blank" style="display: block; text-align: center; text-decoration: none;"> <img src="images/yootheme/home_zoo_product.png" alt="Clearly arranged catalog with many built-in features" title="Clearly arranged catalog with many built-in features" height="85" width="100" /> <span style="display: block; font-size: 16px; line-height: 18px; text-transform: uppercase; margin-top: 5px;">Product<br />Catalog</span> </a></p>', 0, 'top', 63, '2011-09-09 09:16:49', 0, 'mod_custom', 0, 0, 0, 'moduleclass_sfx=style-glass\n\n', 0, 0, ''),
(238, 'High quality icon sets', '<ul class="hoverbox" style="margin: 0;">\r\n<li>\r\n	<a href="http://icons.yootheme.com/icon-club#set6" target="_blank">\r\n		<span class="title">Homepage Icon Set</span>\r\n		<span class="subtitle">16 icons released in July 2010</span>\r\n	</a>\r\n</li>\r\n<li>\r\n	<a href="http://icons.yootheme.com/icon-club#set5" target="_blank">\r\n		<span class="title">Contact Icon Set</span>\r\n		<span class="subtitle">10 icons released in July 2010</span>\r\n	</a>\r\n</li>\r\n<li>\r\n	<a href="http://icons.yootheme.com/icon-club#set4" target="_blank">\r\n		<span class="title">Community Icon Set</span>\r\n		<span class="subtitle">12 icons released in July 2010</span>\r\n	</a>\r\n</li>\r\n<li>\r\n	<a href="http://icons.yootheme.com/icon-club#set3" target="_blank">\r\n		<span class="title">Actions Icon Set</span>\r\n		<span class="subtitle">16 icons released in July 2010</span>\r\n	</a>\r\n</li>\r\n<li>\r\n	<a href="http://icons.yootheme.com/icon-club#set2" target="_blank">\r\n		<span class="title">Symbols Icon Set</span>\r\n		<span class="subtitle">24 icons released in July 2010</span>\r\n	</a>\r\n</li>\r\n</ul>', 7, 'right', 0, '0000-00-00 00:00:00', 0, 'mod_custom', 0, 0, 0, 'moduleclass_sfx=\n\n', 0, 0, ''),
(239, 'Icon Set Homepage', '<a href="http://icons.yootheme.com/icon-club#set6" target="_blank" style="display: block; text-align: center; text-decoration: none;">\r\n	<img src="images/yootheme/icons_set06.png" width="128" height="85" alt="Homepage Icon Set" />\r\n	<span style="display: block; font-size: 16px; line-height: 18px; text-transform: uppercase; margin-top: 5px;">Homepage<br />Icon Set</span>\r\n</a>', 7, 'top', 63, '2011-09-09 09:17:10', 1, 'mod_custom', 0, 0, 0, 'moduleclass_sfx=style-glow color-templatecolor\n\n', 0, 0, ''),
(240, 'Icon Set Community', '<a href="http://icons.yootheme.com/icon-club#set4" target="_blank" style="display: block; text-align: center; text-decoration: none;">\r\n	<img src="images/yootheme/icons_set04.png" width="128" height="85" alt="Community Icon Set" />\r\n	<span style="display: block; font-size: 16px; line-height: 18px; text-transform: uppercase; margin-top: 5px;">Community<br />Icon Set</span>\r\n</a>', 8, 'top', 63, '2011-09-09 09:17:40', 1, 'mod_custom', 0, 0, 0, 'moduleclass_sfx=style-glow color-templatecolor\n\n', 0, 0, ''),
(241, 'Icon Set Actions', '<a href="http://icons.yootheme.com/icon-club#set3" target="_blank" style="display: block; text-align: center; text-decoration: none;">\r\n	<img src="images/yootheme/icons_set03.png" width="128" height="85" alt="Actions Icon Set" />\r\n	<span style="display: block; font-size: 16px; line-height: 18px; text-transform: uppercase; margin-top: 5px;">Actions<br />Icon Set</span>\r\n</a>', 9, 'top', 63, '2011-09-09 09:17:53', 1, 'mod_custom', 0, 0, 0, 'moduleclass_sfx=style-glow color-templatecolor\n\n', 0, 0, ''),
(242, 'Icon Set Symbols', '<a href="http://icons.yootheme.com/icon-club#set2" target="_blank" style="display: block; text-align: center; text-decoration: none;">\r\n	<img src="images/yootheme/icons_set02.png" width="128" height="85" alt="Symbols Icon Set" />\r\n	<span style="display: block; font-size: 16px; line-height: 18px; text-transform: uppercase; margin-top: 5px;">Symbols<br />Icon Set</span>\r\n</a>', 10, 'top', 63, '2011-09-09 09:17:59', 1, 'mod_custom', 0, 0, 0, 'moduleclass_sfx=style-glow color-templatecolor\n\n', 0, 0, ''),
(279, 'Vinaora Cu3er 3D SlideShow', '', 0, 'contenttop', 0, '0000-00-00 00:00:00', 1, 'mod_vinaora_cu3er', 0, 0, 0, 'moduleclass_sfx=\nconfig_code=V279_20110913_071631.xml\nconfig_custom=-1\nslide_panel_width=600\nslide_panel_height=380\nslide_panel_horizontal_align=left\nslide_panel_vertical_align=top\nui_visibility_time=3\nslide_dir=Slider\nslide_url=\nslide_link=\nslide_link_target=\nslide_description_heading=\nslide_description_paragraph=\nslide_description_link=\nslide_description_link_target=\ntransition_type=auto\ntransition_num=\ntransition_slicing=\ntransition_direction=\ntransition_duration=\ntransition_delay=\ntransition_shader=\ntransition_light_position=\ntransition_cube_color=\ntransition_z_multiplier=\nenable_description_box=0\nswffont=-1\ndescription_round_corners=0, 0, 0, 0\ndescription_heading_font=Georgia\ndescription_heading_text_size=18\ndescription_heading_text_color=0x000000\ndescription_heading_text_align=left\ndescription_heading_text_margin=10 , 25 , 0 , 25\ndescription_heading_text_leading=0\ndescription_heading_text_letterSpacing=0\ndescription_paragraph_font=Arial\ndescription_paragraph_text_size=12\ndescription_paragraph_text_color=0x000000\ndescription_paragraph_text_align=left\ndescription_paragraph_text_margin=5, 25, 0, 25\ndescription_paragraph_text_leading=0\ndescription_paragraph_text_letterSpacing=0\nenable_auto_play=1\nauto_play_symbol=circular\nauto_play_time_defaults=5\nenable_preloader=1\npreloader_symbol=circular\nenable_prev_button=1\nprev_button_round_corners=0, 0, 0, 0\nenable_prev_symbol=1\nprev_symbol_type=3\nenable_next_button=1\nnext_button_round_corners=0, 0, 0, 0\nenable_next_symbol=1\nnext_symbol_type=3\nenable_debug=0\ndebug_x=5\ndebug_y=5\ncache=1\ncache_time=900\nswfobject=i2.2\ndescription_time=\ndescription_delay=\ndescription_x=\ndescription_y=\ndescription_width=\ndescription_height=\ndescription_rotation=\ndescription_alpha=\ndescription_tint=\ndescription_scaleX=\ndescription_scaleY=\nauto_play_time=\nauto_play_delay=\nauto_play_x=\nauto_play_y=\nauto_play_width=\nauto_play_height=\nauto_play_rotation=\nauto_play_alpha=\nauto_play_tint=\nauto_play_scaleX=\nauto_play_scaleY=\npreloader_time=\npreloader_delay=\npreloader_x=\npreloader_y=\npreloader_width=\npreloader_height=\npreloader_rotation=\npreloader_alpha=\npreloader_tint=\npreloader_scaleX=\npreloader_scaleY=\nprev_button_time=\nprev_button_delay=\nprev_button_x=\nprev_button_y=\nprev_button_width=\nprev_button_height=\nprev_button_rotation=\nprev_button_alpha=\nprev_button_tint=\nprev_button_scaleX=\nprev_button_scaleY=\nprev_symbol_time=\nprev_symbol_delay=\nprev_symbol_x=\nprev_symbol_y=\nprev_symbol_width=\nprev_symbol_height=\nprev_symbol_rotation=\nprev_symbol_alpha=\nprev_symbol_tint=\nprev_symbol_scaleX=\nprev_symbol_scaleY=\nnext_button_time=\nnext_button_delay=\nnext_button_x=\nnext_button_y=\nnext_button_width=\nnext_button_height=\nnext_button_rotation=\nnext_button_alpha=\nnext_button_tint=\nnext_button_scaleX=\nnext_button_scaleY=\nnext_symbol_time=\nnext_symbol_delay=\nnext_symbol_x=\nnext_symbol_y=\nnext_symbol_width=\nnext_symbol_height=\nnext_symbol_rotation=\nnext_symbol_alpha=\nnext_symbol_tint=\nnext_symbol_scaleX=\nnext_symbol_scaleY=\npretext=\nposttext=\n\n', 0, 0, ''),
(248, 'Content Bottom1', '<p><span style="font-size: 12pt; line-height: 115%; font-family: ''Times New Roman'',''serif'';">Kebutuhan sekolah setingkat SLTP, disekitar lingkungan yayasan Al Ikhlas dan sekitarnya sangatlah dibutuhkan oleh karena itu kami dengan sumber daya yang tersedia memulai untuk merintis pendirian MTs </span></p>', 0, 'contentbottom', 0, '0000-00-00 00:00:00', 0, 'mod_custom', 0, 0, 0, 'moduleclass_sfx=style-box\n\n', 0, 0, ''),
(249, 'Footer', '<div style="text-align: center;"><span style="font-size: 12pt; color: #3366ff;"><strong>YAYASAN AL-IKHLAS CITRA UTAMA</strong></span></div>\r\n<div style="text-align: center;"><span style="color: #3366ff; font-size: 11pt;">Jl. Raya Gunung Putri Selatan No 28 Ctr 16810; Telp :(021) 8762579 Kab. Bogor; e-mail <a href="mailto:alikhlas.citrautama@gmail.com"><span style="color: #3366ff;">alikhlas.citrautama@gmail.com</span></a></span></div>\r\n<div style="text-align: center;"><span style="color: #003300;"><span style="color: #003300;"><span style="font-size: 11pt; color: #3366ff;">www.alikhlascitrautama.com</span><br /></span></span></div>', 0, 'footer', 0, '0000-00-00 00:00:00', 1, 'mod_custom', 0, 0, 0, 'moduleclass_sfx=style-box\n\n', 0, 0, ''),
(256, 'RAUDHATUL ATHFAL', '', 3, 'bottom', 0, '0000-00-00 00:00:00', 1, 'mod_lv_enhanced_image_slider', 0, 0, 0, 'lveisWidth=265\nulHeight=220\nlveisFloat=none\nuseNav=0\nnavHeight=30\nnextbutton=0\nprevbutton=0\nlveisindex=0\neffectFx=all\ntimeout=4000\nspeed=800\npause=1\nrandom=1\nimageFolder=modules/mod_lv_enhanced_image_slider/images/demo/\nstretchImages=1\nuselinks=1\nlinktarget=_self\nuseModalbox=1\ntransparentBgColor=1\nlveis_bgcolor=FFFFFF\nlveisnav_bgcolor=333333\nlveisnav_bordercolor=111111\nlveisnav_a=888888\nlveisnav_ahover=FFFFFF\nlveisnav_aborder=282828\nlveisnav_aact=FFFFFF\nlveisnav_aactbg=222222\nlveisnav_aactborder=111111\nvariation=1\nuseCompression=1\nimageCentered=1\nslider_id=3\nmoduleclass_sfx=style-box\ncache=1\ncache_time=900\n\n', 0, 0, ''),
(254, 'MTs AL-IKHLAS', '', 2, 'bottom', 63, '2011-09-08 15:57:13', 1, 'mod_lv_enhanced_image_slider', 0, 0, 0, 'lveisWidth=260\nulHeight=220\nlveisFloat=left\nuseNav=0\nnavHeight=30\nnextbutton=0\nprevbutton=0\nlveisindex=0\neffectFx=all\ntimeout=4000\nspeed=800\npause=1\nrandom=1\nimageFolder=modules/mod_lv_enhanced_image_slider/images/demo/\nstretchImages=1\nuselinks=1\nlinktarget=_self\nuseModalbox=1\ntransparentBgColor=1\nlveis_bgcolor=FFFFFF\nlveisnav_bgcolor=333333\nlveisnav_bordercolor=111111\nlveisnav_a=888888\nlveisnav_ahover=FFFFFF\nlveisnav_aborder=282828\nlveisnav_aact=FFFFFF\nlveisnav_aactbg=222222\nlveisnav_aactborder=111111\nvariation=1\nuseCompression=1\nimageCentered=1\nslider_id=3\nmoduleclass_sfx=style-box\ncache=1\ncache_time=900\n\n', 0, 0, ''),
(255, 'MADRASAH DINIYAH', '', 4, 'bottom', 0, '0000-00-00 00:00:00', 1, 'mod_lv_enhanced_image_slider', 0, 0, 0, 'lveisWidth=263\nulHeight=220\nlveisFloat=none\nuseNav=0\nnavHeight=30\nnextbutton=0\nprevbutton=0\nlveisindex=0\neffectFx=all\ntimeout=4000\nspeed=800\npause=1\nrandom=1\nimageFolder=modules/mod_lv_enhanced_image_slider/images/demo/\nstretchImages=1\nuselinks=1\nlinktarget=_self\nuseModalbox=1\ntransparentBgColor=1\nlveis_bgcolor=FFFFFF\nlveisnav_bgcolor=333333\nlveisnav_bordercolor=111111\nlveisnav_a=888888\nlveisnav_ahover=FFFFFF\nlveisnav_aborder=282828\nlveisnav_aact=FFFFFF\nlveisnav_aactbg=222222\nlveisnav_aactborder=111111\nvariation=1\nuseCompression=1\nimageCentered=1\nslider_id=3\nmoduleclass_sfx=style-box\ncache=1\ncache_time=900\n\n', 0, 0, ''),
(280, 'Jshopping cart', '', 20, 'left', 0, '0000-00-00 00:00:00', 0, 'mod_jshopping_cart', 0, 0, 1, '', 0, 0, ''),
(281, 'PRODUCT USAHA', '', 3, 'contentright', 0, '0000-00-00 00:00:00', 1, 'mod_jshopping_latest_products', 0, 0, 0, 'count_products=1\nshow_image=1\ncatids=3\n\n', 0, 0, ''),
(282, 'PRODUCT USAHA', '', 4, 'contentright', 0, '0000-00-00 00:00:00', 1, 'mod_jshopping_latest_products', 0, 0, 0, 'count_products=5\nshow_image=1\ncatids=4\n\n', 0, 0, '');
INSERT INTO `jos_modules` (`id`, `title`, `content`, `ordering`, `position`, `checked_out`, `checked_out_time`, `published`, `module`, `numnews`, `access`, `showtitle`, `params`, `iscore`, `client_id`, `control`) VALUES
(283, 'Info Terkini', '', 0, 'mainbottom', 0, '0000-00-00 00:00:00', 1, 'mod_minifrontpage', 0, 0, 0, 'cache=0\nmoduleclass_sfx=style-glow color-templatecolor icon-message\nsections=7\ncategories=42\norder=0\norder_type=desc\nperiod=1200\nloadorder=0\ncat_title=0\ncat_title_link=0\nshow_front=1\nshow_title=1\ntitle_link=1\nshow_author=1\nshow_author_type=0\nshow_date=1\ndate_type=0\ndate_format=%d/%m/%Y\nlimit=200\nfulllink=+ Full Story\ncolumns=1\ncount=1\nnum_intro=2\nnum_intro_skip=0\nthumb_embed=1\nthumb_embed_default=1\nthumb_width=64\nthumb_height=64\naspect=0\nheader_title_links=Other Articles\n\n', 0, 0, ''),
(269, 'News Articles', '', 5, 'contentright', 0, '0000-00-00 00:00:00', 0, 'mod_latestnewsplusdate', 0, 0, 1, 'count=5\nordering=m_dsc\nuser_id=0\nshow_front=1\nsecid=\ncatid=\nmoduleclass_sfx=style-glow color-templatecolor\nshow_date=0\nshow_introtext=0\nshow_date_type=1\nthumb_embed=0\nthumb_width=64\nthumb_height=64\nlimit=200\nloadorder=0\naspect=0\nshow_date_in_introtext=1\nshow_more_in=1\nshow_more_type=1\ncache=1\ncache_time=900\n\n', 0, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `jos_modules_menu`
--

CREATE TABLE IF NOT EXISTS `jos_modules_menu` (
  `moduleid` int(11) NOT NULL default '0',
  `menuid` int(11) NOT NULL default '0',
  PRIMARY KEY  (`moduleid`,`menuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_modules_menu`
--

INSERT INTO `jos_modules_menu` (`moduleid`, `menuid`) VALUES
(1, 0),
(16, 1),
(16, 48),
(16, 49),
(16, 134),
(16, 135),
(16, 136),
(16, 138),
(16, 140),
(16, 141),
(16, 142),
(16, 145),
(16, 156),
(16, 157),
(16, 158),
(17, 1),
(18, 1),
(18, 48),
(18, 49),
(18, 134),
(18, 135),
(18, 136),
(18, 138),
(18, 140),
(18, 141),
(18, 142),
(18, 145),
(18, 156),
(18, 157),
(18, 158),
(19, 200),
(21, 53),
(22, 200),
(25, 200),
(27, 0),
(29, 0),
(30, 0),
(32, 0),
(33, 0),
(34, 0),
(35, 0),
(36, 0),
(39, 43),
(39, 44),
(39, 45),
(39, 46),
(39, 47),
(40, 0),
(42, 1),
(42, 48),
(42, 49),
(42, 134),
(42, 135),
(42, 136),
(42, 138),
(42, 140),
(42, 141),
(42, 142),
(42, 145),
(42, 156),
(42, 157),
(42, 158),
(46, 0),
(52, 200),
(53, 0),
(56, 0),
(57, 200),
(58, 53),
(59, 58),
(61, 200),
(62, 200),
(63, 200),
(64, 58),
(68, 58),
(72, 0),
(73, 58),
(75, 0),
(76, 0),
(77, 58),
(78, 0),
(82, 0),
(83, 58),
(84, 58),
(85, 200),
(86, 200),
(87, 11),
(87, 12),
(87, 13),
(87, 89),
(87, 90),
(87, 91),
(87, 92),
(87, 93),
(87, 94),
(87, 95),
(87, 96),
(87, 97),
(87, 98),
(87, 99),
(87, 100),
(87, 101),
(89, 0),
(91, 58),
(117, 200),
(118, 1),
(118, 11),
(118, 12),
(118, 13),
(118, 20),
(118, 24),
(118, 48),
(118, 49),
(118, 51),
(118, 52),
(118, 53),
(118, 54),
(118, 55),
(118, 89),
(118, 90),
(118, 91),
(118, 92),
(118, 93),
(118, 94),
(118, 95),
(118, 96),
(118, 97),
(118, 98),
(118, 99),
(118, 100),
(118, 101),
(118, 134),
(118, 135),
(118, 136),
(118, 138),
(118, 140),
(118, 141),
(118, 142),
(118, 145),
(118, 152),
(118, 156),
(118, 157),
(118, 158),
(118, 171),
(118, 185),
(118, 186),
(118, 187),
(118, 188),
(118, 189),
(118, 190),
(118, 191),
(118, 192),
(118, 193),
(121, 1),
(121, 11),
(121, 12),
(121, 13),
(121, 20),
(121, 24),
(121, 48),
(121, 49),
(121, 51),
(121, 52),
(121, 53),
(121, 54),
(121, 55),
(121, 89),
(121, 90),
(121, 91),
(121, 92),
(121, 93),
(121, 94),
(121, 95),
(121, 96),
(121, 97),
(121, 98),
(121, 99),
(121, 100),
(121, 101),
(121, 134),
(121, 135),
(121, 136),
(121, 138),
(121, 140),
(121, 141),
(121, 142),
(121, 145),
(121, 152),
(121, 156),
(121, 157),
(121, 158),
(121, 171),
(121, 185),
(121, 186),
(121, 187),
(121, 188),
(121, 189),
(121, 190),
(121, 191),
(121, 192),
(121, 193),
(122, 53),
(123, 53),
(124, 53),
(125, 0),
(134, 0),
(136, 0),
(150, 53),
(151, 53),
(155, 54),
(155, 152),
(156, 54),
(156, 152),
(158, 1),
(158, 11),
(158, 12),
(158, 13),
(158, 20),
(158, 24),
(158, 48),
(158, 49),
(158, 51),
(158, 52),
(158, 53),
(158, 54),
(158, 55),
(158, 89),
(158, 90),
(158, 91),
(158, 92),
(158, 93),
(158, 94),
(158, 95),
(158, 96),
(158, 97),
(158, 98),
(158, 99),
(158, 100),
(158, 101),
(158, 134),
(158, 135),
(158, 136),
(158, 138),
(158, 140),
(158, 141),
(158, 142),
(158, 145),
(158, 152),
(158, 156),
(158, 157),
(158, 158),
(158, 171),
(158, 185),
(158, 186),
(158, 187),
(158, 188),
(158, 189),
(158, 190),
(158, 191),
(158, 192),
(158, 193),
(168, 53),
(170, 58),
(171, 58),
(175, 54),
(175, 152),
(175, 171),
(176, 54),
(176, 152),
(176, 171),
(177, 0),
(178, 0),
(180, 58),
(181, 58),
(182, 58),
(183, 53),
(191, 58),
(202, 187),
(203, 187),
(204, 187),
(205, 187),
(212, 53),
(214, 1),
(214, 11),
(214, 12),
(214, 13),
(214, 20),
(214, 24),
(214, 48),
(214, 49),
(214, 51),
(214, 52),
(214, 53),
(214, 54),
(214, 55),
(214, 89),
(214, 90),
(214, 91),
(214, 92),
(214, 93),
(214, 94),
(214, 95),
(214, 96),
(214, 97),
(214, 98),
(214, 99),
(214, 100),
(214, 101),
(214, 134),
(214, 135),
(214, 136),
(214, 138),
(214, 140),
(214, 141),
(214, 142),
(214, 145),
(214, 152),
(214, 156),
(214, 157),
(214, 158),
(214, 171),
(214, 185),
(214, 186),
(214, 187),
(214, 188),
(214, 189),
(214, 190),
(214, 191),
(214, 192),
(214, 193),
(224, 171),
(225, 53),
(226, 53),
(227, 0),
(228, 0),
(238, 53),
(239, 193),
(240, 193),
(241, 193),
(242, 193),
(249, 0),
(254, 200),
(255, 200),
(256, 200),
(269, 0),
(279, 200),
(280, 0),
(281, 200),
(282, 200),
(283, 0);

-- --------------------------------------------------------

--
-- Table structure for table `jos_newsfeeds`
--

CREATE TABLE IF NOT EXISTS `jos_newsfeeds` (
  `catid` int(11) NOT NULL default '0',
  `id` int(11) NOT NULL auto_increment,
  `name` text NOT NULL,
  `alias` varchar(255) NOT NULL default '',
  `link` text NOT NULL,
  `filename` varchar(200) default NULL,
  `published` tinyint(1) NOT NULL default '0',
  `numarticles` int(11) unsigned NOT NULL default '1',
  `cache_time` int(11) unsigned NOT NULL default '3600',
  `checked_out` tinyint(3) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL default '0',
  `rtl` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `published` (`published`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `jos_newsfeeds`
--

INSERT INTO `jos_newsfeeds` (`catid`, `id`, `name`, `alias`, `link`, `filename`, `published`, `numarticles`, `cache_time`, `checked_out`, `checked_out_time`, `ordering`, `rtl`) VALUES
(4, 1, 'Joomla! - Official News', 'joomla-official-news', 'http://www.joomla.org/index.php?option=com_rss_xtd&feed=RSS2.0&type=com_frontpage&Itemid=1', '', 1, 5, 3600, 0, '0000-00-00 00:00:00', 8, 0),
(4, 2, 'Joomla! - Community News', 'joomla-community-news', 'http://www.joomla.org/index.php?option=com_rss_xtd&feed=RSS2.0&type=com_content&task=blogcategory&id=0&Itemid=33', '', 1, 5, 3600, 0, '0000-00-00 00:00:00', 9, 0),
(6, 3, 'Linux Today', 'linux-today', 'http://linuxtoday.com/backend/my-netscape.rdf', '', 1, 3, 3600, 0, '0000-00-00 00:00:00', 1, 0),
(5, 4, 'Business News', 'business-news', 'http://headlines.internet.com/internetnews/bus-news/news.rss', '', 1, 3, 3600, 0, '0000-00-00 00:00:00', 2, 0),
(5, 5, 'Web Developer News', 'web-developer-news', 'http://headlines.internet.com/internetnews/wd-news/news.rss', '', 1, 3, 3600, 0, '0000-00-00 00:00:00', 3, 0),
(6, 6, 'Linux Central:New Products', 'linux-central-news-products', 'http://linuxcentral.com/backend/lcnew.rdf', '', 1, 3, 3600, 0, '0000-00-00 00:00:00', 4, 0),
(6, 7, 'Linux Central:Best Selling', 'linux-central-best-selling', 'http://linuxcentral.com/backend/lcbestns.rdf', '', 1, 3, 3600, 0, '0000-00-00 00:00:00', 5, 0),
(6, 8, 'Linux Central:Daily Specials', 'linux-central-daily-specials', 'http://linuxcentral.com/backend/lcspecialns.rdf', '', 1, 3, 3600, 0, '0000-00-00 00:00:00', 6, 0);

-- --------------------------------------------------------

--
-- Table structure for table `jos_plugins`
--

CREATE TABLE IF NOT EXISTS `jos_plugins` (
  `id` int(11) NOT NULL auto_increment,
  `name` text NOT NULL,
  `element` text NOT NULL,
  `folder` varchar(100) NOT NULL default '',
  `access` tinyint(3) unsigned NOT NULL default '0',
  `ordering` int(11) NOT NULL default '0',
  `published` tinyint(3) NOT NULL default '0',
  `iscore` tinyint(3) NOT NULL default '0',
  `client_id` tinyint(3) NOT NULL default '0',
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `params` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `idx_folder` (`published`,`client_id`,`access`,`folder`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=53 ;

--
-- Dumping data for table `jos_plugins`
--

INSERT INTO `jos_plugins` (`id`, `name`, `element`, `folder`, `access`, `ordering`, `published`, `iscore`, `client_id`, `checked_out`, `checked_out_time`, `params`) VALUES
(1, 'Authentication - Joomla', 'joomla', 'authentication', 0, 1, 1, 1, 0, 0, '0000-00-00 00:00:00', ''),
(2, 'Authentication - LDAP', 'ldap', 'authentication', 0, 2, 0, 1, 0, 0, '0000-00-00 00:00:00', 'host=\nport=389\nuse_ldapV3=0\nnegotiate_tls=0\nno_referrals=0\nauth_method=bind\nbase_dn=\nsearch_string=\nusers_dn=\nusername=\npassword=\nldap_fullname=fullName\nldap_email=mail\nldap_uid=uid\n\n'),
(3, 'Authentication - GMail', 'gmail', 'authentication', 0, 4, 0, 0, 0, 0, '0000-00-00 00:00:00', ''),
(4, 'Authentication - OpenID', 'openid', 'authentication', 0, 3, 0, 0, 0, 0, '0000-00-00 00:00:00', ''),
(5, 'User - Joomla!', 'joomla', 'user', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', 'autoregister=1\n\n'),
(6, 'Search - Content', 'content', 'search', 0, 1, 1, 1, 0, 0, '0000-00-00 00:00:00', 'search_limit=50\nsearch_content=1\nsearch_uncategorised=1\nsearch_archived=1\n\n'),
(7, 'Search - Contacts', 'contacts', 'search', 0, 3, 1, 1, 0, 0, '0000-00-00 00:00:00', 'search_limit=50\n\n'),
(8, 'Search - Categories', 'categories', 'search', 0, 4, 1, 0, 0, 0, '0000-00-00 00:00:00', 'search_limit=50\n\n'),
(9, 'Search - Sections', 'sections', 'search', 0, 5, 1, 0, 0, 0, '0000-00-00 00:00:00', 'search_limit=50\n\n'),
(10, 'Search - Newsfeeds', 'newsfeeds', 'search', 0, 6, 1, 0, 0, 0, '0000-00-00 00:00:00', 'search_limit=50\n\n'),
(11, 'Search - Weblinks', 'weblinks', 'search', 0, 2, 1, 1, 0, 0, '0000-00-00 00:00:00', 'search_limit=50\n\n'),
(12, 'Content - Pagebreak', 'pagebreak', 'content', 0, 10000, 1, 1, 0, 0, '0000-00-00 00:00:00', 'enabled=1\ntitle=1\nmultipage_toc=1\nshowall=1\n\n'),
(13, 'Content - Rating', 'vote', 'content', 0, 4, 1, 1, 0, 0, '0000-00-00 00:00:00', ''),
(14, 'Content - Email Cloaking', 'emailcloak', 'content', 0, 5, 1, 0, 0, 0, '0000-00-00 00:00:00', 'mode=1\n\n'),
(15, 'Content - Code Hightlighter (GeSHi)', 'geshi', 'content', 0, 5, 0, 0, 0, 0, '0000-00-00 00:00:00', ''),
(17, 'Content - Page Navigation', 'pagenavigation', 'content', 0, 2, 1, 1, 0, 0, '0000-00-00 00:00:00', 'position=1\n\n'),
(18, 'Editor - No Editor', 'none', 'editors', 0, 0, 1, 1, 0, 0, '0000-00-00 00:00:00', ''),
(19, 'Editor - TinyMCE 2.0', 'tinymce', 'editors', 0, 0, 1, 1, 0, 0, '0000-00-00 00:00:00', 'theme=advanced\ncleanup=1\ncleanup_startup=0\nautosave=0\ncompressed=0\nrelative_urls=1\ntext_direction=ltr\nlang_mode=0\nlang_code=en\ninvalid_elements=applet\ncontent_css=1\ncontent_css_custom=\nnewlines=0\ntoolbar=top\nhr=1\nsmilies=1\ntable=1\nstyle=1\nlayer=1\nxhtmlxtras=0\ntemplate=0\ndirectionality=1\nfullscreen=1\nhtml_height=550\nhtml_width=750\npreview=1\ninsertdate=1\nformat_date=%Y-%m-%d\ninserttime=1\nformat_time=%H:%M:%S\n\n'),
(20, 'Editor - XStandard Lite 2.0', 'xstandard', 'editors', 0, 0, 1, 1, 0, 0, '0000-00-00 00:00:00', ''),
(21, 'Editor Button - Image', 'image', 'editors-xtd', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(22, 'Editor Button - Pagebreak', 'pagebreak', 'editors-xtd', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(23, 'Editor Button - Readmore', 'readmore', 'editors-xtd', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(24, 'XML-RPC - Joomla', 'joomla', 'xmlrpc', 0, 7, 0, 1, 0, 0, '0000-00-00 00:00:00', ''),
(25, 'XML-RPC - Blogger API', 'blogger', 'xmlrpc', 0, 7, 0, 1, 0, 0, '0000-00-00 00:00:00', 'catid=1\nsectionid=0\n\n'),
(27, 'System - SEF', 'sef', 'system', 0, 1, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(28, 'System - Debug', 'debug', 'system', 0, 2, 1, 0, 0, 0, '0000-00-00 00:00:00', 'queries=1\nmemory=1\nlangauge=1\n\n'),
(29, 'System - Legacy', 'legacy', 'system', 0, 3, 0, 1, 0, 0, '0000-00-00 00:00:00', 'route=0\n\n'),
(30, 'System - Cache', 'cache', 'system', 0, 4, 0, 1, 0, 0, '0000-00-00 00:00:00', 'browsercache=0\ncachetime=15\n\n'),
(31, 'System - Log', 'log', 'system', 0, 5, 0, 1, 0, 0, '0000-00-00 00:00:00', ''),
(32, 'System - Remember Me', 'remember', 'system', 0, 6, 1, 1, 0, 0, '0000-00-00 00:00:00', ''),
(33, 'System - Backlink', 'backlink', 'system', 0, 7, 0, 1, 0, 0, '0000-00-00 00:00:00', ''),
(35, 'YOOeffects', 'yoo_effects', 'system', 0, 0, 1, 0, 0, 62, '2008-03-27 22:08:03', 'lightbox=1\nreflection=1\nspotlight=1\ngzip=1\n'),
(37, 'ZOO Search', 'zoosearch', 'search', 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', 'search_limit=50\n'),
(38, 'System - Mootools Upgrade', 'mtupgrade', 'system', 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', ''),
(39, 'Editor - JCE', 'jce', 'editors', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', '');

-- --------------------------------------------------------

--
-- Table structure for table `jos_polls`
--

CREATE TABLE IF NOT EXISTS `jos_polls` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `title` text NOT NULL,
  `alias` varchar(255) NOT NULL default '',
  `voters` int(9) NOT NULL default '0',
  `checked_out` int(11) NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL default '0',
  `access` int(11) NOT NULL default '0',
  `lag` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `jos_polls`
--

INSERT INTO `jos_polls` (`id`, `title`, `alias`, `voters`, `checked_out`, `checked_out_time`, `published`, `access`, `lag`) VALUES
(14, 'Joomla! is used for?', 'joomla-is-used-for', 11, 0, '0000-00-00 00:00:00', 1, 0, 86400);

-- --------------------------------------------------------

--
-- Table structure for table `jos_poll_data`
--

CREATE TABLE IF NOT EXISTS `jos_poll_data` (
  `id` int(11) NOT NULL auto_increment,
  `pollid` int(11) NOT NULL default '0',
  `text` text NOT NULL,
  `hits` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `pollid` (`pollid`,`text`(1))
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `jos_poll_data`
--

INSERT INTO `jos_poll_data` (`id`, `pollid`, `text`, `hits`) VALUES
(1, 14, 'Community Sites', 2),
(2, 14, 'Public Brand Sites', 3),
(3, 14, 'eCommerce', 1),
(4, 14, 'Blogs', 0),
(5, 14, 'Intranets', 0),
(6, 14, 'Photo and Media Sites', 2),
(7, 14, 'All of the Above!', 3),
(8, 14, '', 0),
(9, 14, '', 0),
(10, 14, '', 0),
(11, 14, '', 0),
(12, 14, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `jos_poll_date`
--

CREATE TABLE IF NOT EXISTS `jos_poll_date` (
  `id` bigint(20) NOT NULL auto_increment,
  `date` datetime NOT NULL default '0000-00-00 00:00:00',
  `vote_id` int(11) NOT NULL default '0',
  `poll_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `poll_id` (`poll_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `jos_poll_date`
--

INSERT INTO `jos_poll_date` (`id`, `date`, `vote_id`, `poll_id`) VALUES
(1, '2006-10-09 13:01:58', 1, 14),
(2, '2006-10-10 15:19:43', 7, 14),
(3, '2006-10-11 11:08:16', 7, 14),
(4, '2006-10-11 15:02:26', 2, 14),
(5, '2006-10-11 15:43:03', 7, 14),
(6, '2006-10-11 15:43:38', 7, 14),
(7, '2006-10-12 00:51:13', 2, 14),
(8, '2007-05-10 19:12:29', 3, 14),
(9, '2007-05-14 14:18:00', 6, 14),
(10, '2007-06-10 15:20:29', 6, 14),
(11, '2007-07-03 12:37:53', 2, 14);

-- --------------------------------------------------------

--
-- Table structure for table `jos_poll_menu`
--

CREATE TABLE IF NOT EXISTS `jos_poll_menu` (
  `pollid` int(11) NOT NULL default '0',
  `menuid` int(11) NOT NULL default '0',
  PRIMARY KEY  (`pollid`,`menuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jos_sections`
--

CREATE TABLE IF NOT EXISTS `jos_sections` (
  `id` int(11) NOT NULL auto_increment,
  `title` text NOT NULL,
  `name` text NOT NULL,
  `alias` varchar(255) NOT NULL default '',
  `image` text NOT NULL,
  `scope` varchar(50) NOT NULL default '',
  `image_position` varchar(90) NOT NULL default '',
  `description` text NOT NULL,
  `published` tinyint(1) NOT NULL default '0',
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL default '0',
  `access` tinyint(3) unsigned NOT NULL default '0',
  `count` int(11) NOT NULL default '0',
  `params` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `idx_scope` (`scope`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `jos_sections`
--

INSERT INTO `jos_sections` (`id`, `title`, `name`, `alias`, `image`, `scope`, `image_position`, `description`, `published`, `checked_out`, `checked_out_time`, `ordering`, `access`, `count`, `params`) VALUES
(4, 'Joomla!', '', 'joomla', 'powered_by.png', 'content', 'right', 'As with previous releases, Joomla! provides a unified and easy-to-use framework for delivering content for Web sites of all kinds. To support the changing nature of the Internet and emerging Web technologies, Joomla! required substantial restructuring of its core functionality and we also used this effort to simplify many challenges within the current user interface. Joomla! 1.5 has many new features.', 1, 0, '0000-00-00 00:00:00', 1, 0, 22, ''),
(5, 'YOOtheme', '', 'yootheme', '', 'content', 'left', '', 1, 0, '0000-00-00 00:00:00', 2, 0, 25, ''),
(6, 'Pendidikan', '', 'pendidikan', '', 'content', 'left', '', 1, 0, '0000-00-00 00:00:00', 3, 0, 4, ''),
(7, 'Yayasan', '', 'yayasan', '', 'content', 'left', '', 1, 63, '2011-09-13 05:37:34', 4, 0, 2, ''),
(8, 'Divisi Usaha', '', 'divisi-usaha', '', 'content', 'left', '', 1, 0, '0000-00-00 00:00:00', 5, 0, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `jos_session`
--

CREATE TABLE IF NOT EXISTS `jos_session` (
  `username` varchar(150) default '',
  `time` varchar(14) default '',
  `session_id` varchar(200) NOT NULL default '0',
  `guest` tinyint(4) default '1',
  `userid` int(11) default '0',
  `usertype` varchar(150) default '',
  `gid` tinyint(3) unsigned NOT NULL default '0',
  `client_id` tinyint(3) unsigned NOT NULL default '0',
  `data` longtext,
  PRIMARY KEY  (`session_id`(64)),
  KEY `whosonline` (`guest`,`usertype`),
  KEY `userid` (`userid`),
  KEY `time` (`time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_session`
--

INSERT INTO `jos_session` (`username`, `time`, `session_id`, `guest`, `userid`, `usertype`, `gid`, `client_id`, `data`) VALUES
('', '1315971873', 'ffa1d4a0329abb4fb25f571b6b390b01', 1, 0, '', 0, 0, '__default|a:15:{s:15:"session.counter";i:2;s:19:"session.timer.start";i:1315971697;s:18:"session.timer.last";i:1315971697;s:17:"session.timer.now";i:1315971873;s:24:"session.client.forwarded";s:13:"192.168.8.148";s:22:"session.client.browser";s:67:"Mozilla/5.0 (Windows NT 6.1; rv:6.0.2) Gecko/20100101 Firefox/6.0.2";s:8:"registry";O:9:"JRegistry":3:{s:17:"_defaultNameSpace";s:7:"session";s:9:"_registry";a:1:{s:7:"session";a:1:{s:4:"data";O:8:"stdClass":0:{}}}s:7:"_errors";a:0:{}}s:4:"user";O:5:"JUser":20:{s:2:"id";i:0;s:4:"name";N;s:8:"username";N;s:5:"email";N;s:8:"password";N;s:14:"password_clear";s:0:"";s:8:"usertype";N;s:5:"block";N;s:9:"sendEmail";i:0;s:3:"gid";i:0;s:12:"registerDate";N;s:13:"lastvisitDate";N;s:10:"activation";N;s:6:"params";N;s:3:"aid";i:0;s:5:"guest";i:1;s:7:"_params";O:10:"JParameter":7:{s:4:"_raw";s:0:"";s:4:"_xml";N;s:9:"_elements";a:0:{}s:12:"_elementPath";a:1:{i:0;s:66:"/home/alikhlas/public_html/libraries/joomla/html/parameter/element";}s:17:"_defaultNameSpace";s:8:"_default";s:9:"_registry";a:1:{s:8:"_default";a:1:{s:4:"data";O:8:"stdClass":0:{}}}s:7:"_errors";a:0:{}}s:9:"_errorMsg";N;s:7:"_errors";a:0:{}s:10:"superadmin";b:0;}s:13:"session.token";s:32:"4598dc42ce81175632b150d538a436fb";s:19:"js_id_currency_orig";s:1:"1";s:14:"js_id_currency";s:1:"1";s:17:"js_currency_value";s:8:"1.000000";s:16:"js_currency_code";s:3:"EUR";s:20:"js_currency_code_iso";s:3:"EUR";s:21:"shop_main_page_itemid";i:0;}'),
('', '1315971753', '53bf4adbadbbe26cbbcd883c02178124', 1, 0, '', 0, 0, '__default|a:14:{s:15:"session.counter";i:1;s:19:"session.timer.start";i:1315971753;s:18:"session.timer.last";i:1315971753;s:17:"session.timer.now";i:1315971753;s:22:"session.client.browser";s:67:"Mozilla/5.0 (Windows NT 6.1; rv:6.0.2) Gecko/20100101 Firefox/6.0.2";s:8:"registry";O:9:"JRegistry":3:{s:17:"_defaultNameSpace";s:7:"session";s:9:"_registry";a:1:{s:7:"session";a:1:{s:4:"data";O:8:"stdClass":0:{}}}s:7:"_errors";a:0:{}}s:4:"user";O:5:"JUser":20:{s:2:"id";i:0;s:4:"name";N;s:8:"username";N;s:5:"email";N;s:8:"password";N;s:14:"password_clear";s:0:"";s:8:"usertype";N;s:5:"block";N;s:9:"sendEmail";i:0;s:3:"gid";i:0;s:12:"registerDate";N;s:13:"lastvisitDate";N;s:10:"activation";N;s:6:"params";N;s:3:"aid";i:0;s:5:"guest";i:1;s:7:"_params";O:10:"JParameter":7:{s:4:"_raw";s:0:"";s:4:"_xml";N;s:9:"_elements";a:0:{}s:12:"_elementPath";a:1:{i:0;s:66:"/home/alikhlas/public_html/libraries/joomla/html/parameter/element";}s:17:"_defaultNameSpace";s:8:"_default";s:9:"_registry";a:1:{s:8:"_default";a:1:{s:4:"data";O:8:"stdClass":0:{}}}s:7:"_errors";a:0:{}}s:9:"_errorMsg";N;s:7:"_errors";a:0:{}s:10:"superadmin";b:0;}s:13:"session.token";s:32:"235c41d5d2a89b850a46934ab780b038";s:19:"js_id_currency_orig";s:1:"1";s:14:"js_id_currency";s:1:"1";s:17:"js_currency_value";s:8:"1.000000";s:16:"js_currency_code";s:3:"EUR";s:20:"js_currency_code_iso";s:3:"EUR";s:21:"shop_main_page_itemid";i:0;}');

-- --------------------------------------------------------

--
-- Table structure for table `jos_stats_agents`
--

CREATE TABLE IF NOT EXISTS `jos_stats_agents` (
  `agent` varchar(255) NOT NULL default '',
  `type` tinyint(1) unsigned NOT NULL default '0',
  `hits` int(11) unsigned NOT NULL default '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jos_templates_menu`
--

CREATE TABLE IF NOT EXISTS `jos_templates_menu` (
  `template` text NOT NULL,
  `menuid` int(11) NOT NULL default '0',
  `client_id` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`menuid`,`client_id`,`template`(255))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_templates_menu`
--

INSERT INTO `jos_templates_menu` (`template`, `menuid`, `client_id`) VALUES
('alikhlas', 0, 0),
('khepri', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `jos_users`
--

CREATE TABLE IF NOT EXISTS `jos_users` (
  `id` int(11) NOT NULL auto_increment,
  `name` text NOT NULL,
  `username` varchar(150) NOT NULL default '',
  `email` varchar(100) NOT NULL default '',
  `password` varchar(100) NOT NULL default '',
  `usertype` varchar(75) NOT NULL default '',
  `block` tinyint(4) NOT NULL default '0',
  `sendEmail` tinyint(4) default '0',
  `gid` tinyint(3) unsigned NOT NULL default '1',
  `registerDate` datetime NOT NULL default '0000-00-00 00:00:00',
  `lastvisitDate` datetime NOT NULL default '0000-00-00 00:00:00',
  `activation` varchar(100) NOT NULL default '',
  `params` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `usertype` (`usertype`),
  KEY `idx_name` (`name`(255)),
  KEY `gid_block` (`gid`,`block`),
  KEY `username` (`username`),
  KEY `email` (`email`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=64 ;

--
-- Dumping data for table `jos_users`
--

INSERT INTO `jos_users` (`id`, `name`, `username`, `email`, `password`, `usertype`, `block`, `sendEmail`, `gid`, `registerDate`, `lastvisitDate`, `activation`, `params`) VALUES
(62, 'Administrator', 'admin', 'admin@admin.com', '2ece6c1f5b6a6ff572e2acaeb17b7f33:p4i1ynvjbmzoVdj316c1Ddb9zvfQFGHd', 'Super Administrator', 0, 1, 25, '2011-08-24 14:32:40', '2011-09-13 04:43:35', '', 'admin_language=\nlanguage=\neditor=jce\nhelpsite=\ntimezone=0\n\n'),
(63, 'Alikhlas', 'Alikhlas', 'budi.perkasa10@gmail.com', 'dec7017d240632cb90033563b6a7a2c7:GKK3EYKN71kn1wq41gEfE7IubIBdR7Og', 'Administrator', 0, 0, 24, '2011-09-05 08:46:03', '2011-09-13 17:58:49', '', 'admin_language=\nlanguage=\neditor=jce\nhelpsite=\ntimezone=0\n\n');

-- --------------------------------------------------------

--
-- Table structure for table `jos_vm_auth_group`
--

CREATE TABLE IF NOT EXISTS `jos_vm_auth_group` (
  `group_id` int(11) NOT NULL auto_increment,
  `group_name` varchar(128) default NULL,
  `group_level` int(11) default NULL,
  PRIMARY KEY  (`group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COMMENT='Holds all the user groups' AUTO_INCREMENT=5 ;

--
-- Dumping data for table `jos_vm_auth_group`
--

INSERT INTO `jos_vm_auth_group` (`group_id`, `group_name`, `group_level`) VALUES
(1, 'admin', 0),
(2, 'storeadmin', 250),
(3, 'shopper', 500),
(4, 'demo', 750);

-- --------------------------------------------------------

--
-- Table structure for table `jos_vm_auth_user_group`
--

CREATE TABLE IF NOT EXISTS `jos_vm_auth_user_group` (
  `user_id` int(11) NOT NULL default '0',
  `group_id` int(11) default NULL,
  PRIMARY KEY  (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Maps the user to user groups';

--
-- Dumping data for table `jos_vm_auth_user_group`
--

INSERT INTO `jos_vm_auth_user_group` (`user_id`, `group_id`) VALUES
(62, 2),
(63, 2);

-- --------------------------------------------------------

--
-- Table structure for table `jos_vm_auth_user_vendor`
--

CREATE TABLE IF NOT EXISTS `jos_vm_auth_user_vendor` (
  `user_id` int(11) default NULL,
  `vendor_id` int(11) default NULL,
  KEY `idx_auth_user_vendor_user_id` (`user_id`),
  KEY `idx_auth_user_vendor_vendor_id` (`vendor_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Maps a user to a vendor';

--
-- Dumping data for table `jos_vm_auth_user_vendor`
--

INSERT INTO `jos_vm_auth_user_vendor` (`user_id`, `vendor_id`) VALUES
(62, 1),
(63, 1);

-- --------------------------------------------------------

--
-- Table structure for table `jos_vm_cart`
--

CREATE TABLE IF NOT EXISTS `jos_vm_cart` (
  `user_id` int(11) NOT NULL,
  `cart_content` text NOT NULL,
  `last_updated` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Stores the cart contents of a user';

--
-- Dumping data for table `jos_vm_cart`
--

INSERT INTO `jos_vm_cart` (`user_id`, `cart_content`, `last_updated`) VALUES
(63, 'a:3:{s:3:"idx";i:2;i:0;a:5:{s:8:"quantity";i:1;s:10:"product_id";s:1:"9";s:9:"parent_id";s:1:"9";s:11:"category_id";i:0;s:11:"description";s:0:"";}i:1;a:5:{s:8:"quantity";i:1;s:10:"product_id";s:1:"7";s:9:"parent_id";s:1:"7";s:11:"category_id";s:1:"4";s:11:"description";s:0:"";}}', '2011-09-10 19:10:47');

-- --------------------------------------------------------

--
-- Table structure for table `jos_vm_category`
--

CREATE TABLE IF NOT EXISTS `jos_vm_category` (
  `category_id` int(11) NOT NULL auto_increment,
  `vendor_id` int(11) NOT NULL default '0',
  `category_name` varchar(128) NOT NULL default '',
  `category_description` text,
  `category_thumb_image` varchar(255) default NULL,
  `category_full_image` varchar(255) default NULL,
  `category_publish` char(1) default NULL,
  `cdate` int(11) default NULL,
  `mdate` int(11) default NULL,
  `category_browsepage` varchar(255) NOT NULL default 'browse_1',
  `products_per_row` tinyint(2) NOT NULL default '1',
  `category_flypage` varchar(255) default NULL,
  `list_order` int(11) default NULL,
  PRIMARY KEY  (`category_id`),
  KEY `idx_category_vendor_id` (`vendor_id`),
  KEY `idx_category_name` (`category_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COMMENT='Product Categories are stored here' AUTO_INCREMENT=7 ;

--
-- Dumping data for table `jos_vm_category`
--

INSERT INTO `jos_vm_category` (`category_id`, `vendor_id`, `category_name`, `category_description`, `category_thumb_image`, `category_full_image`, `category_publish`, `cdate`, `mdate`, `category_browsepage`, `products_per_row`, `category_flypage`, `list_order`) VALUES
(1, 1, 'Hand Tools', 'Hand Tools', 'ee024e46399e792cc8ba4bf097d0fa6a.jpg', 'fc2f001413876a374484df36ed9cf775.jpg', 'Y', 950319905, 960304194, 'browse_3', 3, '', 1),
(2, 1, 'Power Tools', 'Power Tools', 'fc8802c7eaa1149bde98a541742217de.jpg', 'fe2f63f4c46023e3b33404c80bdd2bfe.jpg', 'Y', 950319916, 960304104, 'browse_4', 4, '', 2),
(3, 1, 'Garden Tools', 'Garden Tools', '702168cd91e8b7bbb7a36be56f86e9be.jpg', '756ff6d140e11079caf56955060f1162.jpg', 'Y', 950321122, 960304338, 'browse_2', 2, 'garden_flypage.tpl', 3),
(4, 1, 'Outdoor Tools', 'Outdoor Tools', NULL, NULL, 'Y', 955626629, 958889528, 'browse_1', 1, NULL, 4),
(5, 1, 'Indoor Tools', 'Indoor Tools', NULL, NULL, 'Y', 958892894, 958892894, 'browse_1', 1, NULL, 5),
(6, 1, 'Al-Ikhlas Carcare', '', 'resized/Al_Ikhlas_Carcar_4e6b444db1a45_250x250.jpg', 'Al_Ikhlas_Carcar_4e6b444e476b7.jpg', 'Y', 1315652685, 1315652685, 'managed', 1, 'garden_flypage.tpl', 4);

-- --------------------------------------------------------

--
-- Table structure for table `jos_vm_category_xref`
--

CREATE TABLE IF NOT EXISTS `jos_vm_category_xref` (
  `category_parent_id` int(11) NOT NULL default '0',
  `category_child_id` int(11) NOT NULL default '0',
  `category_list` int(11) default NULL,
  PRIMARY KEY  (`category_child_id`),
  KEY `category_xref_category_parent_id` (`category_parent_id`),
  KEY `idx_category_xref_category_list` (`category_list`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Category child-parent relation list';

--
-- Dumping data for table `jos_vm_category_xref`
--

INSERT INTO `jos_vm_category_xref` (`category_parent_id`, `category_child_id`, `category_list`) VALUES
(0, 1, NULL),
(0, 2, NULL),
(0, 3, NULL),
(2, 4, NULL),
(2, 5, NULL),
(0, 6, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jos_vm_country`
--

CREATE TABLE IF NOT EXISTS `jos_vm_country` (
  `country_id` int(11) NOT NULL auto_increment,
  `zone_id` int(11) NOT NULL default '1',
  `country_name` varchar(64) default NULL,
  `country_3_code` char(3) default NULL,
  `country_2_code` char(2) default NULL,
  PRIMARY KEY  (`country_id`),
  KEY `idx_country_name` (`country_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COMMENT='Country records' AUTO_INCREMENT=246 ;

--
-- Dumping data for table `jos_vm_country`
--

INSERT INTO `jos_vm_country` (`country_id`, `zone_id`, `country_name`, `country_3_code`, `country_2_code`) VALUES
(1, 1, 'Afghanistan', 'AFG', 'AF'),
(2, 1, 'Albania', 'ALB', 'AL'),
(3, 1, 'Algeria', 'DZA', 'DZ'),
(4, 1, 'American Samoa', 'ASM', 'AS'),
(5, 1, 'Andorra', 'AND', 'AD'),
(6, 1, 'Angola', 'AGO', 'AO'),
(7, 1, 'Anguilla', 'AIA', 'AI'),
(8, 1, 'Antarctica', 'ATA', 'AQ'),
(9, 1, 'Antigua and Barbuda', 'ATG', 'AG'),
(10, 1, 'Argentina', 'ARG', 'AR'),
(11, 1, 'Armenia', 'ARM', 'AM'),
(12, 1, 'Aruba', 'ABW', 'AW'),
(13, 1, 'Australia', 'AUS', 'AU'),
(14, 1, 'Austria', 'AUT', 'AT'),
(15, 1, 'Azerbaijan', 'AZE', 'AZ'),
(16, 1, 'Bahamas', 'BHS', 'BS'),
(17, 1, 'Bahrain', 'BHR', 'BH'),
(18, 1, 'Bangladesh', 'BGD', 'BD'),
(19, 1, 'Barbados', 'BRB', 'BB'),
(20, 1, 'Belarus', 'BLR', 'BY'),
(21, 1, 'Belgium', 'BEL', 'BE'),
(22, 1, 'Belize', 'BLZ', 'BZ'),
(23, 1, 'Benin', 'BEN', 'BJ'),
(24, 1, 'Bermuda', 'BMU', 'BM'),
(25, 1, 'Bhutan', 'BTN', 'BT'),
(26, 1, 'Bolivia', 'BOL', 'BO'),
(27, 1, 'Bosnia and Herzegowina', 'BIH', 'BA'),
(28, 1, 'Botswana', 'BWA', 'BW'),
(29, 1, 'Bouvet Island', 'BVT', 'BV'),
(30, 1, 'Brazil', 'BRA', 'BR'),
(31, 1, 'British Indian Ocean Territory', 'IOT', 'IO'),
(32, 1, 'Brunei Darussalam', 'BRN', 'BN'),
(33, 1, 'Bulgaria', 'BGR', 'BG'),
(34, 1, 'Burkina Faso', 'BFA', 'BF'),
(35, 1, 'Burundi', 'BDI', 'BI'),
(36, 1, 'Cambodia', 'KHM', 'KH'),
(37, 1, 'Cameroon', 'CMR', 'CM'),
(38, 1, 'Canada', 'CAN', 'CA'),
(39, 1, 'Cape Verde', 'CPV', 'CV'),
(40, 1, 'Cayman Islands', 'CYM', 'KY'),
(41, 1, 'Central African Republic', 'CAF', 'CF'),
(42, 1, 'Chad', 'TCD', 'TD'),
(43, 1, 'Chile', 'CHL', 'CL'),
(44, 1, 'China', 'CHN', 'CN'),
(45, 1, 'Christmas Island', 'CXR', 'CX'),
(46, 1, 'Cocos (Keeling) Islands', 'CCK', 'CC'),
(47, 1, 'Colombia', 'COL', 'CO'),
(48, 1, 'Comoros', 'COM', 'KM'),
(49, 1, 'Congo', 'COG', 'CG'),
(50, 1, 'Cook Islands', 'COK', 'CK'),
(51, 1, 'Costa Rica', 'CRI', 'CR'),
(52, 1, 'Cote D''Ivoire', 'CIV', 'CI'),
(53, 1, 'Croatia', 'HRV', 'HR'),
(54, 1, 'Cuba', 'CUB', 'CU'),
(55, 1, 'Cyprus', 'CYP', 'CY'),
(56, 1, 'Czech Republic', 'CZE', 'CZ'),
(57, 1, 'Denmark', 'DNK', 'DK'),
(58, 1, 'Djibouti', 'DJI', 'DJ'),
(59, 1, 'Dominica', 'DMA', 'DM'),
(60, 1, 'Dominican Republic', 'DOM', 'DO'),
(61, 1, 'East Timor', 'TMP', 'TP'),
(62, 1, 'Ecuador', 'ECU', 'EC'),
(63, 1, 'Egypt', 'EGY', 'EG'),
(64, 1, 'El Salvador', 'SLV', 'SV'),
(65, 1, 'Equatorial Guinea', 'GNQ', 'GQ'),
(66, 1, 'Eritrea', 'ERI', 'ER'),
(67, 1, 'Estonia', 'EST', 'EE'),
(68, 1, 'Ethiopia', 'ETH', 'ET'),
(69, 1, 'Falkland Islands (Malvinas)', 'FLK', 'FK'),
(70, 1, 'Faroe Islands', 'FRO', 'FO'),
(71, 1, 'Fiji', 'FJI', 'FJ'),
(72, 1, 'Finland', 'FIN', 'FI'),
(73, 1, 'France', 'FRA', 'FR'),
(74, 1, 'France, Metropolitan', 'FXX', 'FX'),
(75, 1, 'French Guiana', 'GUF', 'GF'),
(76, 1, 'French Polynesia', 'PYF', 'PF'),
(77, 1, 'French Southern Territories', 'ATF', 'TF'),
(78, 1, 'Gabon', 'GAB', 'GA'),
(79, 1, 'Gambia', 'GMB', 'GM'),
(80, 1, 'Georgia', 'GEO', 'GE'),
(81, 1, 'Germany', 'DEU', 'DE'),
(82, 1, 'Ghana', 'GHA', 'GH'),
(83, 1, 'Gibraltar', 'GIB', 'GI'),
(84, 1, 'Greece', 'GRC', 'GR'),
(85, 1, 'Greenland', 'GRL', 'GL'),
(86, 1, 'Grenada', 'GRD', 'GD'),
(87, 1, 'Guadeloupe', 'GLP', 'GP'),
(88, 1, 'Guam', 'GUM', 'GU'),
(89, 1, 'Guatemala', 'GTM', 'GT'),
(90, 1, 'Guinea', 'GIN', 'GN'),
(91, 1, 'Guinea-bissau', 'GNB', 'GW'),
(92, 1, 'Guyana', 'GUY', 'GY'),
(93, 1, 'Haiti', 'HTI', 'HT'),
(94, 1, 'Heard and Mc Donald Islands', 'HMD', 'HM'),
(95, 1, 'Honduras', 'HND', 'HN'),
(96, 1, 'Hong Kong', 'HKG', 'HK'),
(97, 1, 'Hungary', 'HUN', 'HU'),
(98, 1, 'Iceland', 'ISL', 'IS'),
(99, 1, 'India', 'IND', 'IN'),
(100, 1, 'Indonesia', 'IDN', 'ID'),
(101, 1, 'Iran (Islamic Republic of)', 'IRN', 'IR'),
(102, 1, 'Iraq', 'IRQ', 'IQ'),
(103, 1, 'Ireland', 'IRL', 'IE'),
(104, 1, 'Israel', 'ISR', 'IL'),
(105, 1, 'Italy', 'ITA', 'IT'),
(106, 1, 'Jamaica', 'JAM', 'JM'),
(107, 1, 'Japan', 'JPN', 'JP'),
(108, 1, 'Jordan', 'JOR', 'JO'),
(109, 1, 'Kazakhstan', 'KAZ', 'KZ'),
(110, 1, 'Kenya', 'KEN', 'KE'),
(111, 1, 'Kiribati', 'KIR', 'KI'),
(112, 1, 'Korea, Democratic People''s Republic of', 'PRK', 'KP'),
(113, 1, 'Korea, Republic of', 'KOR', 'KR'),
(114, 1, 'Kuwait', 'KWT', 'KW'),
(115, 1, 'Kyrgyzstan', 'KGZ', 'KG'),
(116, 1, 'Lao People''s Democratic Republic', 'LAO', 'LA'),
(117, 1, 'Latvia', 'LVA', 'LV'),
(118, 1, 'Lebanon', 'LBN', 'LB'),
(119, 1, 'Lesotho', 'LSO', 'LS'),
(120, 1, 'Liberia', 'LBR', 'LR'),
(121, 1, 'Libyan Arab Jamahiriya', 'LBY', 'LY'),
(122, 1, 'Liechtenstein', 'LIE', 'LI'),
(123, 1, 'Lithuania', 'LTU', 'LT'),
(124, 1, 'Luxembourg', 'LUX', 'LU'),
(125, 1, 'Macau', 'MAC', 'MO'),
(126, 1, 'Macedonia, The Former Yugoslav Republic of', 'MKD', 'MK'),
(127, 1, 'Madagascar', 'MDG', 'MG'),
(128, 1, 'Malawi', 'MWI', 'MW'),
(129, 1, 'Malaysia', 'MYS', 'MY'),
(130, 1, 'Maldives', 'MDV', 'MV'),
(131, 1, 'Mali', 'MLI', 'ML'),
(132, 1, 'Malta', 'MLT', 'MT'),
(133, 1, 'Marshall Islands', 'MHL', 'MH'),
(134, 1, 'Martinique', 'MTQ', 'MQ'),
(135, 1, 'Mauritania', 'MRT', 'MR'),
(136, 1, 'Mauritius', 'MUS', 'MU'),
(137, 1, 'Mayotte', 'MYT', 'YT'),
(138, 1, 'Mexico', 'MEX', 'MX'),
(139, 1, 'Micronesia, Federated States of', 'FSM', 'FM'),
(140, 1, 'Moldova, Republic of', 'MDA', 'MD'),
(141, 1, 'Monaco', 'MCO', 'MC'),
(142, 1, 'Mongolia', 'MNG', 'MN'),
(143, 1, 'Montserrat', 'MSR', 'MS'),
(144, 1, 'Morocco', 'MAR', 'MA'),
(145, 1, 'Mozambique', 'MOZ', 'MZ'),
(146, 1, 'Myanmar', 'MMR', 'MM'),
(147, 1, 'Namibia', 'NAM', 'NA'),
(148, 1, 'Nauru', 'NRU', 'NR'),
(149, 1, 'Nepal', 'NPL', 'NP'),
(150, 1, 'Netherlands', 'NLD', 'NL'),
(151, 1, 'Netherlands Antilles', 'ANT', 'AN'),
(152, 1, 'New Caledonia', 'NCL', 'NC'),
(153, 1, 'New Zealand', 'NZL', 'NZ'),
(154, 1, 'Nicaragua', 'NIC', 'NI'),
(155, 1, 'Niger', 'NER', 'NE'),
(156, 1, 'Nigeria', 'NGA', 'NG'),
(157, 1, 'Niue', 'NIU', 'NU'),
(158, 1, 'Norfolk Island', 'NFK', 'NF'),
(159, 1, 'Northern Mariana Islands', 'MNP', 'MP'),
(160, 1, 'Norway', 'NOR', 'NO'),
(161, 1, 'Oman', 'OMN', 'OM'),
(162, 1, 'Pakistan', 'PAK', 'PK'),
(163, 1, 'Palau', 'PLW', 'PW'),
(164, 1, 'Panama', 'PAN', 'PA'),
(165, 1, 'Papua New Guinea', 'PNG', 'PG'),
(166, 1, 'Paraguay', 'PRY', 'PY'),
(167, 1, 'Peru', 'PER', 'PE'),
(168, 1, 'Philippines', 'PHL', 'PH'),
(169, 1, 'Pitcairn', 'PCN', 'PN'),
(170, 1, 'Poland', 'POL', 'PL'),
(171, 1, 'Portugal', 'PRT', 'PT'),
(172, 1, 'Puerto Rico', 'PRI', 'PR'),
(173, 1, 'Qatar', 'QAT', 'QA'),
(174, 1, 'Reunion', 'REU', 'RE'),
(175, 1, 'Romania', 'ROM', 'RO'),
(176, 1, 'Russian Federation', 'RUS', 'RU'),
(177, 1, 'Rwanda', 'RWA', 'RW'),
(178, 1, 'Saint Kitts and Nevis', 'KNA', 'KN'),
(179, 1, 'Saint Lucia', 'LCA', 'LC'),
(180, 1, 'Saint Vincent and the Grenadines', 'VCT', 'VC'),
(181, 1, 'Samoa', 'WSM', 'WS'),
(182, 1, 'San Marino', 'SMR', 'SM'),
(183, 1, 'Sao Tome and Principe', 'STP', 'ST'),
(184, 1, 'Saudi Arabia', 'SAU', 'SA'),
(185, 1, 'Senegal', 'SEN', 'SN'),
(186, 1, 'Seychelles', 'SYC', 'SC'),
(187, 1, 'Sierra Leone', 'SLE', 'SL'),
(188, 1, 'Singapore', 'SGP', 'SG'),
(189, 1, 'Slovakia (Slovak Republic)', 'SVK', 'SK'),
(190, 1, 'Slovenia', 'SVN', 'SI'),
(191, 1, 'Solomon Islands', 'SLB', 'SB'),
(192, 1, 'Somalia', 'SOM', 'SO'),
(193, 1, 'South Africa', 'ZAF', 'ZA'),
(194, 1, 'South Georgia and the South Sandwich Islands', 'SGS', 'GS'),
(195, 1, 'Spain', 'ESP', 'ES'),
(196, 1, 'Sri Lanka', 'LKA', 'LK'),
(197, 1, 'St. Helena', 'SHN', 'SH'),
(198, 1, 'St. Pierre and Miquelon', 'SPM', 'PM'),
(199, 1, 'Sudan', 'SDN', 'SD'),
(200, 1, 'Suriname', 'SUR', 'SR'),
(201, 1, 'Svalbard and Jan Mayen Islands', 'SJM', 'SJ'),
(202, 1, 'Swaziland', 'SWZ', 'SZ'),
(203, 1, 'Sweden', 'SWE', 'SE'),
(204, 1, 'Switzerland', 'CHE', 'CH'),
(205, 1, 'Syrian Arab Republic', 'SYR', 'SY'),
(206, 1, 'Taiwan', 'TWN', 'TW'),
(207, 1, 'Tajikistan', 'TJK', 'TJ'),
(208, 1, 'Tanzania, United Republic of', 'TZA', 'TZ'),
(209, 1, 'Thailand', 'THA', 'TH'),
(210, 1, 'Togo', 'TGO', 'TG'),
(211, 1, 'Tokelau', 'TKL', 'TK'),
(212, 1, 'Tonga', 'TON', 'TO'),
(213, 1, 'Trinidad and Tobago', 'TTO', 'TT'),
(214, 1, 'Tunisia', 'TUN', 'TN'),
(215, 1, 'Turkey', 'TUR', 'TR'),
(216, 1, 'Turkmenistan', 'TKM', 'TM'),
(217, 1, 'Turks and Caicos Islands', 'TCA', 'TC'),
(218, 1, 'Tuvalu', 'TUV', 'TV'),
(219, 1, 'Uganda', 'UGA', 'UG'),
(220, 1, 'Ukraine', 'UKR', 'UA'),
(221, 1, 'United Arab Emirates', 'ARE', 'AE'),
(222, 1, 'United Kingdom', 'GBR', 'GB'),
(223, 1, 'United States', 'USA', 'US'),
(224, 1, 'United States Minor Outlying Islands', 'UMI', 'UM'),
(225, 1, 'Uruguay', 'URY', 'UY'),
(226, 1, 'Uzbekistan', 'UZB', 'UZ'),
(227, 1, 'Vanuatu', 'VUT', 'VU'),
(228, 1, 'Vatican City State (Holy See)', 'VAT', 'VA'),
(229, 1, 'Venezuela', 'VEN', 'VE'),
(230, 1, 'Viet Nam', 'VNM', 'VN'),
(231, 1, 'Virgin Islands (British)', 'VGB', 'VG'),
(232, 1, 'Virgin Islands (U.S.)', 'VIR', 'VI'),
(233, 1, 'Wallis and Futuna Islands', 'WLF', 'WF'),
(234, 1, 'Western Sahara', 'ESH', 'EH'),
(235, 1, 'Yemen', 'YEM', 'YE'),
(236, 1, 'Serbia', 'SRB', 'RS'),
(237, 1, 'The Democratic Republic of Congo', 'DRC', 'DC'),
(238, 1, 'Zambia', 'ZMB', 'ZM'),
(239, 1, 'Zimbabwe', 'ZWE', 'ZW'),
(240, 1, 'East Timor', 'XET', 'XE'),
(241, 1, 'Jersey', 'XJE', 'XJ'),
(242, 1, 'St. Barthelemy', 'XSB', 'XB'),
(243, 1, 'St. Eustatius', 'XSE', 'XU'),
(244, 1, 'Canary Islands', 'XCA', 'XC'),
(245, 1, 'Montenegro', 'MNE', 'ME');

-- --------------------------------------------------------

--
-- Table structure for table `jos_vm_coupons`
--

CREATE TABLE IF NOT EXISTS `jos_vm_coupons` (
  `coupon_id` int(16) NOT NULL auto_increment,
  `coupon_code` varchar(32) NOT NULL default '',
  `percent_or_total` enum('percent','total') NOT NULL default 'percent',
  `coupon_type` enum('gift','permanent') NOT NULL default 'gift',
  `coupon_value` decimal(12,2) NOT NULL default '0.00',
  PRIMARY KEY  (`coupon_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COMMENT='Used to store coupon codes' AUTO_INCREMENT=5 ;

--
-- Dumping data for table `jos_vm_coupons`
--

INSERT INTO `jos_vm_coupons` (`coupon_id`, `coupon_code`, `percent_or_total`, `coupon_type`, `coupon_value`) VALUES
(1, 'test1', 'total', 'gift', '6.00'),
(2, 'test2', 'percent', 'permanent', '15.00'),
(3, 'test3', 'total', 'permanent', '4.00'),
(4, 'test4', 'total', 'gift', '15.00');

-- --------------------------------------------------------

--
-- Table structure for table `jos_vm_creditcard`
--

CREATE TABLE IF NOT EXISTS `jos_vm_creditcard` (
  `creditcard_id` int(11) NOT NULL auto_increment,
  `vendor_id` int(11) NOT NULL default '0',
  `creditcard_name` varchar(70) NOT NULL default '',
  `creditcard_code` varchar(30) NOT NULL default '',
  PRIMARY KEY  (`creditcard_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COMMENT='Used to store credit card types' AUTO_INCREMENT=8 ;

--
-- Dumping data for table `jos_vm_creditcard`
--

INSERT INTO `jos_vm_creditcard` (`creditcard_id`, `vendor_id`, `creditcard_name`, `creditcard_code`) VALUES
(1, 1, 'Visa', 'VISA'),
(2, 1, 'MasterCard', 'MC'),
(3, 1, 'American Express', 'amex'),
(4, 1, 'Discover Card', 'discover'),
(5, 1, 'Diners Club', 'diners'),
(6, 1, 'JCB', 'jcb'),
(7, 1, 'Australian Bankcard', 'australian_bc');

-- --------------------------------------------------------

--
-- Table structure for table `jos_vm_csv`
--

CREATE TABLE IF NOT EXISTS `jos_vm_csv` (
  `field_id` int(11) NOT NULL auto_increment,
  `field_name` varchar(128) NOT NULL default '',
  `field_default_value` text,
  `field_ordering` int(3) NOT NULL default '0',
  `field_required` char(1) default 'N',
  PRIMARY KEY  (`field_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COMMENT='Holds all fields which are used on CVS Ex-/Import' AUTO_INCREMENT=26 ;

--
-- Dumping data for table `jos_vm_csv`
--

INSERT INTO `jos_vm_csv` (`field_id`, `field_name`, `field_default_value`, `field_ordering`, `field_required`) VALUES
(1, 'product_sku', '', 1, 'Y'),
(2, 'product_s_desc', '', 5, 'N'),
(3, 'product_desc', '', 6, 'N'),
(4, 'product_thumb_image', '', 7, 'N'),
(5, 'product_full_image', '', 8, 'N'),
(6, 'product_weight', '', 9, 'N'),
(7, 'product_weight_uom', 'KG', 10, 'N'),
(8, 'product_length', '', 11, 'N'),
(9, 'product_width', '', 12, 'N'),
(10, 'product_height', '', 13, 'N'),
(11, 'product_lwh_uom', '', 14, 'N'),
(12, 'product_in_stock', '0', 15, 'N'),
(13, 'product_available_date', '', 16, 'N'),
(14, 'product_discount_id', '', 17, 'N'),
(15, 'product_name', '', 2, 'Y'),
(16, 'product_price', '', 4, 'N'),
(17, 'category_path', '', 3, 'Y'),
(18, 'manufacturer_id', '', 18, 'N'),
(19, 'product_tax_id', '', 19, 'N'),
(20, 'product_sales', '', 20, 'N'),
(21, 'product_parent_id', '0', 21, 'N'),
(22, 'attribute', '', 22, 'N'),
(23, 'custom_attribute', '', 23, 'N'),
(24, 'attributes', '', 24, 'N'),
(25, 'attribute_values', '', 25, 'N');

-- --------------------------------------------------------

--
-- Table structure for table `jos_vm_currency`
--

CREATE TABLE IF NOT EXISTS `jos_vm_currency` (
  `currency_id` int(11) NOT NULL auto_increment,
  `currency_name` varchar(64) default NULL,
  `currency_code` char(3) default NULL,
  PRIMARY KEY  (`currency_id`),
  KEY `idx_currency_name` (`currency_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COMMENT='Used to store currencies' AUTO_INCREMENT=159 ;

--
-- Dumping data for table `jos_vm_currency`
--

INSERT INTO `jos_vm_currency` (`currency_id`, `currency_name`, `currency_code`) VALUES
(1, 'Andorran Peseta', 'ADP'),
(2, 'United Arab Emirates Dirham', 'AED'),
(3, 'Afghanistan Afghani', 'AFA'),
(4, 'Albanian Lek', 'ALL'),
(5, 'Netherlands Antillian Guilder', 'ANG'),
(6, 'Angolan Kwanza', 'AOK'),
(7, 'Argentine Peso', 'ARS'),
(9, 'Australian Dollar', 'AUD'),
(10, 'Aruban Florin', 'AWG'),
(11, 'Barbados Dollar', 'BBD'),
(12, 'Bangladeshi Taka', 'BDT'),
(14, 'Bulgarian Lev', 'BGL'),
(15, 'Bahraini Dinar', 'BHD'),
(16, 'Burundi Franc', 'BIF'),
(17, 'Bermudian Dollar', 'BMD'),
(18, 'Brunei Dollar', 'BND'),
(19, 'Bolivian Boliviano', 'BOB'),
(20, 'Brazilian Real', 'BRL'),
(21, 'Bahamian Dollar', 'BSD'),
(22, 'Bhutan Ngultrum', 'BTN'),
(23, 'Burma Kyat', 'BUK'),
(24, 'Botswanian Pula', 'BWP'),
(25, 'Belize Dollar', 'BZD'),
(26, 'Canadian Dollar', 'CAD'),
(27, 'Swiss Franc', 'CHF'),
(28, 'Chilean Unidades de Fomento', 'CLF'),
(29, 'Chilean Peso', 'CLP'),
(30, 'Yuan (Chinese) Renminbi', 'CNY'),
(31, 'Colombian Peso', 'COP'),
(32, 'Costa Rican Colon', 'CRC'),
(33, 'Czech Koruna', 'CZK'),
(34, 'Cuban Peso', 'CUP'),
(35, 'Cape Verde Escudo', 'CVE'),
(36, 'Cyprus Pound', 'CYP'),
(40, 'Danish Krone', 'DKK'),
(41, 'Dominican Peso', 'DOP'),
(42, 'Algerian Dinar', 'DZD'),
(43, 'Ecuador Sucre', 'ECS'),
(44, 'Egyptian Pound', 'EGP'),
(46, 'Ethiopian Birr', 'ETB'),
(47, 'Euro', 'EUR'),
(49, 'Fiji Dollar', 'FJD'),
(50, 'Falkland Islands Pound', 'FKP'),
(52, 'British Pound', 'GBP'),
(53, 'Ghanaian Cedi', 'GHC'),
(54, 'Gibraltar Pound', 'GIP'),
(55, 'Gambian Dalasi', 'GMD'),
(56, 'Guinea Franc', 'GNF'),
(58, 'Guatemalan Quetzal', 'GTQ'),
(59, 'Guinea-Bissau Peso', 'GWP'),
(60, 'Guyanan Dollar', 'GYD'),
(61, 'Hong Kong Dollar', 'HKD'),
(62, 'Honduran Lempira', 'HNL'),
(63, 'Haitian Gourde', 'HTG'),
(64, 'Hungarian Forint', 'HUF'),
(65, 'Indonesian Rupiah', 'IDR'),
(66, 'Irish Punt', 'IEP'),
(67, 'Israeli Shekel', 'ILS'),
(68, 'Indian Rupee', 'INR'),
(69, 'Iraqi Dinar', 'IQD'),
(70, 'Iranian Rial', 'IRR'),
(73, 'Jamaican Dollar', 'JMD'),
(74, 'Jordanian Dinar', 'JOD'),
(75, 'Japanese Yen', 'JPY'),
(76, 'Kenyan Shilling', 'KES'),
(77, 'Kampuchean (Cambodian) Riel', 'KHR'),
(78, 'Comoros Franc', 'KMF'),
(79, 'North Korean Won', 'KPW'),
(80, '(South) Korean Won', 'KRW'),
(81, 'Kuwaiti Dinar', 'KWD'),
(82, 'Cayman Islands Dollar', 'KYD'),
(83, 'Lao Kip', 'LAK'),
(84, 'Lebanese Pound', 'LBP'),
(85, 'Sri Lanka Rupee', 'LKR'),
(86, 'Liberian Dollar', 'LRD'),
(87, 'Lesotho Loti', 'LSL'),
(89, 'Libyan Dinar', 'LYD'),
(90, 'Moroccan Dirham', 'MAD'),
(91, 'Malagasy Franc', 'MGF'),
(92, 'Mongolian Tugrik', 'MNT'),
(93, 'Macau Pataca', 'MOP'),
(94, 'Mauritanian Ouguiya', 'MRO'),
(95, 'Maltese Lira', 'MTL'),
(96, 'Mauritius Rupee', 'MUR'),
(97, 'Maldive Rufiyaa', 'MVR'),
(98, 'Malawi Kwacha', 'MWK'),
(99, 'Mexican Peso', 'MXP'),
(100, 'Malaysian Ringgit', 'MYR'),
(101, 'Mozambique Metical', 'MZM'),
(102, 'Nigerian Naira', 'NGN'),
(103, 'Nicaraguan Cordoba', 'NIC'),
(105, 'Norwegian Kroner', 'NOK'),
(106, 'Nepalese Rupee', 'NPR'),
(107, 'New Zealand Dollar', 'NZD'),
(108, 'Omani Rial', 'OMR'),
(109, 'Panamanian Balboa', 'PAB'),
(110, 'Peruvian Nuevo Sol', 'PEN'),
(111, 'Papua New Guinea Kina', 'PGK'),
(112, 'Philippine Peso', 'PHP'),
(113, 'Pakistan Rupee', 'PKR'),
(114, 'Polish Z?oty', 'PLN'),
(116, 'Paraguay Guarani', 'PYG'),
(117, 'Qatari Rial', 'QAR'),
(118, 'Romanian Leu', 'RON'),
(119, 'Rwanda Franc', 'RWF'),
(120, 'Saudi Arabian Riyal', 'SAR'),
(121, 'Solomon Islands Dollar', 'SBD'),
(122, 'Seychelles Rupee', 'SCR'),
(123, 'Sudanese Pound', 'SDP'),
(124, 'Swedish Krona', 'SEK'),
(125, 'Singapore Dollar', 'SGD'),
(126, 'St. Helena Pound', 'SHP'),
(127, 'Sierra Leone Leone', 'SLL'),
(128, 'Somali Shilling', 'SOS'),
(129, 'Suriname Guilder', 'SRG'),
(130, 'Sao Tome and Principe Dobra', 'STD'),
(131, 'Russian Ruble', 'RUB'),
(132, 'El Salvador Colon', 'SVC'),
(133, 'Syrian Potmd', 'SYP'),
(134, 'Swaziland Lilangeni', 'SZL'),
(135, 'Thai Bath', 'THB'),
(136, 'Tunisian Dinar', 'TND'),
(137, 'Tongan Pa''anga', 'TOP'),
(138, 'East Timor Escudo', 'TPE'),
(139, 'Turkish Lira', 'TRY'),
(140, 'Trinidad and Tobago Dollar', 'TTD'),
(141, 'Taiwan Dollar', 'TWD'),
(142, 'Tanzanian Shilling', 'TZS'),
(143, 'Uganda Shilling', 'UGS'),
(144, 'US Dollar', 'USD'),
(145, 'Uruguayan Peso', 'UYP'),
(146, 'Venezualan Bolivar', 'VEB'),
(147, 'Vietnamese Dong', 'VND'),
(148, 'Vanuatu Vatu', 'VUV'),
(149, 'Samoan Tala', 'WST'),
(150, 'Democratic Yemeni Dinar', 'YDD'),
(151, 'Yemeni Rial', 'YER'),
(152, 'Dinar', 'RSD'),
(153, 'South African Rand', 'ZAR'),
(154, 'Zambian Kwacha', 'ZMK'),
(155, 'Zaire Zaire', 'ZRZ'),
(156, 'Zimbabwe Dollar', 'ZWD'),
(157, 'Slovak Koruna', 'SKK'),
(158, 'Armenian Dram', 'AMD');

-- --------------------------------------------------------

--
-- Table structure for table `jos_vm_export`
--

CREATE TABLE IF NOT EXISTS `jos_vm_export` (
  `export_id` int(11) NOT NULL auto_increment,
  `vendor_id` int(11) default NULL,
  `export_name` varchar(255) default NULL,
  `export_desc` text NOT NULL,
  `export_class` varchar(50) NOT NULL,
  `export_enabled` char(1) NOT NULL default 'N',
  `export_config` text NOT NULL,
  `iscore` tinyint(3) NOT NULL default '0',
  PRIMARY KEY  (`export_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Export Modules' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `jos_vm_function`
--

CREATE TABLE IF NOT EXISTS `jos_vm_function` (
  `function_id` int(11) NOT NULL auto_increment,
  `module_id` int(11) default NULL,
  `function_name` varchar(32) default NULL,
  `function_class` varchar(32) default NULL,
  `function_method` varchar(32) default NULL,
  `function_description` text,
  `function_perms` varchar(255) default NULL,
  PRIMARY KEY  (`function_id`),
  KEY `idx_function_module_id` (`module_id`),
  KEY `idx_function_name` (`function_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COMMENT='Used to map a function alias to a ''real'' class::function' AUTO_INCREMENT=195 ;

--
-- Dumping data for table `jos_vm_function`
--

INSERT INTO `jos_vm_function` (`function_id`, `module_id`, `function_name`, `function_class`, `function_method`, `function_description`, `function_perms`) VALUES
(1, 1, 'userAdd', 'ps_user', 'add', '', 'admin,storeadmin'),
(2, 1, 'userDelete', 'ps_user', 'delete', '', 'admin,storeadmin'),
(3, 1, 'userUpdate', 'ps_user', 'update', '', 'admin,storeadmin'),
(31, 2, 'productAdd', 'ps_product', 'add', '', 'admin,storeadmin'),
(6, 1, 'functionAdd', 'ps_function', 'add', '', 'admin'),
(7, 1, 'functionUpdate', 'ps_function', 'update', '', 'admin'),
(8, 1, 'functionDelete', 'ps_function', 'delete', '', 'admin'),
(9, 1, 'userLogout', 'ps_user', 'logout', '', 'none'),
(10, 1, 'userAddressAdd', 'ps_user_address', 'add', '', 'admin,storeadmin,shopper,demo'),
(11, 1, 'userAddressUpdate', 'ps_user_address', 'update', '', 'admin,storeadmin,shopper'),
(12, 1, 'userAddressDelete', 'ps_user_address', 'delete', '', 'admin,storeadmin,shopper'),
(13, 1, 'moduleAdd', 'ps_module', 'add', '', 'admin'),
(14, 1, 'moduleUpdate', 'ps_module', 'update', '', 'admin'),
(15, 1, 'moduleDelete', 'ps_module', 'delete', '', 'admin'),
(16, 1, 'userLogin', 'ps_user', 'login', '', 'none'),
(17, 3, 'vendorAdd', 'ps_vendor', 'add', '', 'admin'),
(18, 3, 'vendorUpdate', 'ps_vendor', 'update', '', 'admin,storeadmin'),
(19, 3, 'vendorDelete', 'ps_vendor', 'delete', '', 'admin'),
(20, 3, 'vendorCategoryAdd', 'ps_vendor_category', 'add', '', 'admin'),
(21, 3, 'vendorCategoryUpdate', 'ps_vendor_category', 'update', '', 'admin'),
(22, 3, 'vendorCategoryDelete', 'ps_vendor_category', 'delete', '', 'admin'),
(23, 4, 'shopperAdd', 'ps_shopper', 'add', '', 'none'),
(24, 4, 'shopperDelete', 'ps_shopper', 'delete', '', 'admin,storeadmin'),
(25, 4, 'shopperUpdate', 'ps_shopper', 'update', '', 'admin,storeadmin,shopper'),
(26, 4, 'shopperGroupAdd', 'ps_shopper_group', 'add', '', 'admin,storeadmin'),
(27, 4, 'shopperGroupUpdate', 'ps_shopper_group', 'update', '', 'admin,storeadmin'),
(28, 4, 'shopperGroupDelete', 'ps_shopper_group', 'delete', '', 'admin,storeadmin'),
(30, 5, 'orderStatusSet', 'ps_order', 'order_status_update', '', 'admin,storeadmin'),
(32, 2, 'productDelete', 'ps_product', 'delete', '', 'admin,storeadmin'),
(33, 2, 'productUpdate', 'ps_product', 'update', '', 'admin,storeadmin'),
(34, 2, 'productCategoryAdd', 'ps_product_category', 'add', '', 'admin,storeadmin'),
(35, 2, 'productCategoryUpdate', 'ps_product_category', 'update', '', 'admin,storeadmin'),
(36, 2, 'productCategoryDelete', 'ps_product_category', 'delete', '', 'admin,storeadmin'),
(37, 2, 'productPriceAdd', 'ps_product_price', 'add', '', 'admin,storeadmin'),
(38, 2, 'productPriceUpdate', 'ps_product_price', 'update', '', 'admin,storeadmin'),
(39, 2, 'productPriceDelete', 'ps_product_price', 'delete', '', 'admin,storeadmin'),
(40, 2, 'productAttributeAdd', 'ps_product_attribute', 'add', '', 'admin,storeadmin'),
(41, 2, 'productAttributeUpdate', 'ps_product_attribute', 'update', '', 'admin,storeadmin'),
(42, 2, 'productAttributeDelete', 'ps_product_attribute', 'delete', '', 'admin,storeadmin'),
(43, 7, 'cartAdd', 'ps_cart', 'add', '', 'none'),
(44, 7, 'cartUpdate', 'ps_cart', 'update', '', 'none'),
(45, 7, 'cartDelete', 'ps_cart', 'delete', '', 'none'),
(46, 10, 'checkoutComplete', 'ps_checkout', 'add', '', 'shopper,storeadmin,admin'),
(48, 8, 'paymentMethodUpdate', 'ps_payment_method', 'update', '', 'admin,storeadmin'),
(49, 8, 'paymentMethodAdd', 'ps_payment_method', 'add', '', 'admin,storeadmin'),
(50, 8, 'paymentMethodDelete', 'ps_payment_method', 'delete', '', 'admin,storeadmin'),
(51, 5, 'orderDelete', 'ps_order', 'delete', '', 'admin,storeadmin'),
(52, 11, 'addTaxRate', 'ps_tax', 'add', '', 'admin,storeadmin'),
(53, 11, 'updateTaxRate', 'ps_tax', 'update', '', 'admin,storeadmin'),
(54, 11, 'deleteTaxRate', 'ps_tax', 'delete', '', 'admin,storeadmin'),
(55, 10, 'checkoutValidateST', 'ps_checkout', 'validate_shipto', '', 'none'),
(59, 5, 'orderStatusUpdate', 'ps_order_status', 'update', '', 'admin,storeadmin'),
(60, 5, 'orderStatusAdd', 'ps_order_status', 'add', '', 'storeadmin,admin'),
(61, 5, 'orderStatusDelete', 'ps_order_status', 'delete', '', 'admin,storeadmin'),
(62, 1, 'currencyAdd', 'ps_currency', 'add', 'add a currency', 'storeadmin,admin'),
(63, 1, 'currencyUpdate', 'ps_currency', 'update', '        update a currency', 'storeadmin,admin'),
(64, 1, 'currencyDelete', 'ps_currency', 'delete', 'delete a currency', 'storeadmin,admin'),
(65, 1, 'countryAdd', 'ps_country', 'add', 'Add a country ', 'storeadmin,admin'),
(66, 1, 'countryUpdate', 'ps_country', 'update', 'Update a country record', 'storeadmin,admin'),
(67, 1, 'countryDelete', 'ps_country', 'delete', 'Delete a country record', 'storeadmin,admin'),
(68, 2, 'product_csv', 'ps_csv', 'upload_csv', '', 'admin'),
(110, 7, 'waitingListAdd', 'zw_waiting_list', 'add', '', 'none'),
(111, 13, 'addzone', 'ps_zone', 'add', 'This will add a zone', 'admin,storeadmin'),
(112, 13, 'updatezone', 'ps_zone', 'update', 'This will update a zone', 'admin,storeadmin'),
(113, 13, 'deletezone', 'ps_zone', 'delete', 'This will delete a zone', 'admin,storeadmin'),
(114, 13, 'zoneassign', 'ps_zone', 'assign', 'This will assign a country to a zone', 'admin,storeadmin'),
(115, 1, 'writeConfig', 'ps_config', 'writeconfig', 'This will write the configuration details to virtuemart.cfg.php', 'admin'),
(116, 12839, 'carrierAdd', 'ps_shipping', 'add', '', 'admin,storeadmin'),
(117, 12839, 'carrierDelete', 'ps_shipping', 'delete', '', 'admin,storeadmin'),
(118, 12839, 'carrierUpdate', 'ps_shipping', 'update', '', 'admin,storeadmin'),
(119, 12839, 'rateAdd', 'ps_shipping', 'rate_add', '', 'admin,storeadmin'),
(120, 12839, 'rateUpdate', 'ps_shipping', 'rate_update', '', 'admin,shopadmin'),
(121, 12839, 'rateDelete', 'ps_shipping', 'rate_delete', '', 'admin,storeadmin'),
(122, 10, 'checkoutProcess', 'ps_checkout', 'process', '', 'none'),
(123, 5, 'downloadRequest', 'ps_order', 'download_request', 'This checks if the download request is valid and sends the file to the browser as file download if the request was successful, otherwise echoes an error', 'none'),
(128, 99, 'manufacturerAdd', 'ps_manufacturer', 'add', '', 'admin,storeadmin'),
(129, 99, 'manufacturerUpdate', 'ps_manufacturer', 'update', '', 'admin,storeadmin'),
(130, 99, 'manufacturerDelete', 'ps_manufacturer', 'delete', '', 'admin,storeadmin'),
(131, 99, 'manufacturercategoryAdd', 'ps_manufacturer_category', 'add', '', 'admin,storeadmin'),
(132, 99, 'manufacturercategoryUpdate', 'ps_manufacturer_category', 'update', '', 'admin,storeadmin'),
(133, 99, 'manufacturercategoryDelete', 'ps_manufacturer_category', 'delete', '', 'admin,storeadmin'),
(134, 7, 'addReview', 'ps_reviews', 'process_review', 'This lets the user add a review and rating to a product.', 'admin,storeadmin,shopper,demo'),
(135, 7, 'productReviewDelete', 'ps_reviews', 'delete_review', 'This deletes a review and from a product.', 'admin,storeadmin'),
(136, 8, 'creditcardAdd', 'ps_creditcard', 'add', 'Adds a Credit Card entry.', 'admin,storeadmin'),
(137, 8, 'creditcardUpdate', 'ps_creditcard', 'update', 'Updates a Credit Card entry.', 'admin,storeadmin'),
(138, 8, 'creditcardDelete', 'ps_creditcard', 'delete', 'Deletes a Credit Card entry.', 'admin,storeadmin'),
(139, 2, 'changePublishState', 'vmAbstractObject.class', 'handlePublishState', 'Changes the publish field of an item, so that it can be published or unpublished easily.', 'admin,storeadmin'),
(140, 2, 'export_csv', 'ps_csv', 'export_csv', 'This function exports all relevant product data to CSV.', 'admin,storeadmin'),
(141, 2, 'reorder', 'ps_product_category', 'reorder', 'Changes the list order of a category.', 'admin,storeadmin'),
(142, 2, 'discountAdd', 'ps_product_discount', 'add', 'Adds a discount.', 'admin,storeadmin'),
(143, 2, 'discountUpdate', 'ps_product_discount', 'update', 'Updates a discount.', 'admin,storeadmin'),
(144, 2, 'discountDelete', 'ps_product_discount', 'delete', 'Deletes a discount.', 'admin,storeadmin'),
(145, 8, 'shippingmethodSave', 'ps_shipping_method', 'save', '', 'admin,storeadmin'),
(146, 2, 'uploadProductFile', 'ps_product_files', 'add', 'Uploads and Adds a Product Image/File.', 'admin,storeadmin'),
(147, 2, 'updateProductFile', 'ps_product_files', 'update', 'Updates a Product Image/File.', 'admin,storeadmin'),
(148, 2, 'deleteProductFile', 'ps_product_files', 'delete', 'Deletes a Product Image/File.', 'admin,storeadmin'),
(149, 12843, 'couponAdd', 'ps_coupon', 'add_coupon_code', 'Adds a Coupon.', 'admin,storeadmin'),
(150, 12843, 'couponUpdate', 'ps_coupon', 'update_coupon', 'Updates a Coupon.', 'admin,storeadmin'),
(151, 12843, 'couponDelete', 'ps_coupon', 'remove_coupon_code', 'Deletes a Coupon.', 'admin,storeadmin'),
(152, 12843, 'couponProcess', 'ps_coupon', 'process_coupon_code', 'Processes a Coupon.', 'admin,storeadmin,shopper,demo'),
(153, 2, 'ProductTypeAdd', 'ps_product_type', 'add', 'Function add a Product Type and create new table product_type_<id>.', 'admin'),
(154, 2, 'ProductTypeUpdate', 'ps_product_type', 'update', 'Update a Product Type.', 'admin'),
(155, 2, 'ProductTypeDelete', 'ps_product_type', 'delete', 'Delete a Product Type and drop table product_type_<id>.', 'admin'),
(156, 2, 'ProductTypeReorder', 'ps_product_type', 'reorder', 'Changes the list order of a Product Type.', 'admin'),
(157, 2, 'ProductTypeAddParam', 'ps_product_type_parameter', 'add_parameter', 'Function add a Parameter into a Product Type and create new column in table product_type_<id>.', 'admin'),
(158, 2, 'ProductTypeUpdateParam', 'ps_product_type_parameter', 'update_parameter', 'Function update a Parameter in a Product Type and a column in table product_type_<id>.', 'admin'),
(159, 2, 'ProductTypeDeleteParam', 'ps_product_type_parameter', 'delete_parameter', 'Function delete a Parameter from a Product Type and drop a column in table product_type_<id>.', 'admin'),
(160, 2, 'ProductTypeReorderParam', 'ps_product_type_parameter', 'reorder_parameter', 'Changes the list order of a Parameter.', 'admin'),
(161, 2, 'productProductTypeAdd', 'ps_product_product_type', 'add', 'Add a Product into a Product Type.', 'admin,storeadmin'),
(162, 2, 'productProductTypeDelete', 'ps_product_product_type', 'delete', 'Delete a Product from a Product Type.', 'admin,storeadmin'),
(163, 1, 'stateAdd', 'ps_country', 'addState', 'Add a State ', 'storeadmin,admin'),
(164, 1, 'stateUpdate', 'ps_country', 'updateState', 'Update a state record', 'storeadmin,admin'),
(165, 1, 'stateDelete', 'ps_country', 'deleteState', 'Delete a state record', 'storeadmin,admin'),
(166, 2, 'csvFieldAdd', 'ps_csv', 'add', 'Add a CSV Field ', 'storeadmin,admin'),
(167, 2, 'csvFieldUpdate', 'ps_csv', 'update', 'Update a CSV Field', 'storeadmin,admin'),
(168, 2, 'csvFieldDelete', 'ps_csv', 'delete', 'Delete a CSV Field', 'storeadmin,admin'),
(169, 1, 'userfieldSave', 'ps_userfield', 'savefield', 'add or edit a user field', 'admin'),
(170, 1, 'userfieldDelete', 'ps_userfield', 'deletefield', '', 'admin'),
(171, 1, 'changeordering', 'vmAbstractObject.class', 'handleordering', '', 'admin'),
(172, 2, 'moveProduct', 'ps_product', 'move', 'Move products from one category to another.', 'admin,storeadmin'),
(173, 7, 'productAsk', 'ps_communication', 'mail_question', 'Lets the customer send a question about a specific product.', 'none'),
(174, 7, 'recommendProduct', 'ps_communication', 'sendRecommendation', 'Lets the customer send a recommendation about a specific product to a friend.', 'none'),
(175, 2, 'reviewUpdate', 'ps_reviews', 'update', 'Modify a review about a specific product.', 'admin'),
(176, 8, 'ExportUpdate', 'ps_export', 'update', '', 'admin,storeadmin'),
(177, 8, 'ExportAdd', 'ps_export', 'add', '', 'admin,storeadmin'),
(178, 8, 'ExportDelete', 'ps_export', 'delete', '', 'admin,storeadmin'),
(179, 1, 'writeThemeConfig', 'ps_config', 'writeThemeConfig', 'Writes a theme configuration file.', 'admin'),
(180, 1, 'usergroupAdd', 'usergroup.class', 'add', 'Add a new user group', 'admin'),
(181, 1, 'usergroupUpdate', 'usergroup.class', 'update', 'Update an user group', 'admin'),
(182, 1, 'usergroupDelete', 'usergroup.class', 'delete', 'Delete an user group', 'admin'),
(183, 1, 'setModulePermissions', 'ps_module', 'update_permissions', '', 'admin'),
(184, 1, 'setFunctionPermissions', 'ps_function', 'update_permissions', '', 'admin'),
(185, 2, 'insertDownloadsForProduct', 'ps_order', 'insert_downloads_for_product', '', 'admin'),
(186, 5, 'mailDownloadId', 'ps_order', 'mail_download_id', '', 'storeadmin,admin'),
(187, 7, 'replaceSavedCart', 'ps_cart', 'replaceCart', 'Replace cart with saved cart', 'none'),
(188, 7, 'mergeSavedCart', 'ps_cart', 'mergeSaved', 'Merge saved cart with cart', 'none'),
(189, 7, 'deleteSavedCart', 'ps_cart', 'deleteCart', 'Delete saved cart', 'none'),
(190, 7, 'savedCartDelete', 'ps_cart', 'deleteSaved', 'Delete items from saved cart', 'none'),
(191, 7, 'savedCartUpdate', 'ps_cart', 'updateSaved', 'Update saved cart items', 'none'),
(192, 1, 'getupdatepackage', 'update.class', 'getPatchPackage', 'Retrieves the Patch Package from the virtuemart.net Servers.', 'admin'),
(193, 1, 'applypatchpackage', 'update.class', 'applyPatch', 'Applies the Patch using the instructions from the update.xml file in the downloaded patch.', 'admin'),
(194, 1, 'removePatchPackage', 'update.class', 'removePackageFile', 'Removes  a Patch Package File and its extracted contents.', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `jos_vm_manufacturer`
--

CREATE TABLE IF NOT EXISTS `jos_vm_manufacturer` (
  `manufacturer_id` int(11) NOT NULL auto_increment,
  `mf_name` varchar(64) default NULL,
  `mf_email` varchar(255) default NULL,
  `mf_desc` text,
  `mf_category_id` int(11) default NULL,
  `mf_url` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`manufacturer_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COMMENT='Manufacturers are those who create products' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `jos_vm_manufacturer`
--

INSERT INTO `jos_vm_manufacturer` (`manufacturer_id`, `mf_name`, `mf_email`, `mf_desc`, `mf_category_id`, `mf_url`) VALUES
(1, 'Manufacturer', 'info@manufacturer.com', 'An example for a manufacturer', 1, 'http://www.a-url.com');

-- --------------------------------------------------------

--
-- Table structure for table `jos_vm_manufacturer_category`
--

CREATE TABLE IF NOT EXISTS `jos_vm_manufacturer_category` (
  `mf_category_id` int(11) NOT NULL auto_increment,
  `mf_category_name` varchar(64) default NULL,
  `mf_category_desc` text,
  PRIMARY KEY  (`mf_category_id`),
  KEY `idx_manufacturer_category_category_name` (`mf_category_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COMMENT='Manufacturers are assigned to these categories' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `jos_vm_manufacturer_category`
--

INSERT INTO `jos_vm_manufacturer_category` (`mf_category_id`, `mf_category_name`, `mf_category_desc`) VALUES
(1, '-default-', 'This is the default manufacturer category');

-- --------------------------------------------------------

--
-- Table structure for table `jos_vm_module`
--

CREATE TABLE IF NOT EXISTS `jos_vm_module` (
  `module_id` int(11) NOT NULL auto_increment,
  `module_name` varchar(255) default NULL,
  `module_description` text,
  `module_perms` varchar(255) default NULL,
  `module_publish` char(1) default NULL,
  `list_order` int(11) default NULL,
  PRIMARY KEY  (`module_id`),
  KEY `idx_module_name` (`module_name`),
  KEY `idx_module_list_order` (`list_order`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COMMENT='VirtueMart Core Modules, not: Joomla modules' AUTO_INCREMENT=12844 ;

--
-- Dumping data for table `jos_vm_module`
--

INSERT INTO `jos_vm_module` (`module_id`, `module_name`, `module_description`, `module_perms`, `module_publish`, `list_order`) VALUES
(1, 'admin', '<h4>ADMINISTRATIVE USERS ONLY</h4>\r\n\r\n<p>Only used for the following:</p>\r\n<OL>\r\n\r\n<LI>User Maintenance</LI>\r\n<LI>Module Maintenance</LI>\r\n<LI>Function Maintenance</LI>\r\n</OL>\r\n', 'admin', 'Y', 1),
(2, 'product', '<p>Here you can adminster your online catalog of products.  The Product Administrator allows you to create product categories, create new products, edit product attributes, and add product items for each attribute value.</p>', 'storeadmin,admin', 'Y', 4),
(3, 'vendor', '<h4>ADMINISTRATIVE USERS ONLY</h4>\r\n<p>Here you can manage the vendors on the phpShop system.</p>', 'admin', 'Y', 6),
(4, 'shopper', '<p>Manage shoppers in your store.  Allows you to create shopper groups.  Shopper groups can be used when setting the price for a product.  This allows you to create different prices for different types of users.  An example of this would be to have a ''wholesale'' group and a ''retail'' group. </p>', 'admin,storeadmin', 'Y', 4),
(5, 'order', '<p>View Order and Update Order Status.</p>', 'admin,storeadmin', 'Y', 5),
(6, 'msgs', 'This module is unprotected an used for displaying system messages to users.  We need to have an area that does not require authorization when things go wrong.', 'none', 'N', 99),
(7, 'shop', 'This is the Washupito store module.  This is the demo store included with the phpShop distribution.', 'none', 'Y', 99),
(8, 'store', '', 'storeadmin,admin', 'Y', 2),
(9, 'account', 'This module allows shoppers to update their account information and view previously placed orders.', 'shopper,storeadmin,admin,demo', 'N', 99),
(10, 'checkout', '', 'none', 'N', 99),
(11, 'tax', 'The tax module allows you to set tax rates for states or regions within a country.  The rate is set as a decimal figure.  For example, 2 percent tax would be 0.02.', 'admin,storeadmin', 'Y', 8),
(12, 'reportbasic', 'The report basic module allows you to do queries on all orders.', 'admin,storeadmin', 'Y', 7),
(13, 'zone', 'This is the zone-shipping module. Here you can manage your shipping costs according to Zones.', 'admin,storeadmin', 'N', 9),
(12839, 'shipping', '<h4>Shipping</h4><p>Let this module calculate the shipping fees for your customers.<br>Create carriers for shipping areas and weight groups.</p>', 'admin,storeadmin', 'Y', 10),
(99, 'manufacturer', 'Manage the manufacturers of products in your store.', 'storeadmin,admin', 'Y', 12),
(12842, 'help', 'Help Module', 'admin,storeadmin', 'Y', 13),
(12843, 'coupon', 'Coupon Management', 'admin,storeadmin', 'Y', 11);

-- --------------------------------------------------------

--
-- Table structure for table `jos_vm_orders`
--

CREATE TABLE IF NOT EXISTS `jos_vm_orders` (
  `order_id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL default '0',
  `vendor_id` int(11) NOT NULL default '0',
  `order_number` varchar(32) default NULL,
  `user_info_id` varchar(32) default NULL,
  `order_total` decimal(15,5) NOT NULL default '0.00000',
  `order_subtotal` decimal(15,5) default NULL,
  `order_tax` decimal(10,2) default NULL,
  `order_tax_details` text NOT NULL,
  `order_shipping` decimal(10,2) default NULL,
  `order_shipping_tax` decimal(10,2) default NULL,
  `coupon_discount` decimal(12,2) NOT NULL default '0.00',
  `coupon_code` varchar(32) default NULL,
  `order_discount` decimal(12,2) NOT NULL default '0.00',
  `order_currency` varchar(16) default NULL,
  `order_status` char(1) default NULL,
  `cdate` int(11) default NULL,
  `mdate` int(11) default NULL,
  `ship_method_id` varchar(255) default NULL,
  `customer_note` text NOT NULL,
  `ip_address` varchar(15) NOT NULL default '',
  PRIMARY KEY  (`order_id`),
  KEY `idx_orders_user_id` (`user_id`),
  KEY `idx_orders_vendor_id` (`vendor_id`),
  KEY `idx_orders_order_number` (`order_number`),
  KEY `idx_orders_user_info_id` (`user_info_id`),
  KEY `idx_orders_ship_method_id` (`ship_method_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Used to store all orders' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `jos_vm_order_history`
--

CREATE TABLE IF NOT EXISTS `jos_vm_order_history` (
  `order_status_history_id` int(11) NOT NULL auto_increment,
  `order_id` int(11) NOT NULL default '0',
  `order_status_code` char(1) NOT NULL default '0',
  `date_added` datetime NOT NULL default '0000-00-00 00:00:00',
  `customer_notified` int(1) default '0',
  `comments` text,
  PRIMARY KEY  (`order_status_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Stores all actions and changes that occur to an order' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `jos_vm_order_item`
--

CREATE TABLE IF NOT EXISTS `jos_vm_order_item` (
  `order_item_id` int(11) NOT NULL auto_increment,
  `order_id` int(11) default NULL,
  `user_info_id` varchar(32) default NULL,
  `vendor_id` int(11) default NULL,
  `product_id` int(11) default NULL,
  `order_item_sku` varchar(64) NOT NULL default '',
  `order_item_name` varchar(64) NOT NULL default '',
  `product_quantity` int(11) default NULL,
  `product_item_price` decimal(15,5) default NULL,
  `product_final_price` decimal(12,2) NOT NULL default '0.00',
  `order_item_currency` varchar(16) default NULL,
  `order_status` char(1) default NULL,
  `cdate` int(11) default NULL,
  `mdate` int(11) default NULL,
  `product_attribute` text,
  PRIMARY KEY  (`order_item_id`),
  KEY `idx_order_item_order_id` (`order_id`),
  KEY `idx_order_item_user_info_id` (`user_info_id`),
  KEY `idx_order_item_vendor_id` (`vendor_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Stores all items (products) which are part of an order' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `jos_vm_order_payment`
--

CREATE TABLE IF NOT EXISTS `jos_vm_order_payment` (
  `order_id` int(11) NOT NULL default '0',
  `payment_method_id` int(11) default NULL,
  `order_payment_code` varchar(30) NOT NULL default '',
  `order_payment_number` blob,
  `order_payment_expire` int(11) default NULL,
  `order_payment_name` varchar(255) default NULL,
  `order_payment_log` text,
  `order_payment_trans_id` text NOT NULL,
  KEY `idx_order_payment_order_id` (`order_id`),
  KEY `idx_order_payment_method_id` (`payment_method_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='The payment method that was chosen for a specific order';

-- --------------------------------------------------------

--
-- Table structure for table `jos_vm_order_status`
--

CREATE TABLE IF NOT EXISTS `jos_vm_order_status` (
  `order_status_id` int(11) NOT NULL auto_increment,
  `order_status_code` char(1) NOT NULL default '',
  `order_status_name` varchar(64) default NULL,
  `order_status_description` text NOT NULL,
  `list_order` int(11) default NULL,
  `vendor_id` int(11) default NULL,
  PRIMARY KEY  (`order_status_id`),
  KEY `idx_order_status_list_order` (`list_order`),
  KEY `idx_order_status_vendor_id` (`vendor_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COMMENT='All available order statuses' AUTO_INCREMENT=6 ;

--
-- Dumping data for table `jos_vm_order_status`
--

INSERT INTO `jos_vm_order_status` (`order_status_id`, `order_status_code`, `order_status_name`, `order_status_description`, `list_order`, `vendor_id`) VALUES
(1, 'P', 'Pending', '', 1, 1),
(2, 'C', 'Confirmed', '', 2, 1),
(3, 'X', 'Cancelled', '', 3, 1),
(4, 'R', 'Refunded', '', 4, 1),
(5, 'S', 'Shipped', '', 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `jos_vm_order_user_info`
--

CREATE TABLE IF NOT EXISTS `jos_vm_order_user_info` (
  `order_info_id` int(11) NOT NULL auto_increment,
  `order_id` int(11) NOT NULL default '0',
  `user_id` int(11) NOT NULL default '0',
  `address_type` char(2) default NULL,
  `address_type_name` varchar(32) default NULL,
  `company` varchar(64) default NULL,
  `title` varchar(32) default NULL,
  `last_name` varchar(32) default NULL,
  `first_name` varchar(32) default NULL,
  `middle_name` varchar(32) default NULL,
  `phone_1` varchar(32) default NULL,
  `phone_2` varchar(32) default NULL,
  `fax` varchar(32) default NULL,
  `address_1` varchar(64) NOT NULL default '',
  `address_2` varchar(64) default NULL,
  `city` varchar(32) NOT NULL default '',
  `state` varchar(32) NOT NULL default '',
  `country` varchar(32) NOT NULL default 'US',
  `zip` varchar(32) NOT NULL default '',
  `user_email` varchar(255) default NULL,
  `extra_field_1` varchar(255) default NULL,
  `extra_field_2` varchar(255) default NULL,
  `extra_field_3` varchar(255) default NULL,
  `extra_field_4` char(1) default NULL,
  `extra_field_5` char(1) default NULL,
  `bank_account_nr` varchar(32) NOT NULL default '',
  `bank_name` varchar(32) NOT NULL default '',
  `bank_sort_code` varchar(16) NOT NULL default '',
  `bank_iban` varchar(64) NOT NULL default '',
  `bank_account_holder` varchar(48) NOT NULL default '',
  `bank_account_type` enum('Checking','Business Checking','Savings') NOT NULL default 'Checking',
  PRIMARY KEY  (`order_info_id`),
  KEY `idx_order_info_order_id` (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Stores the BillTo and ShipTo Information at order time' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `jos_vm_payment_method`
--

CREATE TABLE IF NOT EXISTS `jos_vm_payment_method` (
  `payment_method_id` int(11) NOT NULL auto_increment,
  `vendor_id` int(11) default NULL,
  `payment_method_name` varchar(255) default NULL,
  `payment_class` varchar(50) NOT NULL default '',
  `shopper_group_id` int(11) default NULL,
  `payment_method_discount` decimal(12,2) default NULL,
  `payment_method_discount_is_percent` tinyint(1) NOT NULL,
  `payment_method_discount_max_amount` decimal(10,2) NOT NULL,
  `payment_method_discount_min_amount` decimal(10,2) NOT NULL,
  `list_order` int(11) default NULL,
  `payment_method_code` varchar(8) default NULL,
  `enable_processor` char(1) default NULL,
  `is_creditcard` tinyint(1) NOT NULL default '0',
  `payment_enabled` char(1) NOT NULL default 'N',
  `accepted_creditcards` varchar(128) NOT NULL default '',
  `payment_extrainfo` text NOT NULL,
  `payment_passkey` blob NOT NULL,
  PRIMARY KEY  (`payment_method_id`),
  KEY `idx_payment_method_vendor_id` (`vendor_id`),
  KEY `idx_payment_method_name` (`payment_method_name`),
  KEY `idx_payment_method_list_order` (`list_order`),
  KEY `idx_payment_method_shopper_group_id` (`shopper_group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COMMENT='The payment methods of your store' AUTO_INCREMENT=21 ;

--
-- Dumping data for table `jos_vm_payment_method`
--

INSERT INTO `jos_vm_payment_method` (`payment_method_id`, `vendor_id`, `payment_method_name`, `payment_class`, `shopper_group_id`, `payment_method_discount`, `payment_method_discount_is_percent`, `payment_method_discount_max_amount`, `payment_method_discount_min_amount`, `list_order`, `payment_method_code`, `enable_processor`, `is_creditcard`, `payment_enabled`, `accepted_creditcards`, `payment_extrainfo`, `payment_passkey`) VALUES
(1, 1, 'Purchase Order', '', 6, '0.00', 0, '0.00', '0.00', 4, 'PO', 'N', 0, 'N', '', '', ''),
(2, 1, 'Cash On Delivery', '', 5, '-2.00', 0, '0.00', '0.00', 5, 'COD', 'N', 0, 'Y', '', '', ''),
(3, 1, 'Credit Card', 'ps_authorize', 5, '0.00', 0, '0.00', '0.00', 0, 'AN', 'Y', 0, 'N', '1,2,6,7,', '', ''),
(4, 1, 'PayPal (new API)', 'ps_paypal_api', 5, '0.00', 0, '0.00', '0.00', 0, 'PP_API', 'Y', 1, 'N', '', '', ''),
(5, 1, 'PayMate', 'ps_paymate', 5, '0.00', 0, '0.00', '0.00', 0, 'PM', 'P', 0, 'N', '', '<script type="text/javascript" language="javascript">\n  function openExpress(){\n      var url = ''https://www.paymate.com/PayMate/ExpressPayment?mid=<?php echo PAYMATE_USERNAME.\n          "&amt=".$db->f("order_total").\n   "&currency=".$_SESSION[''vendor_currency''].\n       "&ref=".$db->f("order_id").\n      "&pmt_sender_email=".$user->email.\n         "&pmt_contact_firstname=".$user->first_name.\n       "&pmt_contact_surname=".$user->last_name.\n          "&regindi_address1=".$user->address_1.\n     "&regindi_address2=".$user->address_2.\n     "&regindi_sub=".$user->city.\n       "&regindi_pcode=".$user->zip;?>''\n        var newWin = window.open(url, ''wizard'', ''height=640,width=500,scrollbars=0,toolbar=no'');\n  self.name = ''parent'';\n       newWin.focus();\n  }\n  </script>\n  <div align="center">\n  <p>\n  <a href="javascript:openExpress();">\n  <img src="https://www.paymate.com/homepage/images/butt_PayNow.gif" border="0" alt="Pay with Paymate Express">\n  <br />click here to pay your account</a>\n  </p>\n  </div>', ''),
(6, 1, 'WorldPay', 'ps_worldpay', 5, '0.00', 0, '0.00', '0.00', 0, 'WP', 'P', 0, 'N', '', '<form action="https://select.worldpay.com/wcc/purchase" method="post">\n                                                <input type=hidden name="testMode" value="100"> \n                                                  <input type="hidden" name="instId" value="<?php echo WORLDPAY_INST_ID ?>" />\n                                            <input type="hidden" name="cartId" value="<?php echo $db->f("order_id") ?>" />\n                                               <input type="hidden" name="amount" value="<?php echo $db->f("order_total") ?>" />\n                                            <input type="hidden" name="currency" value="<?php echo $_SESSION[''vendor_currency''] ?>" />\n                                           <input type="hidden" name="desc" value="Products" />\n                                            <input type="hidden" name="email" value="<?php echo $user->email?>" />\n                                                 <input type="hidden" name="address" value="<?php echo $user->address_1?>&#10<?php echo $user->address_2?>&#10<?php echo\n                                                $user->city?>&#10<?php echo $user->state?>" />\n                                             <input type="hidden" name="name" value="<?php echo $user->title?><?php echo $user->first_name?>. <?php echo $user->middle_name?><?php echo $user->last_name?>" />\n                                           <input type="hidden" name="country" value="<?php echo $user->country?>"/>\n                                              <input type="hidden" name="postcode" value="<?php echo $user->zip?>" />\n                                                <input type="hidden" name="tel"  value="<?php echo $user->phone_1?>">\n                                                  <input type="hidden" name="withDelivery"  value="true">\n                                                 <br />\n                                                <input type="submit" value ="PROCEED TO PAYMENT PAGE" />\n                                                  </form>', ''),
(7, 1, '2Checkout', 'ps_twocheckout', 5, '0.00', 0, '0.00', '0.00', 0, '2CO', 'P', 0, 'N', '', '<?php\n      $q  = "SELECT * FROM #__users WHERE user_info_id=''".$db->f("user_info_id")."''"; \n    $dbbt = new ps_DB;\n   $dbbt->setQuery($q);\n        $dbbt->query();\n      $dbbt->next_record(); \n       // Get ship_to information\n    if( $db->f("user_info_id") != $dbbt->f("user_info_id")) {\n         $q2  = "SELECT * FROM #__vm_user_info WHERE user_info_id=''".$db->f("user_info_id")."''"; \n    $dbst = new ps_DB;\n   $dbst->setQuery($q2);\n       $dbst->query();\n      $dbst->next_record();\n      }\n     else  {\n         $dbst = $dbbt;\n    }\n                     \n      //Authnet vars to send\n        $formdata = array (\n   ''x_login'' => TWOCO_LOGIN,\n   ''x_email_merchant'' => ((TWOCO_MERCHANT_EMAIL == ''True'') ? ''TRUE'' : ''FALSE''),\n                  \n      // Customer Name and Billing Address\n  ''x_first_name'' => $dbbt->f("first_name"),\n        ''x_last_name'' => $dbbt->f("last_name"),\n  ''x_company'' => $dbbt->f("company"),\n      ''x_address'' => $dbbt->f("address_1"),\n    ''x_city'' => $dbbt->f("city"),\n    ''x_state'' => $dbbt->f("state"),\n  ''x_zip'' => $dbbt->f("zip"),\n      ''x_country'' => $dbbt->f("country"),\n      ''x_phone'' => $dbbt->f("phone_1"),\n        ''x_fax'' => $dbbt->f("fax"),\n      ''x_email'' => $dbbt->f("email"),\n \n       // Customer Shipping Address\n  ''x_ship_to_first_name'' => $dbst->f("first_name"),\n        ''x_ship_to_last_name'' => $dbst->f("last_name"),\n  ''x_ship_to_company'' => $dbst->f("company"),\n      ''x_ship_to_address'' => $dbst->f("address_1"),\n    ''x_ship_to_city'' => $dbst->f("city"),\n    ''x_ship_to_state'' => $dbst->f("state"),\n  ''x_ship_to_zip'' => $dbst->f("zip"),\n      ''x_ship_to_country'' => $dbst->f("country"),\n     \n       ''x_invoice_num'' => $db->f("order_number"),\n       ''x_receipt_link_url'' => SECUREURL."2checkout_notify.php"\n  );\n    \n     if( TWOCO_TESTMODE == "Y" )\n   $formdata[''demo''] = "Y";\n       \n       $version = "2";\n    $url = "https://www2.2checkout.com/2co/buyer/purchase";\n    $formdata[''x_amount''] = number_format($db->f("order_total"), 2, ''.'', '''');\n \n       //build the post string\n       $poststring = '''';\n  foreach($formdata AS $key => $val){\n          $poststring .= "<input type=''hidden'' name=''$key'' value=''$val'' />\n ";\n    }\n    \n      ?>\n    <form action="<?php echo $url ?>" method="post" target="_blank">\n       <?php echo $poststring ?>\n    <p>Click on the Image below to pay...</p>\n     <input type="image" name="submit" src="https://www.2checkout.com/images/buy_logo.gif" border="0" alt="Make payments with 2Checkout, it''s fast and secure!" title="Pay your Order with 2Checkout, it''s fast and secure!" />\n      </form>', ''),
(8, 1, 'NoChex', 'ps_nochex', 5, '0.00', 0, '0.00', '0.00', 0, 'NOCHEX', 'P', 0, 'N', '', '<form action="https://www.nochex.com/nochex.dll/checkout" method="post" target="_blank"> \n                                                                                     <input type="hidden" name="email" value="<?php echo NOCHEX_EMAIL ?>" />\n                                                                                 <input type="hidden" name="amount" value="<?php printf("%.2f", $db->f("order_total"))?>" />\n                                                                                        <input type="hidden" name="ordernumber" value="<?php $db->p("order_id") ?>" />\n                                                                                       <input type="hidden" name="logo" value="<?php echo $vendor_image_url ?>" />\n                                                                                    <input type="hidden" name="returnurl" value="<?php echo SECUREURL ."index.php?option=com_virtuemart&amp;page=checkout.result&amp;order_id=".$db->f("order_id") ?>" />\n                                                                                      <input type="image" name="submit" src="http://www.nochex.com/web/images/paymeanimated.gif"> \n                                                                                    </form>', ''),
(9, 1, 'Credit Card (PayMeNow)', 'ps_paymenow', 5, '0.00', 0, '0.00', '0.00', 0, 'PN', 'Y', 0, 'N', '1,2,3,', '', ''),
(10, 1, 'eWay', 'ps_eway', 5, '0.00', 0, '0.00', '0.00', 0, 'EWAY', 'Y', 0, 'N', '', '', ''),
(11, 1, 'eCheck.net', 'ps_echeck', 5, '0.00', 0, '0.00', '0.00', 0, 'ECK', 'B', 0, 'N', '', '', ''),
(12, 1, 'Credit Card (eProcessingNetwork)', 'ps_epn', 5, '0.00', 0, '0.00', '0.00', 0, 'EPN', 'Y', 0, 'N', '1,2,3,', '', ''),
(13, 1, 'iKobo', '', 5, '0.00', 0, '0.00', '0.00', 0, 'IK', 'P', 0, 'N', '', '<form action="https://www.iKobo.com/store/index.php" method="post"> \n  <input type="hidden" name="cmd" value="cart" />Click on the image below to Pay with iKobo\n  <input type="image" src="https://www.ikobo.com/merchant/buttons/ikobo_pay1.gif" name="submit" alt="Pay with iKobo" /> \n  <input type="hidden" name="poid" value="USER_ID" /> \n  <input type="hidden" name="item" value="Order: <?php $db->p("order_id") ?>" /> \n  <input type="hidden" name="price" value="<?php printf("%.2f", $db->f("order_total"))?>" /> \n  <input type="hidden" name="firstname" value="<?php echo $user->first_name?>" /> \n  <input type="hidden" name="lastname" value="<?php echo $user->last_name?>" /> \n  <input type="hidden" name="address" value="<?php echo $user->address_1?>&#10<?php echo $user->address_2?>" /> \n  <input type="hidden" name="city" value="<?php echo $user->city?>" /> \n  <input type="hidden" name="state" value="<?php echo $user->state?>" /> \n  <input type="hidden" name="zip" value="<?php echo $user->zip?>" /> \n  <input type="hidden" name="phone" value="<?php echo $user->phone_1?>" /> \n  <input type="hidden" name="email" value="<?php echo $user->email?>" /> \n  </form> >', ''),
(14, 1, 'iTransact', '', 5, '0.00', 0, '0.00', '0.00', 0, 'ITR', 'P', 0, 'N', '', '<?php\n  //your iTransact account details\n  $vendorID = "XXXXX";\n  global $vendor_name;\n  $mername = $vendor_name;\n  \n  //order details\n  $total = $db->f("order_total");$first_name = $user->first_name;$last_name = $user->last_name;$address = $user->address_1;$city = $user->city;$state = $user->state;$zip = $user->zip;$country = $user->country;$email = $user->email;$phone = $user->phone_1;$home_page = $mosConfig_live_site."/index.php";$ret_addr = $mosConfig_live_site."/index.php";$cc_payment_image = $mosConfig_live_site."/components/com_virtuemart/shop_image/ps_image/cc_payment.jpg";\n  ?>\n  <form action="https://secure.paymentclearing.com/cgi-bin/mas/split.cgi" method="POST"> \n                <input type="hidden" name="vendor_id" value="<?php echo $vendorID; ?>" />\n              <input type="hidden" name="home_page" value="<?php echo $home_page; ?>" />\n             <input type="hidden" name="ret_addr" value="<?php echo $ret_addr; ?>" />\n               <input type="hidden" name="mername" value="<?php echo $mername; ?>" />\n         <!--Enter text in the next value that should appear on the bottom of the order form.-->\n               <INPUT type="hidden" name="mertext" value="" />\n         <!--If you are accepting checks, enter the number 1 in the next value.  Enter the number 0 if you are not accepting checks.-->\n                <INPUT type="hidden" name="acceptchecks" value="0" />\n           <!--Enter the number 1 in the next value if you want to allow pre-registered customers to pay with a check.  Enter the number 0 if not.-->\n            <INPUT type="hidden" name="allowreg" value="0" />\n               <!--If you are set up with Check Guarantee, enter the number 1 in the next value.  Enter the number 0 if not.-->\n              <INPUT type="hidden" name="checkguar" value="0" />\n              <!--Enter the number 1 in the next value if you are accepting credit card payments.  Enter the number zero if not.-->\n         <INPUT type="hidden" name="acceptcards" value="1">\n              <!--Enter the number 1 in the next value if you want to allow a separate mailing address for credit card orders.  Enter the number 0 if not.-->\n               <INPUT type="hidden" name="altaddr" value="0" />\n                <!--Enter the number 1 in the next value if you want the customer to enter the CVV number for card orders.  Enter the number 0 if not.-->\n             <INPUT type="hidden" name="showcvv" value="1" />\n                \n              <input type="hidden" name="1-desc" value="Order Total" />\n               <input type="hidden" name="1-cost" value="<?php echo $total; ?>" />\n            <input type="hidden" name="1-qty" value="1" />\n          <input type="hidden" name="total" value="<?php echo $total; ?>" />\n             <input type="hidden" name="first_name" value="<?php echo $first_name; ?>" />\n           <input type="hidden" name="last_name" value="<?php echo $last_name; ?>" />\n             <input type="hidden" name="address" value="<?php echo $address; ?>" />\n         <input type="hidden" name="city" value="<?php echo $city; ?>" />\n               <input type="hidden" name="state" value="<?php echo $state; ?>" />\n             <input type="hidden" name="zip" value="<?php echo $zip; ?>" />\n         <input type="hidden" name="country" value="<?php echo $country; ?>" />\n         <input type="hidden" name="phone" value="<?php echo $phone; ?>" />\n             <input type="hidden" name="email" value="<?php echo $email; ?>" />\n             <p><input type="image" alt="Process Secure Credit Card Transaction using iTransact" border="0" height="60" width="210" src="<?php echo $cc_payment_image; ?>" /> </p>\n            </form>', ''),
(15, 1, 'Verisign PayFlow Pro', 'payflow_pro', 5, '0.00', 0, '0.00', '0.00', 0, 'PFP', 'Y', 0, 'N', '1,2,6,7,', '', ''),
(16, 1, 'Dankort/PBS via ePay', 'ps_epay', 5, '0.00', 0, '0.00', '0.00', 0, 'EPAY', 'P', 0, 'N', '', '<?php\r\nrequire_once(CLASSPATH ."payment/ps_epay.cfg.php");\r\n$url=basename($mosConfig_live_site);\r\nfunction get_iso_code($code) {\r\nswitch ($code) {\r\ncase "ADP": return "020"; break;\r\ncase "AED": return "784"; break;\r\ncase "AFA": return "004"; break;\r\ncase "ALL": return "008"; break;\r\ncase "AMD": return "051"; break;\r\ncase "ANG": return "532"; break;\r\ncase "AOA": return "973"; break;\r\ncase "ARS": return "032"; break;\r\ncase "AUD": return "036"; break;\r\ncase "AWG": return "533"; break;\r\ncase "AZM": return "031"; break;\r\ncase "BAM": return "977"; break;\r\ncase "BBD": return "052"; break;\r\ncase "BDT": return "050"; break;\r\ncase "BGL": return "100"; break;\r\ncase "BGN": return "975"; break;\r\ncase "BHD": return "048"; break;\r\ncase "BIF": return "108"; break;\r\ncase "BMD": return "060"; break;\r\ncase "BND": return "096"; break;\r\ncase "BOB": return "068"; break;\r\ncase "BOV": return "984"; break;\r\ncase "BRL": return "986"; break;\r\ncase "BSD": return "044"; break;\r\ncase "BTN": return "064"; break;\r\ncase "BWP": return "072"; break;\r\ncase "BYR": return "974"; break;\r\ncase "BZD": return "084"; break;\r\ncase "CAD": return "124"; break;\r\ncase "CDF": return "976"; break;\r\ncase "CHF": return "756"; break;\r\ncase "CLF": return "990"; break;\r\ncase "CLP": return "152"; break;\r\ncase "CNY": return "156"; break;\r\ncase "COP": return "170"; break;\r\ncase "CRC": return "188"; break;\r\ncase "CUP": return "192"; break;\r\ncase "CVE": return "132"; break;\r\ncase "CYP": return "196"; break;\r\ncase "CZK": return "203"; break;\r\ncase "DJF": return "262"; break;\r\ncase "DKK": return "208"; break;\r\ncase "DOP": return "214"; break;\r\ncase "DZD": return "012"; break;\r\ncase "ECS": return "218"; break;\r\ncase "ECV": return "983"; break;\r\ncase "EEK": return "233"; break;\r\ncase "EGP": return "818"; break;\r\ncase "ERN": return "232"; break;\r\ncase "ETB": return "230"; break;\r\ncase "EUR": return "978"; break;\r\ncase "FJD": return "242"; break;\r\ncase "FKP": return "238"; break;\r\ncase "GBP": return "826"; break;\r\ncase "GEL": return "981"; break;\r\ncase "GHC": return "288"; break;\r\ncase "GIP": return "292"; break;\r\ncase "GMD": return "270"; break;\r\ncase "GNF": return "324"; break;\r\ncase "GTQ": return "320"; break;\r\ncase "GWP": return "624"; break;\r\ncase "GYD": return "328"; break;\r\ncase "HKD": return "344"; break;\r\ncase "HNL": return "340"; break;\r\ncase "HRK": return "191"; break;\r\ncase "HTG": return "332"; break;\r\ncase "HUF": return "348"; break;\r\ncase "IDR": return "360"; break;\r\ncase "ILS": return "376"; break;\r\ncase "INR": return "356"; break;\r\ncase "IQD": return "368"; break;\r\ncase "IRR": return "364"; break;\r\ncase "ISK": return "352"; break;\r\ncase "JMD": return "388"; break;\r\ncase "JOD": return "400"; break;\r\ncase "JPY": return "392"; break;\r\ncase "KES": return "404"; break;\r\ncase "KGS": return "417"; break;\r\ncase "KHR": return "116"; break;\r\ncase "KMF": return "174"; break;\r\ncase "KPW": return "408"; break;\r\ncase "KRW": return "410"; break;\r\ncase "KWD": return "414"; break;\r\ncase "KYD": return "136"; break;\r\ncase "KZT": return "398"; break;\r\ncase "LAK": return "418"; break;\r\ncase "LBP": return "422"; break;\r\ncase "LKR": return "144"; break;\r\ncase "LRD": return "430"; break;\r\ncase "LSL": return "426"; break;\r\ncase "LTL": return "440"; break;\r\ncase "LVL": return "428"; break;\r\ncase "LYD": return "434"; break;\r\ncase "MAD": return "504"; break;\r\ncase "MDL": return "498"; break;\r\ncase "MGF": return "450"; break;\r\ncase "MKD": return "807"; break;\r\ncase "MMK": return "104"; break;\r\ncase "MNT": return "496"; break;\r\ncase "MOP": return "446"; break;\r\ncase "MRO": return "478"; break;\r\ncase "MTL": return "470"; break;\r\ncase "MUR": return "480"; break;\r\ncase "MVR": return "462"; break;\r\ncase "MWK": return "454"; break;\r\ncase "MXN": return "484"; break;\r\ncase "MXV": return "979"; break;\r\ncase "MYR": return "458"; break;\r\ncase "MZM": return "508"; break;\r\ncase "NAD": return "516"; break;\r\ncase "NGN": return "566"; break;\r\ncase "NIO": return "558"; break;\r\ncase "NOK": return "578"; break;\r\ncase "NPR": return "524"; break;\r\ncase "NZD": return "554"; break;\r\ncase "OMR": return "512"; break;\r\ncase "PAB": return "590"; break;\r\ncase "PEN": return "604"; break;\r\ncase "PGK": return "598"; break;\r\ncase "PHP": return "608"; break;\r\ncase "PKR": return "586"; break;\r\ncase "PLN": return "985"; break;\r\ncase "PYG": return "600"; break;\r\ncase "QAR": return "634"; break;\r\ncase "ROL": return "642"; break;\r\ncase "RUB": return "643"; break;\r\ncase "RUR": return "810"; break;\r\ncase "RWF": return "646"; break;\r\ncase "SAR": return "682"; break;\r\ncase "SBD": return "090"; break;\r\ncase "SCR": return "690"; break;\r\ncase "SDD": return "736"; break;\r\ncase "SEK": return "752"; break;\r\ncase "SGD": return "702"; break;\r\ncase "SHP": return "654"; break;\r\ncase "SIT": return "705"; break;\r\ncase "SKK": return "703"; break;\r\ncase "SLL": return "694"; break;\r\ncase "SOS": return "706"; break;\r\ncase "SRG": return "740"; break;\r\ncase "STD": return "678"; break;\r\ncase "SVC": return "222"; break;\r\ncase "SYP": return "760"; break;\r\ncase "SZL": return "748"; break;\r\ncase "THB": return "764"; break;\r\ncase "TJS": return "972"; break;\r\ncase "TMM": return "795"; break;\r\ncase "TND": return "788"; break;\r\ncase "TOP": return "776"; break;\r\ncase "TPE": return "626"; break;\r\ncase "TRL": return "792"; break;\r\ncase "TRY": return "949"; break;\r\ncase "TTD": return "780"; break;\r\ncase "TWD": return "901"; break;\r\ncase "TZS": return "834"; break;\r\ncase "UAH": return "980"; break;\r\ncase "UGX": return "800"; break;\r\ncase "USD": return "840"; break;\r\ncase "UYU": return "858"; break;\r\ncase "UZS": return "860"; break;\r\ncase "VEB": return "862"; break;\r\ncase "VND": return "704"; break;\r\ncase "VUV": return "548"; break;\r\ncase "XAF": return "950"; break;\r\ncase "XCD": return "951"; break;\r\ncase "XOF": return "952"; break;\r\ncase "XPF": return "953"; break;\r\ncase "YER": return "886"; break;\r\ncase "YUM": return "891"; break;\r\ncase "ZAR": return "710"; break;\r\ncase "ZMK": return "894"; break;\r\ncase "ZWD": return "716"; break;\r\n}\r\nreturn "XXX"; // return invalid code if the currency is not found \r\n}\r\n\r\nfunction calculateePayCurrency($order_id)\r\n{\r\n$db = new ps_DB;\r\n$currency_code = "208";\r\n$q = "SELECT order_currency FROM #__vm_orders where order_id = " . $order_id;\r\n$db->query($q);\r\nif ($db->next_record()) {\r\n	$currency_code = get_iso_code($db->f("order_currency"));\r\n}\r\nreturn $currency_code;\r\n}\r\n echo $VM_LANG->_(''VM_CHECKOUT_EPAY_PAYMENT_CHECKOUT_HEADER'');\r\n?>\r\n<script type="text/javascript" src="http://www.epay.dk/js/standardwindow.js"></script>\r\n<script type="text/javascript">\r\nfunction printCard(cardId)\r\n{\r\ndocument.write ("<table border=0 cellspacing=10 cellpadding=10>");\r\nswitch (cardId) {\r\ncase 1: document.write ("<input type=hidden name=cardtype value=1>"); break;\r\ncase 2: document.write ("<input type=hidden name=cardtype value=2>"); break;\r\ncase 3: document.write ("<input type=hidden name=cardtype value=3>"); break;\r\ncase 4: document.write ("<input type=hidden name=cardtype value=4>"); break;\r\ncase 5: document.write ("<input type=hidden name=cardtype value=5>"); break;\r\ncase 6: document.write ("<input type=hidden name=cardtype value=6>"); break;\r\ncase 7: document.write ("<input type=hidden name=cardtype value=7>"); break;\r\ncase 8: document.write ("<input type=hidden name=cardtype value=8>"); break;\r\ncase 9: document.write ("<input type=hidden name=cardtype value=9>"); break;\r\ncase 10: document.write ("<input type=hidden name=cardtype value=10>"); break;\r\ncase 12: document.write ("<input type=hidden name=cardtype value=12>"); break;\r\ncase 13: document.write ("<input type=hidden name=cardtype value=13>"); break;\r\ncase 14: document.write ("<input type=hidden name=cardtype value=14>"); break;\r\ncase 15: document.write ("<input type=hidden name=cardtype value=15>"); break;\r\ncase 16: document.write ("<input type=hidden name=cardtype value=16>"); break;\r\ncase 17: document.write ("<input type=hidden name=cardtype value=17>"); break;\r\ncase 18: document.write ("<input type=hidden name=cardtype value=18>"); break;\r\ncase 19: document.write ("<input type=hidden name=cardtype value=19>"); break;\r\ncase 21: document.write ("<input type=hidden name=cardtype value=21>"); break;\r\ncase 22: document.write ("<input type=hidden name=cardtype value=22>"); break;\r\n}\r\ndocument.write ("</table>");\r\n}\r\n</script>\r\n<form action="https://ssl.ditonlinebetalingssystem.dk/popup/default.asp" method="post" name="ePay" target="ePay_window" id="ePay">\r\n<input type="hidden" name="merchantnumber" value="<?php echo EPAY_MERCHANTNUMBER ?>">\r\n<input type="hidden" name="amount" value="<?php echo round($db->f("order_total")*100, 2 ) ?>">\r\n<input type="hidden" name="currency" value="<?php echo calculateePayCurrency($order_id)?>">\r\n<input type="hidden" name="orderid" value="<?php echo $order_id ?>">\r\n<input type="hidden" name="ordretext" value="">\r\n<?php \r\nif (EPAY_CALLBACK == "1")\r\n{\r\n	echo ''<input type="hidden" name="callbackurl" value="'' . $mosConfig_live_site . ''/index.php?page=checkout.epay_result&accept=1&sessionid='' . $sessionid . ''&option=com_virtuemart&Itemid=1">'';\r\n}\r\n?>\r\n<input type="hidden" name="accepturl" value="<?php echo $mosConfig_live_site ?>/index.php?page=checkout.epay_result&accept=1&sessionid=<?php echo $sessionid ?>&option=com_virtuemart&Itemid=1">\r\n<input type="hidden" name="declineurl" value="<?php echo $mosConfig_live_site ?>/index.php?page=checkout.epay_result&accept=0&sessionid=<?php echo $sessionid ?>&option=com_virtuemart&Itemid=1">\r\n<input type="hidden" name="group" value="<?php echo EPAY_GROUP ?>">\r\n<input type="hidden" name="instant" value="<?php echo EPAY_INSTANT_CAPTURE ?>">\r\n<input type="hidden" name="language" value="<?php echo EPAY_LANGUAGE ?>">\r\n<input type="hidden" name="authsms" value="<?php echo EPAY_AUTH_SMS ?>">\r\n<input type="hidden" name="authmail" value="<?php echo EPAY_AUTH_MAIL . (strlen(EPAY_AUTH_MAIL) > 0 && EPAY_AUTHEMAILCUSTOMER == 1 ? ";" : "") . (EPAY_AUTHEMAILCUSTOMER == 1 ? $user->user_email : ""); ?>">\r\n<input type="hidden" name="windowstate" value="<?php echo EPAY_WINDOW_STATE ?>">\r\n<input type="hidden" name="use3D" value="<?php echo EPAY_3DSECURE ?>">\r\n<input type="hidden" name="addfee" value="<?php echo EPAY_ADDFEE ?>">\r\n<input type="hidden" name="subscription" value="<?php echo EPAY_SUBSCRIPTION ?>">\r\n<input type="hidden" name="MD5Key" value="<?php if (EPAY_MD5_TYPE == 2) echo md5( calculateePayCurrency($order_id) . round($db->f("order_total")*100, 2 ) . $order_id  . EPAY_MD5_KEY)?>">\r\n<?php\r\nif (EPAY_CARDTYPES_1 == "1" && EPAY_CARDTYPES_0 != "1") echo "<script>printCard(1)</script>";\r\nif (EPAY_CARDTYPES_2 == "1" && EPAY_CARDTYPES_0 != "1") echo "<script>printCard(2)</script>";\r\nif (EPAY_CARDTYPES_3 == "1" && EPAY_CARDTYPES_0 != "1") echo "<script>printCard(3)</script>";\r\nif (EPAY_CARDTYPES_4 == "1" && EPAY_CARDTYPES_0 != "1") echo "<script>printCard(4)</script>";\r\nif (EPAY_CARDTYPES_5 == "1" && EPAY_CARDTYPES_0 != "1") echo "<script>printCard(5)</script>";\r\nif (EPAY_CARDTYPES_6 == "1" && EPAY_CARDTYPES_0 != "1") echo "<script>printCard(6)</script>";\r\nif (EPAY_CARDTYPES_7 == "1" && EPAY_CARDTYPES_0 != "1") echo "<script>printCard(7)</script>";\r\nif (EPAY_CARDTYPES_8 == "1" && EPAY_CARDTYPES_0 != "1") echo "<script>printCard(8)</script>";\r\nif (EPAY_CARDTYPES_9 == "1" && EPAY_CARDTYPES_0 != "1") echo "<script>printCard(9)</script>";\r\nif (EPAY_CARDTYPES_10 == "1" && EPAY_CARDTYPES_0 != "1") echo "<script>printCard(10)</script>";\r\nif (EPAY_CARDTYPES_11 == "1" && EPAY_CARDTYPES_0 != "1") echo "<script>printCard(11)</script>";\r\nif (EPAY_CARDTYPES_12 == "1" && EPAY_CARDTYPES_0 != "1") echo "<script>printCard(12)</script>";\r\nif (EPAY_CARDTYPES_14 == "1" && EPAY_CARDTYPES_0 != "1") echo "<script>printCard(14)</script>";\r\nif (EPAY_CARDTYPES_15 == "1" && EPAY_CARDTYPES_0 != "1") echo "<script>printCard(15)</script>";\r\nif (EPAY_CARDTYPES_16 == "1" && EPAY_CARDTYPES_0 != "1") echo "<script>printCard(16)</script>";\r\nif (EPAY_CARDTYPES_17 == "1" && EPAY_CARDTYPES_0 != "1") echo "<script>printCard(17)</script>";\r\nif (EPAY_CARDTYPES_18 == "1" && EPAY_CARDTYPES_0 != "1") echo "<script>printCard(18)</script>";\r\nif (EPAY_CARDTYPES_19 == "1" && EPAY_CARDTYPES_0 != "1") echo "<script>printCard(19)</script>";\r\nif (EPAY_CARDTYPES_21 == "1" && EPAY_CARDTYPES_0 != "1") echo "<script>printCard(21)</script>";\r\nif (EPAY_CARDTYPES_22 == "1" && EPAY_CARDTYPES_0 != "1") echo "<script>printCard(22)</script>";;\r\n?>\r\n</form>\r\n<script>open_ePay_window();</script>\r\n<br>\r\n<table border="0" width="100%"><tr><td><input type="button" onClick="open_ePay_window()" value="<?php echo $VM_LANG->_(''VM_CHECKOUT_EPAY_BUTTON_OPEN_WINDOW'') ?>"></td><td width="100%" id="flashLoader"></td></tr></table><br><br><br>\r\n<?php echo $VM_LANG->_(''VM_CHECKOUT_EPAY_PAYMENT_CHECKOUT_FOOTER'') ?>\r\n<br><br>\r\n<img src="components/com_virtuemart/shop_image/ps_image/epay_images/epay_logo.gif" border="0">&nbsp;&nbsp;&nbsp;\r\n<img src="components/com_virtuemart/shop_image/ps_image/epay_images/mastercard_securecode.gif" border="0">&nbsp;&nbsp;&nbsp;\r\n<img src="components/com_virtuemart/shop_image/ps_image/epay_images/pci.gif" border="0">&nbsp;&nbsp;&nbsp;\r\n<img src="components/com_virtuemart/shop_image/ps_image/epay_images/verisign_secure.gif" border="0">&nbsp;&nbsp;&nbsp;\r\n<img src="components/com_virtuemart/shop_image/ps_image/epay_images/visa_secure.gif" border="0">&nbsp;&nbsp;&nbsp;;', ''),
(17, 1, 'PaySbuy', 'ps_paysbuy', 5, '0.00', 0, '0.00', '0.00', 0, 'PSB', 'P', 0, 'N', '', '', ''),
(18, 1, 'PayPal (Legacy)', 'ps_paypal', 5, '0.00', 0, '0.00', '0.00', 0, 'PP', 'P', 0, 'N', '', '<?php\r\n$db1 = new ps_DB();\r\n$q = "SELECT country_2_code FROM #__vm_country WHERE country_3_code=''".$user->country."'' ORDER BY country_2_code ASC";\r\n$db1->query($q);\r\n\r\n$url = "https://www.paypal.com/cgi-bin/webscr";\r\n$tax_total = $db->f("order_tax") + $db->f("order_shipping_tax");\r\n$discount_total = $db->f("coupon_discount") + $db->f("order_discount");\r\n$post_variables = Array(\r\n"cmd" => "_ext-enter",\r\n"redirect_cmd" => "_xclick",\r\n"upload" => "1",\r\n"business" => PAYPAL_EMAIL,\r\n"receiver_email" => PAYPAL_EMAIL,\r\n"item_name" => $VM_LANG->_(''PHPSHOP_ORDER_PRINT_PO_NUMBER'').": ". $db->f("order_id"),\r\n"order_id" => $db->f("order_id"),\r\n"invoice" => $db->f("order_number"),\r\n"amount" => round( $db->f("order_total")-$db->f("order_shipping"), 2),\r\n"shipping" => sprintf("%.2f", $db->f("order_shipping")),\r\n"currency_code" => $_SESSION[''vendor_currency''],\r\n\r\n"address_override" => "1",\r\n"first_name" => $dbbt->f(''first_name''),\r\n"last_name" => $dbbt->f(''last_name''),\r\n"address1" => $dbbt->f(''address_1''),\r\n"address2" => $dbbt->f(''address_2''),\r\n"zip" => $dbbt->f(''zip''),\r\n"city" => $dbbt->f(''city''),\r\n"state" => $dbbt->f(''state''),\r\n"country" => $db1->f(''country_2_code''),\r\n"email" => $dbbt->f(''user_email''),\r\n"night_phone_b" => $dbbt->f(''phone_1''),\r\n"cpp_header_image" => $vendor_image_url,\r\n\r\n"return" => SECUREURL ."index.php?option=com_virtuemart&page=checkout.result&order_id=".$db->f("order_id"),\r\n"notify_url" => SECUREURL ."administrator/components/com_virtuemart/notify.php",\r\n"cancel_return" => SECUREURL ."index.php",\r\n"undefined_quantity" => "0",\r\n\r\n"test_ipn" => PAYPAL_DEBUG,\r\n"pal" => "NRUBJXESJTY24",\r\n"no_shipping" => "1",\r\n"no_note" => "1"\r\n);\r\nif( $page == "checkout.thankyou" ) {\r\n$query_string = "?";\r\nforeach( $post_variables as $name => $value ) {\r\n$query_string .= $name. "=" . urlencode($value) ."&";\r\n}\r\nvmRedirect( $url . $query_string );\r\n} else {\r\necho ''<form action="''.$url.''" method="post" target="_blank">'';\r\necho ''<input type="image" name="submit" src="https://www.paypal.com/en_US/i/btn/x-click-but6.gif" alt="Click to pay with PayPal - it is fast, free and secure!" />'';\r\n\r\nforeach( $post_variables as $name => $value ) {\r\necho ''<input type="hidden" name="''.$name.''" value="''.htmlspecialchars($value).''" />'';\r\n}\r\necho ''</form>'';\r\n\r\n}\r\n?>', ''),
(19, 1, 'MerchantWarrior', 'ps_merchantwarrior', 5, '0.00', 0, '0.00', '0.00', 1, 'MW', 'Y', 1, 'N', '1,2,3,5,7,', '', ''),
(20, 1, 'Transfer Ke Bang Permata', 'ps_payment', 5, '0.00', 0, '0.00', '0.00', 0, '013', 'N', 0, 'Y', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `jos_vm_product`
--

CREATE TABLE IF NOT EXISTS `jos_vm_product` (
  `product_id` int(11) NOT NULL auto_increment,
  `vendor_id` int(11) NOT NULL default '0',
  `product_parent_id` int(11) NOT NULL default '0',
  `product_sku` varchar(64) NOT NULL default '',
  `product_s_desc` varchar(255) default NULL,
  `product_desc` text,
  `product_thumb_image` varchar(255) default NULL,
  `product_full_image` varchar(255) default NULL,
  `product_publish` char(1) default NULL,
  `product_weight` decimal(10,4) default NULL,
  `product_weight_uom` varchar(32) default 'pounds.',
  `product_length` decimal(10,4) default NULL,
  `product_width` decimal(10,4) default NULL,
  `product_height` decimal(10,4) default NULL,
  `product_lwh_uom` varchar(32) default 'inches',
  `product_url` varchar(255) default NULL,
  `product_in_stock` int(11) NOT NULL default '0',
  `product_available_date` int(11) default NULL,
  `product_availability` varchar(56) NOT NULL default '',
  `product_special` char(1) default NULL,
  `product_discount_id` int(11) default NULL,
  `ship_code_id` int(11) default NULL,
  `cdate` int(11) default NULL,
  `mdate` int(11) default NULL,
  `product_name` varchar(64) default NULL,
  `product_sales` int(11) NOT NULL default '0',
  `attribute` text,
  `custom_attribute` text NOT NULL,
  `product_tax_id` int(11) default NULL,
  `product_unit` varchar(32) default NULL,
  `product_packaging` int(11) default NULL,
  `child_options` varchar(45) default NULL,
  `quantity_options` varchar(45) default NULL,
  `child_option_ids` varchar(45) default NULL,
  `product_order_levels` varchar(45) default NULL,
  PRIMARY KEY  (`product_id`),
  KEY `idx_product_vendor_id` (`vendor_id`),
  KEY `idx_product_product_parent_id` (`product_parent_id`),
  KEY `idx_product_sku` (`product_sku`),
  KEY `idx_product_ship_code_id` (`ship_code_id`),
  KEY `idx_product_name` (`product_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COMMENT='All products are stored here.' AUTO_INCREMENT=17 ;

--
-- Dumping data for table `jos_vm_product`
--

INSERT INTO `jos_vm_product` (`product_id`, `vendor_id`, `product_parent_id`, `product_sku`, `product_s_desc`, `product_desc`, `product_thumb_image`, `product_full_image`, `product_publish`, `product_weight`, `product_weight_uom`, `product_length`, `product_width`, `product_height`, `product_lwh_uom`, `product_url`, `product_in_stock`, `product_available_date`, `product_availability`, `product_special`, `product_discount_id`, `ship_code_id`, `cdate`, `mdate`, `product_name`, `product_sales`, `attribute`, `custom_attribute`, `product_tax_id`, `product_unit`, `product_packaging`, `child_options`, `quantity_options`, `child_option_ids`, `product_order_levels`) VALUES
(7, 1, 0, 'P01', 'Mau mobil anda mulus? Pake carcare solusinya.', '<p style="margin-bottom: 0.0001pt; line-height: normal;"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';"><b><span style="font-size: 12pt; font-family: ''Arial'',''sans-serif'';">CAR CARE PRODUCT,</span></b><span style="font-size: 12pt; font-family: ''Arial'',''sans-serif'';"> Adalah produk-produk khusus untuk perawatan Kendaraan kesayangan anda, produk ini dibawah lisensi Gefragt Stets GMBH & Co GERMANY. Terdiri dari :<span style="font-size: 12pt; font-family: ''Arial'',''sans-serif'';"></span></span></span></p>\r\n<ul>\r\n<li style="margin-bottom: 0.0001pt; line-height: normal;"><span style="font-size: 12pt; font-family: ''Arial'',''sans-serif'';">Diamond Glaze : Obat Poles Finishing yang mengandung polymer dan wax melindungi cat kendaraan dari noda dan kotoran. Produk ini mengandung Abrasive pilihan yang dapat membuat cat kusam menjadi mengkilap.</span></li>\r\n<li style="line-height: normal;"><span style="font-size: 12pt; font-family: ''Arial'',''sans-serif'';"><span style="font-size: 12pt; font-family: ''Arial'',''sans-serif'';"><span style="font-size: 12pt; font-family: ''Arial'',''sans-serif'';"><span style="font-size: 12pt; font-family: ''Arial'',''sans-serif'';">Stubborn Stain Cleaner : Membersihkan kerak dan jamur body dari cat mobil, paling bagus bila digunakan sebelum memoles cat mobil untuk menghemat waktu dan tenaga.</span></span></span></span><hr id="system-readmore" /><span style="font-size: 12pt; font-family: ''Arial'',''sans-serif'';"><span style="font-size: 12pt; font-family: ''Arial'',''sans-serif'';"><span style="font-size: 12pt; font-family: ''Arial'',''sans-serif'';"></span></span></span></li>\r\n<li style="line-height: normal;"><span style="font-size: 12pt; font-family: ''Arial'',''sans-serif'';">Engine Cleaner : Produk ini untuk membersihkan bagian luar mesin mobil yang biasanya sangat kotor karena oli, hanya dengan menggunakan kuas dan semprot dengan air.</span></li>\r\n<li style="line-height: normal;"><span style="font-size: 12pt; font-family: ''Arial'',''sans-serif'';">Mould : Produk ini membersihkan jamur pada kaca mobil  yang membandel.</span></li>\r\n<li style="line-height: normal;"><span style="font-size: 12pt; font-family: ''Arial'',''sans-serif'';">Wipe & Glaze : Produk ini membersihkan dan mengkilapkan Vinyl, Kulit, ban dan karet, dan melindungi dari retak karena panas matahari.</span></li>\r\n<li style="line-height: normal;"><span style="font-size: 12pt; font-family: ''Arial'',''sans-serif'';">Car Seat Cleaner : Produk ini membersihkan interior mobil, sangat effective bila digunakan dengan Steamer dan Vacuum Cleaner.</span></li>\r\n<li style="line-height: normal;"><span style="font-size: 12pt; font-family: ''Arial'',''sans-serif'';">Shampoo mobil : Produk ini diformulasikan dengan bahan yang sangat lembut, sampo ini berfungsi/berguna membersihkan dari kotoran tanpa memberikan efek pada mobil seperti:noda keputihan , tidak memudarkan warna cat mobil, dll.<b><span style="text-decoration: underline;"> </span></b>ini telah diuji pada berbagai macam cat, dan ter bukti aman.</span></li>\r\n</ul>\r\n<p style="margin-left: 6px; line-height: normal;"><span style="font-size: 12pt; font-family: ''Arial'',''sans-serif'';">Shampoo mobil + wax</span></p>\r\n<p style="margin-left: 6px; line-height: normal;"><span style="font-size: 12pt; font-family: ''Arial'',''sans-serif'';">Produk ini diformulasikan dengan bahan yang sangat lembut, sampo ini berfungsi/berguna membersihkan dari kotoran tanpa memberikan efek pada mobil seperti: noda keputihan,tidak memudarkan warna cat mobil.</span></p>\r\n<div style="margin-left: 6px; line-height: normal;"><span style="font-size: 12pt; font-family: ''Arial'',''sans-serif'';"><br /></span></div>\r\n<div style="margin-left: 6px; line-height: normal;"><span style="font-size: 12pt; font-family: ''Arial'',''sans-serif'';">Bisa juga pesan langsung ke:</span></div>\r\n<div style="margin-left: 6px; line-height: normal;"><span style="font-size: 12pt; font-family: ''Arial'',''sans-serif'';"><br /></span></div>\r\n<div style="margin-left: 6px; line-height: normal;"><span style="font-size: 12pt; font-family: ''Arial'',''sans-serif'';">Divisi Usaha Yayasan Al ikhlas Citrautama </span></div>\r\n<div style="margin-left: 6px; line-height: normal;"><span style="font-size: 12pt; font-family: ''Arial'',''sans-serif'';">Jl. Raya Gunungputri Selatan No 28 Ctr 16810 Bogor.</span></div>\r\n<div style="margin-left: 6px; line-height: normal;"><span style="font-size: 12pt; font-family: ''Arial'',''sans-serif'';">Telp/Fax : 021- 921 83392, 876 2579</span></div>\r\n<div style="margin-left: 6px; line-height: normal;"><span style="font-size: 12pt; font-family: ''Arial'',''sans-serif'';">E-mail : <a href="mailto:alikhlas.citrautama@gmail.com">alikhlas.citrautama@gmail.com</a> </span></div>', 'resized/Carcare_Product_4e6861d0b8eea_90x90.jpg', 'Carcare_Product_4e6861d13b36b.jpg', 'Y', '200.0000', 'pounds', '200.0000', '200.0000', '200.0000', '', '', 45, 1088553600, 'not_available.gif', 'N', 0, NULL, 950321725, 1315653159, 'Carcare Product', 0, '', '', 2, '', 0, 'N,N,N,N,N,N,,,', 'none,0,0,1', '', '0,0'),
(8, 1, 0, 'P02', 'Cut rings around wood.  This saw can handle the most delicate projects.', '<p style="margin-bottom: 0.0001pt; line-height: normal;"><span style="font-size: 10pt; font-family: ''Times New Roman'',''serif'';">JENIS PRODUK :<span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';"></span></span><span style="font-size: 10pt; font-family: ''Times New Roman'',''serif'';"></span></p>\r\n<ul>\r\n<li style="margin-bottom: 0.0001pt; line-height: normal;"><span style="font-size: 10pt; font-family: ''Times New Roman'',''serif'';"><span style="font-size: 7pt; font-family: ''Times New Roman'',''serif'';"><span style="font-size: 10pt; font-family: ''Times New Roman'',''serif'';">SOFTENER PAKAIAN <span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';"></span></span></span></span><span style="font-size: 10pt; font-family: ''Times New Roman'',''serif'';"></span></li>\r\n<li style="margin-bottom: 0.0001pt; line-height: normal;"><span style="font-size: 10pt; font-family: ''Times New Roman'',''serif'';"><span style="font-size: 7pt; font-family: ''Times New Roman'',''serif'';"><span style="font-size: 10pt; font-family: ''Times New Roman'',''serif'';">SOFTENER ULTRA<span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';"></span></span></span></span><span style="font-size: 10pt; font-family: ''Times New Roman'',''serif'';"></span></li>\r\n<li style="margin-bottom: 0.0001pt; line-height: normal;"><span style="font-size: 10pt; font-family: ''Times New Roman'',''serif'';"><span style="font-size: 7pt; font-family: ''Times New Roman'',''serif'';"> <span style="font-size: 10pt; font-family: ''Times New Roman'',''serif'';">DETERGENT CAIR <span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';"></span></span></span></span><span style="font-size: 10pt; font-family: ''Times New Roman'',''serif'';"></span></li>\r\n<li style="margin-bottom: 0.0001pt; line-height: normal;"><span style="font-size: 10pt; font-family: ''Times New Roman'',''serif'';"><span style="font-size: 7pt; font-family: ''Times New Roman'',''serif'';"><span style="font-size: 10pt; font-family: ''Times New Roman'',''serif'';">PELICIN PAKAIAN <span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';"></span></span></span></span><span style="font-size: 10pt; font-family: ''Times New Roman'',''serif'';"></span></li>\r\n<li style="margin-bottom: 0.0001pt; line-height: normal;"><span style="font-size: 10pt; font-family: ''Times New Roman'',''serif'';"><span style="font-size: 7pt; font-family: ''Times New Roman'',''serif'';"><span style="font-size: 10pt; font-family: ''Times New Roman'',''serif'';">HAND SOAP (SABUN CUCI TANGAN)<span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';"></span></span></span></span><span style="font-size: 10pt; font-family: ''Times New Roman'',''serif'';"></span></li>\r\n<li style="margin-bottom: 0.0001pt; line-height: normal;"><span style="font-size: 10pt; font-family: ''Times New Roman'',''serif'';"><span style="font-size: 7pt; font-family: ''Times New Roman'',''serif'';"><span style="font-size: 10pt; font-family: ''Times New Roman'',''serif'';">SABUN CUCI PIRING<span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';"></span></span></span></span><span style="font-size: 10pt; font-family: ''Times New Roman'',''serif'';"></span></li>\r\n<li style="margin-bottom: 0.0001pt; line-height: normal;"><span style="font-size: 10pt; font-family: ''Times New Roman'',''serif'';"><span style="font-size: 7pt; font-family: ''Times New Roman'',''serif'';"><span style="font-size: 10pt; font-family: ''Times New Roman'',''serif'';">SABUN CUCI PIRING EXTRA BUSA<span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';"></span></span></span></span><span style="font-size: 10pt; font-family: ''Times New Roman'',''serif'';"></span></li>\r\n<li style="margin-bottom: 0.0001pt; line-height: normal;"><span style="font-size: 10pt; font-family: ''Times New Roman'',''serif'';"><span style="font-size: 7pt; font-family: ''Times New Roman'',''serif'';"><span style="font-size: 10pt; font-family: ''Times New Roman'',''serif'';">PEMBERSIH LANTAI<span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';"></span></span></span></span><span style="font-size: 10pt; font-family: ''Times New Roman'',''serif'';"></span></li>\r\n<li style="margin-bottom: 0.0001pt; line-height: normal;"><span style="font-size: 10pt; font-family: ''Times New Roman'',''serif'';"><span style="font-size: 7pt; font-family: ''Times New Roman'',''serif'';"><span style="font-size: 10pt; font-family: ''Times New Roman'',''serif'';">KARBOL<span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';"></span></span></span></span><span style="font-size: 10pt; font-family: ''Times New Roman'',''serif'';"></span></li>\r\n<li style="margin-bottom: 0.0001pt; line-height: normal;"><span style="font-size: 10pt; font-family: ''Times New Roman'',''serif'';"><span style="font-size: 7pt; font-family: ''Times New Roman'',''serif'';"><span style="font-size: 10pt; font-family: ''Times New Roman'',''serif'';">PEMBERSIH KACA<span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';"></span></span></span></span><span style="font-size: 10pt; font-family: ''Times New Roman'',''serif'';"></span></li>\r\n<li style="margin-bottom: 0.0001pt; line-height: normal;"><span style="font-size: 10pt; font-family: ''Times New Roman'',''serif'';"><span style="font-size: 7pt; font-family: ''Times New Roman'',''serif'';"><span style="font-size: 10pt; font-family: ''Times New Roman'',''serif'';">SHAMPO 3 IN 1<span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';"></span></span></span></span><span style="font-size: 10pt; font-family: ''Times New Roman'',''serif'';"></span></li>\r\n<li style="margin-bottom: 0.0001pt; line-height: normal;"><span style="font-size: 10pt; font-family: ''Times New Roman'',''serif'';"><span style="font-size: 7pt; font-family: ''Times New Roman'',''serif'';"><span style="font-size: 10pt; font-family: ''Times New Roman'',''serif'';">SHAMPO 3 IN 1 ANTI KETOMBE<span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';"></span></span></span></span><span style="font-size: 10pt; font-family: ''Times New Roman'',''serif'';"></span></li>\r\n<li style="margin-bottom: 0.0001pt; line-height: normal;"><span style="font-size: 10pt; font-family: ''Times New Roman'',''serif'';"><span style="font-size: 7pt; font-family: ''Times New Roman'',''serif'';"><span style="font-size: 10pt; font-family: ''Times New Roman'',''serif'';">BODY FOAM (SABUN MANDI CAIR)<span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';"></span></span></span></span><span style="font-size: 10pt; font-family: ''Times New Roman'',''serif'';"></span></li>\r\n<li style="margin-bottom: 0.0001pt; line-height: normal;"><span style="font-size: 10pt; font-family: ''Times New Roman'',''serif'';"><span style="font-size: 7pt; font-family: ''Times New Roman'',''serif'';"><span style="font-size: 10pt; font-family: ''Times New Roman'',''serif'';">PARFUM SHOLAT NON AL KOHOL.</span></span></span></li>\r\n</ul>\r\n<p style="margin-bottom: 0.0001pt; text-indent: -18pt; line-height: normal;"> </p>\r\n<div align="center">\r\n<table style="border-collapse: collapse;" border="0" cellpadding="0" cellspacing="0">\r\n<tbody>\r\n<tr>\r\n<td style="width: 27.9pt; border: 1pt solid black; padding: 0cm 5.4pt;" valign="top" width="37">\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">No</span></p>\r\n</td>\r\n<td style="width: 220.5pt; border-width: 1pt 1pt 1pt medium; border-style: solid solid solid none; border-color: windowtext windowtext windowtext -moz-use-text-color; padding: 0cm 5.4pt;" valign="top" width="294">\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">Nama Produk</span></p>\r\n</td>\r\n<td style="width: 76.5pt; border-width: 1pt 1pt 1pt medium; border-style: solid solid solid none; border-color: windowtext windowtext windowtext -moz-use-text-color; padding: 0cm 5.4pt;" valign="top" width="102">\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">Kemasan</span></p>\r\n</td>\r\n<td style="width: 119.7pt; border-width: 1pt 1pt 1pt medium; border-style: solid solid solid none; border-color: windowtext windowtext windowtext -moz-use-text-color; padding: 0cm 5.4pt;" valign="top" width="160">\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">Izin DEPKES RI No.</span></p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style="width: 27.9pt; border-right: 1pt solid windowtext; border-width: medium 1pt 1pt; border-style: none solid solid; border-color: -moz-use-text-color windowtext windowtext; padding: 0cm 5.4pt;" valign="top" width="37">\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">1</span></p>\r\n</td>\r\n<td style="width: 220.5pt; border-width: medium 1pt 1pt medium; border-style: none solid solid none; border-color: -moz-use-text-color windowtext windowtext -moz-use-text-color; padding: 0cm 5.4pt;" valign="top" width="294">\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">Softener</span></p>\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">Variant: Pink, Blue</span></p>\r\n</td>\r\n<td style="width: 76.5pt; border-width: medium 1pt 1pt medium; border-style: none solid solid none; border-color: -moz-use-text-color windowtext windowtext -moz-use-text-color; padding: 0cm 5.4pt;" valign="top" width="102">\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">Botol 400 Ml</span></p>\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">Jerigen 20 Ltr</span></p>\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">Sachet 80 Ml</span></p>\r\n</td>\r\n<td style="width: 119.7pt; border-width: medium 1pt 1pt medium; border-style: none solid solid none; border-color: -moz-use-text-color windowtext windowtext -moz-use-text-color; padding: 0cm 5.4pt;" valign="top" width="160">\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">PKD 20203600230</span></p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style="width: 27.9pt; border-right: 1pt solid windowtext; border-width: medium 1pt 1pt; border-style: none solid solid; border-color: -moz-use-text-color windowtext windowtext; padding: 0cm 5.4pt;" valign="top" width="37">\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">2</span></p>\r\n</td>\r\n<td style="width: 220.5pt; border-width: medium 1pt 1pt medium; border-style: none solid solid none; border-color: -moz-use-text-color windowtext windowtext -moz-use-text-color; padding: 0cm 5.4pt;" valign="top" width="294">\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">Softener Ultra</span></p>\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">Variant: Orange, Green, Yellow</span></p>\r\n</td>\r\n<td style="width: 76.5pt; border-width: medium 1pt 1pt medium; border-style: none solid solid none; border-color: -moz-use-text-color windowtext windowtext -moz-use-text-color; padding: 0cm 5.4pt;" valign="top" width="102">\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">Botol 400 Ml</span></p>\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">Jerigen 20 Ltr</span></p>\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">Sachet 80 Ml </span></p>\r\n</td>\r\n<td style="width: 119.7pt; border-width: medium 1pt 1pt medium; border-style: none solid solid none; border-color: -moz-use-text-color windowtext windowtext -moz-use-text-color; padding: 0cm 5.4pt;" valign="top" width="160">\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">PKD 20203600230</span></p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style="width: 27.9pt; border-right: 1pt solid windowtext; border-width: medium 1pt 1pt; border-style: none solid solid; border-color: -moz-use-text-color windowtext windowtext; padding: 0cm 5.4pt;" valign="top" width="37">\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">3</span></p>\r\n</td>\r\n<td style="width: 220.5pt; border-width: medium 1pt 1pt medium; border-style: none solid solid none; border-color: -moz-use-text-color windowtext windowtext -moz-use-text-color; padding: 0cm 5.4pt;" valign="top" width="294">\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">Deterjen Cair</span></p>\r\n</td>\r\n<td style="width: 76.5pt; border-width: medium 1pt 1pt medium; border-style: none solid solid none; border-color: -moz-use-text-color windowtext windowtext -moz-use-text-color; padding: 0cm 5.4pt;" valign="top" width="102">\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">Botol 400 Ml</span></p>\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">Jerigen 20 Ltr</span></p>\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">Sachet 80 Ml </span></p>\r\n</td>\r\n<td style="width: 119.7pt; border-width: medium 1pt 1pt medium; border-style: none solid solid none; border-color: -moz-use-text-color windowtext windowtext -moz-use-text-color; padding: 0cm 5.4pt;" valign="top" width="160">\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">PKD 20202600229</span></p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style="width: 27.9pt; border-right: 1pt solid windowtext; border-width: medium 1pt 1pt; border-style: none solid solid; border-color: -moz-use-text-color windowtext windowtext; padding: 0cm 5.4pt;" valign="top" width="37">\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">4</span></p>\r\n</td>\r\n<td style="width: 220.5pt; border-width: medium 1pt 1pt medium; border-style: none solid solid none; border-color: -moz-use-text-color windowtext windowtext -moz-use-text-color; padding: 0cm 5.4pt;" valign="top" width="294">\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">Pelicin Pakaian</span></p>\r\n</td>\r\n<td style="width: 76.5pt; border-width: medium 1pt 1pt medium; border-style: none solid solid none; border-color: -moz-use-text-color windowtext windowtext -moz-use-text-color; padding: 0cm 5.4pt;" valign="top" width="102">\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">Botol 400 Ml</span></p>\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">Jerigen 20 Ltr</span></p>\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">Sachet 80 Ml </span></p>\r\n</td>\r\n<td style="width: 119.7pt; border-width: medium 1pt 1pt medium; border-style: none solid solid none; border-color: -moz-use-text-color windowtext windowtext -moz-use-text-color; padding: 0cm 5.4pt;" valign="top" width="160">\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">PKD 20203600224</span></p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style="width: 27.9pt; border-right: 1pt solid windowtext; border-width: medium 1pt 1pt; border-style: none solid solid; border-color: -moz-use-text-color windowtext windowtext; padding: 0cm 5.4pt;" valign="top" width="37">\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">5</span></p>\r\n</td>\r\n<td style="width: 220.5pt; border-width: medium 1pt 1pt medium; border-style: none solid solid none; border-color: -moz-use-text-color windowtext windowtext -moz-use-text-color; padding: 0cm 5.4pt;" valign="top" width="294">\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">Hand Soap (Sabun cuci tangan)</span></p>\r\n</td>\r\n<td style="width: 76.5pt; border-width: medium 1pt 1pt medium; border-style: none solid solid none; border-color: -moz-use-text-color windowtext windowtext -moz-use-text-color; padding: 0cm 5.4pt;" valign="top" width="102">\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">Botol 400 Ml</span></p>\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">Jerigen 20 Ltr</span></p>\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">Sachet 80 Ml </span></p>\r\n</td>\r\n<td style="width: 119.7pt; border-width: medium 1pt 1pt medium; border-style: none solid solid none; border-color: -moz-use-text-color windowtext windowtext -moz-use-text-color; padding: 0cm 5.4pt;" valign="top" width="160">\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">PKD 20206600231</span></p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style="width: 27.9pt; border-right: 1pt solid windowtext; border-width: medium 1pt 1pt; border-style: none solid solid; border-color: -moz-use-text-color windowtext windowtext; padding: 0cm 5.4pt;" valign="top" width="37">\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">6</span></p>\r\n</td>\r\n<td style="width: 220.5pt; border-width: medium 1pt 1pt medium; border-style: none solid solid none; border-color: -moz-use-text-color windowtext windowtext -moz-use-text-color; padding: 0cm 5.4pt;" valign="top" width="294">\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">Dishwashing  (Sabun Cuci Piring)</span></p>\r\n</td>\r\n<td style="width: 76.5pt; border-width: medium 1pt 1pt medium; border-style: none solid solid none; border-color: -moz-use-text-color windowtext windowtext -moz-use-text-color; padding: 0cm 5.4pt;" valign="top" width="102">\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">Botol 400 Ml</span></p>\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">Jerigen 20 Ltr</span></p>\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">Sachet 80 Ml </span></p>\r\n</td>\r\n<td style="width: 119.7pt; border-width: medium 1pt 1pt medium; border-style: none solid solid none; border-color: -moz-use-text-color windowtext windowtext -moz-use-text-color; padding: 0cm 5.4pt;" valign="top" width="160">\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">PKD 203016002324</span></p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style="width: 27.9pt; border-right: 1pt solid windowtext; border-width: medium 1pt 1pt; border-style: none solid solid; border-color: -moz-use-text-color windowtext windowtext; padding: 0cm 5.4pt;" valign="top" width="37">\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">7</span></p>\r\n</td>\r\n<td style="width: 220.5pt; border-width: medium 1pt 1pt medium; border-style: none solid solid none; border-color: -moz-use-text-color windowtext windowtext -moz-use-text-color; padding: 0cm 5.4pt;" valign="top" width="294">\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">Dishwashing Extra Busa</span></p>\r\n</td>\r\n<td style="width: 76.5pt; border-width: medium 1pt 1pt medium; border-style: none solid solid none; border-color: -moz-use-text-color windowtext windowtext -moz-use-text-color; padding: 0cm 5.4pt;" valign="top" width="102">\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">Botol 400 Ml</span></p>\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">Jerigen 20 Ltr</span></p>\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">Sachet 80 Ml </span></p>\r\n</td>\r\n<td style="width: 119.7pt; border-width: medium 1pt 1pt medium; border-style: none solid solid none; border-color: -moz-use-text-color windowtext windowtext -moz-use-text-color; padding: 0cm 5.4pt;" valign="top" width="160">\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">PKD 203016002324</span></p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style="width: 27.9pt; border-right: 1pt solid windowtext; border-width: medium 1pt 1pt; border-style: none solid solid; border-color: -moz-use-text-color windowtext windowtext; padding: 0cm 5.4pt;" valign="top" width="37">\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">8</span></p>\r\n</td>\r\n<td style="width: 220.5pt; border-width: medium 1pt 1pt medium; border-style: none solid solid none; border-color: -moz-use-text-color windowtext windowtext -moz-use-text-color; padding: 0cm 5.4pt;" valign="top" width="294">\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">Floor Cleaner (Pembersih Lantai)</span></p>\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">Variant: blue, orange, yellow, green &  red</span></p>\r\n</td>\r\n<td style="width: 76.5pt; border-width: medium 1pt 1pt medium; border-style: none solid solid none; border-color: -moz-use-text-color windowtext windowtext -moz-use-text-color; padding: 0cm 5.4pt;" valign="top" width="102">\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">Botol 400 Ml</span></p>\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">Jerigen 20 Ltr</span></p>\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">Sachet 80 Ml </span></p>\r\n</td>\r\n<td style="width: 119.7pt; border-width: medium 1pt 1pt medium; border-style: none solid solid none; border-color: -moz-use-text-color windowtext windowtext -moz-use-text-color; padding: 0cm 5.4pt;" valign="top" width="160">\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">PKD 20303600226</span></p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style="width: 27.9pt; border-right: 1pt solid windowtext; border-width: medium 1pt 1pt; border-style: none solid solid; border-color: -moz-use-text-color windowtext windowtext; padding: 0cm 5.4pt;" valign="top" width="37">\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">9</span></p>\r\n</td>\r\n<td style="width: 220.5pt; border-width: medium 1pt 1pt medium; border-style: none solid solid none; border-color: -moz-use-text-color windowtext windowtext -moz-use-text-color; padding: 0cm 5.4pt;" valign="top" width="294">\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">Karbol</span></p>\r\n</td>\r\n<td style="width: 76.5pt; border-width: medium 1pt 1pt medium; border-style: none solid solid none; border-color: -moz-use-text-color windowtext windowtext -moz-use-text-color; padding: 0cm 5.4pt;" valign="top" width="102">\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">Botol 400 Ml</span></p>\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">Jerigen 20 Ltr</span></p>\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">Sachet 80 Ml </span></p>\r\n</td>\r\n<td style="width: 119.7pt; border-width: medium 1pt 1pt medium; border-style: none solid solid none; border-color: -moz-use-text-color windowtext windowtext -moz-use-text-color; padding: 0cm 5.4pt;" valign="top" width="160">\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">PKD 20502600228</span></p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style="width: 27.9pt; border-right: 1pt solid windowtext; border-width: medium 1pt 1pt; border-style: none solid solid; border-color: -moz-use-text-color windowtext windowtext; padding: 0cm 5.4pt;" valign="top" width="37">\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">10</span></p>\r\n</td>\r\n<td style="width: 220.5pt; border-width: medium 1pt 1pt medium; border-style: none solid solid none; border-color: -moz-use-text-color windowtext windowtext -moz-use-text-color; padding: 0cm 5.4pt;" valign="top" width="294">\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">Pembersih Kaca</span></p>\r\n</td>\r\n<td style="width: 76.5pt; border-width: medium 1pt 1pt medium; border-style: none solid solid none; border-color: -moz-use-text-color windowtext windowtext -moz-use-text-color; padding: 0cm 5.4pt;" valign="top" width="102">\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">Botol 400 Ml</span></p>\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">Jerigen 20 Ltr</span></p>\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">Sachet 80 Ml </span></p>\r\n</td>\r\n<td style="width: 119.7pt; border-width: medium 1pt 1pt medium; border-style: none solid solid none; border-color: -moz-use-text-color windowtext windowtext -moz-use-text-color; padding: 0cm 5.4pt;" valign="top" width="160">\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">PKD 20302600233</span></p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style="width: 27.9pt; border-right: 1pt solid windowtext; border-width: medium 1pt 1pt; border-style: none solid solid; border-color: -moz-use-text-color windowtext windowtext; padding: 0cm 5.4pt;" valign="top" width="37">\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">11</span></p>\r\n</td>\r\n<td style="width: 220.5pt; border-width: medium 1pt 1pt medium; border-style: none solid solid none; border-color: -moz-use-text-color windowtext windowtext -moz-use-text-color; padding: 0cm 5.4pt;" valign="top" width="294">\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">Shampo 2 in 1</span></p>\r\n</td>\r\n<td style="width: 76.5pt; border-width: medium 1pt 1pt medium; border-style: none solid solid none; border-color: -moz-use-text-color windowtext windowtext -moz-use-text-color; padding: 0cm 5.4pt;" valign="top" width="102">\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">Botol 400 Ml</span></p>\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">Jerigen 20 Ltr</span></p>\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">Sachet 80 Ml </span></p>\r\n</td>\r\n<td style="width: 119.7pt; border-width: medium 1pt 1pt medium; border-style: none solid solid none; border-color: -moz-use-text-color windowtext windowtext -moz-use-text-color; padding: 0cm 5.4pt;" valign="top" width="160"></td>\r\n</tr>\r\n<tr>\r\n<td style="width: 27.9pt; border-right: 1pt solid windowtext; border-width: medium 1pt 1pt; border-style: none solid solid; border-color: -moz-use-text-color windowtext windowtext; padding: 0cm 5.4pt;" valign="top" width="37">\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">12</span></p>\r\n</td>\r\n<td style="width: 220.5pt; border-width: medium 1pt 1pt medium; border-style: none solid solid none; border-color: -moz-use-text-color windowtext windowtext -moz-use-text-color; padding: 0cm 5.4pt;" valign="top" width="294">\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">Shampo 2 in 1 + Anti Ketombe</span></p>\r\n</td>\r\n<td style="width: 76.5pt; border-width: medium 1pt 1pt medium; border-style: none solid solid none; border-color: -moz-use-text-color windowtext windowtext -moz-use-text-color; padding: 0cm 5.4pt;" valign="top" width="102">\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">Botol 400 Ml</span></p>\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">Jerigen 20 Ltr</span></p>\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">Sachet 80 Ml</span></p>\r\n</td>\r\n<td style="width: 119.7pt; border-width: medium 1pt 1pt medium; border-style: none solid solid none; border-color: -moz-use-text-color windowtext windowtext -moz-use-text-color; padding: 0cm 5.4pt;" valign="top" width="160"></td>\r\n</tr>\r\n<tr>\r\n<td style="width: 27.9pt; border-right: 1pt solid windowtext; border-width: medium 1pt 1pt; border-style: none solid solid; border-color: -moz-use-text-color windowtext windowtext; padding: 0cm 5.4pt;" valign="top" width="37">\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">13</span></p>\r\n</td>\r\n<td style="width: 220.5pt; border-width: medium 1pt 1pt medium; border-style: none solid solid none; border-color: -moz-use-text-color windowtext windowtext -moz-use-text-color; padding: 0cm 5.4pt;" valign="top" width="294">\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">Body Foam</span></p>\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">Variant: Misty blue & Green Tea</span></p>\r\n</td>\r\n<td style="width: 76.5pt; border-width: medium 1pt 1pt medium; border-style: none solid solid none; border-color: -moz-use-text-color windowtext windowtext -moz-use-text-color; padding: 0cm 5.4pt;" valign="top" width="102">\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">Botol 400 Ml</span></p>\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">Jerigen 20 Ltr</span></p>\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">Sachet 80 Ml</span></p>\r\n</td>\r\n<td style="width: 119.7pt; border-width: medium 1pt 1pt medium; border-style: none solid solid none; border-color: -moz-use-text-color windowtext windowtext -moz-use-text-color; padding: 0cm 5.4pt;" valign="top" width="160"></td>\r\n</tr>\r\n<tr>\r\n<td style="width: 27.9pt; border-right: 1pt solid windowtext; border-width: medium 1pt 1pt; border-style: none solid solid; border-color: -moz-use-text-color windowtext windowtext; padding: 0cm 5.4pt;" valign="top" width="37">\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">14</span></p>\r\n</td>\r\n<td style="width: 220.5pt; border-width: medium 1pt 1pt medium; border-style: none solid solid none; border-color: -moz-use-text-color windowtext windowtext -moz-use-text-color; padding: 0cm 5.4pt;" valign="top" width="294">\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">Minyak wangi untuk sholat non alcohol Variant : Jasmine, Agarwood, sandalwood</span></p>\r\n</td>\r\n<td style="width: 76.5pt; border-width: medium 1pt 1pt medium; border-style: none solid solid none; border-color: -moz-use-text-color windowtext windowtext -moz-use-text-color; padding: 0cm 5.4pt;" valign="top" width="102">\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">Botol 10 Ml</span></p>\r\n</td>\r\n<td style="width: 119.7pt; border-width: medium 1pt 1pt medium; border-style: none solid solid none; border-color: -moz-use-text-color windowtext windowtext -moz-use-text-color; padding: 0cm 5.4pt;" valign="top" width="160">\r\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: normal;"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';"> </span></p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n<p><br /> <b></b></p>', 'resized/Home_Care_4e6890eb3547e_90x90.jpg', 'Home_Care_4e6890eb4a701.jpg', 'Y', '10.0000', 'pounds', '2.0000', '2.0000', '2.0000', 'inches', '', 33, 1072828800, 'not_available.gif', 'Y', 1, NULL, 950321795, 1315478199, 'Home Care', 0, 'Size;Power,strong,middle,poor[=24]', '', 2, '', 0, 'N,N,N,N,N,N,,,style-box', 'drop,0,0,1', '', '0,0');
INSERT INTO `jos_vm_product` (`product_id`, `vendor_id`, `product_parent_id`, `product_sku`, `product_s_desc`, `product_desc`, `product_thumb_image`, `product_full_image`, `product_publish`, `product_weight`, `product_weight_uom`, `product_length`, `product_width`, `product_height`, `product_lwh_uom`, `product_url`, `product_in_stock`, `product_available_date`, `product_availability`, `product_special`, `product_discount_id`, `ship_code_id`, `cdate`, `mdate`, `product_name`, `product_sales`, `attribute`, `custom_attribute`, `product_tax_id`, `product_unit`, `product_packaging`, `child_options`, `quantity_options`, `child_option_ids`, `product_order_levels`) VALUES
(9, 1, 0, 'P03', 'Drill through anything.  This drill has the power you need for those demanding hole boring duties.', '<p><span style="color: #000000; font-size: small;" size="3" color="#000000"></span></p>\r\n<p style="margin-bottom: 0.0001pt; line-height: normal;"><a href="http://3.bp.blogspot.com/-COLbYRPEyFo/ThRc2Fwv3-I/AAAAAAAAAKg/c-74JeJ7Nyo/s1600/HYGIO2.jpg"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif''; color: blue;">Mari bergabung dengan ribuan pelanggan HYGIO, yang dalam 6 bulan* PULIH SEMPURNA dari Gagal Ginjal, Diabetes, Asam Urat, Kolesterol, Lever, Gangguan Jantung (Arrhythmia, Infarction, Angina), Hipertensi, Rheumatik, Kanker, Batu Ginjal, Batu Empedu, DB, Flu, Panas Dalam, dan berbagai penyakit lainnya. </span></a><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';"></span></p>\r\n<p><span style="color: #000000; font-size: small;" size="3" color="#000000"></span></p>\r\n<p style="margin-bottom: 0.0001pt; line-height: normal;"><a href="http://hygio2.tk/wp-content/uploads/2011/03/15.jpg"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif''; color: blue; text-decoration: none;"></span></a><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">HYGIO adalah Air Aktif, hasil pemurnian mahal dan rumit untuk mengembalikan daya alami air sebagai sumber kehidupan. Bersih dari mikroba & logam (mineral) serta memiliki pH 7.5 dan Potensial Zeta sesuai serum darah (bisa disuntikkan/infus kedalam darah).</span></p>\r\n<p><span style="color: #000000; font-size: small;" size="3" color="#000000"></span></p>\r\n<p style="margin-bottom: 0.0001pt; line-height: normal;"><a href="http://hygio2.tk/wp-content/uploads/2011/03/16.jpg"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif''; color: blue; text-decoration: none;"></span></a><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">Air aktif HYGIO 3 liter per hari dibutuhkan tubuh untuk:</span></p>\r\n<p style="margin-bottom: 0.0001pt; line-height: normal;"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';"><img alt="15" src="images/15.jpg" width="491" height="272" /></span></p>\r\n<p><span style="color: #000000; font-size: small;" size="3" color="#000000"></span></p>\r\n<p style="margin-bottom: 0.0001pt; line-height: normal;"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">1.  Aktif mengangkat endapan & sumbatan ginjal, hati, jantung, pembuluh darah & getah bening.</span></p>\r\n<p><span style="color: #000000; font-size: small;" size="3" color="#000000"></span></p>\r\n<p style="margin-bottom: 0.0001pt; line-height: normal;"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">2.  Aktif membilas racun, kolesterol, oksidan & mikroba/virus dari jaringan. Sehat tanpa obat.</span></p>\r\n<p><span style="color: #000000; font-size: small;" size="3" color="#000000"></span></p>\r\n<p style="margin-bottom: 0.0001pt; line-height: normal;"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">3.  Aktif memasok gula & ATP ke otot dari cadangan alami tubuh. Kuat tanpa doping energi.</span></p>\r\n<p><span style="color: #000000; font-size: small;" size="3" color="#000000"></span></p>\r\n<p style="margin-bottom: 0.0001pt; line-height: normal;"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">4.  Aktif menyalurkan nutrisi ke daging & tulang. Pacu pertumbuhan, atasi osteoporosis.</span></p>\r\n<p><span style="color: #000000; font-size: small;" size="3" color="#000000"></span></p>\r\n<p style="margin-bottom: 0.0001pt; line-height: normal;"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">5.  Aktif memulihkan ion darah dari cadangan alami tubuh. Segar tanpa penyegar isotonik.</span></p>\r\n<p><span style="color: #000000; font-size: small;" size="3" color="#000000"></span></p>\r\n<p style="margin-bottom: 0.0001pt; line-height: normal;"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">6.  Aktif melancarkan kerja syaraf & otak. Cerdas dan tangkas.</span></p>\r\n<p><span style="color: #000000; font-size: small;" size="3" color="#000000"></span></p>\r\n<p style="margin-bottom: 0.0001pt; line-height: normal;"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">7.  Aktif menyebarkan protein dan cytokine dalam jaringan, Kekebalan tubuh meningkat.</span></p>\r\n<p><span style="color: #000000; font-size: small;" size="3" color="#000000"></span></p>\r\n<p style="line-height: normal;"><b><span style="font-size: 13.5pt; font-family: ''Times New Roman'',''serif'';">KEUNGGULAN HYGIO2</span></b></p>\r\n<p style="line-height: normal;"><b><span style="font-size: 13.5pt; font-family: ''Times New Roman'',''serif'';"><img alt="16" src="images/16.jpg" width="457" height="176" /></span></b></p>\r\n<p><span style="color: #000000; font-size: small;" size="3" color="#000000"></span></p>\r\n<p style="margin-bottom: 0.0001pt; line-height: normal;"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">Air digunakan oleh tubuh untuk membilas dan melarutkan sampah sisa pembakaran dan penyakit. Air melarutkan  dengan menguraikan sampah menjadi ion lalu dikepung dan diseret keluar. Setelah jenuh ion, air tidak melarutkan lagi walau tampak bening. Karena itu, air minum penuh ion/mineral sulit membersihkan tubuh. Sebaliknya air tanpa ion merupakan pelarut yang terlalu kuat.</span></p>\r\n<p><span style="color: #000000; font-size: small;" size="3" color="#000000"></span></p>\r\n<p style="margin-bottom: 0.0001pt; line-height: normal;"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">HYGIO bukan larutan ion mineral atau isotonik tapi mengandung sedikit ion yang jenisnya tidak meracuni tubuh. Tubuh hanya butuh sedikit saja logam/mineral. Sebagai contohnya, protein pembawa oksigen dalam sel darah merah, Hemoglobin  (C<sub>738</sub>H<sub>1166</sub>FeN<sub>203</sub>O<sub>208</sub>S<sub>2</sub>)<sub>4</sub> terdiri dari 9,268 atom, hanya punya 4 atom Besi/Fe. Kelebihan mineral berakibat penggumpalan dan oksidasi berlebihan yang merusak protein dan DNA.</span></p>\r\n<p><span style="color: #000000; font-size: small;" size="3" color="#000000"></span></p>\r\n<p style="margin-bottom: 0.0001pt; line-height: normal;"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">HYGIO juga mengandung molekul air DHO yang lebih kecil dari molekul air biasa (H<sub>2</sub>O), sehingga dapat menembus 4 kali lebih cepat, serta dapat menyelip dan membersihkan sampai ke relung sempit. DHO juga membentuk protein yang tahan terhadap radikal oksidan. Secara alami DHO ada di mata air, tapi menjadi H<sub>2</sub>O bila dipanaskan atau terjemur. Proses pemurnian HYGIO mempertahankan DHO ini sehingga terbentuk Air Aktif.</span></p>\r\n<p><span style="color: #000000; font-size: small;" size="3" color="#000000"></span></p>\r\n<p style="margin-bottom: 0.0001pt; line-height: normal;"><a href="http://hygio2.tk/wp-content/uploads/2011/03/13.jpg"><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif''; color: blue; text-decoration: none;"></span></a><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">Air aktif tidak saja tak tercemar dan bening, namun seolah hidup. Pada tempat sejuk dan tak terkena cahaya matahari, air aktif bergerak sendiri sampai membentuk pusaran. Air di tengah pusaran menjadi pekat, penuh energy, dan membentuk lebih banyak lagi DHO (dan D<sub>2</sub>O). Itu sebabnya, sampai saat ini wadah terbaik untuk air adalah kendi tanah liat.Air adalah bagian utama dari jaringan tubuh (75% air), darah (80% air) dan getah bening (85% air), semestinya semuanya air aktif. Kecenderungan berpusar memudahkan air aktif mengangkat dan mengangkut berbagai sampah di jaringan tubuh, sekaligus juga melicinkan saluran-saluran darah dan getah bening.</span></p>\r\n<p><span style="color: #000000; font-size: small;" size="3" color="#000000"></span></p>\r\n<p style="margin-bottom: 0.0001pt; line-height: normal;"><i><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">1.<b>HYGIO2 MENGGUNAKAN TEHNOLOGI ABSORSI</b> yang menghasilkan output satu tahap sebelum air diinfus ( Bides).HYGIO2 membuat rekayasa tegbologi destilasi sehingga secara ekonomis biayanya bisa rasional dalam skala industri. Absorbsi mampu mengikat mineral UN organic ( tidak dibutuhkan ) didalam air.</span></i><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';"></span></p>\r\n<p><span style="color: #000000; font-size: small;" size="3" color="#000000"></span></p>\r\n<p style="margin-bottom: 0.0001pt; line-height: normal;"><i><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">2<b>.</b>HYGIO2 JUGA MENGANDUNG MOLEKUL AIR DHO YANG LEBIH KAECIL DARI MOLEKUL AIR BIASA (H2O), sehingga dapat menembus 4 kali lebih cepat, serta dapat menyelip dan membersihkan sampai ke relung sempit. DHO juga membentuk protein yang tahan terhadap radikal bebas. Secara alami DHO ada di mata air, tapi menjadi H2O bila dipanaskan atau terjemur. Proses pemurnian HYGIO2 mempertahankan DHO ini sehingga terbentuk Air Aktif. </span></i><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';"></span></p>\r\n<p><span style="color: #000000; font-size: small;" size="3" color="#000000"></span></p>\r\n<p style="margin-bottom: 0.0001pt; line-height: normal;"><i><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">3.<b>HYGIO2 MEMPUNYAI TDS 0,00 </b>artinya Hygio tidak mengandung bahan pencemar dan bebas mikroba. Dalam kondisi ini HYGIO2 mampu melarutkan endapan dalam tubuh baik racun maupun kerak sebagai penyebab timbulnya berbagai penyakit seperti ( kanker usus, pengerasan pembuluh darah), dan HYGIO2 mampu mempercepat proses penyerapan sari makanan ke dalam tubuh. </span></i><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';"></span></p>\r\n<p><span style="color: #000000; font-size: small;" size="3" color="#000000"></span></p>\r\n<p style="margin-bottom: 0.0001pt; line-height: normal;"><i><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">4.<b>HYGIO2 MEMPUNYAI PH 7,4</b> dan potensial Zeta yang sesuai dengan darah , getah bening dan cairan tubuh. SNI mensyaratkan 6,5 – 8,5. Potensial zeta adalah muatan tegangan statis yang membuat partikel tidak menggumpal dan mengendap. Secara bertahap menyebabkan metabolisme menjadi prima dan meningkatkan kekebaan tubuh. </span></i><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';"></span></p>\r\n<p><span style="color: #000000; font-size: small;" size="3" color="#000000"></span></p>\r\n<p style="margin-bottom: 0.0001pt; line-height: normal;"><i><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">5. <b>HYGIO2 MEMILIKI IKATAN ION HIDROGEN 6</b> (  hexagonal ) yang mampu membentuk ion dalam tubuh sehingga tubuh menjadi lebih sehat, dan HYGIO2 lebih mudah diserap oleh tubuh </span></i><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';"></span></p>\r\n<p><span style="color: #000000; font-size: small;" size="3" color="#000000"></span></p>\r\n<p style="margin-bottom: 0.0001pt; line-height: normal;"><i><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">6. <b>HYGIO2 MEMILIKI DHL <5</b>, membuktikan bahwa HYGIO2 tidak mengandung mineral un organik yang berbahaya bagi tubuh.HYGIO2 mampu mereduksi mineral un organik.dan mengandung hidrogen aktif yang sangat ampuh untuk menangkal radikal bebas. Mineral un organik membuat kerja ginjal menjadi lebih berat dan bisa mengakibatkan penyempitan pembuluh darah. HYGIO2 disebut juga air organic </span></i><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';"></span></p>\r\n<p><span style="color: #000000; font-size: small;" size="3" color="#000000"></span></p>\r\n<p style="margin-bottom: 0.0001pt; line-height: normal;"><i><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">7. <b>HYGIO2 BERASAL DARI SUMBER AIR DIBAWAHLEMPENGAN BATU</b> dengan kedalaman 150m yang mengandung muatan proton, elektron dan netron ( T3O / tetrium oksida ). Muatan netron inilah yang mampu menstimulasi terbentuknya ion dalam tubuh.pada kedalam tersebut kualitas air terjaga dari polusi alam seperti hujan, udara, panas. </span></i><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';"></span></p>\r\n<p><span style="color: #000000; font-size: small;" size="3" color="#000000"></span></p>\r\n<p style="margin-bottom: 0.0001pt; line-height: normal;"><i><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';">8. <b>HYGIO2 MENGGUNAKAN KEMASAN DENGAN KONSTRUKSI KHUSUS AIR OKSIGEN</b>, yang menjaga stabilitas kadar oxygen ,serta bentuk botolnya mampu membentuk hexagonal, tahan goncang dan tekanan serta oksidasi dari luar. Serta bahan botol memiliki standard sertifikasi lolos food grade ( FDA ) </span></i><span style="font-size: 12pt; font-family: ''Times New Roman'',''serif'';"></span></p>\r\n<p><span style="color: #000000; font-size: small;" size="3" color="#000000"><i><span style="font-size: 12pt; line-height: 115%; font-family: ''Times New Roman'',''serif'';">9. <b>HYGIO2 MEMPUNYAI KANDUNGAN OKSIGEN TERLARUT 28,82 MG /L.</b> air yang ada di alam sekitar memiliki kandungan oksigen berkisar 5  sd 7. Tubuh memiliki batas ambang maksimal 40. hal ini disebabkan karena oksigen yang masuk dalam tubuh yang tidak terserap oleh tubuh akan menjdi oksigen radikal  yang akan mengakibatkan radikal bebas.</span></i><b></b><br /> </span></p>', 'resized/Hygio_4e6895d304c45_90x90.jpg', 'Hygio_4e6895d314a2a.jpg', 'Y', '10.0000', 'pounds', '0.0000', '0.0000', '0.0000', 'inches', '', 3, 1072828800, 'not_available.gif', 'N', 0, NULL, 950321879, 1315476947, 'Hygio', 0, '', '', 0, '', 0, 'N,N,N,N,N,N,,,', 'hide,0,0,1', '', '0,0');

-- --------------------------------------------------------

--
-- Table structure for table `jos_vm_product_attribute`
--

CREATE TABLE IF NOT EXISTS `jos_vm_product_attribute` (
  `attribute_id` int(11) NOT NULL auto_increment,
  `product_id` int(11) NOT NULL default '0',
  `attribute_name` char(255) NOT NULL default '',
  `attribute_value` char(255) NOT NULL default '',
  PRIMARY KEY  (`attribute_id`),
  KEY `idx_product_attribute_product_id` (`product_id`),
  KEY `idx_product_attribute_name` (`attribute_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COMMENT='Stores attributes + their specific values for Child Products' AUTO_INCREMENT=10 ;

-- --------------------------------------------------------

--
-- Table structure for table `jos_vm_product_attribute_sku`
--

CREATE TABLE IF NOT EXISTS `jos_vm_product_attribute_sku` (
  `product_id` int(11) NOT NULL default '0',
  `attribute_name` char(255) NOT NULL default '',
  `attribute_list` int(11) NOT NULL default '0',
  KEY `idx_product_attribute_sku_product_id` (`product_id`),
  KEY `idx_product_attribute_sku_attribute_name` (`attribute_name`),
  KEY `idx_product_attribute_list` (`attribute_list`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Attributes for a Parent Product used by its Child Products';

-- --------------------------------------------------------

--
-- Table structure for table `jos_vm_product_category_xref`
--

CREATE TABLE IF NOT EXISTS `jos_vm_product_category_xref` (
  `category_id` int(11) NOT NULL default '0',
  `product_id` int(11) NOT NULL default '0',
  `product_list` int(11) default NULL,
  KEY `idx_product_category_xref_category_id` (`category_id`),
  KEY `idx_product_category_xref_product_id` (`product_id`),
  KEY `idx_product_category_xref_product_list` (`product_list`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Maps Products to Categories';

--
-- Dumping data for table `jos_vm_product_category_xref`
--

INSERT INTO `jos_vm_product_category_xref` (`category_id`, `product_id`, `product_list`) VALUES
(6, 7, 1),
(2, 8, NULL),
(5, 9, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jos_vm_product_discount`
--

CREATE TABLE IF NOT EXISTS `jos_vm_product_discount` (
  `discount_id` int(11) NOT NULL auto_increment,
  `amount` decimal(12,2) NOT NULL default '0.00',
  `is_percent` tinyint(1) NOT NULL default '0',
  `start_date` int(11) NOT NULL default '0',
  `end_date` int(11) NOT NULL default '0',
  PRIMARY KEY  (`discount_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COMMENT='Discounts that can be assigned to products' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `jos_vm_product_discount`
--

INSERT INTO `jos_vm_product_discount` (`discount_id`, `amount`, `is_percent`, `start_date`, `end_date`) VALUES
(1, '20.00', 1, 1097704800, 1194390000),
(2, '2.00', 0, 1098655200, 0);

-- --------------------------------------------------------

--
-- Table structure for table `jos_vm_product_download`
--

CREATE TABLE IF NOT EXISTS `jos_vm_product_download` (
  `product_id` int(11) NOT NULL default '0',
  `user_id` int(11) NOT NULL default '0',
  `order_id` int(11) NOT NULL default '0',
  `end_date` int(11) NOT NULL default '0',
  `download_max` int(11) NOT NULL default '0',
  `download_id` varchar(32) NOT NULL default '',
  `file_name` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`download_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Active downloads for selling downloadable goods';

-- --------------------------------------------------------

--
-- Table structure for table `jos_vm_product_files`
--

CREATE TABLE IF NOT EXISTS `jos_vm_product_files` (
  `file_id` int(19) NOT NULL auto_increment,
  `file_product_id` int(11) NOT NULL default '0',
  `file_name` varchar(128) NOT NULL default '',
  `file_title` varchar(128) NOT NULL default '',
  `file_description` mediumtext NOT NULL,
  `file_extension` varchar(128) NOT NULL default '',
  `file_mimetype` varchar(64) NOT NULL default '',
  `file_url` varchar(254) NOT NULL default '',
  `file_published` tinyint(1) NOT NULL default '0',
  `file_is_image` tinyint(1) NOT NULL default '0',
  `file_image_height` int(11) NOT NULL default '0',
  `file_image_width` int(11) NOT NULL default '0',
  `file_image_thumb_height` int(11) NOT NULL default '50',
  `file_image_thumb_width` int(11) NOT NULL default '0',
  PRIMARY KEY  (`file_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Additional Images and Files which are assigned to products' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `jos_vm_product_mf_xref`
--

CREATE TABLE IF NOT EXISTS `jos_vm_product_mf_xref` (
  `product_id` int(11) default NULL,
  `manufacturer_id` int(11) default NULL,
  KEY `idx_product_mf_xref_product_id` (`product_id`),
  KEY `idx_product_mf_xref_manufacturer_id` (`manufacturer_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Maps a product to a manufacturer';

--
-- Dumping data for table `jos_vm_product_mf_xref`
--

INSERT INTO `jos_vm_product_mf_xref` (`product_id`, `manufacturer_id`) VALUES
(7, 1),
(8, 1),
(9, 1);

-- --------------------------------------------------------

--
-- Table structure for table `jos_vm_product_price`
--

CREATE TABLE IF NOT EXISTS `jos_vm_product_price` (
  `product_price_id` int(11) NOT NULL auto_increment,
  `product_id` int(11) NOT NULL default '0',
  `product_price` decimal(12,5) default NULL,
  `product_currency` char(16) default NULL,
  `product_price_vdate` int(11) default NULL,
  `product_price_edate` int(11) default NULL,
  `cdate` int(11) default NULL,
  `mdate` int(11) default NULL,
  `shopper_group_id` int(11) default NULL,
  `price_quantity_start` int(11) unsigned NOT NULL default '0',
  `price_quantity_end` int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (`product_price_id`),
  KEY `idx_product_price_product_id` (`product_id`),
  KEY `idx_product_price_shopper_group_id` (`shopper_group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COMMENT='Holds price records for a product' AUTO_INCREMENT=17 ;

--
-- Dumping data for table `jos_vm_product_price`
--

INSERT INTO `jos_vm_product_price` (`product_price_id`, `product_id`, `product_price`, `product_currency`, `product_price_vdate`, `product_price_edate`, `cdate`, `mdate`, `shopper_group_id`, `price_quantity_start`, `price_quantity_end`) VALUES
(7, 7, '149.99000', 'IDR', 0, 0, 950321754, 1315653159, 5, 0, 0),
(8, 8, '220.90000', 'IDR', 0, 0, 950321833, 1315478199, 5, 0, 0),
(9, 9, '700.00000', 'IDR', 0, 0, 950321933, 1315476947, 5, 0, 0),
(16, 7, '2.99000', 'USD', 0, 0, 966589140, 966589140, 6, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `jos_vm_product_product_type_xref`
--

CREATE TABLE IF NOT EXISTS `jos_vm_product_product_type_xref` (
  `product_id` int(11) NOT NULL default '0',
  `product_type_id` int(11) NOT NULL default '0',
  KEY `idx_product_product_type_xref_product_id` (`product_id`),
  KEY `idx_product_product_type_xref_product_type_id` (`product_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Maps products to a product type';

-- --------------------------------------------------------

--
-- Table structure for table `jos_vm_product_relations`
--

CREATE TABLE IF NOT EXISTS `jos_vm_product_relations` (
  `product_id` int(11) NOT NULL default '0',
  `related_products` text,
  PRIMARY KEY  (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `jos_vm_product_reviews`
--

CREATE TABLE IF NOT EXISTS `jos_vm_product_reviews` (
  `review_id` int(11) NOT NULL auto_increment,
  `product_id` int(11) NOT NULL default '0',
  `comment` text NOT NULL,
  `userid` int(11) NOT NULL default '0',
  `time` int(11) NOT NULL default '0',
  `user_rating` tinyint(1) NOT NULL default '0',
  `review_ok` int(11) NOT NULL default '0',
  `review_votes` int(11) NOT NULL default '0',
  `published` char(1) NOT NULL default 'Y',
  PRIMARY KEY  (`review_id`),
  UNIQUE KEY `product_id` (`product_id`,`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `jos_vm_product_type`
--

CREATE TABLE IF NOT EXISTS `jos_vm_product_type` (
  `product_type_id` int(11) NOT NULL auto_increment,
  `product_type_name` varchar(255) NOT NULL default '',
  `product_type_description` text,
  `product_type_publish` char(1) default NULL,
  `product_type_browsepage` varchar(255) default NULL,
  `product_type_flypage` varchar(255) default NULL,
  `product_type_list_order` int(11) default NULL,
  PRIMARY KEY  (`product_type_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `jos_vm_product_type`
--

INSERT INTO `jos_vm_product_type` (`product_type_id`, `product_type_name`, `product_type_description`, `product_type_publish`, `product_type_browsepage`, `product_type_flypage`, `product_type_list_order`) VALUES
(1, 'Product mark', '', 'Y', '', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `jos_vm_product_type_1`
--

CREATE TABLE IF NOT EXISTS `jos_vm_product_type_1` (
  `product_id` int(11) NOT NULL,
  PRIMARY KEY  (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `jos_vm_product_type_parameter`
--

CREATE TABLE IF NOT EXISTS `jos_vm_product_type_parameter` (
  `product_type_id` int(11) NOT NULL default '0',
  `parameter_name` varchar(255) NOT NULL default '',
  `parameter_label` varchar(255) NOT NULL default '',
  `parameter_description` text,
  `parameter_list_order` int(11) NOT NULL default '0',
  `parameter_type` char(1) NOT NULL default 'T',
  `parameter_values` varchar(255) default NULL,
  `parameter_multiselect` char(1) default NULL,
  `parameter_default` varchar(255) default NULL,
  `parameter_unit` varchar(32) default NULL,
  PRIMARY KEY  (`product_type_id`,`parameter_name`),
  KEY `idx_product_type_parameter_product_type_id` (`product_type_id`),
  KEY `idx_product_type_parameter_parameter_order` (`parameter_list_order`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Parameters which are part of a product type';

-- --------------------------------------------------------

--
-- Table structure for table `jos_vm_product_votes`
--

CREATE TABLE IF NOT EXISTS `jos_vm_product_votes` (
  `product_id` int(255) NOT NULL default '0',
  `votes` text NOT NULL,
  `allvotes` int(11) NOT NULL default '0',
  `rating` tinyint(1) NOT NULL default '0',
  `lastip` varchar(50) NOT NULL default '0',
  PRIMARY KEY  (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Stores all votes for a product';

-- --------------------------------------------------------

--
-- Table structure for table `jos_vm_shipping_carrier`
--

CREATE TABLE IF NOT EXISTS `jos_vm_shipping_carrier` (
  `shipping_carrier_id` int(11) NOT NULL auto_increment,
  `shipping_carrier_name` char(80) NOT NULL default '',
  `shipping_carrier_list_order` int(11) NOT NULL default '0',
  PRIMARY KEY  (`shipping_carrier_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COMMENT='Shipping Carriers as used by the Standard Shipping Module' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `jos_vm_shipping_carrier`
--

INSERT INTO `jos_vm_shipping_carrier` (`shipping_carrier_id`, `shipping_carrier_name`, `shipping_carrier_list_order`) VALUES
(1, 'DHL', 0),
(2, 'UPS', 1);

-- --------------------------------------------------------

--
-- Table structure for table `jos_vm_shipping_label`
--

CREATE TABLE IF NOT EXISTS `jos_vm_shipping_label` (
  `order_id` int(11) NOT NULL default '0',
  `shipper_class` varchar(32) default NULL,
  `ship_date` varchar(32) default NULL,
  `service_code` varchar(32) default NULL,
  `special_service` varchar(32) default NULL,
  `package_type` varchar(16) default NULL,
  `order_weight` decimal(10,2) default NULL,
  `is_international` tinyint(1) default NULL,
  `additional_protection_type` varchar(16) default NULL,
  `additional_protection_value` decimal(10,2) default NULL,
  `duty_value` decimal(10,2) default NULL,
  `content_desc` varchar(255) default NULL,
  `label_is_generated` tinyint(1) NOT NULL default '0',
  `tracking_number` varchar(32) default NULL,
  `label_image` blob,
  `have_signature` tinyint(1) NOT NULL default '0',
  `signature_image` blob,
  PRIMARY KEY  (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Stores information used in generating shipping labels';

-- --------------------------------------------------------

--
-- Table structure for table `jos_vm_shipping_rate`
--

CREATE TABLE IF NOT EXISTS `jos_vm_shipping_rate` (
  `shipping_rate_id` int(11) NOT NULL auto_increment,
  `shipping_rate_name` varchar(255) NOT NULL default '',
  `shipping_rate_carrier_id` int(11) NOT NULL default '0',
  `shipping_rate_country` text NOT NULL,
  `shipping_rate_zip_start` varchar(32) NOT NULL default '',
  `shipping_rate_zip_end` varchar(32) NOT NULL default '',
  `shipping_rate_weight_start` decimal(10,3) NOT NULL default '0.000',
  `shipping_rate_weight_end` decimal(10,3) NOT NULL default '0.000',
  `shipping_rate_value` decimal(10,2) NOT NULL default '0.00',
  `shipping_rate_package_fee` decimal(10,2) NOT NULL default '0.00',
  `shipping_rate_currency_id` int(11) NOT NULL default '0',
  `shipping_rate_vat_id` int(11) NOT NULL default '0',
  `shipping_rate_list_order` int(11) NOT NULL default '0',
  PRIMARY KEY  (`shipping_rate_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COMMENT='Shipping Rates, used by the Standard Shipping Module' AUTO_INCREMENT=22 ;

--
-- Dumping data for table `jos_vm_shipping_rate`
--

INSERT INTO `jos_vm_shipping_rate` (`shipping_rate_id`, `shipping_rate_name`, `shipping_rate_carrier_id`, `shipping_rate_country`, `shipping_rate_zip_start`, `shipping_rate_zip_end`, `shipping_rate_weight_start`, `shipping_rate_weight_end`, `shipping_rate_value`, `shipping_rate_package_fee`, `shipping_rate_currency_id`, `shipping_rate_vat_id`, `shipping_rate_list_order`) VALUES
(1, 'Inland > 4kg', 1, 'DEU', '00000', '99999', '0.000', '4.000', '5.62', '2.00', 47, 0, 1),
(2, 'Inland > 8kg', 1, 'DEU', '00000', '99999', '4.000', '8.000', '6.39', '2.00', 47, 0, 2),
(3, 'Inland > 12kg', 1, 'DEU', '00000', '99999', '8.000', '12.000', '7.16', '2.00', 47, 0, 3),
(4, 'Inland > 20kg', 1, 'DEU', '00000', '99999', '12.000', '20.000', '8.69', '2.00', 47, 0, 4),
(5, 'EU+ >  4kg', 1, 'AND;BEL;DNK;FRO;FIN;FRA;GRC;GRL;GBR;IRL;ITA;LIE;LUX;MCO;NLD;AUT;POL;PRT;SMR;SWE;CHE;SVK;ESP;CZE', '00000', '99999', '0.000', '4.000', '14.57', '2.00', 47, 0, 5),
(6, 'EU+ >  8kg', 1, 'AND;BEL;DNK;FRO;FIN;FRA;GRC;GRL;GBR;IRL;ITA;LIE;LUX;MCO;NLD;AUT;POL;PRT;SMR;SWE;CHE;SVK;ESP;CZE', '00000', '99999', '4.000', '8.000', '18.66', '2.00', 47, 0, 6),
(7, 'EU+ > 12kg', 1, 'AND;BEL;DNK;FRO;FIN;FRA;GRC;GRL;GBR;IRL;ITA;LIE;LUX;MCO;NLD;AUT;POL;PRT;SMR;SWE;CHE;SVK;ESP;CZE', '00000', '99999', '8.000', '12.000', '22.57', '2.00', 47, 0, 7),
(8, 'EU+ > 20kg', 1, 'AND;BEL;DNK;FRO;FIN;FRA;GRC;GRL;GBR;IRL;ITA;LIE;LUX;MCO;NLD;AUT;POL;PRT;SMR;SWE;CHE;SVK;ESP;CZE', '00000', '99999', '12.000', '20.000', '30.93', '2.00', 47, 0, 8),
(9, 'Europe > 4kg', 1, 'ALB;ARM;AZE;BLR;BIH;BGR;EST;GEO;GIB;ISL;YUG;KAZ;HRV;LVA;LTU;MLT;MKD;MDA;NOR;ROM;RUS;SVN;TUR;UKR;HUN;BLR;CYP', '00000', '99999', '0.000', '4.000', '23.78', '2.00', 47, 0, 9),
(10, 'Europe >  8kg', 1, 'ALB;ARM;AZE;BLR;BIH;BGR;EST;GEO;GIB;ISL;YUG;KAZ;HRV;LVA;LTU;MLT;MKD;MDA;NOR;ROM;RUS;SVN;TUR;UKR;HUN;BLR;CYP', '00000', '99999', '4.000', '8.000', '29.91', '2.00', 47, 0, 10),
(11, 'Europe > 12kg', 1, 'ALB;ARM;AZE;BLR;BIH;BGR;EST;GEO;GIB;ISL;YUG;KAZ;HRV;LVA;LTU;MLT;MKD;MDA;NOR;ROM;RUS;SVN;TUR;UKR;HUN;BLR;CYP', '00000', '99999', '8.000', '12.000', '36.05', '2.00', 47, 0, 11),
(12, 'Europe > 20kg', 1, 'ALB;ARM;AZE;BLR;BIH;BGR;EST;GEO;GIB;ISL;YUG;KAZ;HRV;LVA;LTU;MLT;MKD;MDA;NOR;ROM;RUS;SVN;TUR;UKR;HUN;BLR;CYP', '00000', '99999', '12.000', '20.000', '48.32', '2.00', 47, 0, 12),
(13, 'World_1 >  4kg', 1, 'EGY;DZA;BHR;IRQ;IRN;ISR;YEM;JOR;CAN;QAT;KWT;LBN;LBY;MAR;OMN;SAU;SYR;TUN;ARE;USA', '00000', '99999', '0.000', '4.000', '26.84', '2.00', 47, 0, 13),
(14, 'World_1 > 8kg', 1, 'EGY;DZA;BHR;IRQ;IRN;ISR;YEM;JOR;CAN;QAT;KWT;LBN;LBY;MAR;OMN;SAU;SYR;TUN;ARE;USA', '00000', '99999', '4.000', '8.000', '35.02', '2.00', 47, 0, 14),
(15, 'World_1 > 12kg', 1, 'EGY;DZA;BHR;IRQ;IRN;ISR;YEM;JOR;CAN;QAT;KWT;LBN;LBY;MAR;OMN;SAU;SYR;TUN;ARE;USA', '00000', '99999', '8.000', '12.000', '43.20', '2.00', 47, 0, 15),
(16, 'World_1 > 20kg', 1, 'EGY;DZA;BHR;IRQ;IRN;ISR;YEM;JOR;CAN;QAT;KWT;LBN;LBY;MAR;OMN;SAU;SYR;TUN;ARE;USA', '00000', '99999', '12.000', '20.000', '59.57', '2.00', 47, 0, 16),
(17, 'World_2 > 4kg', 1, '', '00000', '99999', '0.000', '4.000', '32.98', '2.00', 47, 0, 17),
(18, 'World_2 > 8kg', 1, '', '00000', '99999', '4.000', '8.000', '47.29', '2.00', 47, 0, 18),
(19, 'World_2 > 12kg', 1, '', '00000', '99999', '8.000', '12.000', '61.61', '2.00', 47, 0, 19),
(20, 'World_2 > 20kg', 1, '', '00000', '99999', '12.000', '20.000', '90.24', '2.00', 47, 0, 20),
(21, 'UPS Express', 2, 'AND;BEL;DNK;FRO;FIN;FRA;GRC;GRL;GBR;IRL;ITA;LIE;LUX;MCO;NLD;AUT;POL;PRT;SMR;SWE;CHE;SVK;ESP;CZE', '00000', '99999', '0.000', '20.000', '5.24', '2.00', 47, 0, 21);

-- --------------------------------------------------------

--
-- Table structure for table `jos_vm_shopper_group`
--

CREATE TABLE IF NOT EXISTS `jos_vm_shopper_group` (
  `shopper_group_id` int(11) NOT NULL auto_increment,
  `vendor_id` int(11) default NULL,
  `shopper_group_name` varchar(32) default NULL,
  `shopper_group_desc` text,
  `shopper_group_discount` decimal(5,2) NOT NULL default '0.00',
  `show_price_including_tax` tinyint(1) NOT NULL default '1',
  `default` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`shopper_group_id`),
  KEY `idx_shopper_group_vendor_id` (`vendor_id`),
  KEY `idx_shopper_group_name` (`shopper_group_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COMMENT='Shopper Groups that users can be assigned to' AUTO_INCREMENT=8 ;

--
-- Dumping data for table `jos_vm_shopper_group`
--

INSERT INTO `jos_vm_shopper_group` (`shopper_group_id`, `vendor_id`, `shopper_group_name`, `shopper_group_desc`, `shopper_group_discount`, `show_price_including_tax`, `default`) VALUES
(5, 1, '-default-', 'This is the default shopper group.', '0.00', 1, 1),
(6, 1, 'Gold Level', 'Gold Level Shoppers.', '0.00', 1, 0),
(7, 1, 'Wholesale', 'Shoppers that can buy at wholesale.', '0.00', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `jos_vm_shopper_vendor_xref`
--

CREATE TABLE IF NOT EXISTS `jos_vm_shopper_vendor_xref` (
  `user_id` int(11) default NULL,
  `vendor_id` int(11) default NULL,
  `shopper_group_id` int(11) default NULL,
  `customer_number` varchar(32) default NULL,
  KEY `idx_shopper_vendor_xref_user_id` (`user_id`),
  KEY `idx_shopper_vendor_xref_vendor_id` (`vendor_id`),
  KEY `idx_shopper_vendor_xref_shopper_group_id` (`shopper_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Maps a user to a Shopper Group of a Vendor';

--
-- Dumping data for table `jos_vm_shopper_vendor_xref`
--

INSERT INTO `jos_vm_shopper_vendor_xref` (`user_id`, `vendor_id`, `shopper_group_id`, `customer_number`) VALUES
(62, 1, 5, ''),
(63, 1, 5, '');

-- --------------------------------------------------------

--
-- Table structure for table `jos_vm_state`
--

CREATE TABLE IF NOT EXISTS `jos_vm_state` (
  `state_id` int(11) NOT NULL auto_increment,
  `country_id` int(11) NOT NULL default '1',
  `state_name` varchar(64) default NULL,
  `state_3_code` char(3) default NULL,
  `state_2_code` char(2) default NULL,
  PRIMARY KEY  (`state_id`),
  UNIQUE KEY `state_3_code` (`country_id`,`state_3_code`),
  UNIQUE KEY `state_2_code` (`country_id`,`state_2_code`),
  KEY `idx_country_id` (`country_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COMMENT='States that are assigned to a country' AUTO_INCREMENT=452 ;

--
-- Dumping data for table `jos_vm_state`
--

INSERT INTO `jos_vm_state` (`state_id`, `country_id`, `state_name`, `state_3_code`, `state_2_code`) VALUES
(1, 223, 'Alabama', 'ALA', 'AL'),
(2, 223, 'Alaska', 'ALK', 'AK'),
(3, 223, 'Arizona', 'ARZ', 'AZ'),
(4, 223, 'Arkansas', 'ARK', 'AR'),
(5, 223, 'California', 'CAL', 'CA'),
(6, 223, 'Colorado', 'COL', 'CO'),
(7, 223, 'Connecticut', 'CCT', 'CT'),
(8, 223, 'Delaware', 'DEL', 'DE'),
(9, 223, 'District Of Columbia', 'DOC', 'DC'),
(10, 223, 'Florida', 'FLO', 'FL'),
(11, 223, 'Georgia', 'GEA', 'GA'),
(12, 223, 'Hawaii', 'HWI', 'HI'),
(13, 223, 'Idaho', 'IDA', 'ID'),
(14, 223, 'Illinois', 'ILL', 'IL'),
(15, 223, 'Indiana', 'IND', 'IN'),
(16, 223, 'Iowa', 'IOA', 'IA'),
(17, 223, 'Kansas', 'KAS', 'KS'),
(18, 223, 'Kentucky', 'KTY', 'KY'),
(19, 223, 'Louisiana', 'LOA', 'LA'),
(20, 223, 'Maine', 'MAI', 'ME'),
(21, 223, 'Maryland', 'MLD', 'MD'),
(22, 223, 'Massachusetts', 'MSA', 'MA'),
(23, 223, 'Michigan', 'MIC', 'MI'),
(24, 223, 'Minnesota', 'MIN', 'MN'),
(25, 223, 'Mississippi', 'MIS', 'MS'),
(26, 223, 'Missouri', 'MIO', 'MO'),
(27, 223, 'Montana', 'MOT', 'MT'),
(28, 223, 'Nebraska', 'NEB', 'NE'),
(29, 223, 'Nevada', 'NEV', 'NV'),
(30, 223, 'New Hampshire', 'NEH', 'NH'),
(31, 223, 'New Jersey', 'NEJ', 'NJ'),
(32, 223, 'New Mexico', 'NEM', 'NM'),
(33, 223, 'New York', 'NEY', 'NY'),
(34, 223, 'North Carolina', 'NOC', 'NC'),
(35, 223, 'North Dakota', 'NOD', 'ND'),
(36, 223, 'Ohio', 'OHI', 'OH'),
(37, 223, 'Oklahoma', 'OKL', 'OK'),
(38, 223, 'Oregon', 'ORN', 'OR'),
(39, 223, 'Pennsylvania', 'PEA', 'PA'),
(40, 223, 'Rhode Island', 'RHI', 'RI'),
(41, 223, 'South Carolina', 'SOC', 'SC'),
(42, 223, 'South Dakota', 'SOD', 'SD'),
(43, 223, 'Tennessee', 'TEN', 'TN'),
(44, 223, 'Texas', 'TXS', 'TX'),
(45, 223, 'Utah', 'UTA', 'UT'),
(46, 223, 'Vermont', 'VMT', 'VT'),
(47, 223, 'Virginia', 'VIA', 'VA'),
(48, 223, 'Washington', 'WAS', 'WA'),
(49, 223, 'West Virginia', 'WEV', 'WV'),
(50, 223, 'Wisconsin', 'WIS', 'WI'),
(51, 223, 'Wyoming', 'WYO', 'WY'),
(52, 38, 'Alberta', 'ALB', 'AB'),
(53, 38, 'British Columbia', 'BRC', 'BC'),
(54, 38, 'Manitoba', 'MAB', 'MB'),
(55, 38, 'New Brunswick', 'NEB', 'NB'),
(56, 38, 'Newfoundland and Labrador', 'NFL', 'NL'),
(57, 38, 'Northwest Territories', 'NWT', 'NT'),
(58, 38, 'Nova Scotia', 'NOS', 'NS'),
(59, 38, 'Nunavut', 'NUT', 'NU'),
(60, 38, 'Ontario', 'ONT', 'ON'),
(61, 38, 'Prince Edward Island', 'PEI', 'PE'),
(62, 38, 'Quebec', 'QEC', 'QC'),
(63, 38, 'Saskatchewan', 'SAK', 'SK'),
(64, 38, 'Yukon', 'YUT', 'YT'),
(65, 222, 'England', 'ENG', 'EN'),
(66, 222, 'Northern Ireland', 'NOI', 'NI'),
(67, 222, 'Scotland', 'SCO', 'SD'),
(68, 222, 'Wales', 'WLS', 'WS'),
(69, 13, 'Australian Capital Territory', 'ACT', 'AC'),
(70, 13, 'New South Wales', 'NSW', 'NS'),
(71, 13, 'Northern Territory', 'NOT', 'NT'),
(72, 13, 'Queensland', 'QLD', 'QL'),
(73, 13, 'South Australia', 'SOA', 'SA'),
(74, 13, 'Tasmania', 'TAS', 'TS'),
(75, 13, 'Victoria', 'VIC', 'VI'),
(76, 13, 'Western Australia', 'WEA', 'WA'),
(77, 138, 'Aguascalientes', 'AGS', 'AG'),
(78, 138, 'Baja California Norte', 'BCN', 'BN'),
(79, 138, 'Baja California Sur', 'BCS', 'BS'),
(80, 138, 'Campeche', 'CAM', 'CA'),
(81, 138, 'Chiapas', 'CHI', 'CS'),
(82, 138, 'Chihuahua', 'CHA', 'CH'),
(83, 138, 'Coahuila', 'COA', 'CO'),
(84, 138, 'Colima', 'COL', 'CM'),
(85, 138, 'Distrito Federal', 'DFM', 'DF'),
(86, 138, 'Durango', 'DGO', 'DO'),
(87, 138, 'Guanajuato', 'GTO', 'GO'),
(88, 138, 'Guerrero', 'GRO', 'GU'),
(89, 138, 'Hidalgo', 'HGO', 'HI'),
(90, 138, 'Jalisco', 'JAL', 'JA'),
(91, 138, 'México (Estado de)', 'EDM', 'EM'),
(92, 138, 'Michoacán', 'MCN', 'MI'),
(93, 138, 'Morelos', 'MOR', 'MO'),
(94, 138, 'Nayarit', 'NAY', 'NY'),
(95, 138, 'Nuevo León', 'NUL', 'NL'),
(96, 138, 'Oaxaca', 'OAX', 'OA'),
(97, 138, 'Puebla', 'PUE', 'PU'),
(98, 138, 'Querétaro', 'QRO', 'QU'),
(99, 138, 'Quintana Roo', 'QUR', 'QR'),
(100, 138, 'San Luis Potosí', 'SLP', 'SP'),
(101, 138, 'Sinaloa', 'SIN', 'SI'),
(102, 138, 'Sonora', 'SON', 'SO'),
(103, 138, 'Tabasco', 'TAB', 'TA'),
(104, 138, 'Tamaulipas', 'TAM', 'TM'),
(105, 138, 'Tlaxcala', 'TLX', 'TX'),
(106, 138, 'Veracruz', 'VER', 'VZ'),
(107, 138, 'Yucatán', 'YUC', 'YU'),
(108, 138, 'Zacatecas', 'ZAC', 'ZA'),
(109, 30, 'Acre', 'ACR', 'AC'),
(110, 30, 'Alagoas', 'ALG', 'AL'),
(111, 30, 'Amapá', 'AMP', 'AP'),
(112, 30, 'Amazonas', 'AMZ', 'AM'),
(113, 30, 'Bahía', 'BAH', 'BA'),
(114, 30, 'Ceará', 'CEA', 'CE'),
(115, 30, 'Distrito Federal', 'DFB', 'DF'),
(116, 30, 'Espirito Santo', 'ESS', 'ES'),
(117, 30, 'Goiás', 'GOI', 'GO'),
(118, 30, 'Maranhão', 'MAR', 'MA'),
(119, 30, 'Mato Grosso', 'MAT', 'MT'),
(120, 30, 'Mato Grosso do Sul', 'MGS', 'MS'),
(121, 30, 'Minas Geraís', 'MIG', 'MG'),
(122, 30, 'Paraná', 'PAR', 'PR'),
(123, 30, 'Paraíba', 'PRB', 'PB'),
(124, 30, 'Pará', 'PAB', 'PA'),
(125, 30, 'Pernambuco', 'PER', 'PE'),
(126, 30, 'Piauí', 'PIA', 'PI'),
(127, 30, 'Rio Grande do Norte', 'RGN', 'RN'),
(128, 30, 'Rio Grande do Sul', 'RGS', 'RS'),
(129, 30, 'Rio de Janeiro', 'RDJ', 'RJ'),
(130, 30, 'Rondônia', 'RON', 'RO'),
(131, 30, 'Roraima', 'ROR', 'RR'),
(132, 30, 'Santa Catarina', 'SAC', 'SC'),
(133, 30, 'Sergipe', 'SER', 'SE'),
(134, 30, 'São Paulo', 'SAP', 'SP'),
(135, 30, 'Tocantins', 'TOC', 'TO'),
(136, 44, 'Anhui', 'ANH', '34'),
(137, 44, 'Beijing', 'BEI', '11'),
(138, 44, 'Chongqing', 'CHO', '50'),
(139, 44, 'Fujian', 'FUJ', '35'),
(140, 44, 'Gansu', 'GAN', '62'),
(141, 44, 'Guangdong', 'GUA', '44'),
(142, 44, 'Guangxi Zhuang', 'GUZ', '45'),
(143, 44, 'Guizhou', 'GUI', '52'),
(144, 44, 'Hainan', 'HAI', '46'),
(145, 44, 'Hebei', 'HEB', '13'),
(146, 44, 'Heilongjiang', 'HEI', '23'),
(147, 44, 'Henan', 'HEN', '41'),
(148, 44, 'Hubei', 'HUB', '42'),
(149, 44, 'Hunan', 'HUN', '43'),
(150, 44, 'Jiangsu', 'JIA', '32'),
(151, 44, 'Jiangxi', 'JIX', '36'),
(152, 44, 'Jilin', 'JIL', '22'),
(153, 44, 'Liaoning', 'LIA', '21'),
(154, 44, 'Nei Mongol', 'NML', '15'),
(155, 44, 'Ningxia Hui', 'NIH', '64'),
(156, 44, 'Qinghai', 'QIN', '63'),
(157, 44, 'Shandong', 'SNG', '37'),
(158, 44, 'Shanghai', 'SHH', '31'),
(159, 44, 'Shaanxi', 'SHX', '61'),
(160, 44, 'Sichuan', 'SIC', '51'),
(161, 44, 'Tianjin', 'TIA', '12'),
(162, 44, 'Xinjiang Uygur', 'XIU', '65'),
(163, 44, 'Xizang', 'XIZ', '54'),
(164, 44, 'Yunnan', 'YUN', '53'),
(165, 44, 'Zhejiang', 'ZHE', '33'),
(166, 104, 'Israel', 'ISL', 'IL'),
(167, 104, 'Gaza Strip', 'GZS', 'GZ'),
(168, 104, 'West Bank', 'WBK', 'WB'),
(169, 151, 'St. Maarten', 'STM', 'SM'),
(170, 151, 'Bonaire', 'BNR', 'BN'),
(171, 151, 'Curacao', 'CUR', 'CR'),
(172, 175, 'Alba', 'ABA', 'AB'),
(173, 175, 'Arad', 'ARD', 'AR'),
(174, 175, 'Arges', 'ARG', 'AG'),
(175, 175, 'Bacau', 'BAC', 'BC'),
(176, 175, 'Bihor', 'BIH', 'BH'),
(177, 175, 'Bistrita-Nasaud', 'BIS', 'BN'),
(178, 175, 'Botosani', 'BOT', 'BT'),
(179, 175, 'Braila', 'BRL', 'BR'),
(180, 175, 'Brasov', 'BRA', 'BV'),
(181, 175, 'Bucuresti', 'BUC', 'B'),
(182, 175, 'Buzau', 'BUZ', 'BZ'),
(183, 175, 'Calarasi', 'CAL', 'CL'),
(184, 175, 'Caras Severin', 'CRS', 'CS'),
(185, 175, 'Cluj', 'CLJ', 'CJ'),
(186, 175, 'Constanta', 'CST', 'CT'),
(187, 175, 'Covasna', 'COV', 'CV'),
(188, 175, 'Dambovita', 'DAM', 'DB'),
(189, 175, 'Dolj', 'DLJ', 'DJ'),
(190, 175, 'Galati', 'GAL', 'GL'),
(191, 175, 'Giurgiu', 'GIU', 'GR'),
(192, 175, 'Gorj', 'GOR', 'GJ'),
(193, 175, 'Hargita', 'HRG', 'HR'),
(194, 175, 'Hunedoara', 'HUN', 'HD'),
(195, 175, 'Ialomita', 'IAL', 'IL'),
(196, 175, 'Iasi', 'IAS', 'IS'),
(197, 175, 'Ilfov', 'ILF', 'IF'),
(198, 175, 'Maramures', 'MAR', 'MM'),
(199, 175, 'Mehedinti', 'MEH', 'MH'),
(200, 175, 'Mures', 'MUR', 'MS'),
(201, 175, 'Neamt', 'NEM', 'NT'),
(202, 175, 'Olt', 'OLT', 'OT'),
(203, 175, 'Prahova', 'PRA', 'PH'),
(204, 175, 'Salaj', 'SAL', 'SJ'),
(205, 175, 'Satu Mare', 'SAT', 'SM'),
(206, 175, 'Sibiu', 'SIB', 'SB'),
(207, 175, 'Suceava', 'SUC', 'SV'),
(208, 175, 'Teleorman', 'TEL', 'TR'),
(209, 175, 'Timis', 'TIM', 'TM'),
(210, 175, 'Tulcea', 'TUL', 'TL'),
(211, 175, 'Valcea', 'VAL', 'VL'),
(212, 175, 'Vaslui', 'VAS', 'VS'),
(213, 175, 'Vrancea', 'VRA', 'VN'),
(214, 105, 'Agrigento', 'AGR', 'AG'),
(215, 105, 'Alessandria', 'ALE', 'AL'),
(216, 105, 'Ancona', 'ANC', 'AN'),
(217, 105, 'Aosta', 'AOS', 'AO'),
(218, 105, 'Arezzo', 'ARE', 'AR'),
(219, 105, 'Ascoli Piceno', 'API', 'AP'),
(220, 105, 'Asti', 'AST', 'AT'),
(221, 105, 'Avellino', 'AVE', 'AV'),
(222, 105, 'Bari', 'BAR', 'BA'),
(223, 105, 'Barletta Andria Trani', 'BTA', 'BT'),
(224, 105, 'Belluno', 'BEL', 'BL'),
(225, 105, 'Benevento', 'BEN', 'BN'),
(226, 105, 'Bergamo', 'BEG', 'BG'),
(227, 105, 'Biella', 'BIE', 'BI'),
(228, 105, 'Bologna', 'BOL', 'BO'),
(229, 105, 'Bolzano', 'BOZ', 'BZ'),
(230, 105, 'Brescia', 'BRE', 'BS'),
(231, 105, 'Brindisi', 'BRI', 'BR'),
(232, 105, 'Cagliari', 'CAG', 'CA'),
(233, 105, 'Caltanissetta', 'CAL', 'CL'),
(234, 105, 'Campobasso', 'CBO', 'CB'),
(235, 105, 'Carbonia-Iglesias', 'CAR', 'CI'),
(236, 105, 'Caserta', 'CAS', 'CE'),
(237, 105, 'Catania', 'CAT', 'CT'),
(238, 105, 'Catanzaro', 'CTZ', 'CZ'),
(239, 105, 'Chieti', 'CHI', 'CH'),
(240, 105, 'Como', 'COM', 'CO'),
(241, 105, 'Cosenza', 'COS', 'CS'),
(242, 105, 'Cremona', 'CRE', 'CR'),
(243, 105, 'Crotone', 'CRO', 'KR'),
(244, 105, 'Cuneo', 'CUN', 'CN'),
(245, 105, 'Enna', 'ENN', 'EN'),
(246, 105, 'Fermo', 'FMO', 'FM'),
(247, 105, 'Ferrara', 'FER', 'FE'),
(248, 105, 'Firenze', 'FIR', 'FI'),
(249, 105, 'Foggia', 'FOG', 'FG'),
(250, 105, 'Forli-Cesena', 'FOC', 'FC'),
(251, 105, 'Frosinone', 'FRO', 'FR'),
(252, 105, 'Genova', 'GEN', 'GE'),
(253, 105, 'Gorizia', 'GOR', 'GO'),
(254, 105, 'Grosseto', 'GRO', 'GR'),
(255, 105, 'Imperia', 'IMP', 'IM'),
(256, 105, 'Isernia', 'ISE', 'IS'),
(257, 105, 'L''Aquila', 'AQU', 'AQ'),
(258, 105, 'La Spezia', 'LAS', 'SP'),
(259, 105, 'Latina', 'LAT', 'LT'),
(260, 105, 'Lecce', 'LEC', 'LE'),
(261, 105, 'Lecco', 'LCC', 'LC'),
(262, 105, 'Livorno', 'LIV', 'LI'),
(263, 105, 'Lodi', 'LOD', 'LO'),
(264, 105, 'Lucca', 'LUC', 'LU'),
(265, 105, 'Macerata', 'MAC', 'MC'),
(266, 105, 'Mantova', 'MAN', 'MN'),
(267, 105, 'Massa-Carrara', 'MAS', 'MS'),
(268, 105, 'Matera', 'MAA', 'MT'),
(269, 105, 'Medio Campidano', 'MED', 'VS'),
(270, 105, 'Messina', 'MES', 'ME'),
(271, 105, 'Milano', 'MIL', 'MI'),
(272, 105, 'Modena', 'MOD', 'MO'),
(273, 105, 'Monza e della Brianza', 'MBA', 'MB'),
(274, 105, 'Napoli', 'NAP', 'NA'),
(275, 105, 'Novara', 'NOV', 'NO'),
(276, 105, 'Nuoro', 'NUR', 'NU'),
(277, 105, 'Ogliastra', 'OGL', 'OG'),
(278, 105, 'Olbia-Tempio', 'OLB', 'OT'),
(279, 105, 'Oristano', 'ORI', 'OR'),
(280, 105, 'Padova', 'PDA', 'PD'),
(281, 105, 'Palermo', 'PAL', 'PA'),
(282, 105, 'Parma', 'PAA', 'PR'),
(283, 105, 'Pavia', 'PAV', 'PV'),
(284, 105, 'Perugia', 'PER', 'PG'),
(285, 105, 'Pesaro e Urbino', 'PES', 'PU'),
(286, 105, 'Pescara', 'PSC', 'PE'),
(287, 105, 'Piacenza', 'PIA', 'PC'),
(288, 105, 'Pisa', 'PIS', 'PI'),
(289, 105, 'Pistoia', 'PIT', 'PT'),
(290, 105, 'Pordenone', 'POR', 'PN'),
(291, 105, 'Potenza', 'PTZ', 'PZ'),
(292, 105, 'Prato', 'PRA', 'PO'),
(293, 105, 'Ragusa', 'RAG', 'RG'),
(294, 105, 'Ravenna', 'RAV', 'RA'),
(295, 105, 'Reggio Calabria', 'REG', 'RC'),
(296, 105, 'Reggio Emilia', 'REE', 'RE'),
(297, 105, 'Rieti', 'RIE', 'RI'),
(298, 105, 'Rimini', 'RIM', 'RN'),
(299, 105, 'Roma', 'ROM', 'RM'),
(300, 105, 'Rovigo', 'ROV', 'RO'),
(301, 105, 'Salerno', 'SAL', 'SA'),
(302, 105, 'Sassari', 'SAS', 'SS'),
(303, 105, 'Savona', 'SAV', 'SV'),
(304, 105, 'Siena', 'SIE', 'SI'),
(305, 105, 'Siracusa', 'SIR', 'SR'),
(306, 105, 'Sondrio', 'SOO', 'SO'),
(307, 105, 'Taranto', 'TAR', 'TA'),
(308, 105, 'Teramo', 'TER', 'TE'),
(309, 105, 'Terni', 'TRN', 'TR'),
(310, 105, 'Torino', 'TOR', 'TO'),
(311, 105, 'Trapani', 'TRA', 'TP'),
(312, 105, 'Trento', 'TRE', 'TN'),
(313, 105, 'Treviso', 'TRV', 'TV'),
(314, 105, 'Trieste', 'TRI', 'TS'),
(315, 105, 'Udine', 'UDI', 'UD'),
(316, 105, 'Varese', 'VAR', 'VA'),
(317, 105, 'Venezia', 'VEN', 'VE'),
(318, 105, 'Verbano Cusio Ossola', 'VCO', 'VB'),
(319, 105, 'Vercelli', 'VER', 'VC'),
(320, 105, 'Verona', 'VRN', 'VR'),
(321, 105, 'Vibo Valenzia', 'VIV', 'VV'),
(322, 105, 'Vicenza', 'VII', 'VI'),
(323, 105, 'Viterbo', 'VIT', 'VT'),
(324, 195, 'A Coruña', 'ACO', '15'),
(325, 195, 'Alava', 'ALA', '01'),
(326, 195, 'Albacete', 'ALB', '02'),
(327, 195, 'Alicante', 'ALI', '03'),
(328, 195, 'Almeria', 'ALM', '04'),
(329, 195, 'Asturias', 'AST', '33'),
(330, 195, 'Avila', 'AVI', '05'),
(331, 195, 'Badajoz', 'BAD', '06'),
(332, 195, 'Baleares', 'BAL', '07'),
(333, 195, 'Barcelona', 'BAR', '08'),
(334, 195, 'Burgos', 'BUR', '09'),
(335, 195, 'Caceres', 'CAC', '10'),
(336, 195, 'Cadiz', 'CAD', '11'),
(337, 195, 'Cantabria', 'CAN', '39'),
(338, 195, 'Castellon', 'CAS', '12'),
(339, 195, 'Ceuta', 'CEU', '51'),
(340, 195, 'Ciudad Real', 'CIU', '13'),
(341, 195, 'Cordoba', 'COR', '14'),
(342, 195, 'Cuenca', 'CUE', '16'),
(343, 195, 'Girona', 'GIR', '17'),
(344, 195, 'Granada', 'GRA', '18'),
(345, 195, 'Guadalajara', 'GUA', '19'),
(346, 195, 'Guipuzcoa', 'GUI', '20'),
(347, 195, 'Huelva', 'HUL', '21'),
(348, 195, 'Huesca', 'HUS', '22'),
(349, 195, 'Jaen', 'JAE', '23'),
(350, 195, 'La Rioja', 'LRI', '26'),
(351, 195, 'Las Palmas', 'LPA', '35'),
(352, 195, 'Leon', 'LEO', '24'),
(353, 195, 'Lleida', 'LLE', '25'),
(354, 195, 'Lugo', 'LUG', '27'),
(355, 195, 'Madrid', 'MAD', '28'),
(356, 195, 'Malaga', 'MAL', '29'),
(357, 195, 'Melilla', 'MEL', '52'),
(358, 195, 'Murcia', 'MUR', '30'),
(359, 195, 'Navarra', 'NAV', '31'),
(360, 195, 'Ourense', 'OUR', '32'),
(361, 195, 'Palencia', 'PAL', '34'),
(362, 195, 'Pontevedra', 'PON', '36'),
(363, 195, 'Salamanca', 'SAL', '37'),
(364, 195, 'Santa Cruz de Tenerife', 'SCT', '38'),
(365, 195, 'Segovia', 'SEG', '40'),
(366, 195, 'Sevilla', 'SEV', '41'),
(367, 195, 'Soria', 'SOR', '42'),
(368, 195, 'Tarragona', 'TAR', '43'),
(369, 195, 'Teruel', 'TER', '44'),
(370, 195, 'Toledo', 'TOL', '45'),
(371, 195, 'Valencia', 'VAL', '46'),
(372, 195, 'Valladolid', 'VLL', '47'),
(373, 195, 'Vizcaya', 'VIZ', '48'),
(374, 195, 'Zamora', 'ZAM', '49'),
(375, 195, 'Zaragoza', 'ZAR', '50'),
(376, 11, 'Aragatsotn', 'ARG', 'AG'),
(377, 11, 'Ararat', 'ARR', 'AR'),
(378, 11, 'Armavir', 'ARM', 'AV'),
(379, 11, 'Gegharkunik', 'GEG', 'GR'),
(380, 11, 'Kotayk', 'KOT', 'KT'),
(381, 11, 'Lori', 'LOR', 'LO'),
(382, 11, 'Shirak', 'SHI', 'SH'),
(383, 11, 'Syunik', 'SYU', 'SU'),
(384, 11, 'Tavush', 'TAV', 'TV'),
(385, 11, 'Vayots-Dzor', 'VAD', 'VD'),
(386, 11, 'Yerevan', 'YER', 'ER'),
(387, 99, 'Andaman & Nicobar Islands', 'ANI', 'AI'),
(388, 99, 'Andhra Pradesh', 'AND', 'AN'),
(389, 99, 'Arunachal Pradesh', 'ARU', 'AR'),
(390, 99, 'Assam', 'ASS', 'AS'),
(391, 99, 'Bihar', 'BIH', 'BI'),
(392, 99, 'Chandigarh', 'CHA', 'CA'),
(393, 99, 'Chhatisgarh', 'CHH', 'CH'),
(394, 99, 'Dadra & Nagar Haveli', 'DAD', 'DD'),
(395, 99, 'Daman & Diu', 'DAM', 'DA'),
(396, 99, 'Delhi', 'DEL', 'DE'),
(397, 99, 'Goa', 'GOA', 'GO'),
(398, 99, 'Gujarat', 'GUJ', 'GU'),
(399, 99, 'Haryana', 'HAR', 'HA'),
(400, 99, 'Himachal Pradesh', 'HIM', 'HI'),
(401, 99, 'Jammu & Kashmir', 'JAM', 'JA'),
(402, 99, 'Jharkhand', 'JHA', 'JH'),
(403, 99, 'Karnataka', 'KAR', 'KA'),
(404, 99, 'Kerala', 'KER', 'KE'),
(405, 99, 'Lakshadweep', 'LAK', 'LA'),
(406, 99, 'Madhya Pradesh', 'MAD', 'MD'),
(407, 99, 'Maharashtra', 'MAH', 'MH'),
(408, 99, 'Manipur', 'MAN', 'MN'),
(409, 99, 'Meghalaya', 'MEG', 'ME'),
(410, 99, 'Mizoram', 'MIZ', 'MI'),
(411, 99, 'Nagaland', 'NAG', 'NA'),
(412, 99, 'Orissa', 'ORI', 'OR'),
(413, 99, 'Pondicherry', 'PON', 'PO'),
(414, 99, 'Punjab', 'PUN', 'PU'),
(415, 99, 'Rajasthan', 'RAJ', 'RA'),
(416, 99, 'Sikkim', 'SIK', 'SI'),
(417, 99, 'Tamil Nadu', 'TAM', 'TA'),
(418, 99, 'Tripura', 'TRI', 'TR'),
(419, 99, 'Uttaranchal', 'UAR', 'UA'),
(420, 99, 'Uttar Pradesh', 'UTT', 'UT'),
(421, 99, 'West Bengal', 'WES', 'WE'),
(422, 101, 'Ahmadi va Kohkiluyeh', 'BOK', 'BO'),
(423, 101, 'Ardabil', 'ARD', 'AR'),
(424, 101, 'Azarbayjan-e Gharbi', 'AZG', 'AG'),
(425, 101, 'Azarbayjan-e Sharqi', 'AZS', 'AS'),
(426, 101, 'Bushehr', 'BUS', 'BU'),
(427, 101, 'Chaharmahal va Bakhtiari', 'CMB', 'CM'),
(428, 101, 'Esfahan', 'ESF', 'ES'),
(429, 101, 'Fars', 'FAR', 'FA'),
(430, 101, 'Gilan', 'GIL', 'GI'),
(431, 101, 'Gorgan', 'GOR', 'GO'),
(432, 101, 'Hamadan', 'HAM', 'HA'),
(433, 101, 'Hormozgan', 'HOR', 'HO'),
(434, 101, 'Ilam', 'ILA', 'IL'),
(435, 101, 'Kerman', 'KER', 'KE'),
(436, 101, 'Kermanshah', 'BAK', 'BA'),
(437, 101, 'Khorasan-e Junoubi', 'KHJ', 'KJ'),
(438, 101, 'Khorasan-e Razavi', 'KHR', 'KR'),
(439, 101, 'Khorasan-e Shomali', 'KHS', 'KS'),
(440, 101, 'Khuzestan', 'KHU', 'KH'),
(441, 101, 'Kordestan', 'KOR', 'KO'),
(442, 101, 'Lorestan', 'LOR', 'LO'),
(443, 101, 'Markazi', 'MAR', 'MR'),
(444, 101, 'Mazandaran', 'MAZ', 'MZ'),
(445, 101, 'Qazvin', 'QAS', 'QA'),
(446, 101, 'Qom', 'QOM', 'QO'),
(447, 101, 'Semnan', 'SEM', 'SE'),
(448, 101, 'Sistan va Baluchestan', 'SBA', 'SB'),
(449, 101, 'Tehran', 'TEH', 'TE'),
(450, 101, 'Yazd', 'YAZ', 'YA'),
(451, 101, 'Zanjan', 'ZAN', 'ZA');

-- --------------------------------------------------------

--
-- Table structure for table `jos_vm_tax_rate`
--

CREATE TABLE IF NOT EXISTS `jos_vm_tax_rate` (
  `tax_rate_id` int(11) NOT NULL auto_increment,
  `vendor_id` int(11) default NULL,
  `tax_state` varchar(64) default NULL,
  `tax_country` varchar(64) default NULL,
  `mdate` int(11) default NULL,
  `tax_rate` decimal(10,5) default NULL,
  PRIMARY KEY  (`tax_rate_id`),
  KEY `idx_tax_rate_vendor_id` (`vendor_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COMMENT='The tax rates for your store' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `jos_vm_tax_rate`
--

INSERT INTO `jos_vm_tax_rate` (`tax_rate_id`, `vendor_id`, `tax_state`, `tax_country`, `mdate`, `tax_rate`) VALUES
(2, 1, 'CA', 'USA', 964565926, '0.09750');

-- --------------------------------------------------------

--
-- Table structure for table `jos_vm_userfield`
--

CREATE TABLE IF NOT EXISTS `jos_vm_userfield` (
  `fieldid` int(11) NOT NULL auto_increment,
  `name` varchar(50) NOT NULL default '',
  `title` varchar(255) NOT NULL,
  `description` mediumtext NOT NULL,
  `type` varchar(50) NOT NULL default '',
  `maxlength` int(11) default NULL,
  `size` int(11) default NULL,
  `required` tinyint(4) default '0',
  `ordering` int(11) default NULL,
  `cols` int(11) default NULL,
  `rows` int(11) default NULL,
  `value` varchar(50) default NULL,
  `default` int(11) default NULL,
  `published` tinyint(1) NOT NULL default '1',
  `registration` tinyint(1) NOT NULL default '0',
  `shipping` tinyint(1) NOT NULL default '0',
  `account` tinyint(1) NOT NULL default '1',
  `readonly` tinyint(1) NOT NULL default '0',
  `calculated` tinyint(1) NOT NULL default '0',
  `sys` tinyint(4) NOT NULL default '0',
  `vendor_id` int(11) default NULL,
  `params` mediumtext,
  PRIMARY KEY  (`fieldid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COMMENT='Holds the fields for the user information' AUTO_INCREMENT=36 ;

--
-- Dumping data for table `jos_vm_userfield`
--

INSERT INTO `jos_vm_userfield` (`fieldid`, `name`, `title`, `description`, `type`, `maxlength`, `size`, `required`, `ordering`, `cols`, `rows`, `value`, `default`, `published`, `registration`, `shipping`, `account`, `readonly`, `calculated`, `sys`, `vendor_id`, `params`) VALUES
(1, 'email', 'REGISTER_EMAIL', '', 'emailaddress', 100, 30, 1, 2, NULL, NULL, NULL, NULL, 1, 1, 0, 1, 0, 0, 1, 1, NULL),
(7, 'title', 'PHPSHOP_SHOPPER_FORM_TITLE', '', 'select', 0, 0, 0, 8, NULL, NULL, NULL, NULL, 1, 1, 0, 1, 0, 0, 1, 1, NULL),
(3, 'password', 'PHPSHOP_SHOPPER_FORM_PASSWORD_1', '', 'password', 25, 30, 1, 4, NULL, NULL, NULL, NULL, 1, 1, 0, 1, 0, 0, 1, 1, NULL),
(4, 'password2', 'PHPSHOP_SHOPPER_FORM_PASSWORD_2', '', 'password', 25, 30, 1, 5, NULL, NULL, NULL, NULL, 1, 1, 0, 1, 0, 0, 1, 1, NULL),
(6, 'company', 'PHPSHOP_SHOPPER_FORM_COMPANY_NAME', '', 'text', 64, 30, 0, 7, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 0, 1, 1, NULL),
(5, 'delimiter_billto', 'PHPSHOP_USER_FORM_BILLTO_LBL', '', 'delimiter', 25, 30, 0, 6, NULL, NULL, NULL, NULL, 1, 1, 0, 1, 0, 0, 0, 1, NULL),
(2, 'username', 'REGISTER_UNAME', '', 'text', 25, 30, 1, 3, NULL, NULL, NULL, NULL, 1, 1, 0, 1, 0, 0, 1, 1, ''),
(35, 'address_type_name', 'PHPSHOP_USER_FORM_ADDRESS_LABEL', '', 'text', 32, 30, 1, 6, NULL, NULL, NULL, NULL, 1, 0, 1, 0, 0, 0, 1, 1, NULL),
(8, 'first_name', 'PHPSHOP_SHOPPER_FORM_FIRST_NAME', '', 'text', 32, 30, 1, 9, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 0, 1, 1, NULL),
(9, 'last_name', 'PHPSHOP_SHOPPER_FORM_LAST_NAME', '', 'text', 32, 30, 1, 10, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 0, 1, 1, NULL),
(10, 'middle_name', 'PHPSHOP_SHOPPER_FORM_MIDDLE_NAME', '', 'text', 32, 30, 0, 11, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 0, 1, 1, NULL),
(11, 'address_1', 'PHPSHOP_SHOPPER_FORM_ADDRESS_1', '', 'text', 64, 30, 1, 12, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 0, 1, 1, NULL),
(12, 'address_2', 'PHPSHOP_SHOPPER_FORM_ADDRESS_2', '', 'text', 64, 30, 0, 13, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 0, 1, 1, NULL),
(13, 'city', 'PHPSHOP_SHOPPER_FORM_CITY', '', 'text', 32, 30, 1, 14, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 0, 1, 1, NULL),
(14, 'zip', 'PHPSHOP_SHOPPER_FORM_ZIP', '', 'text', 32, 30, 1, 15, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 0, 1, 1, NULL),
(15, 'country', 'PHPSHOP_SHOPPER_FORM_COUNTRY', '', 'select', 0, 0, 1, 16, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 0, 1, 1, NULL),
(16, 'state', 'PHPSHOP_SHOPPER_FORM_STATE', '', 'select', 0, 0, 1, 17, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 0, 1, 1, NULL),
(17, 'phone_1', 'PHPSHOP_SHOPPER_FORM_PHONE', '', 'text', 32, 30, 1, 18, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 0, 1, 1, NULL),
(18, 'phone_2', 'PHPSHOP_SHOPPER_FORM_PHONE2', '', 'text', 32, 30, 0, 19, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 0, 1, 1, NULL),
(19, 'fax', 'PHPSHOP_SHOPPER_FORM_FAX', '', 'text', 32, 30, 0, 20, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 0, 1, 1, NULL),
(20, 'delimiter_bankaccount', 'PHPSHOP_ACCOUNT_BANK_TITLE', '', 'delimiter', 25, 30, 0, 21, NULL, NULL, NULL, NULL, 1, 0, 0, 1, 0, 0, 0, 1, NULL),
(21, 'bank_account_holder', 'PHPSHOP_ACCOUNT_LBL_BANK_ACCOUNT_HOLDER', '', 'text', 48, 30, 0, 22, NULL, NULL, NULL, NULL, 1, 0, 0, 1, 0, 0, 1, 1, NULL),
(22, 'bank_account_nr', 'PHPSHOP_ACCOUNT_LBL_BANK_ACCOUNT_NR', '', 'text', 32, 30, 0, 23, NULL, NULL, NULL, NULL, 1, 0, 0, 1, 0, 0, 1, 1, NULL),
(23, 'bank_sort_code', 'PHPSHOP_ACCOUNT_LBL_BANK_SORT_CODE', '', 'text', 16, 30, 0, 24, NULL, NULL, NULL, NULL, 1, 0, 0, 1, 0, 0, 1, 1, NULL),
(24, 'bank_name', 'PHPSHOP_ACCOUNT_LBL_BANK_NAME', '', 'text', 32, 30, 0, 25, NULL, NULL, NULL, NULL, 1, 0, 0, 1, 0, 0, 1, 1, NULL),
(25, 'bank_account_type', 'PHPSHOP_ACCOUNT_LBL_ACCOUNT_TYPE', '', 'select', 0, 0, 0, 26, NULL, NULL, NULL, NULL, 1, 0, 0, 1, 1, 0, 1, 1, ''),
(26, 'bank_iban', 'PHPSHOP_ACCOUNT_LBL_BANK_IBAN', '', 'text', 64, 30, 0, 27, NULL, NULL, NULL, NULL, 1, 0, 0, 1, 0, 0, 1, 1, NULL),
(27, 'delimiter_sendregistration', 'BUTTON_SEND_REG', '', 'delimiter', 25, 30, 0, 28, NULL, NULL, NULL, NULL, 1, 1, 0, 0, 0, 0, 0, 1, NULL),
(28, 'agreed', 'PHPSHOP_I_AGREE_TO_TOS', '', 'checkbox', NULL, NULL, 1, 29, NULL, NULL, NULL, NULL, 1, 1, 0, 0, 0, 0, 1, 1, NULL),
(29, 'delimiter_userinfo', 'PHPSHOP_ORDER_PRINT_CUST_INFO_LBL', '', 'delimiter', NULL, NULL, 0, 1, NULL, NULL, NULL, NULL, 1, 1, 0, 1, 0, 0, 0, 1, NULL),
(30, 'extra_field_1', 'PHPSHOP_SHOPPER_FORM_EXTRA_FIELD_1', '', 'text', 255, 30, 0, 31, NULL, NULL, NULL, NULL, 0, 1, 0, 1, 0, 0, 0, 1, NULL),
(31, 'extra_field_2', 'PHPSHOP_SHOPPER_FORM_EXTRA_FIELD_2', '', 'text', 255, 30, 0, 32, NULL, NULL, NULL, NULL, 0, 1, 0, 1, 0, 0, 0, 1, NULL),
(32, 'extra_field_3', 'PHPSHOP_SHOPPER_FORM_EXTRA_FIELD_3', '', 'text', 255, 30, 0, 33, NULL, NULL, NULL, NULL, 0, 1, 0, 1, 0, 0, 0, 1, NULL),
(33, 'extra_field_4', 'PHPSHOP_SHOPPER_FORM_EXTRA_FIELD_4', '', 'select', 1, 1, 0, 34, NULL, NULL, NULL, NULL, 0, 1, 0, 1, 0, 0, 0, 1, NULL),
(34, 'extra_field_5', 'PHPSHOP_SHOPPER_FORM_EXTRA_FIELD_5', '', 'select', 1, 1, 0, 35, NULL, NULL, NULL, NULL, 0, 1, 0, 1, 0, 0, 0, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jos_vm_userfield_values`
--

CREATE TABLE IF NOT EXISTS `jos_vm_userfield_values` (
  `fieldvalueid` int(11) NOT NULL auto_increment,
  `fieldid` int(11) NOT NULL default '0',
  `fieldtitle` varchar(255) NOT NULL default '',
  `fieldvalue` varchar(255) NOT NULL,
  `ordering` int(11) NOT NULL default '0',
  `sys` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`fieldvalueid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COMMENT='Holds the different values for dropdown and radio lists' AUTO_INCREMENT=4 ;

--
-- Dumping data for table `jos_vm_userfield_values`
--

INSERT INTO `jos_vm_userfield_values` (`fieldvalueid`, `fieldid`, `fieldtitle`, `fieldvalue`, `ordering`, `sys`) VALUES
(1, 25, 'PHPSHOP_ACCOUNT_LBL_ACCOUNT_TYPE_BUSINESSCHECKING', 'Checking', 1, 1),
(2, 25, 'PHPSHOP_ACCOUNT_LBL_ACCOUNT_TYPE_CHECKING', 'Business Checking', 2, 1),
(3, 25, 'PHPSHOP_ACCOUNT_LBL_ACCOUNT_TYPE_SAVINGS', 'Savings', 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `jos_vm_user_info`
--

CREATE TABLE IF NOT EXISTS `jos_vm_user_info` (
  `user_info_id` varchar(32) NOT NULL default '',
  `user_id` int(11) NOT NULL default '0',
  `address_type` char(2) default NULL,
  `address_type_name` varchar(32) default NULL,
  `company` varchar(64) default NULL,
  `title` varchar(32) default NULL,
  `last_name` varchar(32) default NULL,
  `first_name` varchar(32) default NULL,
  `middle_name` varchar(32) default NULL,
  `phone_1` varchar(32) default NULL,
  `phone_2` varchar(32) default NULL,
  `fax` varchar(32) default NULL,
  `address_1` varchar(64) NOT NULL default '',
  `address_2` varchar(64) default NULL,
  `city` varchar(32) NOT NULL default '',
  `state` varchar(32) NOT NULL default '',
  `country` varchar(32) NOT NULL default 'US',
  `zip` varchar(32) NOT NULL default '',
  `user_email` varchar(255) default NULL,
  `extra_field_1` varchar(255) default NULL,
  `extra_field_2` varchar(255) default NULL,
  `extra_field_3` varchar(255) default NULL,
  `extra_field_4` char(1) default NULL,
  `extra_field_5` char(1) default NULL,
  `cdate` int(11) default NULL,
  `mdate` int(11) default NULL,
  `perms` varchar(40) NOT NULL default 'shopper',
  `bank_account_nr` varchar(32) NOT NULL default '',
  `bank_name` varchar(32) NOT NULL default '',
  `bank_sort_code` varchar(16) NOT NULL default '',
  `bank_iban` varchar(64) NOT NULL default '',
  `bank_account_holder` varchar(48) NOT NULL default '',
  `bank_account_type` enum('Checking','Business Checking','Savings') NOT NULL default 'Checking',
  PRIMARY KEY  (`user_info_id`),
  KEY `idx_user_info_user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Customer Information, BT = BillTo and ST = ShipTo';

--
-- Dumping data for table `jos_vm_user_info`
--

INSERT INTO `jos_vm_user_info` (`user_info_id`, `user_id`, `address_type`, `address_type_name`, `company`, `title`, `last_name`, `first_name`, `middle_name`, `phone_1`, `phone_2`, `fax`, `address_1`, `address_2`, `city`, `state`, `country`, `zip`, `user_email`, `extra_field_1`, `extra_field_2`, `extra_field_3`, `extra_field_4`, `extra_field_5`, `cdate`, `mdate`, `perms`, `bank_account_nr`, `bank_name`, `bank_sort_code`, `bank_iban`, `bank_account_holder`, `bank_account_type`) VALUES
('ea43bc6e616f416747f72ead73954efe', 62, 'BT', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '', '', 'US', '', 'admin@admin.com', NULL, NULL, NULL, NULL, NULL, 1314171160, 1315187010, 'shopper', '', '', '', '', '', 'Checking'),
('71ba235abc035946ae2171f7e5269ef0', 63, 'BT', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '', '', 'US', '', 'budi.perkasa10@gmail.com', NULL, NULL, NULL, NULL, NULL, 1315187163, 1315425759, 'shopper', '', '', '', '', '', 'Checking');

-- --------------------------------------------------------

--
-- Table structure for table `jos_vm_vendor`
--

CREATE TABLE IF NOT EXISTS `jos_vm_vendor` (
  `vendor_id` int(11) NOT NULL auto_increment,
  `vendor_name` varchar(64) default NULL,
  `contact_last_name` varchar(32) NOT NULL default '',
  `contact_first_name` varchar(32) NOT NULL default '',
  `contact_middle_name` varchar(32) default NULL,
  `contact_title` varchar(32) default NULL,
  `contact_phone_1` varchar(32) NOT NULL default '',
  `contact_phone_2` varchar(32) default NULL,
  `contact_fax` varchar(32) default NULL,
  `contact_email` varchar(255) default NULL,
  `vendor_phone` varchar(32) default NULL,
  `vendor_address_1` varchar(64) NOT NULL default '',
  `vendor_address_2` varchar(64) default NULL,
  `vendor_city` varchar(32) NOT NULL default '',
  `vendor_state` varchar(32) NOT NULL default '',
  `vendor_country` varchar(32) NOT NULL default 'US',
  `vendor_zip` varchar(32) NOT NULL default '',
  `vendor_store_name` varchar(128) NOT NULL default '',
  `vendor_store_desc` text,
  `vendor_category_id` int(11) default NULL,
  `vendor_thumb_image` varchar(255) default NULL,
  `vendor_full_image` varchar(255) default NULL,
  `vendor_currency` varchar(16) default NULL,
  `cdate` int(11) default NULL,
  `mdate` int(11) default NULL,
  `vendor_image_path` varchar(255) default NULL,
  `vendor_terms_of_service` text NOT NULL,
  `vendor_url` varchar(255) NOT NULL default '',
  `vendor_min_pov` decimal(10,2) default NULL,
  `vendor_freeshipping` decimal(10,2) NOT NULL default '0.00',
  `vendor_currency_display_style` varchar(64) NOT NULL default '',
  `vendor_accepted_currencies` text NOT NULL,
  `vendor_address_format` text NOT NULL,
  `vendor_date_format` varchar(255) NOT NULL,
  PRIMARY KEY  (`vendor_id`),
  KEY `idx_vendor_name` (`vendor_name`),
  KEY `idx_vendor_category_id` (`vendor_category_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COMMENT='Vendors manage their products in your store' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `jos_vm_vendor`
--

INSERT INTO `jos_vm_vendor` (`vendor_id`, `vendor_name`, `contact_last_name`, `contact_first_name`, `contact_middle_name`, `contact_title`, `contact_phone_1`, `contact_phone_2`, `contact_fax`, `contact_email`, `vendor_phone`, `vendor_address_1`, `vendor_address_2`, `vendor_city`, `vendor_state`, `vendor_country`, `vendor_zip`, `vendor_store_name`, `vendor_store_desc`, `vendor_category_id`, `vendor_thumb_image`, `vendor_full_image`, `vendor_currency`, `cdate`, `mdate`, `vendor_image_path`, `vendor_terms_of_service`, `vendor_url`, `vendor_min_pov`, `vendor_freeshipping`, `vendor_currency_display_style`, `vendor_accepted_currencies`, `vendor_address_format`, `vendor_date_format`) VALUES
(1, 'Al-Ikhlas', '', 'Damanhurri', '', 'Mr.', '(021) 8762579', '555-555-1212', '', 'alikhlas.citrautama@gmail.com', '555-555-1212', 'YAYASAN AL-IKHLAS CITRA UTAMA Jl. Raya GUnung Putri Selatan No 2', '', 'Bogor', ' - ', 'IDN', '92630', 'Divisi Usaha', '<p>We have the best tools for do-it-yourselfers. Check us out!</p>\r\n<p>We were established in 1969 in a time when getting good tools was expensive, but the quality was good. Now that only a select few of those authentic tools survive, we have dedicated this store to bringing the experience alive for collectors and master mechanics everywhere.</p>\r\n<p>You can easily find products selecting the category you would like to browse above.</p>', 0, '', 'Al_Ikhlas_4e6afbaf5e2c3.jpg', 'IDR', 950302468, 1315634144, '', '<h5>You haven\\''t configured any terms of service yet. Click <a href=\\"administrator/index2.php?page=store.store_form&amp;option=com_virtuemart\\">here</a> to change this text.</h5>', 'http://alikhlascitrautama.com', '0.00', '0.00', '1|Rp|2|,|.|2|1', 'IDR', '{storename}\r\n{address_1}\r\n{address_2}\r\n{city}, {zip}', '%A, %d %B %Y %H:%M');

-- --------------------------------------------------------

--
-- Table structure for table `jos_vm_vendor_category`
--

CREATE TABLE IF NOT EXISTS `jos_vm_vendor_category` (
  `vendor_category_id` int(11) NOT NULL auto_increment,
  `vendor_category_name` varchar(64) default NULL,
  `vendor_category_desc` text,
  PRIMARY KEY  (`vendor_category_id`),
  KEY `idx_vendor_category_category_name` (`vendor_category_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COMMENT='The categories that vendors are assigned to' AUTO_INCREMENT=7 ;

--
-- Dumping data for table `jos_vm_vendor_category`
--

INSERT INTO `jos_vm_vendor_category` (`vendor_category_id`, `vendor_category_name`, `vendor_category_desc`) VALUES
(6, '-default-', 'Default');

-- --------------------------------------------------------

--
-- Table structure for table `jos_vm_waiting_list`
--

CREATE TABLE IF NOT EXISTS `jos_vm_waiting_list` (
  `waiting_list_id` int(11) NOT NULL auto_increment,
  `product_id` int(11) NOT NULL default '0',
  `user_id` int(11) NOT NULL default '0',
  `notify_email` varchar(150) NOT NULL default '',
  `notified` enum('0','1') default '0',
  `notify_date` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`waiting_list_id`),
  KEY `product_id` (`product_id`),
  KEY `notify_email` (`notify_email`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Stores notifications, users waiting f. products out of stock' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `jos_vm_zone_shipping`
--

CREATE TABLE IF NOT EXISTS `jos_vm_zone_shipping` (
  `zone_id` int(11) NOT NULL auto_increment,
  `zone_name` varchar(255) default NULL,
  `zone_cost` decimal(10,2) default NULL,
  `zone_limit` decimal(10,2) default NULL,
  `zone_description` text NOT NULL,
  `zone_tax_rate` int(11) NOT NULL default '0',
  PRIMARY KEY  (`zone_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COMMENT='The Zones managed by the Zone Shipping Module' AUTO_INCREMENT=5 ;

--
-- Dumping data for table `jos_vm_zone_shipping`
--

INSERT INTO `jos_vm_zone_shipping` (`zone_id`, `zone_name`, `zone_cost`, `zone_limit`, `zone_description`, `zone_tax_rate`) VALUES
(1, 'Default', '6.00', '35.00', 'This is the default Shipping Zone. This is the zone information that all countries will use until you assign each individual country to a Zone.', 2),
(2, 'Zone 1', '1000.00', '10000.00', 'This is a zone example', 2),
(3, 'Zone 2', '2.00', '22.00', 'This is the second zone. You can use this for notes about this zone', 2),
(4, 'Zone 3', '11.00', '64.00', 'Another usefull thing might be details about this zone or special instructions.', 2);

-- --------------------------------------------------------

--
-- Table structure for table `jos_weblinks`
--

CREATE TABLE IF NOT EXISTS `jos_weblinks` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `catid` int(11) NOT NULL default '0',
  `sid` int(11) NOT NULL default '0',
  `title` text NOT NULL,
  `alias` varchar(255) NOT NULL default '',
  `url` varchar(250) NOT NULL default '',
  `description` text NOT NULL,
  `date` datetime NOT NULL default '0000-00-00 00:00:00',
  `hits` int(11) NOT NULL default '0',
  `published` tinyint(1) NOT NULL default '0',
  `checked_out` int(11) NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL default '0',
  `archived` tinyint(1) NOT NULL default '0',
  `approved` tinyint(1) NOT NULL default '1',
  `params` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `catid` (`catid`,`published`,`archived`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `jos_weblinks`
--

INSERT INTO `jos_weblinks` (`id`, `catid`, `sid`, `title`, `alias`, `url`, `description`, `date`, `hits`, `published`, `checked_out`, `checked_out_time`, `ordering`, `archived`, `approved`, `params`) VALUES
(1, 2, 0, 'Joomla!', 'joomla', 'http://www.joomla.org', 'Home of Joomla!', '2005-02-14 15:19:02', 3, 1, 0, '0000-00-00 00:00:00', 1, 0, 1, 'target=0'),
(2, 2, 0, 'php.net', 'php', 'http://www.php.net', 'The language that Joomla! is developed in', '2004-07-07 11:33:24', 6, 1, 0, '0000-00-00 00:00:00', 3, 0, 1, ''),
(3, 2, 0, 'MySQL', 'mysql', 'http://www.mysql.com', 'The database that Joomla! uses', '2004-07-07 10:18:31', 1, 1, 0, '0000-00-00 00:00:00', 5, 0, 1, ''),
(4, 2, 0, 'OpenSourceMatters', 'opensourcematters', 'http://www.opensourcematters.org', 'Home of OSM', '2005-02-14 15:19:02', 11, 1, 0, '0000-00-00 00:00:00', 2, 0, 1, 'target=0'),
(5, 2, 0, 'Joomla! - Forums', 'joomla-forums', 'http://forum.joomla.org', 'Joomla! Forums', '2005-02-14 15:19:02', 4, 1, 0, '0000-00-00 00:00:00', 4, 0, 1, 'target=0'),
(6, 2, 0, 'Ohloh Tracking of Joomla!', 'ohloh-tracking-of-joomla', 'http://www.ohloh.net/projects/20', 'Objective reports from Ohloh about Joomla''s development activity. Joomla! has some star developers with serious kudos.', '2007-07-19 09:28:31', 1, 1, 0, '0000-00-00 00:00:00', 6, 0, 1, 'target=0\n\n');

-- --------------------------------------------------------

--
-- Table structure for table `jos_wf_profiles`
--

CREATE TABLE IF NOT EXISTS `jos_wf_profiles` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `users` text NOT NULL,
  `types` varchar(255) NOT NULL,
  `components` text NOT NULL,
  `area` tinyint(3) NOT NULL,
  `rows` text NOT NULL,
  `plugins` text NOT NULL,
  `published` tinyint(3) NOT NULL,
  `ordering` int(11) NOT NULL,
  `checked_out` tinyint(3) NOT NULL,
  `checked_out_time` datetime NOT NULL,
  `params` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `jos_wf_profiles`
--

INSERT INTO `jos_wf_profiles` (`id`, `name`, `description`, `users`, `types`, `components`, `area`, `rows`, `plugins`, `published`, `ordering`, `checked_out`, `checked_out_time`, `params`) VALUES
(1, 'Default', 'Default Profile for all users', '', '19,20,21,23,24,25', '', 0, 'help,newdocument,undo,redo,spacer,bold,italic,underline,strikethrough,justifyfull,justifycenter,justifyleft,justifyright,spacer,blockquote,formatselect,styleselect,removeformat,cleanup;fontselect,fontsizeselect,forecolor,backcolor,spacer,paste,indent,outdent,numlist,bullist,sub,sup,textcase,charmap,hr;directionality,fullscreen,preview,source,print,searchreplace,spacer,table;visualaid,visualchars,nonbreaking,style,xhtmlxtras,anchor,unlink,link,imgmanager,spellchecker,article', 'contextmenu,browser,inlinepopups,media,help,paste,searchreplace,directionality,fullscreen,preview,source,table,textcase,print,style,nonbreaking,visualchars,xhtmlxtras,imgmanager,link,spellchecker,article', 1, 1, 0, '0000-00-00 00:00:00', ''),
(2, 'Front End', 'Sample Front-end Profile', '', '19,20,21', '', 1, 'help,newdocument,undo,redo,spacer,bold,italic,underline,strikethrough,justifyfull,justifycenter,justifyleft,justifyright,spacer,formatselect,styleselect;paste,searchreplace,indent,outdent,numlist,bullist,cleanup,charmap,removeformat,hr,sub,sup,textcase,nonbreaking,visualchars;fullscreen,preview,print,visualaid,style,xhtmlxtras,anchor,unlink,link,imgmanager,spellchecker,article', 'contextmenu,inlinepopups,help,paste,searchreplace,fullscreen,preview,print,style,textcase,nonbreaking,visualchars,xhtmlxtras,imgmanager,link,spellchecker,article', 0, 2, 0, '0000-00-00 00:00:00', '');

-- --------------------------------------------------------

--
-- Table structure for table `jos_zoo_application`
--

CREATE TABLE IF NOT EXISTS `jos_zoo_application` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `application_group` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `params` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `jos_zoo_application`
--

INSERT INTO `jos_zoo_application` (`id`, `name`, `application_group`, `description`, `params`) VALUES
(11, 'Frontpage', 'blog', '', '{"group":"blog","template":"sans","global.config.items_per_page":"15","global.config.item_order":"rdate","global.config.show_feed_link":"1","global.config.feed_title":"","global.config.alternate_feed_link":"","global.template.show_title":"1","global.template.show_description":"1","global.template.show_image":"1","global.template.alignment":"left","global.template.items_cols":"1","global.template.items_order":"0","global.template.teaseritem_media_alignment":"above","global.template.item_media_alignment":"above","global.comments.enable_comments":"0","global.comments.require_name_and_mail":"1","global.comments.registered_users_only":"1","global.comments.approved":"0","global.comments.time_between_user_posts":"120","global.comments.avatar":"1","global.comments.order":"ASC","global.comments.max_depth":"5","global.comments.facebook_enable":"0","global.comments.facebook_api_key":"","global.comments.facebook_api_secret":"","global.comments.twitter_enable":"0","global.comments.twitter_consumer_key":"","global.comments.twitter_consumer_secret":"","global.comments.akismet_enable":"0","global.comments.akismet_api_key":"","global.comments.mollom_enable":"0","global.comments.mollom_public_key":"","global.comments.mollom_private_key":"","global.comments.blacklist":""}');

-- --------------------------------------------------------

--
-- Table structure for table `jos_zoo_category`
--

CREATE TABLE IF NOT EXISTS `jos_zoo_category` (
  `id` int(11) NOT NULL auto_increment,
  `application_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `parent` int(11) NOT NULL,
  `ordering` int(11) NOT NULL,
  `published` tinyint(1) NOT NULL,
  `params` text NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `ALIAS_INDEX` (`alias`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=175 ;

-- --------------------------------------------------------

--
-- Table structure for table `jos_zoo_category_item`
--

CREATE TABLE IF NOT EXISTS `jos_zoo_category_item` (
  `category_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  PRIMARY KEY  (`category_id`,`item_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_zoo_category_item`
--

INSERT INTO `jos_zoo_category_item` (`category_id`, `item_id`) VALUES
(0, 233),
(0, 234),
(0, 235);

-- --------------------------------------------------------

--
-- Table structure for table `jos_zoo_comment`
--

CREATE TABLE IF NOT EXISTS `jos_zoo_comment` (
  `id` int(11) NOT NULL auto_increment,
  `parent_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `user_type` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `ip` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `content` text NOT NULL,
  `state` tinyint(4) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

-- --------------------------------------------------------

--
-- Table structure for table `jos_zoo_item`
--

CREATE TABLE IF NOT EXISTS `jos_zoo_item` (
  `id` int(11) NOT NULL auto_increment,
  `application_id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `modified_by` int(11) NOT NULL,
  `publish_up` datetime NOT NULL,
  `publish_down` datetime NOT NULL,
  `priority` int(11) NOT NULL,
  `hits` int(11) NOT NULL,
  `state` tinyint(3) NOT NULL,
  `access` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_by_alias` varchar(255) NOT NULL,
  `searchable` int(11) NOT NULL,
  `elements` text NOT NULL,
  `params` text NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `ALIAS_INDEX` (`alias`),
  KEY `PUBLISH_INDEX` (`publish_up`,`publish_down`),
  KEY `STATE_INDEX` (`state`),
  KEY `ACCESS_INDEX` (`access`),
  KEY `CREATED_BY_INDEX` (`created_by`),
  KEY `NAME_INDEX` (`name`),
  FULLTEXT KEY `SEARCH_FULLTEXT` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=236 ;

--
-- Dumping data for table `jos_zoo_item`
--

INSERT INTO `jos_zoo_item` (`id`, `application_id`, `type`, `name`, `alias`, `created`, `modified`, `modified_by`, `publish_up`, `publish_down`, `priority`, `hits`, `state`, `access`, `created_by`, `created_by_alias`, `searchable`, `elements`, `params`) VALUES
(233, 11, 'article', 'New ZOO template released', 'new-zoo-template-released', '2010-07-20 13:20:49', '2010-07-22 15:30:01', 62, '2010-07-20 13:20:49', '0000-00-00 00:00:00', 0, 3, 0, 0, 62, '', 1, '<?xml version="1.0" encoding="utf-8"?>\n<elements><relateditems identifier="fc5a6788-ffae-41d9-a812-3530331fef64"/><text identifier="08795744-c2dc-4a68-8252-4e21c4c4c774">\n  <value><![CDATA[We released our new "Sans" template for the blog app]]></value>\n</text><textarea identifier="2e3c9e69-1f9e-4647-8d13-4e88094d2790">\n  <value><![CDATA[Today we released the next ZOO version 2.0.3. In addition to the bugfixes we updated our blog app and put an additional template in this app. With this new template you can easily change the style of your blog, without changing any of the css styles. Update your ZOO now, to get the new template.]]></value>\n</textarea><textarea identifier="2e3c9e69-1f9e-4647-8d13-4e88094d2790">\n  <value><![CDATA[For the usage of the blog app in our new template Neo, we created a new page class suffix "custom-noborder". It turns off the wrapping box of the template, so the articles of the blog app which are also displayed in separate boxes don´t disturb the layout of your site.\n\n<p><a href="http://zoo.yootheme.com" target="_blank">Download ZOO and the new template today</a>.</p>]]></value>\n</textarea><image identifier="cdce6654-4e01-4a7f-9ed6-0407709d904c">\n  <file><![CDATA[images/stories/demo/frontpage/news03.jpg]]></file>\n  <width><![CDATA[508]]></width>\n  <height><![CDATA[167]]></height>\n</image><image identifier="c26feca6-b2d4-47eb-a74d-b067aaae5b90">\n  <file><![CDATA[images/stories/demo/frontpage/news03.jpg]]></file>\n  <link/>\n  <target/>\n  <rel/>\n  <width><![CDATA[508]]></width>\n  <height><![CDATA[167]]></height>\n</image><video identifier="ff1ed5b5-4365-457e-98bb-026366028bd7">\n  <file/>\n  <url/>\n  <format/>\n  <width/>\n  <height/>\n  <autoplay/>\n</video><socialbookmarks identifier="6af341e4-f0e9-4605-b2a5-60d7a3525a96">\n  <value><![CDATA[1]]></value>\n</socialbookmarks><relateditems identifier="65b7851d-199f-4ac6-95a7-409ad1bca488"/><link identifier="fdcbebaa-e61a-462d-963e-aff74ff95499">\n  <text><![CDATA[ZOO website]]></text>\n  <value><![CDATA[http://zoo.yootheme.com]]></value>\n  <target><![CDATA[1]]></target>\n  <rel/>\n</link><link identifier="fdcbebaa-e61a-462d-963e-aff74ff95499">\n  <text><![CDATA[ZOO download page]]></text>\n  <value><![CDATA[http://www.yootheme.com/member-area/downloads/category/zoo-20]]></value>\n  <target/>\n  <rel/>\n</link>\n</elements>', '{"config.enable_comments":"1","metadata.description":"","metadata.keywords":"","metadata.robots":"","metadata.author":""}'),
(234, 11, 'article', 'YOOicons launched', 'yooicons-launched', '2010-07-20 14:47:27', '2010-07-22 15:29:54', 62, '2010-07-20 13:20:49', '0000-00-00 00:00:00', 0, 6, 0, 0, 62, '', 1, '<?xml version="1.0" encoding="utf-8"?>\n<elements><relateditems identifier="fc5a6788-ffae-41d9-a812-3530331fef64"/><text identifier="08795744-c2dc-4a68-8252-4e21c4c4c774">\n  <value><![CDATA[Beautiful and handcrafted icon sets for web projects]]></value>\n</text><textarea identifier="2e3c9e69-1f9e-4647-8d13-4e88094d2790">\n  <value><![CDATA[You may already use one of our templates but what about your content? Wouldn''t it be great to have some real eye-catching icons to beautify the content of your website? Icons are an essential content element for web design. Today almost every major website uses icons to highlight important parts in their content.]]></value>\n</textarea><textarea identifier="2e3c9e69-1f9e-4647-8d13-4e88094d2790">\n  <value><![CDATA[This is why we came up with the idea of creating handcrafted icon sets for web and print projects. Today we are proud to open our brand new YOOtheme icon club! With the icon club we will offer commercial icon sets. But we will also have some freebie icon sets in the future.\n\n\n<p><a href="http://icons.yootheme.com/icon-club" target="_blank">Join our new icon club today</a>.</p>]]></value>\n</textarea><image identifier="cdce6654-4e01-4a7f-9ed6-0407709d904c">\n  <file><![CDATA[images/stories/demo/frontpage/news02.jpg]]></file>\n  <width><![CDATA[508]]></width>\n  <height><![CDATA[167]]></height>\n</image><image identifier="c26feca6-b2d4-47eb-a74d-b067aaae5b90">\n  <file><![CDATA[images/stories/demo/frontpage/news02.jpg]]></file>\n  <link/>\n  <target/>\n  <rel/>\n  <width><![CDATA[508]]></width>\n  <height><![CDATA[167]]></height>\n</image><video identifier="ff1ed5b5-4365-457e-98bb-026366028bd7">\n  <file/>\n  <url/>\n  <format/>\n  <width/>\n  <height/>\n  <autoplay/>\n</video><socialbookmarks identifier="6af341e4-f0e9-4605-b2a5-60d7a3525a96">\n  <value><![CDATA[1]]></value>\n</socialbookmarks><relateditems identifier="65b7851d-199f-4ac6-95a7-409ad1bca488"/><link identifier="fdcbebaa-e61a-462d-963e-aff74ff95499">\n  <text><![CDATA[YOOicons website]]></text>\n  <value><![CDATA[http://icons.yootheme.com]]></value>\n  <target><![CDATA[1]]></target>\n  <rel/>\n</link><link identifier="fdcbebaa-e61a-462d-963e-aff74ff95499">\n  <text><![CDATA[Blog post: YOOicons launched]]></text>\n  <value/>\n  <target/>\n  <rel><![CDATA[https://www.yootheme.com/blog/item/root/yooicons-launched]]></rel>\n</link><link identifier="fdcbebaa-e61a-462d-963e-aff74ff95499">\n  <text><![CDATA[Free Social Icons Set]]></text>\n  <value><![CDATA[https://www.yootheme.com/blog/item/root/free-social-icons-set]]></value>\n  <target/>\n  <rel/>\n</link>\n</elements>', '{"config.enable_comments":"1","metadata.description":"","metadata.keywords":"","metadata.robots":"","metadata.author":""}'),
(235, 11, 'article', 'Neo Template', 'neo-template', '2010-07-20 14:47:29', '2010-07-22 15:29:48', 62, '2010-07-20 13:20:49', '0000-00-00 00:00:00', 0, 20, 0, 0, 62, '', 1, '<?xml version="1.0" encoding="utf-8"?>\n<elements><relateditems identifier="fc5a6788-ffae-41d9-a812-3530331fef64"/><text identifier="08795744-c2dc-4a68-8252-4e21c4c4c774">\n  <value><![CDATA[Today we released our new August 2010 template]]></value>\n</text><textarea identifier="2e3c9e69-1f9e-4647-8d13-4e88094d2790">\n  <value><![CDATA[Enjoy Neo, the latest YOOtheme template. Neo comes with three basic themes, each of them has different color variations to choose from. They contain a plain variation, a gradient variation and a retro variation. This makes it suitable for all kinds of websites, from stylish individual blogs or portfolio websites to impressive business sites.]]></value>\n</textarea><textarea identifier="2e3c9e69-1f9e-4647-8d13-4e88094d2790">\n  <value><![CDATA[Again we implemented some new features in this template. We put in a broad range of module variation, for example the brand new transparent glass style. Articles in the blog layout are shown in wrapping boxes and we put an additional list-style, called "hoverbox" in the template.\n\n<p>Get Neo and <a href="http://www.yootheme.com/signup" target="_blank">join the YOOtheme club today</a>.</p>]]></value>\n</textarea><image identifier="cdce6654-4e01-4a7f-9ed6-0407709d904c">\n  <file><![CDATA[images/stories/demo/frontpage/news01.jpg]]></file>\n  <width><![CDATA[508]]></width>\n  <height><![CDATA[167]]></height>\n</image><image identifier="c26feca6-b2d4-47eb-a74d-b067aaae5b90">\n  <file><![CDATA[images/stories/demo/frontpage/news01.jpg]]></file>\n  <link/>\n  <target/>\n  <rel/>\n  <width><![CDATA[508]]></width>\n  <height><![CDATA[167]]></height>\n</image><video identifier="ff1ed5b5-4365-457e-98bb-026366028bd7">\n  <file/>\n  <url/>\n  <format/>\n  <width/>\n  <height/>\n  <autoplay/>\n</video><socialbookmarks identifier="6af341e4-f0e9-4605-b2a5-60d7a3525a96">\n  <value><![CDATA[1]]></value>\n</socialbookmarks><relateditems identifier="65b7851d-199f-4ac6-95a7-409ad1bca488"/><link identifier="fdcbebaa-e61a-462d-963e-aff74ff95499">\n  <text><![CDATA[YOOtheme website]]></text>\n  <value><![CDATA[http://www.yootheme.com]]></value>\n  <target><![CDATA[1]]></target>\n  <rel/>\n</link><link identifier="fdcbebaa-e61a-462d-963e-aff74ff95499">\n  <text><![CDATA[Blog post: Neo template]]></text>\n  <value><![CDATA[https://www.yootheme.com/blog/item/root/neo-template]]></value>\n  <target/>\n  <rel/>\n</link>\n</elements>', '{"config.enable_comments":"1","metadata.description":"","metadata.keywords":"","metadata.robots":"","metadata.author":""}');

-- --------------------------------------------------------

--
-- Table structure for table `jos_zoo_rating`
--

CREATE TABLE IF NOT EXISTS `jos_zoo_rating` (
  `id` int(11) NOT NULL auto_increment,
  `item_id` int(11) default NULL,
  `element_id` varchar(255) default NULL,
  `user_id` int(11) default NULL,
  `value` tinyint(4) default NULL,
  `ip` varchar(255) default NULL,
  `created` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- Table structure for table `jos_zoo_search_index`
--

CREATE TABLE IF NOT EXISTS `jos_zoo_search_index` (
  `item_id` int(11) NOT NULL,
  `element_id` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY  (`item_id`,`element_id`),
  FULLTEXT KEY `SEARCH_FULLTEXT` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_zoo_search_index`
--

INSERT INTO `jos_zoo_search_index` (`item_id`, `element_id`, `value`) VALUES
(233, '2e3c9e69-1f9e-4647-8d13-4e88094d2790', 'Today we released the next ZOO version 2.0.3. In addition to the bugfixes we updated our blog app and put an additional template in this app. With this new template you can easily change the style of your blog, without changing any of the css styles. Update your ZOO now, to get the new template.\nFor the usage of the blog app in our new template Neo, we created a new page class suffix "custom-noborder". It turns off the wrapping box of the template, so the articles of the blog app which are also displayed in separate boxes don´t disturb the layout of your site.\n\nDownload ZOO and the new template today.'),
(233, '08795744-c2dc-4a68-8252-4e21c4c4c774', 'We released our new "Sans" template for the blog app'),
(234, '08795744-c2dc-4a68-8252-4e21c4c4c774', 'Beautiful and handcrafted icon sets for web projects'),
(234, '2e3c9e69-1f9e-4647-8d13-4e88094d2790', 'You may already use one of our templates but what about your content? Wouldn''t it be great to have some real eye-catching icons to beautify the content of your website? Icons are an essential content element for web design. Today almost every major website uses icons to highlight important parts in their content.\nThis is why we came up with the idea of creating handcrafted icon sets for web and print projects. Today we are proud to open our brand new YOOtheme icon club! With the icon club we will offer commercial icon sets. But we will also have some freebie icon sets in the future.\n\n\nJoin our new icon club today.'),
(235, '08795744-c2dc-4a68-8252-4e21c4c4c774', 'Today we released our new August 2010 template'),
(235, '2e3c9e69-1f9e-4647-8d13-4e88094d2790', 'Enjoy Neo, the latest YOOtheme template. Neo comes with three basic themes, each of them has different color variations to choose from. They contain a plain variation, a gradient variation and a retro variation. This makes it suitable for all kinds of websites, from stylish individual blogs or portfolio websites to impressive business sites.\nAgain we implemented some new features in this template. We put in a broad range of module variation, for example the brand new transparent glass style. Articles in the blog layout are shown in wrapping boxes and we put an additional list-style, called "hoverbox" in the template.\n\nGet Neo and join the YOOtheme club today.'),
(234, 'fdcbebaa-e61a-462d-963e-aff74ff95499', '\n\n'),
(233, 'fdcbebaa-e61a-462d-963e-aff74ff95499', '\n'),
(235, 'fdcbebaa-e61a-462d-963e-aff74ff95499', '\n');

-- --------------------------------------------------------

--
-- Table structure for table `jos_zoo_tag`
--

CREATE TABLE IF NOT EXISTS `jos_zoo_tag` (
  `item_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY  (`item_id`,`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_zoo_tag`
--

INSERT INTO `jos_zoo_tag` (`item_id`, `name`) VALUES
(1, 'iPhone'),
(1, 'Wallpaper'),
(2, 'Free'),
(2, 'Icons'),
(3, 'Movies'),
(3, 'Wallpaper'),
(5, 'HDR'),
(5, 'Photography'),
(6, 'CMS'),
(6, 'Drupal'),
(6, 'Joomla'),
(6, 'Open Source'),
(6, 'Wordpress'),
(7, 'Wallpaper'),
(8, 'Retro'),
(8, 'Showcase'),
(9, 'Blockbuster'),
(9, 'Overlength'),
(9, 'Peter Jackson'),
(9, 'Won Oscar'),
(11, 'Blockbuster'),
(11, 'Overlength'),
(11, 'Peter Jackson'),
(11, 'Won Oscar'),
(12, 'Blockbuster'),
(12, 'Overlength'),
(12, 'Peter Jackson'),
(12, 'Won Oscar'),
(13, 'Love Story'),
(15, 'Restricted'),
(16, 'Blockbuster'),
(16, 'Overlength'),
(16, 'Won Oscar'),
(18, 'Won Oscar'),
(19, 'Pixar'),
(19, 'Suitable for children'),
(19, 'Won Oscar'),
(20, 'Blockbuster'),
(20, 'Overlength'),
(20, 'Peter Jackson'),
(20, 'Won Oscar'),
(22, 'Johnny Depp'),
(23, 'Pixar'),
(23, 'Suitable for children'),
(23, 'Won Oscar'),
(25, 'Won Oscar'),
(28, 'Blockbuster'),
(28, 'Won Oscar'),
(29, 'Pixar'),
(29, 'Suitable for children'),
(29, 'Won Oscar'),
(30, 'Love Story'),
(31, 'Blockbuster'),
(32, 'Blockbuster'),
(33, 'Johnny Depp'),
(34, 'Restricted'),
(35, 'Restricted'),
(37, 'Suitable for children'),
(39, 'Restricted'),
(40, 'Restricted'),
(43, 'Blockbuster'),
(43, 'Johnny Depp'),
(43, 'Overlength'),
(43, 'Won Oscar'),
(44, 'Blockbuster'),
(44, 'Johnny Depp'),
(44, 'Overlength'),
(45, 'Blockbuster'),
(45, 'Johnny Depp'),
(45, 'Overlength'),
(49, 'Love Story'),
(50, 'Luxury'),
(51, 'Luxury'),
(52, 'Luxury'),
(53, 'PHP'),
(55, 'MySQL'),
(56, 'Javascript'),
(57, 'CSS'),
(57, 'HMTL'),
(58, 'Java'),
(59, 'MySQL'),
(60, 'Actionscript'),
(60, 'Flash'),
(61, 'MySQL'),
(62, 'Canon'),
(62, 'Pink'),
(62, 'Silver'),
(63, 'Pink'),
(64, 'Blue'),
(64, 'Samsung'),
(65, 'Casio'),
(65, 'Pink'),
(66, 'Silver'),
(67, 'Green'),
(68, 'Black'),
(68, 'Casio'),
(69, 'Red'),
(69, 'Sony'),
(70, 'Beige'),
(70, 'Canon'),
(71, 'Canon'),
(71, 'Silver'),
(72, 'Samsung'),
(72, 'Silver'),
(73, 'Blue'),
(73, 'Samsung'),
(74, 'Pink'),
(74, 'Samsung'),
(75, 'Pink'),
(75, 'Samsung'),
(76, 'Silver'),
(77, 'Black'),
(77, 'Samsung'),
(78, 'Black'),
(78, 'Samsung'),
(80, 'Black'),
(80, 'Sony'),
(81, 'Black'),
(81, 'Sony'),
(82, 'Black'),
(82, 'Samsung'),
(83, 'Black'),
(83, 'Nokia'),
(93, 'Luxury'),
(119, 'Pink'),
(119, 'Samsung'),
(120, 'Hardware'),
(120, 'Software'),
(121, 'Hardware'),
(121, 'Software'),
(122, 'Software'),
(124, '>30.000 Employees'),
(124, 'Private Limited Company'),
(126, '>30.000 Employees'),
(126, 'Publicly Traded Company'),
(127, '>10.000 Employees'),
(128, '>30.000 Employees'),
(128, 'Publicly Traded Company'),
(129, '>10.000 Employees'),
(131, '>30.000 Employees'),
(131, 'Publicly Traded Company'),
(131, 'Software'),
(132, 'Publicly Traded Company'),
(132, 'Software'),
(133, '>30.000 Employees'),
(133, 'Hardware'),
(133, 'Publicly Traded Company'),
(133, 'Software'),
(144, 'Casio'),
(145, 'Casio'),
(147, 'Luxury'),
(148, 'Luxury'),
(159, 'Delicious'),
(160, 'Cold'),
(160, 'Delicious'),
(161, 'Delicious'),
(162, 'Grilled'),
(163, 'Delicious'),
(163, 'Grilled'),
(164, 'Delicious'),
(165, 'Delicious'),
(166, 'Delicious'),
(167, 'Delicious'),
(168, 'Delicious'),
(169, 'Cold'),
(169, 'Delicious'),
(170, 'Delicious'),
(171, 'Delicious'),
(173, 'Delicious'),
(174, 'Delicious'),
(175, 'Delicious'),
(178, 'Joomla'),
(178, 'MySQL 4.1'),
(178, 'PHP 5.3'),
(179, 'Beginner'),
(180, 'Beginner'),
(181, 'Beginner'),
(182, 'Joomla'),
(182, 'MySQL 4.1'),
(182, 'PHP 5.3'),
(183, 'Joomla'),
(184, 'Joomla'),
(184, 'Options'),
(185, 'Joomla'),
(186, 'CSS'),
(186, 'Joomla'),
(186, 'Template'),
(187, 'Joomla'),
(187, 'Options'),
(188, 'CSS'),
(188, 'Joomla'),
(188, 'Template'),
(189, 'Joomla'),
(190, 'Joomla'),
(190, 'MySQL 4.1'),
(190, 'PHP 5.3'),
(191, 'Joomla'),
(192, 'Joomla'),
(193, 'Joomla'),
(193, 'Options'),
(193, 'Template'),
(194, 'CSS'),
(194, 'Joomla'),
(194, 'Template'),
(195, 'Joomla'),
(196, 'Joomla'),
(196, 'MySQL 4.1'),
(197, 'Joomla'),
(197, 'MySQL 4.1'),
(197, 'PHP 5.3'),
(198, 'CMS'),
(198, 'Free'),
(198, 'Joomla'),
(198, 'Movies'),
(198, 'Open Source'),
(199, 'MySQL 3.23'),
(199, 'PHP 5.2'),
(199, 'Wordpress'),
(200, 'MySQL 3.23'),
(200, 'Wordpress'),
(201, 'Wordpress'),
(202, 'PHP'),
(202, 'Templating'),
(202, 'Wordpress'),
(203, 'Parameters'),
(203, 'Templating'),
(203, 'Wordpress'),
(204, 'Wordpress'),
(205, 'Wordpress'),
(206, 'MySQL 3.23'),
(206, 'PHP 5.2'),
(206, 'Wordpress'),
(207, 'Wordpress'),
(208, 'PHP'),
(208, 'Templating'),
(208, 'Wordpress'),
(209, 'Parameters'),
(209, 'Wordpress'),
(210, 'PHP'),
(210, 'Templating'),
(210, 'Wordpress'),
(211, 'Wordpress'),
(212, 'Parameters'),
(212, 'Wordpress'),
(213, 'Wordpress'),
(214, 'MySQL 3.23'),
(214, 'PHP 5.2'),
(214, 'Wordpress'),
(215, 'MySQL 3.23'),
(215, 'PHP 5.2'),
(215, 'Wordpress'),
(216, 'Drupal'),
(216, 'MySQL 5.0'),
(216, 'PHP 4.3.10'),
(217, 'Drupal'),
(217, 'MySQL 5.0'),
(218, 'Drupal'),
(219, 'Drupal'),
(219, 'HTML'),
(219, 'Themes'),
(220, 'Configuration'),
(220, 'Drupal'),
(220, 'Themes'),
(221, 'Drupal'),
(222, 'Drupal'),
(223, 'Drupal'),
(223, 'MySQL 5.0'),
(223, 'PHP 4.3.10'),
(224, 'Drupal'),
(225, 'Drupal'),
(225, 'HTML'),
(225, 'Themes'),
(226, 'Configuration'),
(226, 'Drupal'),
(227, 'Drupal'),
(227, 'HTML'),
(227, 'Themes'),
(228, 'Drupal'),
(229, 'Configuration'),
(229, 'Drupal'),
(230, 'Drupal'),
(231, 'Drupal'),
(231, 'MySQL 5.0'),
(231, 'PHP 4.3.10'),
(232, 'Drupal'),
(232, 'MySQL 5.0'),
(232, 'PHP 4.3.10');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
