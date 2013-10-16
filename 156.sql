-- phpMyAdmin SQL Dump
-- version 3.1.3.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 26, 2011 at 08:07 AM
-- Server version: 5.1.33
-- PHP Version: 5.2.9

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `156`
--

-- --------------------------------------------------------

--
-- Table structure for table `jos_banner`
--

CREATE TABLE IF NOT EXISTS `jos_banner` (
  `bid` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL DEFAULT '0',
  `type` varchar(90) NOT NULL DEFAULT 'banner',
  `name` text NOT NULL,
  `alias` varchar(255) NOT NULL DEFAULT '',
  `imptotal` int(11) NOT NULL DEFAULT '0',
  `impmade` int(11) NOT NULL DEFAULT '0',
  `clicks` int(11) NOT NULL DEFAULT '0',
  `imageurl` varchar(100) NOT NULL DEFAULT '',
  `clickurl` varchar(200) NOT NULL DEFAULT '',
  `date` datetime DEFAULT NULL,
  `showBanner` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `editor` varchar(150) DEFAULT NULL,
  `custombannercode` text,
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `sticky` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `tags` text NOT NULL,
  `params` text NOT NULL,
  PRIMARY KEY (`bid`),
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
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `contact` text NOT NULL,
  `email` varchar(255) NOT NULL DEFAULT '',
  `extrainfo` text NOT NULL,
  `checked_out` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out_time` time DEFAULT NULL,
  `editor` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`cid`)
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

--
-- Dumping data for table `jos_bannertrack`
--


-- --------------------------------------------------------

--
-- Table structure for table `jos_categories`
--

CREATE TABLE IF NOT EXISTS `jos_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `title` text NOT NULL,
  `name` text NOT NULL,
  `alias` varchar(255) NOT NULL DEFAULT '',
  `image` varchar(255) NOT NULL DEFAULT '',
  `section` varchar(150) NOT NULL DEFAULT '',
  `image_position` varchar(90) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `editor` varchar(150) DEFAULT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `count` int(11) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cat_idx` (`section`,`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=37 ;

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
(36, 0, 'YOOscroller', '', 'yooscroller', '', '5', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 3, 0, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `jos_components`
--

CREATE TABLE IF NOT EXISTS `jos_components` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL DEFAULT '',
  `link` varchar(255) NOT NULL DEFAULT '',
  `menuid` int(11) unsigned NOT NULL DEFAULT '0',
  `parent` int(11) unsigned NOT NULL DEFAULT '0',
  `admin_menu_link` varchar(255) NOT NULL DEFAULT '',
  `admin_menu_alt` text NOT NULL,
  `option` varchar(50) NOT NULL DEFAULT '',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `admin_menu_img` varchar(255) NOT NULL DEFAULT '',
  `iscore` tinyint(4) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `parent_option` (`parent`,`option`(32))
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=36 ;

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
(35, 'Zoo', 'option=com_zoo', 0, 0, 'option=com_zoo', 'Zoo', 'com_zoo', 0, 'components/com_zoo/assets/images/zoo_16.png', 0, '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `jos_contact_details`
--

CREATE TABLE IF NOT EXISTS `jos_contact_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `alias` varchar(255) NOT NULL DEFAULT '',
  `con_position` text,
  `address` text,
  `suburb` text,
  `state` text,
  `country` text,
  `postcode` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `misc` mediumtext,
  `image` varchar(255) DEFAULT NULL,
  `imagepos` varchar(60) DEFAULT NULL,
  `email_to` varchar(255) DEFAULT NULL,
  `default_con` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `catid` int(11) NOT NULL DEFAULT '0',
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mobile` varchar(255) NOT NULL DEFAULT '',
  `webpage` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
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
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `alias` varchar(255) NOT NULL DEFAULT '',
  `title_alias` text NOT NULL,
  `introtext` mediumtext NOT NULL,
  `fulltext` mediumtext NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `sectionid` int(11) unsigned NOT NULL DEFAULT '0',
  `mask` int(11) unsigned NOT NULL DEFAULT '0',
  `catid` int(11) unsigned NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` text NOT NULL,
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `images` text NOT NULL,
  `urls` text NOT NULL,
  `attribs` text NOT NULL,
  `version` int(11) unsigned NOT NULL DEFAULT '1',
  `parentid` int(11) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `access` int(11) unsigned NOT NULL DEFAULT '0',
  `hits` int(11) unsigned NOT NULL DEFAULT '0',
  `metadata` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_section` (`sectionid`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=82 ;

--
-- Dumping data for table `jos_content`
--

INSERT INTO `jos_content` (`id`, `title`, `alias`, `title_alias`, `introtext`, `fulltext`, `state`, `sectionid`, `mask`, `catid`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `images`, `urls`, `attribs`, `version`, `parentid`, `ordering`, `metakey`, `metadesc`, `access`, `hits`, `metadata`) VALUES
(1, 'Welcome to Joomla!', 'welcome-to-joomla', '', '<strong>Joomla! is a free open source framework and content publishing system designed for quickly creating highly interactive multi-language Web sites, online communities, media portals, blogs and eCommerce applications.</strong>\r\n\r\n<p>Joomla! provides an easy-to-use graphical user interface that simplifies the management and publishing of large volumes of content including HTML, documents, and rich media.  Joomla! is used by organisations of all sizes for Public Web sites, Intranets, and Extranets and is supported by a community of thousands of users.</p>\r\n', '\r\nWith a fully documented library of developer resources, Joomla! allows the customisation of every aspect of a Web site including presentation, layout, administration, and the rapid integration with third-party applications.\r\n\r\n<p>Joomla! has a rich heritage and has been crowned CMS king many times over.  Now with more power under the hood, Joomla! is shifting gear and provides developer power while making the user experience all the more friendly.  For those who always wanted increased extensibility, Joomla! 1.5 can make this happen.</p>\r\n\r\n<p>A new framework, ground-up refactoring, and a highly-active development team brings the excitement of ''the next generation CMS'' to your fingertips.  Whether you are a systems architect or a complete ''noob'' Joomla! can take you to the next level of content delivery. ''More than a CMS'' is something we have been playing with as a catchcry because the new Joomla! API has such incredible power and flexibility, you are free to take whatever direction your creative mind takes you and Joomla! can help you get there so much more easily than ever before.</p>\r\n\r\n<p>Thinking Web publishing? Think Joomla!</p>', 1, 4, 0, 29, '2006-10-13 10:00:00', 62, '', '2008-12-16 15:36:38', 62, 0, '0000-00-00 00:00:00', '2006-01-03 01:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 40, 0, 1, '', '', 0, 108, 'robots=\nauthor='),
(5, 'Joomla! License Guidelines', 'joomla-license-guidelines', 'joomla-license-guidelines', '<p>This Web site is powered by <a href="http://www.joomla.org/">Joomla!</a> The software and default templates on which it runs are Copyright 2005-2007 <a href="http://www.opensourcematters.org/">Open Source Matters</a>.  All other content and data, including data entered into this Web site and templates added after installation, are copyrighted by their respective copyright owners.</p>\r\n\r\n<p>If you want to distribute, copy, or modify Joomla!, you are welcome to do so under the terms of the <a href="http://www.gnu.org/licenses/old-licenses/gpl-2.0.html#SEC1">GNU General Public License</a>.  If you are unfamiliar with this license, you might want to read <a href="http://www.gnu.org/licenses/old-licenses/gpl-2.0.html#SEC4">''How To Apply These Terms To Your Program''</a> and the <a href="http://www.gnu.org/licenses/old-licenses/gpl-2.0-faq.html">''GNU General Public License FAQ''</a>.</p>\r\n', '\r\n<p>Joomla! documentation is released under the terms of the <a href="http://creativecommons.org/licenses/by-nc-sa/2.5/" title="Creative Commons ">Creative Commons Attribution-Non-Commercial-Share-Alike License 2.5</a> or by the specific license of their respective copyright owners.</p>\r\n\r\n<p>The Joomla! licence has always been GPL.</p>', 1, 4, 0, 29, '2004-08-20 10:11:07', 62, '', '2008-12-16 15:45:30', 62, 0, '0000-00-00 00:00:00', '2004-08-19 06:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 9, 0, 5, '', '', 0, 120, 'robots=\nauthor='),
(18, 'Joomla! Features', 'joomla-features', '', '<h4>Joomla! features:</h4>\r\n<ul>\r\n	<li>Completely database driven site engines </li>\r\n	<li>News, products, or services sections fully editable and manageable</li>\r\n	<li>Topics sections can be added to by contributing Authors </li>\r\n	<li>Fully customisable layouts including <em>left</em>, <em>center</em>, and <em>right </em>Menu boxes </li>\r\n	<li>Browser upload of images to your own library for use anywhere in the site </li>\r\n	<li>Dynamic Forum/Poll/Voting booth for on-the-spot results </li>\r\n	<li>Runs on Linux, FreeBSD, MacOSX server, Solaris, and AIX</li>\r\n</ul>\r\n', '\r\n<h4>Extensive Administration:</h4>\r\n<ul>\r\n	<li>Change order of objects including news, FAQs, Articles etc. </li>\r\n	<li>Random Newsflash generator </li>\r\n	<li>Remote Author submission Module for News, Articles, FAQs, and Links </li>\r\n	<li>Object hierarchy - as many Sections, departments, divisions, and pages as you want </li>\r\n	<li>Image library - store all your PNGs, PDFs, DOCs, XLSs, GIFs, and JPEGs online for easy use </li>\r\n	<li>Automatic Path-Finder. Place a picture and let Joomla! fix the link </li>\r\n	<li>News Feed Manager. Choose from over 360 News Feeds from around the world </li>\r\n	<li>E-mail a friend and Print format available for every story and Article </li>\r\n	<li>In-line Text editor similar to any basic word processor software </li>\r\n	<li>User editable look and feel </li>\r\n	<li>Polls/Surveys - Now put a different one on each page </li>\r\n	<li>Custom Page Modules. Download custom page Modules to spice up your site </li>\r\n	<li>Template Manager. Download Templates and implement them in seconds </li>\r\n	<li>Layout preview. See how it looks before going live </li>\r\n	<li>Banner Manager. Make money out of your site</li>\r\n</ul>', 1, 4, 0, 29, '2006-10-08 23:32:45', 62, '', '2008-12-16 15:41:08', 62, 0, '0000-00-00 00:00:00', '2006-10-07 06:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 15, 0, 3, '', '', 0, 74, 'robots=\nauthor='),
(19, 'Joomla! Overview', 'joomla-overview', '', '<p>If you''re new to Web publishing systems, you''ll find that Joomla! delivers sophisticated solutions to your online needs. It can deliver a robust enterprise-level Web site, empowered by endless extensibility for your bespoke publishing needs. Moreover, it is often the system of choice for small business or home users who want a professional looking site that''s simple to deploy and use. <em>We do content right</em>.<br />\r\n</p>\r\n\r\n<p><strong>So what''s the catch? How much does this system cost?</strong></p>\r\n\r\n<p> Well, there''s good news ... and more good news! Joomla! 1.5 is free, it is released under an Open Source license - the GNU/General Public License v 2.0. Had you invested in a mainstream, commercial alternative, there''d be nothing but moths left in your wallet and to add new functionality would probably mean taking out a second mortgage each time you wanted something adding!</p>\r\n\r\n', '\r\n\r\n<p>Joomla! changes all that ... <br />\r\n	Joomla! is different from the normal models for content management software. For a start, it''s not complicated. Joomla! has been developed for everybody, and anybody can develop it further. It is designed to work (primarily) with other Open Source, free, software such as PHP, MySQL, and Apache. </p>\r\n	\r\n<p>It is easy to install and administer, and is reliable. </p>\r\n\r\n<p>Joomla! doesn''t even require the user or administrator of the system to know HTML to operate it once it''s up and running.</p>\r\n\r\n<p>To get the perfect Web site with all the functionality that you require for your particular application may take additional time and effort, but with the Joomla! Community support that is available and the many Third Party Developers actively creating and releasing new Extensions for the 1.5 platform on an almost daily basis, there is likely to be something out there to meet your needs. Or you could develop your own Extensions and make these available to the rest of the community. </p>', 1, 4, 0, 29, '2006-10-13 07:49:20', 62, '', '2008-12-16 15:47:44', 62, 0, '0000-00-00 00:00:00', '2006-10-07 10:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 22, 0, 2, '', '', 0, 219, 'robots=\nauthor='),
(20, 'Support and Documentation', 'support-and-documentation', '', '<h3>Support</h3>\r\n\r\n<p>Support for the Joomla! CMS can be found on several places. The best place to start would be the official <a href="http://help.joomla.org/" target="_blank">Help Site</a>. Here you can help yourself to the information that is regularly published and updated as Joomla! develops. There is much more to come too! </p>\r\n<p>Of course you should not forget the Help System of the CMS itself. On the <em>topmenu </em>in the Back-end Control panel you find the Help button which will provide you with lots of explanation on features. </p>\r\n\r\n<p>Another great place would of course be the <a href="http://forum.joomla.org/" target="_blank">Forum</a> . On the Joomla! Forum you can find help and support from Community members as well as from Joomla! Core members and Working Group members. The forum contains a lot of information, FAQ''s, just about anything you are looking for in terms of support.</p>\r\n', '\r\n<p>Two other resources for Support are the <a href="http://dev.joomla.org/" target="_blank">Joomla! Developer Network</a> (JDN) and the <a href="http://extensions.joomla.org/" target="_blank">Joomla! Extensions Directory</a> (JED). The Developer Network for example provides lots of technical information for the experienced Developer as well as those new to Joomla! and development work in general. The JED whilst not a support site in the strictest sense has many of the Extensions that you will need as you develop your own Web site. </p>\r\n\r\n<p>The Joomla! Core members are regularly posting their blog reports about several topics such as programming techniques used in Joomla!, Security, Events and more. You can even subscribe to get notified by e-mail when a new blog post is made! </p>\r\n\r\n<h3>Documentation </h3>\r\n\r\n<p>Joomla! Documentation can of course be found on the <a href="http://help.joomla.org/" target="_blank">Help Site</a>. You can find information such as an Installation Guide, User and Administrator manuals, Frequently Asked Questions and a lot more. The User Documentation Team are the guardians of the documentation relating to the practical use of Joomla!. The Developer Documentation Team are the stalwarts behind detailing how Joomla! works from the ground up and how you can develop your own Extensions and Templates and much more.</p>\r\n\r\n<p>Other than the documentation provided by the Joomla! Documentation Work Groups there are also books written about Joomla! You can find a listing of these books in the <a href="http://help.joomla.org/content/section/44/254/" target="_blank">Joomla! Bookshelf</a> .</p>\r\n\r\n<h1>Want to help? </h1>\r\n\r\n<p>If you want to help in the documentation project for Joomla! then please post your details on the <a href="http://forum.joomla.org/index.php/board,62.0.html" title="The Joomla! User Documentation Forums">User Documentation Forum</a> or the <a href="http://forum.joomla.org/index.php/board,60.0.html" title="The Joomla! Developer Documentation Forum">Developer Documentation Forum</a> </p>\r\n\r\n<p><a class="urlextern" href="http://forum.joomla.org/index.php/board,391.0.html" target="_blank" title="http://forum.joomla.org/index.php/board,59.0.html" onclick="return svchk()"><br />\r\n	</a></p>', 1, 4, 0, 29, '2006-10-09 08:33:57', 62, '', '2008-12-22 19:39:55', 62, 0, '0000-00-00 00:00:00', '2006-10-07 10:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 16, 0, 7, '', '', 0, 9, 'robots=\nauthor='),
(23, 'Platforms and Open Standards', 'platforms-and-open-standards', '', '<p>Joomla! runs on any platform including Windows, most flavours of Linux, several Unix versions, and the Apple OS/X platform.  Joomla! depends on PHP and the MySQL database to deliver dynamic content. </p>\r\n<p>The minimum requirements are:</p>\r\n<ul>\r\n	<li>Apache 1.x, 2.x and higher</li>\r\n	<li>PHP 4.3 and higher</li>\r\n	<li>MySQL 3.23 and higher</li>\r\n</ul>\r\nIt will also run on alternative server platforms such as Windows IIS - provided they support PHP and MySQL - but these require additional configuration in order for the Joomla! core package to be successful installed and operated.', '', 1, 4, 0, 29, '2006-10-11 04:22:14', 62, '', '2008-12-16 15:34:16', 62, 0, '0000-00-00 00:00:00', '2006-10-10 08:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 8, 0, 6, '', '', 0, 17, 'robots=\nauthor='),
(27, 'The Joomla! Community', 'the-joomla-community', '', '<p><strong>Got a question? </strong>With more than 140,000 members, the online forums at <a href="http://forum.joomla.org/" target="_blank">forum.joomla.org</a> are a great resource for both new and experienced users. Go ahead, ask your toughest questions, the community is waiting to see what you''re going to do with your Joomla! site.</p>\r\n\r\n<p><strong>Do you want to show off your new Joomla! Web site?</strong> Go ahead, we have a section dedicated to that on our forum. </p>\r\n', '\r\n<p><strong>Do you want to join in?</strong></p>\r\n\r\n<p>If you think working with Joomla! is fun, wait until you start working on it. We''re passionate about helping Joomla! Users make the jump to becoming contributing members of the community, so there are many ways you can help Joomla!''s development:</p>\r\n\r\n<ul>\r\n	<li>Submit news about Joomla!. We syndicate all Joomla! related news on our <a href="http://news.joomla.org" title="Joomla! News Portal">news portal</a>. If you have some Joomla! news that you would like to share with the community, please submit your short story, article, announcement or review <a href="http://www.joomla.org/component/option,com_submissions/Itemid,75" title="Submit News">here</a>.</li>\r\n	<li>Report bugs and request features in our <a href="http://joomlacode.org/gf/project/joomla/tracker/" title="Joomla! developement trackers">trackers</a>. Please read <a href="http://dev.joomla.org/content/view/1450/89/">Reporting Bugs</a>, for details on how we like our bug reports served up</li>\r\n	<li>Submit patches for new and/or fixed behaviour. Please read <a href="http://dev.joomla.org/content/view/14/55/">Submitting Patches</a>, for details on how to submit a patch.</li>\r\n	<li>Join the <a href="http://forum.joomla.org/index.php/board,126.0.html" title="Joomla! development forums">developer forums</a> and share your ideas for how to improve Joomla!. We''re always open to suggestions, although we''re likely to be sceptical of large-scale suggestions without some code to back it up.</li>\r\n	<li>Join any of the <a href="http://dev.joomla.org/content/view/13/53/" title="Joomla! working groups">Joomla!  Working Groups</a> and bring your personal expertise to  the Joomla! community. More info about the different working groups can be found <a href="http://dev.joomla.org/content/view/13/53/" title="Joomla! working groups">on the Working Group Roll Call</a>. </li>\r\n</ul>\r\n\r\n<p> That''s all you need to know if you''d like to join the Joomla! development community. </p>', 1, 4, 0, 29, '2006-10-12 16:50:48', 62, '', '2008-12-16 15:44:55', 62, 0, '0000-00-00 00:00:00', '2006-10-11 02:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 13, 0, 4, '', '', 0, 56, 'robots=\nauthor='),
(45, 'Template', 'template', '', '<h2>Warp5 Framework</h2>\r\n<p>This template is based on the Warp5 framework. Warp5 is a fast and powerful template framework for Joomla that lets you create sophisticated Joomla templates in no time. It provides a hybrid fluid-pixel grid and all the elaborate functionalities that make our templates easy to edit, nice to look at and super fast, in every browser. Visit the <a href="http://warp.yootheme.com" target="_blank">Warp5 website</a> and take a look at all <a href="http://warp.yootheme.com/features" target="_blank">the features...</a></p>\r\n\r\n<div class="floatbox">\r\n\r\n	<div class="float-left width50">\r\n		<div class="correct-png ie6-zoom" style="margin-right: 15px; padding-left: 60px; background: transparent url(images/yootheme/icon_menusystem.png) no-repeat scroll 0 0;">\r\n			<h3 style="padding-top: 5px; margin-top: 0px;">Menu System</h3>\r\n			<p>The menu system enhances Joomla''s menu functions to create clearly arranged interfaces even for comprehensive sites. <a href="http://warp.yootheme.com/menu-system" target="_blank">Learn more...</a></p>\r\n		</div>\r\n	</div>\r\n	\r\n	<div class="float-left width50">\r\n		<div class="correct-png ie6-zoom" style="padding-left: 60px; background: transparent url(images/yootheme/icon_modulesystem.png) no-repeat scroll 0 0;">\r\n			<h3 style="padding-top: 5px; margin-top: 0px;">Module System</h3>\r\n			<p>The module system provides a clear grid for Joomla modules and a wide diversity of templates for module variations. <a href="http://warp.yootheme.com/module-system" target="_blank">Learn more...</a></p>\r\n		</div>\r\n	</div>\r\n	\r\n</div>\r\n\r\n<hr class="dotted" />\r\n\r\n<h2>Design and Styles</h2>\r\n<p>We included a lot of different module and typography styles. So you can give your site a unique look and it will also ease your work when setting up your content.</p>\r\n\r\n<div class="floatbox">\r\n\r\n	<div class="float-left width50">\r\n		<div class="correct-png ie6-zoom" style="margin-right: 15px; padding-left: 60px; background: transparent url(images/yootheme/icon_modulevariations.png) no-repeat scroll 0 0;">\r\n			<h3 style="padding-top: 5px; margin-top: 0px;">Module Variations</h3>\r\n			<p>This template comes with a wide variety of module stylings in many different shapes and colours. Take a look at all the different <a href="index.php?option=com_content&view=article&id=48&Itemid=58">module variations.</a></p>\r\n		</div>\r\n	</div>\r\n	\r\n	<div class="float-left width50">\r\n		<div class="correct-png ie6-zoom" style="padding-left: 60px; background: transparent url(images/yootheme/icon_typography.png) no-repeat scroll 0 0;">\r\n			<h3 style="padding-top: 5px; margin-top: 0px;">Typography</h3>\r\n			<p>This templates delivers you sophisticated typography and various stylings. Take a look at the <a href="index.php?option=com_content&view=article&id=46&Itemid=55">style guide</a> about all possible HTML tag styles.</p>\r\n		</div>\r\n	</div>\r\n	\r\n</div>\r\n\r\n<hr class="dotted" />\r\n\r\n<h2>Installation and Customization</h2>\r\n<p>New to YOOtheme? Don''t worry! We provide a lot help to install and cutomize our tempaltes to get you started right away with your web project.</p>\r\n\r\n<div class="floatbox">\r\n\r\n	<div class="float-left width50">\r\n		<div class="correct-png ie6-zoom" style="margin-right: 15px; padding-left: 60px; background: transparent url(images/yootheme/icon_installation.png) no-repeat scroll 0 0;">\r\n			<h3 style="padding-top: 5px; margin-top: 0px;">Installation Package</h3>\r\n			<p>We provide a full Joomla installation package with the demo content of the website for this template. So you can take a look at how everything is set up in the Joomla backend.</p>\r\n			<div class="info">Make sure you click "Install Sample Data" during the installation process.</div>\r\n		</div>\r\n	</div>\r\n	\r\n	<div class="float-left width50">\r\n		<div class="correct-png ie6-zoom" style="padding-left: 60px; background: transparent url(images/yootheme/icon_fireworks.png) no-repeat scroll 0 0;">\r\n			<h3 style="padding-top: 5px; margin-top: 0px;">Sliced Image Source Files</h3>\r\n			<p>The editable fully sliced image source files of this template are available as download. With them you can completely customise your template''s look to match your or your client''s corporate identity.</p>\r\n			<div class="info">Adobe Fireworks CS4 is required to edit the image source files.</div>\r\n		</div>\r\n	</div>\r\n	\r\n</div>\r\n\r\n<hr class="dotted" />\r\n\r\n<h2>Compatibility</h2>\r\n\r\n<p>This template is fully compatible with all YOOtheme products like the <a target="_blank" href="http://tools.yootheme.com/">YOOtools</a>, the <a target="_blank" href="http://zoo.yootheme.com/">ZOO</a> and the <a target="_blank" href="http://teamlog.yootheme.com/">Teamlog extension</a>.</p>\r\n\r\n<div class="tip ie6-zoom" style="overflow: hidden;">\r\n	\r\n	<p style="margin: 0px;">All YOOtools extensions are working right out of the box. Take a look at the demo pages and watch the video tutorials.</p>\r\n	\r\n	<div class="float-left width50">\r\n		<ul class="checkbox">\r\n			<li style="margin-bottom: 4px; overflow: hidden;">\r\n				<a style="display: block; float: left; width: 100px;" target="_blank" href="http://tools.yootheme.com/extensions/yooaccordion" title="YOOaccordion">YOOaccordion</a>\r\n				<a target="_blank" href="http://tools.yootheme.com/extensions/yooaccordion" title="YOOaccordion">\r\n					<img class="correct-png" style="margin: 0px 0px 0px 5px" src="images/yootheme/features_demo.png" alt="See the live demo" title="See the live demo" width="17" height="17" align="absmiddle"/>\r\n				</a>\r\n				<a href="http://tools.yootheme.com/documentation/item/root/how-to-set-up-the-yooaccordion" target="_blank">\r\n					<img class="correct-png" style="margin: 0px 0px 0px 3px" src="images/yootheme/features_tutorial.png" alt="Watch the video tutorial" title="Watch the video tutorial" width="17" height="17" align="absmiddle"/>\r\n				</a>\r\n			</li>\r\n			<li style="margin-bottom: 4px; overflow: hidden;">\r\n				<a style="display: block; float: left; width: 100px;" target="_blank" href="http://tools.yootheme.com/extensions/yoocarousel" title="YOOcarousel">YOOcarousel</a>\r\n				<a target="_blank" href="http://tools.yootheme.com/extensions/yoocarousel" title="YOOcarousel">\r\n					<img class="correct-png" style="margin: 0px 0px 0px 5px" src="images/yootheme/features_demo.png" alt="See the live demo" title="See the live demo" width="17" height="17" align="absmiddle"/>\r\n				</a>\r\n				<a href="http://tools.yootheme.com/documentation/item/root/how-to-set-up-the-yoocarousel" target="_blank">\r\n					<img class="correct-png" style="margin: 0px 0px 0px 3px" src="images/yootheme/features_tutorial.png" alt="Watch the video tutorial" title="Watch the video tutorial" width="17" height="17" align="absmiddle"/>\r\n				</a>\r\n			</li>\r\n			<li style="margin-bottom: 4px; overflow: hidden;">\r\n				<a style="display: block; float: left; width: 100px;" target="_blank" href="http://tools.yootheme.com/extensions/yoodrawer" title="YOOdrawer">YOOdrawer</a>\r\n				<a target="_blank" href="http://tools.yootheme.com/extensions/yoodrawer" title="YOOdrawer">\r\n					<img class="correct-png" style="margin: 0px 0px 0px 5px" src="images/yootheme/features_demo.png" alt="See the live demo" title="See the live demo" width="17" height="17" align="absmiddle"/>\r\n				</a>\r\n				<a href="http://tools.yootheme.com/documentation/item/root/how-to-set-up-the-yoodrawer" target="_blank">\r\n					<img class="correct-png" style="margin: 0px 0px 0px 3px" src="images/yootheme/features_tutorial.png" alt="Watch the video tutorial" title="Watch the video tutorial" width="17" height="17" align="absmiddle"/>\r\n				</a>\r\n			</li>\r\n			<li style="margin-bottom: 4px; overflow: hidden;">\r\n				<a style="display: block; float: left; width: 100px;" target="_blank" href="http://tools.yootheme.com/extensions/yooslider" title="YOOslider">YOOslider</a>\r\n				<a target="_blank" href="http://tools.yootheme.com/extensions/yooslider" title="YOOslider">\r\n					<img class="correct-png" style="margin: 0px 0px 0px 5px" src="images/yootheme/features_demo.png" alt="See the live demo" title="See the live demo" width="17" height="17" align="absmiddle"/>\r\n				</a>\r\n				<a href="http://tools.yootheme.com/documentation/item/root/how-to-set-up-the-yooslider" target="_blank">\r\n					<img class="correct-png" style="margin: 0px 0px 0px 3px" src="images/yootheme/features_tutorial.png" alt="Watch the video tutorial" title="Watch the video tutorial" width="17" height="17" align="absmiddle"/>\r\n				</a>\r\n			</li>\r\n			<li style="margin-bottom: 4px; overflow: hidden;">\r\n				<a style="display: block; float: left; width: 100px;" target="_blank" href="http://tools.yootheme.com/extensions/yooscroller" title="YOOscroller">YOOscroller</a>\r\n				<a target="_blank" href="http://tools.yootheme.com/extensions/yooscroller" title="YOOscroller">\r\n					<img class="correct-png" style="margin: 0px 0px 0px 5px" src="images/yootheme/features_demo.png" alt="See the live demo" title="See the live demo" width="17" height="17" align="absmiddle"/>\r\n				</a>\r\n				<a href="http://tools.yootheme.com/documentation/item/root/how-to-set-up-the-yooscroller" target="_blank">\r\n					<img class="correct-png" style="margin: 0px 0px 0px 3px" src="images/yootheme/features_tutorial.png" alt="Watch the video tutorial" title="Watch the video tutorial" width="17" height="17" align="absmiddle"/>\r\n				</a>\r\n			</li>\r\n			<li style="margin-bottom: 4px; overflow: hidden;">\r\n				<a style="display: block; float: left; width: 100px;" target="_blank" href="http://tools.yootheme.com/extensions/yoosearch" title="YOOsearch">YOOsearch</a>\r\n				<a target="_blank" href="http://tools.yootheme.com/extensions/yoosearch" title="YOOsearch">\r\n					<img class="correct-png" style="margin: 0px 0px 0px 5px" src="images/yootheme/features_demo.png" alt="See the live demo" title="See the live demo" width="17" height="17" align="absmiddle"/>\r\n				</a>\r\n				<a href="http://tools.yootheme.com/documentation/item/root/how-to-set-up-the-yoosearch" target="_blank">\r\n					<img class="correct-png" style="margin: 0px 0px 0px 3px" src="images/yootheme/features_tutorial.png" alt="Watch the video tutorial" title="Watch the video tutorial" width="17" height="17" align="absmiddle"/>\r\n				</a>\r\n			</li>\r\n			<li style="margin-bottom: 4px; overflow: hidden;">\r\n				<a style="display: block; float: left; width: 100px;" target="_blank" href="http://tools.yootheme.com/extensions/yoogallery" title="YOOgallery">YOOgallery</a>\r\n				<a target="_blank" href="http://tools.yootheme.com/extensions/yoogallery" title="YOOgallery">\r\n					<img class="correct-png" style="margin: 0px 0px 0px 5px" src="images/yootheme/features_demo.png" alt="See the live demo" title="See the live demo" width="17" height="17" align="absmiddle"/>\r\n				</a>\r\n				<a href="http://tools.yootheme.com/documentation/item/root/how-to-set-up-the-yoogallery-module" target="_blank">\r\n				<img class="correct-png" style="margin: 0px 0px 0px 3px" src="images/yootheme/features_tutorial.png" alt="Watch the video tutorial" title="Watch the video tutorial" width="17" height="17" align="absmiddle"/></a></li>\r\n			<li style="margin-bottom: 4px; overflow: hidden;">\r\n				<a style="display: block; float: left; width: 100px;" target="_blank" href="http://tools.yootheme.com/extensions/yoomaps" title="YOOmaps">YOOmaps</a>\r\n				<a target="_blank" href="http://tools.yootheme.com/extensions/yoomaps" title="YOOmaps">\r\n					<img class="correct-png" style="margin: 0px 0px 0px 5px" src="images/yootheme/features_demo.png" alt="See the live demo" title="See the live demo" width="17" height="17" align="absmiddle"/>\r\n				</a>\r\n				<a href="http://tools.yootheme.com/documentation/item/root/how-to-set-up-the-yoomaps" target="_blank">\r\n				<img class="correct-png" style="margin: 0px 0px 0px 3px" src="images/yootheme/features_tutorial.png" alt="Watch the video tutorial" title="Watch the video tutorial" width="17" height="17" align="absmiddle"/>\r\n				</a>\r\n			</li>\r\n		</ul>\r\n	</div>\r\n	<div class="float-left width50">\r\n		<ul class="checkbox">\r\n			<li style="margin-bottom: 4px; overflow: hidden;">\r\n				<a style="display: block; float: left; width: 100px;" target="_blank" href="http://tools.yootheme.com/extensions/yootweet" title="YOOtweet">YOOtweet</a>\r\n				<a target="_blank" href="http://tools.yootheme.com/extensions/yootweet" title="YOOtweet">\r\n					<img class="correct-png" style="margin: 0px 0px 0px 5px" src="images/yootheme/features_demo.png" alt="See the live demo" title="See the live demo" width="17" height="17" align="absmiddle"/>\r\n				</a>\r\n			</li>\r\n			<li style="margin-bottom: 4px; overflow: hidden;">\r\n				<a style="display: block; float: left; width: 100px;" target="_blank" href="http://tools.yootheme.com/extensions/yootooltip" title="YOOtooltip">YOOtooltip</a>\r\n				<a target="_blank" href="http://tools.yootheme.com/extensions/yootooltip" title="YOOtooltip">\r\n					<img class="correct-png" style="margin: 0px 0px 0px 5px" src="images/yootheme/features_demo.png" alt="See the live demo" title="See the live demo" width="17" height="17" align="absmiddle"/>\r\n				</a>\r\n				<a href="http://tools.yootheme.com/documentation/item/root/how-to-set-up-the-yootooltip" target="_blank">\r\n				<img class="correct-png" style="margin: 0px 0px 0px 3px" src="images/yootheme/features_tutorial.png" alt="Watch the video tutorial" title="Watch the video tutorial" width="17" height="17" align="absmiddle"/>\r\n				</a></li>\r\n			<li style="margin-bottom: 4px; overflow: hidden;">\r\n				<a style="display: block; float: left; width: 100px;" target="_blank" href="http://tools.yootheme.com/extensions/yootoppanel" title="YOOtoppanel">YOOtoppanel</a>\r\n				<a target="_blank" href="http://tools.yootheme.com/extensions/yootoppanel" title="YOOtoppanel">\r\n					<img class="correct-png" style="margin: 0px 0px 0px 5px" src="images/yootheme/features_demo.png" alt="See the live demo" title="See the live demo" width="17" height="17" align="absmiddle"/>\r\n				</a>\r\n			</li>\r\n			<li style="margin-bottom: 4px; overflow: hidden;">\r\n				<a style="display: block; float: left; width: 100px;" target="_blank" href="http://tools.yootheme.com/free-stuff/yooeffects" title="YOOeffects">YOOeffects</a>\r\n				<a target="_blank" href="http://tools.yootheme.com/free-stuff/yooeffects" title="YOOeffects">\r\n					<img class="correct-png" style="margin: 0px 0px 0px 5px" src="images/yootheme/features_demo.png" alt="See the live demo" title="See the live demo" width="17" height="17" align="absmiddle"/>\r\n				</a>\r\n			</li>\r\n			<li style="margin-bottom: 4px; overflow: hidden;">\r\n				<a style="display: block; float: left; width: 100px;" target="_blank" href="http://tools.yootheme.com/free-stuff/yoologin" title="YOOlogin">YOOlogin</a>\r\n				<a target="_blank" href="http://tools.yootheme.com/free-stuff/yoologin" title="YOOlogin">\r\n					<img class="correct-png" style="margin: 0px 0px 0px 5px" src="images/yootheme/features_demo.png" alt="See the live demo" title="See the live demo" width="17" height="17" align="absmiddle"/>\r\n				</a>\r\n				<a href="http://tools.yootheme.com/documentation/item/root/how-to-set-up-the-yoologin" target="_blank">\r\n					<img class="correct-png" style="margin: 0px 0px 0px 3px" src="images/yootheme/features_tutorial.png" alt="Watch the video tutorial" title="Watch the video tutorial" width="17" height="17" align="absmiddle"/>\r\n				</a>\r\n			</li>\r\n			<li style="margin-bottom: 4px; overflow: hidden;">\r\n				<a style="display: block; float: left; width: 100px;" target="_blank" href="http://tools.yootheme.com/free-stuff/yooholidays" title="YOOholidays">YOOholidays</a>\r\n				<a target="_blank" href="http://tools.yootheme.com/extensions/free-stuff" title="YOOholidays">\r\n					<img class="correct-png" style="margin: 0px 0px 0px 5px" src="images/yootheme/features_demo.png" alt="See the live demo" title="See the live demo" width="17" height="17" align="absmiddle"/>\r\n				</a>\r\n			</li>\r\n			<li style="margin-bottom: 4px; overflow: hidden;">\r\n				<a style="display: block; float: left; width: 100px;" target="_blank" href="http://tools.yootheme.com/free-stuff/yooiecheck" title="YOOiecheck">YOOiecheck</a>\r\n				<a target="_blank" href="http://tools.yootheme.com/free-stuff/yooiecheck" title="YOOiecheck">\r\n					<img class="correct-png" style="margin: 0px 0px 0px 5px" src="images/yootheme/features_demo.png" alt="See the live demo" title="See the live demo" width="17" height="17" align="absmiddle"/>\r\n				</a>\r\n			</li>\r\n			<li style="margin-bottom: 4px; overflow: hidden;">\r\n				<a style="display: block; float: left; width: 100px;" target="_blank" href="http://tools.yootheme.com/free-stuff/yoosnapshots" title="YOOsnapshots">YOOsnapshots</a>\r\n				<a target="_blank" href="http://tools.yootheme.com/free-stuff/yoosnapshots" title="YOOsnapshots">\r\n					<img class="correct-png" style="margin: 0px 0px 0px 5px" src="images/yootheme/features_demo.png" alt="See the live demo" title="See the live demo" width="17" height="17" align="absmiddle"/>\r\n				</a>\r\n			</li>\r\n		</ul>\r\n	</div>\r\n</div>\r\n\r\n<h2>Basic Help</h2>\r\n<p>Learn more about how to install and set up a YOOtheme template and go to the <a href="http://warp.yootheme.com/documentation" target="_blank" title="How to install and set up a YOOtheme template">Warp5 documentation</a>.</p>', '', 1, 5, 0, 34, '2007-12-19 03:00:00', 62, '', '2010-07-19 13:08:36', 62, 0, '0000-00-00 00:00:00', '2007-12-19 03:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=0\nshow_create_date=0\nshow_modify_date=0\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 117, 0, 4, '', '', 0, 2375, 'robots=\nauthor='),
(46, 'Typography', 'typography', '', '<div class="note">Typography is a key element in web design. This templates delivers you sophisticated typography and various stylings. The style guide gives you an overview about all possible HTML tag stylings provided by the template. It also helps you to set up the available classes for special stylings.</div>\r\n\r\n<h1>This is an H1 Header</h1>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>\r\n\r\n<h2>This is an H2 Header</h2>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>\r\n\r\n<h3>This is an H3 Header</h3>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>\r\n\r\n<h4>This is an H4 Header</h4>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>\r\n\r\n<h5>This is an H5 Header</h5>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>\r\n\r\n<h6>This is an H6 Header</h6>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>\r\n\r\n<p class="dropcap"><strong>Dropcap: use &lt;p class="dropcap"&gt;</strong>. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>\r\n\r\n<hr class="dotted" />\r\n\r\n<strong>Horizontal Rule:</strong> &lt;hr&gt; tag with class="dotted"\r\n\r\n<hr class="dotted" />\r\n\r\n<div class="floatbox">\r\n	<div class="float-left width33">\r\n	\r\n		<h4>Inline Styles</h4>\r\n		<p>\r\n			<a href="#">Default &lt;a&gt; tag</a>\r\n			<br /><a href="#" class="icon-folder">&lt;a&gt; with class="icon-folder"</a>\r\n			<br /><a href="#" class="icon-file">&lt;a&gt; with class="icon-file"</a>\r\n			<br /><a href="#" class="icon-download">&lt;a&gt; with class="icon-download"</a>\r\n			<br /><a href="#" class="icon-external">&lt;a&gt; with class="icon-external"</a>\r\n			<br /><a href="#" class="icon-pdf">&lt;a&gt; with class="icon-pdf"</a>\r\n			<br /><br /><em>Default &lt;em&gt;</em>\r\n			<br /><em class="box">&lt;em&gt; with class="box"</em>\r\n			<br /><br /><acronym title="By marking up acronyms you can give useful information to browsers, spell checkers, translation systems and search-engine indexers.">Default &lt;acronym&gt;</acronym>\r\n			<br /><abbr title="By marking up abbreviations you can give useful information to browsers, spell checkers, translation systems and search-engine indexers.">Default &lt;abbr&gt;</abbr>\r\n		\r\n		</p>\r\n	\r\n	</div>\r\n	<div class="float-left width33">\r\n\r\n		<h4>Unordered List Styles</h4>\r\n\r\n		<ul>\r\n			<li>Default &lt;ul&gt; tag</li>\r\n			<li>Lorem ipsum dolor</li>\r\n			<li>Lorem ipsum dolor</li>\r\n		</ul>\r\n\r\n		<ul class="checkbox">\r\n			<li>&lt;ul&gt; with class="checkbox"</li>\r\n		</ul>\r\n		\r\n		<ul class="arrow">\r\n		  <li>&lt;ul&gt; with class="arrow"</li>\r\n		</ul>\r\n		\r\n		<ul class="star">\r\n		  <li>&lt;ul&gt; with class="star"</li>\r\n		</ul>\r\n		\r\n		<ul class="check">\r\n		  <li>&lt;ul&gt; with class="check"</li>\r\n		</ul>\r\n\r\n	</div>\r\n	<div class="float-left width33">\r\n	\r\n		<h4>Ordered List Styles</h4>\r\n\r\n		<ol>\r\n			<li>Default &lt;ol&gt; tag</li>\r\n			<li>Lorem ipsum dolor</li>\r\n			<li>Lorem ipsum dolor</li>\r\n		</ol>\r\n\r\n		<ol class="disc">\r\n		  <li>&lt;ol&gt; tag with class="disc"</li>\r\n		  <li>Item 2</li>\r\n		  <li>Item 3</li>\r\n		  <li>Item 4</li>\r\n		</ol>\r\n\r\n	</div>\r\n</div>\r\n\r\n<hr class="dotted" />\r\n\r\n<h4>Div and Span Styles</h4>\r\n<div class="note"><strong>&lt;div&gt; or &lt;span&gt; tag with class="note"</strong> Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi.<br />\r\n</div>\r\n<div class="info"><strong>&lt;div&gt; or &lt;span&gt; tag with class="info"</strong> Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi.<br />\r\n</div>\r\n<div class="alert"><strong>&lt;div&gt; or &lt;span&gt; tag with class="alert"</strong> Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi.<br />\r\n</div>\r\n<div class="download"><strong>&lt;div&gt; or &lt;span&gt; tag with class="download"</strong> Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi.<br />\r\n</div>\r\n<div class="tip"><strong>&lt;div&gt; or &lt;span&gt; tag with class="tip"</strong> Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi.<br />\r\n</div>\r\n\r\n<hr class="dotted" />\r\n\r\n<h4>Blockquote and Q Styles</h4>\r\n<strong>Default &lt;q&gt; tag:</strong> <q>This is a quote!</q>\r\n\r\n<br /><br /><strong>Default &lt;blockquote&gt; tag with block element as child:</strong>\r\n\r\n<blockquote><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p></blockquote>\r\n\r\n<strong>&lt;blockquote&gt; tag with class="quotation" and an an additional &lt;p&gt; tag.</strong>\r\n<br />(use &lt;blockquote&gt;&lt;p&gt;....&lt;/p&gt;&lt;/blockquote&gt;)\r\n<blockquote class="quotation">\r\n	<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\r\n	</p>\r\n</blockquote>\r\n\r\n<hr class="dotted" />\r\n\r\n<h4>Combine Styles</h4>\r\n<div class="floatbox">\r\n\r\n	<p class="dropcap" style="margin-top: 5px;">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation <span class="info inset-right width25"><strong>Combine Tags</strong> with class "inset-right" or "inset-left". Example: &lt;span class=" info inset-right width25"&gt;.</span> ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\r\n	</p>\r\n	\r\n	<p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. <q class="blockquote inset-left width25"><strong>Combine Tags</strong> with class "inset-right" or "inset-left". Example: &lt;q class=" blockquote inset-right width25"&gt;.</q> Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\r\n	</p>\r\n	\r\n	<p class="dropcap">Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. <span class="tip inset-right width25"><strong>Possible Width Classes</strong> .width15, .width18, .width20, .width23, .width25, .width33, .width35, .width40, .width45, .width50</span> Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\r\n	</p>\r\n	\r\n	<p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\r\n	</p>\r\n	\r\n</div>\r\n\r\n<hr class="dotted" />\r\n\r\n<div class="floatbox">\r\n	<div class="float-left width50">\r\n		\r\n		<h4>Form Styles</h4>\r\n	\r\n		<form action="#">\r\n		<fieldset style="margin-right: 20px;">\r\n		<legend>Form legend</legend>\r\n		<div><label for="f1">Text input:</label> <input type="text" value="input text" id="f1"/></div>\r\n		<div><label for="f2">Radio input:</label> <input type="radio" id="f2"/></div>\r\n		<div><label for="f3">Checkbox input:</label> <input type="checkbox" id="f3"/></div>\r\n		<div><label for="f4">Select field:</label> <select id="f4"><option>Option 01</option><option>Option 02</option></select></div>\r\n		<div><label for="f5">Textarea:</label><br/><textarea rows="5" cols="30" id="f5">Textarea text</textarea></div>\r\n		<div><label for="f6">Button:</label> <input type="button" value="button text" id="f6"/></div>\r\n		</fieldset>\r\n		</form>\r\n\r\n	</div>\r\n	<div class="float-left width50">\r\n	\r\n		<h4>Preformatted Text Style</h4>\r\n		<pre>\r\npre {\r\n	margin: 10px 0 10px 0px;\r\n	padding: 5px 0 5px 10px;\r\n	border: 1px dotted #aab4be;\r\n	border-left: 20px solid #b4b4b4;\r\n	background: #fafafa;\r\n	font-size: 90%;\r\n	color: #2E8B57;\r\n	font-family: "Courier New", Courier, monospace;\r\n	\r\n	/* Browser specific (not valid) styles */\r\n	/* to make preformatted text wrap */\r\n	 \r\n	white-space: pre-wrap;       /* css-3 */\r\n	white-space: -moz-pre-wrap;  /* Mozilla */\r\n}\r\n		</pre>\r\n			\r\n	</div>\r\n</div>', '', 1, 5, 0, 34, '2007-12-19 05:00:00', 62, '', '2009-05-08 14:29:54', 62, 62, '2009-05-08 14:29:54', '2007-12-19 05:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=0\nshow_create_date=0\nshow_modify_date=0\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 137, 0, 5, '', '', 0, 2068, 'robots=\nauthor='),
(48, 'Dummy Content', 'dummy-content', '', 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.', '', 1, 5, 0, 34, '2007-12-19 05:00:00', 62, '', '2008-10-02 11:28:25', 62, 0, '0000-00-00 00:00:00', '2007-12-19 05:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 9, 0, 6, '', '', 0, 5953, 'robots=\nauthor=');
INSERT INTO `jos_content` (`id`, `title`, `alias`, `title_alias`, `introtext`, `fulltext`, `state`, `sectionid`, `mask`, `catid`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `images`, `urls`, `attribs`, `version`, `parentid`, `ordering`, `metakey`, `metadesc`, `access`, `hits`, `metadata`) VALUES
(58, 'Module Variations', 'module-variations', '', '<p>This template''s module system comes with a wide range of module styles, color variations, badges and icons. Below you can see which module styles come with color variations and with which badges and icons you can combine them.</p>\r\n\r\n<table cellspacing="0" cellpadding="0" border="0" class="listing">\r\n	<thead>\r\n		<tr>\r\n			<th align="left" width="25%">Styles</th>\r\n			<th align="left" width="45%">Colors</th>\r\n			<th align="center" width="30%">Combinable</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr class="odd">\r\n			<td class="bold">glow</td>\r\n			<td>white (default), templatecolor</td>\r\n			<td align="center">Badges/Icons</td>\r\n		</tr>\r\n		<tr class="even">\r\n			<td class="bold">box</td>\r\n			<td>white (default), highlight, dark, hover</td>\r\n			<td align="center">Badges/Icons</td>\r\n		</tr>\r\n		<tr class="odd">\r\n			<td class="bold">glass, embedded, separator</td>\r\n			<td>-</td>\r\n			<td align="center">Badges/Icons</td>\r\n		</tr>\r\n		<tr class="even">\r\n			<td class="bold">line, polaroid, postit</td>\r\n			<td>-</td>\r\n			<td align="center">-</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<table cellspacing="0" cellpadding="0" border="0" class="listing">\r\n	<thead>\r\n		<tr>\r\n			<th align="left" width="25%">Extras</th>\r\n			<th align="left" width="75%">Variations</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr class="odd">\r\n			<td class="bold">Badges</td>\r\n			<td>hot, new, top, pick</td>\r\n		</tr>\r\n		<tr class="even">\r\n			<td class="bold">Icons</td>\r\n			<td>download, users, feed, twitter, mail, message, shopping, lock</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', '', 1, 5, 0, 34, '2007-12-19 05:00:00', 62, '', '2010-07-22 14:20:07', 62, 0, '0000-00-00 00:00:00', '2007-12-19 05:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 40, 0, 3, '', '', 0, 3091, 'robots=\nauthor='),
(59, 'ZOO', 'zoo', '', '<p>\r\n<a rel="shadowbox;width=872;height=480" href="http://zoo.yootheme.com/images/stories/videos/zoo_20_video_tour.flv" style="float: right; display: block; margin-left: 10px;">\r\n<img height="105" width="250" alt="Take the video tour on the ZOO!" title="Take the video tour on the ZOO!" src="images/yootheme/zoo_video_tour.png"/>\r\n</a>ZOO is a flexible and powerful content application builder to manage your content. It offers a lot of cool features like nested categories, content arrangement via drag ''n drop, a clean JavaScript powered user interface and a native comments and tagging system.\r\n</p>\r\n\r\n<p class="readmore"><a href="http://zoo.yootheme.com/" class="readmore" target="_blank">Read more...</a></p>\r\n\r\n<h2>Apps for every Purpose</h2>\r\n\r\n<p>Apps are little extension for ZOO 2.0 which are optimized for different types of content catalogs like blogs, business directories and many more. ZOO 2.0 already has some basic apps on board to create websites and blogs. We developed an comprehensive app bundle to cover all kinds of purposes! All of them work out of the box and get you started right away! We will develop new apps in the near future for ZOO! Our range of apps will constantly grow.</p>\r\n\r\n<p class="readmore"><a href="http://zoo.yootheme.com/app-bundle" class="readmore" target="_blank">Read more...</a></p>\r\n\r\n<h2>Content Builder</h2>\r\n\r\n<p>One of the ZOO''s key features is the ability to create your very own custom content types. For each type you create you can select the elements the type should consist of, like text, images or a file download. Any combination is imaginable! You can also add and remove elements from a custom type at any time, even if you already created items of that type. The elements are completely pluggable and can easily be added to your custom app.</p>\r\n\r\n<p class="readmore"><a href="http://zoo.yootheme.com/content-builder" class="readmore" target="_blank">Read more...</a></p>', '', 1, 5, 0, 34, '2009-07-01 18:40:31', 62, '', '2010-05-27 14:49:20', 62, 0, '0000-00-00 00:00:00', '2009-07-01 18:40:31', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 9, 0, 2, '', '', 0, 303, 'robots=\nauthor='),
(73, 'YOOicons launched', 'icons', '', '<p>YOOtheme is a well-known template and extension provider who helps you to create professional websites. But to make your website or interface design a real eye-catcher we got one thing missing: Icons! Icons are an essential tool to simplify user interfaces. We complete this with our beautiful and handcrafted icon sets for web and print projects. We got commercial icon sets and free stuff. Enjoy browsing through all the icons at <a href="http://icons.yootheme.com/" target="_blank">our new icons website</a>!</p>\r\n\r\n<h2>Icon Club</h2>\r\n\r\n<p>You are looking for some high quality, royalty free, vector stock icons? Join the YOOtheme icon club! You will get full access to all our commercial icon sets which are currently available. Additionally you will also get access to all upcoming icon releases during the term of your membership. You can use our royalty free stock icons for as many clients or websites you wish.</p>\r\n\r\n<div style="background: #FAFAFA; border: 1px solid #C8C8C8; overflow:hidden; padding:10px;">\r\n	<img height="130" width="260" alt="Club Icon Sets" title="Club Icon Sets" src="images/yootheme/icons_club.jpg" style="float: left; margin-right: 15px;" />\r\n	<h3 style="margin-top: 0px;">Club Icon Sets</h3>\r\n	<p>All icon sets are available in the PNG file format and in 8 different standard sizes, ranging from 16x16 to 512x512 pixels. Each icon is handcrafted and optimized for each specific size. Vector PDF files of all icons are also available. They are compatible with Adobe Illustrator and can be rescaled to any size without a single loss to the details.</p>\r\n	<p class="readmore" style="margin-bottom: 0px;"><a href="http://icons.yootheme.com/index.php?option=com_content&amp;view=article&amp;id=5&amp;Itemid=16" class="readmore" target="_blank">Read more...</a></p>\r\n</div>\r\n\r\n<h2>Free Icon Sets</h2>\r\n\r\n<p>The free icon sets are also available in 32-bit transparency PNG and scaleable vector PDF format. They are designed to match with all our commercial icon sets.</p>\r\n\r\n<div style="background: #FAFAFA; border: 1px solid #C8C8C8; overflow:hidden; padding:10px;">\r\n	<img height="130" width="260" alt="Social Bookmarks Icon Set" title="Social Bookmarks Icon Set" src="images/yootheme/icons_freebies.jpg" style="float: left; margin-right: 15px;" />\r\n	<h3 style="margin-top: 0px;">Social Bookmarks Icon Set</h3>\r\n	<p>This free icon set contains 47 high quality social network icons. They are perfect for displaying your social bookmarks on your website or to link to external profiles and services.</p>\r\n	<p class="readmore" style="margin-bottom: 0px;"><a href="http://icons.yootheme.com/index.php?option=com_content&amp;view=article&amp;id=6&amp;Itemid=17" class="readmore" target="_blank">Read more...</a></p>\r\n</div>', '', 1, 5, 0, 34, '2009-07-01 18:40:31', 62, '', '2010-07-01 15:01:50', 62, 62, '2010-07-01 15:03:17', '2009-07-01 18:40:31', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=0\nshow_create_date=0\nshow_modify_date=0\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 25, 0, 1, '', '', 0, 170, 'robots=\nauthor='),
(74, 'Cookbook', 'cookbook', '', '<div style="text-align:center">\r\n	<a href="http://www.yootheme.com/blog/item/root/zoo-20-app-bundle" target="_blank">\r\n		<img class="correct-png" width="157" height="130" title="Cookbook" alt="Cookbook" src="images/yootheme/yooscroller/zoo_cookbook.png"/>\r\n	</a>\r\n	<div style="margin: auto; margin-top: -20px; font-size: 13px;">Cookbook</div>\r\n</div>', '', 1, 5, 0, 36, '2010-06-25 09:02:50', 62, '', '2010-07-20 17:10:38', 62, 0, '0000-00-00 00:00:00', '2010-06-25 09:02:50', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 6, 0, 6, '', '', 0, 0, 'robots=\nauthor='),
(75, 'Movie Database', 'movie-database', '', '<div style="text-align:center">\r\n	<a href="http://www.yootheme.com/blog/item/root/zoo-20-app-bundle" target="_blank">\r\n		<img class="correct-png" width="157" height="130" title="Movie Database" alt="Movie Database" src="images/yootheme/yooscroller/zoo_movie.png"/>\r\n	</a>\r\n	<div style="margin: auto; margin-top: -20px; font-size: 13px;">Movie Database</div>\r\n</div>', '', 1, 5, 0, 36, '2010-06-25 09:02:50', 62, '', '2010-07-20 17:10:33', 62, 0, '0000-00-00 00:00:00', '2010-06-25 09:02:50', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 5, 0, 5, '', '', 0, 0, 'robots=\nauthor='),
(76, 'Business Directory', 'business-directory', '', '<div style="text-align:center">\r\n	<a href="http://www.yootheme.com/blog/item/root/zoo-20-app-bundle" target="_blank">\r\n		<img class="correct-png" width="157" height="130" title="Business Directory" alt="Business Directory" src="images/yootheme/yooscroller/zoo_business.png"/>\r\n	</a>\r\n	<div style="margin: auto; margin-top: -20px; font-size: 13px;">Business Directory</div>\r\n</div>', '', 1, 5, 0, 36, '2010-06-25 09:02:50', 62, '', '2010-07-20 17:10:28', 62, 0, '0000-00-00 00:00:00', '2010-06-25 09:02:50', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 5, 0, 4, '', '', 0, 0, 'robots=\nauthor='),
(77, 'Download Archive', 'download-archive', '', '<div style="text-align:center">\r\n	<a href="http://www.yootheme.com/blog/item/root/zoo-20-app-bundle" target="_blank">\r\n		<img class="correct-png" width="157" height="130" title="Download Archive" alt="Download Archive" src="images/yootheme/yooscroller/zoo_download.png"/>\r\n	</a>\r\n	<div style="margin: auto; margin-top: -20px; font-size: 13px;">Download Archive</div>\r\n</div>', '', 1, 5, 0, 36, '2010-06-25 09:02:50', 62, '', '2010-07-20 17:10:24', 62, 0, '0000-00-00 00:00:00', '2010-06-25 09:02:50', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 7, 0, 3, '', '', 0, 0, 'robots=\nauthor='),
(78, 'Product Catalog', 'product-catalog', '', '<div style="text-align:center">\r\n	<a href="http://www.yootheme.com/blog/item/root/zoo-20-app-bundle" target="_blank">\r\n		<img class="correct-png" width="157" height="130" title="Product Catalog" alt="Product Catalog" src="images/yootheme/yooscroller/zoo_product.png"/>\r\n	</a>\r\n	<div style="margin: auto; margin-top: -20px; font-size: 13px;">Product Catalog</div>\r\n</div>', '', 1, 5, 0, 36, '2010-06-25 09:02:50', 62, '', '2010-07-20 17:10:14', 62, 0, '0000-00-00 00:00:00', '2010-06-25 09:02:50', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 4, 0, 2, '', '', 0, 0, 'robots=\nauthor='),
(79, 'Blog', 'blog', '', '<div style="text-align:center">\r\n	<a href="http://www.yootheme.com/blog/item/root/zoo-20-app-bundle" target="_blank">\r\n		<img class="correct-png" width="157" height="130" title="Blog" alt="Blog" src="images/yootheme/yooscroller/zoo_blog.png"/>\r\n	</a>\r\n	<div style="margin: auto; margin-top: -20px; font-size: 13px;">Blog</div>\r\n</div>', '', 1, 5, 0, 36, '2010-06-25 09:02:50', 62, '', '2010-07-20 17:10:19', 62, 0, '0000-00-00 00:00:00', '2010-06-25 09:02:50', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 6, 0, 1, '', '', 0, 0, 'robots=\nauthor='),
(80, 'Documentation', 'documentation', '', '<div style="text-align:center">\r\n	<a href="http://www.yootheme.com/blog/item/root/zoo-20-app-bundle" target="_blank">\r\n		<img class="correct-png" width="157" height="130" title="Documentation" alt="Documentation" src="images/yootheme/yooscroller/zoo_documentation.png"/>\r\n	</a>\r\n	<div style="margin: auto; margin-top: -20px; font-size: 13px;">Documentation</div>\r\n</div>', '', 1, 5, 0, 36, '2010-06-25 09:02:50', 62, '', '2010-07-20 17:10:44', 62, 0, '0000-00-00 00:00:00', '2010-06-25 09:02:50', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 7, '', '', 0, 0, 'robots=\nauthor='),
(81, 'Pages', 'pages', '', '<div style="text-align:center">\r\n	<a href="http://www.yootheme.com/blog/item/root/zoo-20-app-bundle" target="_blank">\r\n		<img class="correct-png" width="157" height="130" title="Pages" alt="Pages" src="images/yootheme/yooscroller/zoo_page.png"/>\r\n	</a>\r\n	<div style="margin: auto; margin-top: -20px; font-size: 13px;">Pages</div>\r\n</div>', '', 1, 5, 0, 36, '2010-06-25 09:02:50', 62, '', '2010-07-20 17:10:48', 62, 0, '0000-00-00 00:00:00', '2010-06-25 09:02:50', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 8, '', '', 0, 0, 'robots=\nauthor=');

-- --------------------------------------------------------

--
-- Table structure for table `jos_content_frontpage`
--

CREATE TABLE IF NOT EXISTS `jos_content_frontpage` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_content_frontpage`
--

INSERT INTO `jos_content_frontpage` (`content_id`, `ordering`) VALUES
(23, 6),
(5, 5),
(1, 1),
(27, 4),
(19, 2),
(18, 3);

-- --------------------------------------------------------

--
-- Table structure for table `jos_content_rating`
--

CREATE TABLE IF NOT EXISTS `jos_content_rating` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `rating_sum` int(11) unsigned NOT NULL DEFAULT '0',
  `rating_count` int(11) unsigned NOT NULL DEFAULT '0',
  `lastip` varchar(150) NOT NULL DEFAULT '',
  PRIMARY KEY (`content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_content_rating`
--


-- --------------------------------------------------------

--
-- Table structure for table `jos_core_acl_aro`
--

CREATE TABLE IF NOT EXISTS `jos_core_acl_aro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `section_value` varchar(240) NOT NULL DEFAULT '0',
  `value` varchar(240) NOT NULL DEFAULT '',
  `order_value` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `hidden` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `__section_value_value_aro` (`section_value`(100),`value`(100)),
  KEY `jos_gacl_hidden_aro` (`hidden`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `jos_core_acl_aro`
--

INSERT INTO `jos_core_acl_aro` (`id`, `section_value`, `value`, `order_value`, `name`, `hidden`) VALUES
(10, 'users', '62', 0, 'Administrator', 0);

-- --------------------------------------------------------

--
-- Table structure for table `jos_core_acl_aro_groups`
--

CREATE TABLE IF NOT EXISTS `jos_core_acl_aro_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `lft` int(11) NOT NULL DEFAULT '0',
  `rgt` int(11) NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
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
  `acl_id` int(11) NOT NULL DEFAULT '0',
  `section_value` varchar(230) NOT NULL DEFAULT '0',
  `value` varchar(100) NOT NULL,
  PRIMARY KEY (`acl_id`,`section_value`,`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_core_acl_aro_map`
--


-- --------------------------------------------------------

--
-- Table structure for table `jos_core_acl_aro_sections`
--

CREATE TABLE IF NOT EXISTS `jos_core_acl_aro_sections` (
  `section_id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(230) NOT NULL DEFAULT '',
  `order_value` int(11) NOT NULL DEFAULT '0',
  `name` varchar(230) NOT NULL DEFAULT '',
  `hidden` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`section_id`),
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
  `group_id` int(11) NOT NULL DEFAULT '0',
  `section_value` varchar(240) NOT NULL DEFAULT '',
  `aro_id` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `group_id_aro_id_groups_aro_map` (`group_id`,`section_value`,`aro_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_core_acl_groups_aro_map`
--

INSERT INTO `jos_core_acl_groups_aro_map` (`group_id`, `section_value`, `aro_id`) VALUES
(25, '', 10);

-- --------------------------------------------------------

--
-- Table structure for table `jos_core_log_items`
--

CREATE TABLE IF NOT EXISTS `jos_core_log_items` (
  `time_stamp` date NOT NULL DEFAULT '0000-00-00',
  `item_table` varchar(50) NOT NULL DEFAULT '',
  `item_id` int(11) unsigned NOT NULL DEFAULT '0',
  `hits` int(11) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_core_log_items`
--


-- --------------------------------------------------------

--
-- Table structure for table `jos_core_log_searches`
--

CREATE TABLE IF NOT EXISTS `jos_core_log_searches` (
  `search_term` text NOT NULL,
  `hits` int(11) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_core_log_searches`
--


-- --------------------------------------------------------

--
-- Table structure for table `jos_groups`
--

CREATE TABLE IF NOT EXISTS `jos_groups` (
  `id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `name` varchar(150) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
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
-- Table structure for table `jos_menu`
--

CREATE TABLE IF NOT EXISTS `jos_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menutype` varchar(225) DEFAULT NULL,
  `name` text,
  `alias` varchar(255) NOT NULL DEFAULT '',
  `link` text,
  `type` varchar(150) NOT NULL DEFAULT '',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `parent` int(11) unsigned NOT NULL DEFAULT '0',
  `componentid` int(11) unsigned NOT NULL DEFAULT '0',
  `sublevel` int(11) DEFAULT '0',
  `ordering` int(11) DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `pollid` int(11) NOT NULL DEFAULT '0',
  `browserNav` tinyint(4) DEFAULT '0',
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `utaccess` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `lft` int(11) unsigned NOT NULL DEFAULT '0',
  `rgt` int(11) unsigned NOT NULL DEFAULT '0',
  `home` int(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `componentid` (`componentid`,`menutype`,`published`,`access`),
  KEY `menutype` (`menutype`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=201 ;

--
-- Dumping data for table `jos_menu`
--

INSERT INTO `jos_menu` (`id`, `menutype`, `name`, `alias`, `link`, `type`, `published`, `parent`, `componentid`, `sublevel`, `ordering`, `checked_out`, `checked_out_time`, `pollid`, `browserNav`, `access`, `utaccess`, `params`, `lft`, `rgt`, `home`) VALUES
(1, 'mainmenu', 'Joomla || subline possible', 'joomla', 'index.php?option=com_content&view=frontpage', 'component', 0, 0, 20, 0, 6, 62, '2010-07-12 12:35:37', 0, 0, 0, 3, 'num_leading_articles=1\nnum_intro_articles=6\nnum_columns=1\nnum_links=4\norderby_pri=\norderby_sec=front\nmulti_column_order=1\nshow_pagination=2\nshow_pagination_results=1\nshow_feed_link=1\nshow_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=Welcome to the Frontpage\nshow_page_title=0\npageclass_sfx=columnwidth-200\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(135, 'mainmenu', 'Category List', 'category-list', 'index.php?option=com_content&view=category&id=29', 'component', 1, 156, 20, 2, 4, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'display_num=10\nshow_headings=1\nshow_date=1\ndate_format=\nfilter=1\nfilter_type=title\norderby_sec=\nshow_pagination=1\nshow_pagination_limit=1\nshow_feed_link=1\nshow_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(136, 'mainmenu', 'Section List', 'section-list', 'index.php?option=com_content&view=section&id=4', 'component', 1, 156, 20, 2, 3, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_description=1\nshow_description_image=1\nshow_categories=1\nshow_empty_categories=0\nshow_cat_num_articles=1\nshow_category_description=1\norderby=\norderby_sec=\nshow_feed_link=1\nshow_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(11, 'othermenu', 'Joomla! Home', 'joomla-home', 'http://www.joomla.org', 'url', 1, 0, 0, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 3, 'menu_image=-1\n\n', 0, 0, 0),
(12, 'othermenu', 'Joomla! Forums', 'joomla-forums', 'http://forum.joomla.org', 'url', 1, 0, 0, 0, 2, 0, '0000-00-00 00:00:00', 0, 0, 0, 3, 'menu_image=-1\n\n', 0, 0, 0),
(13, 'othermenu', 'Joomla! Help', 'joomla-help', 'http://help.joomla.org', 'url', 1, 0, 0, 0, 3, 0, '0000-00-00 00:00:00', 0, 0, 0, 3, 'menu_image=-1\n\n', 0, 0, 0),
(20, 'usermenu', 'Your Details', 'your-details', 'index.php?option=com_user&view=user&task=edit', 'component', 1, 0, 14, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 1, 3, '', 0, 0, 0),
(24, 'usermenu', 'Logout', 'logout', 'index.php?option=com_user&view=login', 'component', 1, 0, 14, 0, 4, 0, '0000-00-00 00:00:00', 0, 0, 1, 3, '', 0, 0, 0),
(90, 'othermenu', 'Level 2', 'level-2', 'index.php?option=com_content&view=article&id=48', 'component', 1, 89, 20, 1, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(134, 'mainmenu', 'Section Blog', 'section-blog', 'index.php?option=com_content&view=section&layout=blog&id=4', 'component', 1, 156, 20, 2, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_description=1\nshow_description_image=1\nnum_leading_articles=1\nnum_intro_articles=4\nnum_columns=2\nnum_links=4\norderby_pri=\norderby_sec=order\nmulti_column_order=1\nshow_pagination=2\nshow_pagination_results=1\nshow_feed_link=1\nshow_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=1\nlink_section=\nshow_category=1\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(171, 'mainmenu', 'ZOO', 'zoo', 'index.php?option=com_content&view=article&id=59', 'component', 0, 0, 20, 0, 4, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=columns-2 columnwidth-225\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(86, 'mainmenu', 'Separator || separator', 'separator', '', 'separator', 0, 0, 0, 0, 7, 62, '2008-07-08 10:39:29', 0, 0, 0, 0, 'menu_image=-1\n\n', 0, 0, 0),
(87, 'mainmenu', 'Level 2', 'level-2', 'index.php?option=com_content&view=article&id=48', 'component', 1, 86, 20, 1, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=0\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(88, 'mainmenu', 'Level 2', 'level-2', 'index.php?option=com_content&view=article&id=48', 'component', 1, 86, 20, 1, 2, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=0\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(89, 'othermenu', 'Sample Levels', 'deeper-levels-examples', 'index.php?option=com_content&view=article&id=48', 'component', 1, 0, 20, 0, 4, 62, '2007-12-21 16:40:26', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(48, 'mainmenu', 'Web Links', 'web-links', 'index.php?option=com_weblinks&view=categories', 'component', 1, 158, 4, 2, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'image=-1\nimage_align=right\nshow_feed_link=1\nshow_comp_description=1\ncomp_description=\nshow_link_hits=1\nshow_link_description=1\nshow_other_cats=1\nshow_headings=1\ntarget=\nlink_icons=\npage_title=Weblinks\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(49, 'mainmenu', 'News Feeds', 'news-feeds', 'index.php?option=com_newsfeeds&view=categories', 'component', 1, 158, 11, 2, 3, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_limit=1\nshow_comp_description=1\ncomp_description=\nimage=-1\nimage_align=right\nshow_headings=1\nshow_name=1\nshow_articles=1\nshow_link=1\nshow_cat_description=1\nshow_cat_items=1\nshow_feed_image=1\nshow_feed_description=1\nshow_item_description=1\nfeed_word_count=0\npage_title=Newsfeeds\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(145, 'mainmenu', 'Category Blog', 'category-blog', 'index.php?option=com_content&view=category&layout=blog&id=29', 'component', 1, 156, 20, 2, 2, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_description=1\nshow_description_image=1\nnum_leading_articles=1\nnum_intro_articles=4\nnum_columns=2\nnum_links=4\norderby_pri=\norderby_sec=order\nmulti_column_order=1\nshow_pagination=2\nshow_pagination_results=1\nshow_feed_link=1\nshow_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=1\nlink_section=\nshow_category=1\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(51, 'usermenu', 'Submit an Article', 'submit-an-article', 'index.php?option=com_content&view=article&layout=form', 'component', 1, 0, 20, 0, 2, 0, '0000-00-00 00:00:00', 0, 0, 1, 0, '', 0, 0, 0),
(52, 'usermenu', 'Submit a Web Link', 'submit-a-web-link', 'index.php?option=com_weblinks&view=weblink&layout=form', 'component', 1, 0, 4, 0, 3, 0, '0000-00-00 00:00:00', 0, 0, 1, 0, '', 0, 0, 0),
(53, 'mainmenu', 'Page', 'page', 'index.php?option=com_zoo&view=frontpage', 'component', 0, 0, 35, 0, 2, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'application=11\npage_title=\nshow_page_title=0\npageclass_sfx=columns-2 columnwidth-200 custom-nobox\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(195, 'mainmenu', 'Gradient Blue', 'gradient-blue', 'index.php?option=com_zoo&view=frontpage&Itemid=53&preset=gradientblue', 'url', 1, 53, 0, 1, 2, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=icon_gradientblue.png\n\n', 0, 0, 0),
(194, 'mainmenu', 'Retro Paper', 'retro-paper', 'index.php?option=com_zoo&view=frontpage&Itemid=53&preset=retropaper', 'url', 1, 53, 0, 1, 9, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=icon_retropaper.png\n\n', 0, 0, 0),
(54, 'mainmenu', 'Template', 'template', 'index.php?option=com_content&view=article&id=45', 'component', 0, 0, 20, 0, 3, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=0\npageclass_sfx=columnwidth-310\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
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
(193, 'mainmenu', 'Icons', 'icons', 'index.php?option=com_content&view=article&id=73', 'component', 0, 0, 20, 0, 5, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(196, 'mainmenu', 'Gradient Business', 'gradient-business', 'index.php?option=com_zoo&view=frontpage&Itemid=53&preset=gradientbusiness', 'url', 1, 53, 0, 1, 8, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=icon_gradientbusiness.png\n\n', 0, 0, 0),
(197, 'mainmenu', 'Gradient Red', 'gradient-red', 'index.php?option=com_zoo&view=frontpage&Itemid=53&preset=gradientred', 'url', 1, 53, 0, 1, 10, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=icon_gradientred.png\n\n', 0, 0, 0),
(198, 'mainmenu', 'Gradient Ribbon', 'gradient-ribbon', 'index.php?option=com_zoo&view=frontpage&Itemid=53&preset=gradientribbon', 'url', 1, 53, 0, 1, 12, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=icon_gradientribbon.png\n\n', 0, 0, 0),
(199, 'mainmenu', 'Gradient Space', 'gradient-space', 'index.php?option=com_zoo&view=frontpage&Itemid=53&preset=gradientspace', 'url', 1, 53, 0, 1, 5, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=icon_gradientspace.png\n\n', 0, 0, 0),
(200, 'mainmenu', 'Home', 'home', 'index.php?option=com_zoo&view=frontpage', 'component', 1, 0, 35, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'application=11\npage_title=\nshow_page_title=0\npageclass_sfx=columns-2 columnwidth-200 custom-nobox\nmenu_image=-1\nsecure=-1\n\n', 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `jos_menu_types`
--

CREATE TABLE IF NOT EXISTS `jos_menu_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menutype` varchar(225) NOT NULL DEFAULT '',
  `title` text NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`),
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
  `message_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id_from` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id_to` int(10) unsigned NOT NULL DEFAULT '0',
  `folder_id` int(10) unsigned NOT NULL DEFAULT '0',
  `date_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `state` int(11) NOT NULL DEFAULT '0',
  `priority` int(1) unsigned NOT NULL DEFAULT '0',
  `subject` text NOT NULL,
  `message` text NOT NULL,
  PRIMARY KEY (`message_id`),
  KEY `useridto_state` (`user_id_to`,`state`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `jos_messages`
--


-- --------------------------------------------------------

--
-- Table structure for table `jos_messages_cfg`
--

CREATE TABLE IF NOT EXISTS `jos_messages_cfg` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cfg_name` text NOT NULL,
  `cfg_value` text NOT NULL,
  UNIQUE KEY `idx_user_var_name` (`user_id`,`cfg_name`(100))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_messages_cfg`
--


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
  PRIMARY KEY (`itemid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_migration_backlinks`
--


-- --------------------------------------------------------

--
-- Table structure for table `jos_modules`
--

CREATE TABLE IF NOT EXISTS `jos_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `content` text NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `position` varchar(150) DEFAULT NULL,
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `module` varchar(150) DEFAULT NULL,
  `numnews` int(11) NOT NULL DEFAULT '0',
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `showtitle` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `params` text NOT NULL,
  `iscore` tinyint(4) NOT NULL DEFAULT '0',
  `client_id` tinyint(4) NOT NULL DEFAULT '0',
  `control` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `published` (`published`,`access`),
  KEY `newsfeeds` (`module`,`published`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=250 ;

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
(19, 'Latest News', '', 0, 'maintop', 0, '0000-00-00 00:00:00', 1, 'mod_latestnews', 0, 0, 1, 'count=5\nordering=c_dsc\nuser_id=0\nshow_front=1\nsecid=\ncatid=\nmoduleclass_sfx=\ncache=1\ncache_time=900\n\n', 1, 0, ''),
(20, 'Statistics', '', 14, 'left', 0, '0000-00-00 00:00:00', 0, 'mod_stats', 0, 0, 0, 'serverinfo=1\nsiteinfo=1\ncounter=1\nincrease=0\nmoduleclass_sfx=\ncache=0\ncache_time=900\n\n', 0, 0, ''),
(21, 'Who''s Online', '', 6, 'right', 62, '2010-07-20 17:30:50', 0, 'mod_whosonline', 0, 0, 1, 'cache=0\nshowmode=0\nmoduleclass_sfx=style-box color-highlight\n\n', 0, 0, ''),
(22, 'Popular', '', 2, 'maintop', 0, '0000-00-00 00:00:00', 1, 'mod_mostread', 0, 0, 1, 'moduleclass_sfx=\nshow_front=1\ncount=5\ncatid=\nsecid=\ncache=1\ncache_time=900\n\n', 0, 0, ''),
(23, 'Archive', '', 15, 'left', 0, '0000-00-00 00:00:00', 0, 'mod_archive', 0, 0, 1, 'count=10\nmoduleclass_sfx=\ncache=1\n\n', 1, 0, ''),
(24, 'Sections', '', 16, 'left', 0, '0000-00-00 00:00:00', 0, 'mod_sections', 0, 0, 1, 'count=5\nmoduleclass_sfx=\ncache=1\ncache_time=900\n\n', 1, 0, ''),
(25, 'Newsflash', '', 1, 'content9', 0, '0000-00-00 00:00:00', 1, 'mod_newsflash', 0, 0, 0, 'catid=49\nlayout=vert\nimage=1\nlink_titles=\nreadmore=1\nitem_title=1\nitems=4\nmoduleclass_sfx=\ncache=0\ncache_time=900\n\n', 0, 0, ''),
(26, 'Related Items', '', 17, 'left', 0, '0000-00-00 00:00:00', 0, 'mod_related_items', 0, 0, 1, '', 0, 0, ''),
(27, 'Search', '', 1, 'search', 0, '0000-00-00 00:00:00', 0, 'mod_search', 0, 0, 0, 'moduleclass_sfx=\nwidth=20\ntext=\nbutton=1\nbutton_pos=right\nimagebutton=\nbutton_text=\ncache=1\ncache_time=900\n\n', 0, 0, ''),
(28, 'Random Image', '', 7, 'left', 0, '0000-00-00 00:00:00', 0, 'mod_random_image', 0, 0, 1, 'type=jpg\nfolder=\nlink=\nwidth=\nheight=\nmoduleclass_sfx=\ncache=0\ncache_time=900\n\n', 0, 0, ''),
(29, 'Top Menu', '', 1, 'toolbarleft', 0, '0000-00-00 00:00:00', 0, 'mod_mainmenu', 0, 0, 0, 'menutype=topmenu\nmenu_style=list\nstartLevel=0\nendLevel=0\nshowAllChildren=0\nwindow_open=\nshow_whitespace=0\ncache=0\ntag_id=\nclass_sfx=\nmoduleclass_sfx=menu\nmaxdepth=10\nmenu_images=0\nmenu_images_align=0\nmenu_images_link=0\nexpand_menu=0\nactivate_parent=0\nfull_active_id=0\nindent_image=0\nindent_image1=-1\nindent_image2=-1\nindent_image3=-1\nindent_image4=-1\nindent_image5=-1\nindent_image6=-1\nspacer=\nend_spacer=\n\n', 1, 0, ''),
(30, 'Banners', '', 1, 'banner', 62, '2009-03-05 14:19:19', 0, 'mod_banners', 0, 0, 0, 'target=1\ncount=1\ncid=1\ncatid=33\ntag_search=0\nordering=random\nheader_text=\nfooter_text=\nmoduleclass_sfx=\ncache=1\ncache_time=15\n\n', 1, 0, ''),
(32, 'Wrapper', '', 18, 'left', 0, '0000-00-00 00:00:00', 0, 'mod_wrapper', 0, 0, 1, '', 0, 0, ''),
(33, 'Footer', '', 3, 'footer', 0, '0000-00-00 00:00:00', 0, 'mod_footer', 0, 0, 0, 'cache=1\n\n', 1, 0, ''),
(34, 'Feed Display', '', 19, 'left', 0, '0000-00-00 00:00:00', 0, 'mod_feed', 0, 0, 1, '', 1, 0, ''),
(35, 'Breadcrumbs', '', 1, 'breadcrumbs', 0, '0000-00-00 00:00:00', 1, 'mod_breadcrumbs', 0, 0, 1, 'showHome=1\nhomeText=Home\nshowLast=1\nseparator=\nmoduleclass_sfx=\ncache=0\n\n', 1, 0, ''),
(36, 'Syndication', '', 6, 'left', 0, '0000-00-00 00:00:00', 0, 'mod_syndicate', 0, 0, 0, 'cache=0\ntext=Feed Entries\nformat=rss\nmoduleclass_sfx=\n\n', 1, 0, ''),
(42, 'Sub Menu', '', 12, 'right', 62, '2010-07-20 17:27:07', 0, 'mod_mainmenu', 0, 0, 1, 'menutype=mainmenu\nmenu_style=list\nstartLevel=1\nendLevel=5\nshowAllChildren=0\nwindow_open=\nshow_whitespace=0\ncache=0\ntag_id=\nclass_sfx=menu-accordion images-off\nmoduleclass_sfx=style-menu\nmaxdepth=10\nmenu_images=0\nmenu_images_align=0\nmenu_images_link=0\nexpand_menu=0\nactivate_parent=0\nfull_active_id=0\nindent_image=0\nindent_image1=\nindent_image2=\nindent_image3=\nindent_image4=\nindent_image5=\nindent_image6=\nspacer=\nend_spacer=\n\n', 0, 0, ''),
(177, 'Footer Menu', '', 1, 'footer', 0, '0000-00-00 00:00:00', 0, 'mod_mainmenu', 0, 0, 0, 'menutype=topmenu\nmenu_style=list\nstartLevel=0\nendLevel=0\nshowAllChildren=0\nwindow_open=\nshow_whitespace=0\ncache=0\ntag_id=\nclass_sfx=\nmoduleclass_sfx=menu\nmaxdepth=10\nmenu_images=0\nmenu_images_align=0\nmenu_images_link=0\nexpand_menu=0\nactivate_parent=0\nfull_active_id=0\nindent_image=0\nindent_image1=-1\nindent_image2=-1\nindent_image3=-1\nindent_image4=-1\nindent_image5=-1\nindent_image6=-1\nspacer=\nend_spacer=\n\n', 0, 0, ''),
(41, 'Welcome to Joomla!', '<div style="padding: 5px"><p>Congratulations on choosing Joomla! as your content management system. We hope you are able to create a successful Web site with our program and maybe you will be able to give something back to the community later.</p><p>To make your start with Joomla! as smooth as possible, we want to give you some pointers to documentation, common questions and help on securing your server. A good place to start is the &quot;<a href="http://forum.joomla.org/index.php/topic,47524.0.html" target="_blank">Absolute Beginners Guide to Joomla!</a>&quot;.</p><p>For your most common questions the best place to start looking for answers is the <a href="http://help.joomla.org/component/option,com_easyfaq/Itemid,268/" target="_blank">Frequently Asked Questions (FAQ)</a> area.  If you are stuck on a particular screen in the Administration area of Joomla! (which is where you are now), then try clicking on the Help toolbar button which you will find on almost all screens.  This will take you to a page about that screen on our <a href="http://help.joomla.org" target="_blank">Help Site</a>.  If you still have questions then take a look on our <a href="http://forum.joomla.org" target="_blank">forum</a> which is most likely the biggest resource on Joomla! there is and you will find almost every question answered at least once, so please try using the search function before asking your question.</p><p>Security is a big concern for us, which is why we would like you to subscribe to the <a href="http://forum.joomla.org/index.php/board,8.0.html" target="_blank">announcement forum</a> (by clicking on the Notify button) to always get the latest information on new releases for Joomla! You should also read the <a href="http://help.joomla.org/component/option,com_easyfaq/task,view/id,167/Itemid,268/" target="_blank">Joomla! Administrator''s Security Checklist</a> and regularly check the <a href="http://forum.joomla.org/index.php/board,267.0.html" target="_blank">security forum</a>.</p><p>We hope you have much fun and success with Joomla! and hope to see you in the forum among the hundreds and thousands of contributors.</p><p>Your Joomla! team.<img alt="Smile" border="0" src="../plugins/editors/tinymce/jscripts/tiny_mce/plugins/emotions/images/smiley-smile.gif" title="Smile" /></p><p>P.S.: To remove this message, delete the &quot;Welcome to Joomla!&quot; Module in the Administrator screen of the Module Manager (on the Extensions menu).  Here is a <a href="index.php?option=com_modules&amp;client=1">quick link</a> to this screen.</p></div>', 1, 'cpanel', 0, '0000-00-00 00:00:00', 1, 'mod_custom', 0, 2, 1, 'moduleclass_sfx=\n\n', 1, 1, ''),
(46, 'YOOlogin (Default)', '', 1, 'content1', 0, '0000-00-00 00:00:00', 1, 'mod_yoo_login', 0, 0, 0, 'style=default\npretext=\nposttext=\nlogin=\nlogout=\ngreeting=1\ntext_mode=input\nlogin_button=icon\nlogout_button=text\nauto_remember=1\nlost_password=1\nlost_username=1\nregistration=1\nmoduleclass_sfx=\ncache=0\ncache_time=900\n\n', 0, 0, ''),
(51, 'Dogear', '<div style="position: absolute;	z-index: 20; top: 0px; left: 0px; width: 135px; height: 135px;">\r\n	<a href="http://www.yootheme.com" target="_blank" title="YOOtheme"><img class="correct-png" style="width: 135px; height: 135px;" src="images/yootheme/absolute_yoodogear.png" alt="YOOtheme" /></a>\r\n</div>', 1, 'absolute', 0, '0000-00-00 00:00:00', 0, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=\n\n', 0, 0, ''),
(52, 'SLIDE PHOTO KEGIATAN', '<p>Lorem ipsum dolor sit amet. Used Module Class Suffix: <em class="box">style-box </em>Lorem ipsum dolor sit amet. Used Module Class Suffix: <em class="box">style-box</em></p>', 0, 'contenttop', 0, '0000-00-00 00:00:00', 1, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=\n\n', 0, 0, ''),
(53, 'Content Top 2', 'Lorem ipsum dolor sit amet. Used Module Class Suffix: <em class="box">style-box</em>', 3, 'contenttop', 0, '0000-00-00 00:00:00', 1, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=\n\n', 0, 0, ''),
(156, 'Validating Code', '<p>This template validates to XHTML and CSS web standards and is designed to be compatible with all modern browsers.</p>\r\n<p>\r\n  <img class="correct-png" style="margin-right: 10px" src="images/yootheme/browser_firefox.png" alt="Firefox 3.0+" title="Firefox 3.0+" width="20" height="20" />\r\n  <img class="correct-png" style="margin-right: 10px" src="images/yootheme/browser_ie7.png" alt="Internet Explorer 7+" title="Internet Explorer 7+" width="20" height="20" />\r\n  <img class="correct-png" style="margin-right: 10px" src="images/yootheme/browser_safari.png" alt="Safari 3.1+" title="Safari 3.1+" width="20" height="20" />\r\n  <img class="correct-png" style="margin-right: 10px" src="images/yootheme/browser_opera.png" alt="Opera 9.5+" title="Opera 9.5+" width="20" height="20" />\r\n  <img class="correct-png" style="margin-right: 10px" src="images/yootheme/browser_camino.png" alt="Camino 1.0+" title="Camino 1.0+" width="20" height="20" />\r\n  <img class="correct-png" style="margin-right: 10px" src="images/yootheme/browser_konqueror.png" alt="Konqueror" title="Konqueror" width="20" height="20" />\r\n  <img class="correct-png" style="margin-right: 10px" src="images/yootheme/browser_chrome.png" alt="Chrome 1.0+" title="Chrome 1.0+" width="20" height="20" />\r\n</p>', 11, 'right', 62, '2010-07-20 17:29:04', 0, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=\n\n', 0, 0, ''),
(155, 'Javascript Library', 'All client side effects use the JavaScript framework <a href="http://www.mootools.net" target="_blank">MooTools</a> which offers most reliable functionality and compact size!', 10, 'right', 62, '2010-07-20 17:29:08', 0, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=\n\n', 0, 0, ''),
(56, 'Login || module position', '', 2, 'menu', 0, '0000-00-00 00:00:00', 0, 'mod_yoo_login', 0, 0, 0, 'style=niftyquick\npretext=\nposttext=\nlogin=\nlogout=\ngreeting=1\ntext_mode=input\nlogin_button=icon\nlogout_button=icon\nauto_remember=1\nlost_password=1\nlost_username=1\nregistration=1\nmoduleclass_sfx=dropdownwidth-310\ncache=0\ncache_time=900\n\n', 0, 0, ''),
(57, 'PROFILE YAYASAN', '<p>Lorem ipsum dolor sit amet. Used Module Class Suffix: <em class="box">style-box</em> Lorem ipsum dolor sit amet. Used Module Class Suffix: <em class="box">style-box</em></p>', 0, 'contentbottom', 0, '0000-00-00 00:00:00', 1, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=style-box\n\n', 0, 0, ''),
(58, 'Skyscraper', '', 2, 'banner', 0, '0000-00-00 00:00:00', 0, 'mod_custom', 0, 0, 0, 'moduleclass_sfx=\n\n', 0, 0, ''),
(243, 'PRODUCT USAHA', '<p>Lorem ipsum dolor sit amet. Used Module Class Suffix: <em class="box">style-box</em></p>', 0, 'contentright', 0, '0000-00-00 00:00:00', 1, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=style-box\n\n', 0, 0, ''),
(59, 'Content Bottom 2', 'Lorem ipsum dolor sit amet. Used Module Class Suffix: <em class="box">style-box</em>', 2, 'contentbottom', 0, '0000-00-00 00:00:00', 1, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=style-box\n\n', 0, 0, ''),
(61, 'MTs AL-IKHLAS', '<p>Lorem ipsum dolor sit amet. Used Module Class Suffix: <em class="box">style-embedded</em></p>', 0, 'bottom', 0, '0000-00-00 00:00:00', 1, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=style-box\n\n', 0, 0, ''),
(62, 'TAMAN KANAK-KANAK', '<p>Lorem ipsum dolor sit amet. Used Module Class Suffix: <em class="box">style-embedded</em></p>', 0, 'bottom', 0, '0000-00-00 00:00:00', 1, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=style-box\n\n', 0, 0, ''),
(176, 'ZOO 2.0', '<a href="http://zoo.yootheme.com" target="_blank" style="display: block; text-align: center;">\r\n<img class="correct-png" src="images/yootheme/icon_zoo.png" alt="A flexible and powerful content application builder to manage your content" title="A flexible and powerful content application builder to manage your content" width="140" height="130" />\r\n</a>\r\n<p>A flexible and powerful content application builder to manage your content. Get <a href="http://zoo.yootheme.com" target="_blank">ZOO 2.0</a>.</p>', 8, 'right', 0, '0000-00-00 00:00:00', 0, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=style-box\n\n', 0, 0, ''),
(63, 'MADRASAH DINIYAH', '<p>Lorem ipsum dolor sit amet. Used Module Class Suffix: <em class="box">style-embedded</em></p>', 0, 'bottom', 0, '0000-00-00 00:00:00', 1, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=style-box\n\n', 0, 0, ''),
(64, 'Bottom  4', 'Lorem ipsum dolor sit amet sed tempor. Used Module Class Suffix: <em class="box">style-embedded</em>', 12, 'bottom', 0, '0000-00-00 00:00:00', 1, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=\n\n', 0, 0, ''),
(68, 'Left 1', 'Lorem ipsum dolor sit amet. Used Module Class Suffix: <em class="box">style-line</em> <em class="box">color-highlight</em> <em class="box">icon-mail</em>', 11, 'left', 0, '0000-00-00 00:00:00', 1, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=style-box color-highlight icon-mail\n\n', 0, 0, ''),
(180, 'Polaroid', 'Lorem ipsum dolor sit amet consect adipisic elit. Used Module Class Suffix: style-polaroid', 13, 'left', 0, '0000-00-00 00:00:00', 1, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=style-polaroid\n\n', 0, 0, ''),
(181, 'Post It', 'Lorem ipsum dolor sit amet consect adipisic elit. Used Module Class Suffix: style-postit', 12, 'contentright', 0, '0000-00-00 00:00:00', 1, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=style-postit\n\n', 0, 0, ''),
(182, 'Left 2', 'Lorem ipsum dolor sit amet. Used Module Class Suffix: <em class="box">style-line</em> <em class="box">color-dark</em> <em class="box">icon-twitter</em>', 12, 'left', 0, '0000-00-00 00:00:00', 1, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=style-box color-dark icon-twitter\n\n', 0, 0, ''),
(89, 'Top Block || Sub Title', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Used Module Class Suffix: <em class="box">style-glass</em>', 0, 'topblock', 0, '0000-00-00 00:00:00', 1, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=style-glass\n\n', 0, 0, ''),
(72, 'Logo', '<a class="logo-icon correct-png" href="index.php" title="Home"></a>', 0, 'logo', 0, '0000-00-00 00:00:00', 0, 'mod_custom', 0, 0, 0, 'moduleclass_sfx=\n\n', 0, 0, ''),
(136, 'Sample Flags', '<p><img class="correct-png" src="images/yootheme/toolbar_flags.png" border="0" alt="Languages" width="123" height="15" style="margin-top: 6px;" /></p>', 0, 'toolbarright', 0, '0000-00-00 00:00:00', 0, 'mod_custom', 0, 0, 0, 'moduleclass_sfx=\n\n', 0, 0, ''),
(73, 'Content Right 2', 'Lorem ipsum dolor sit amet. Used Module Class Suffix: <em class="box">style-line</em>', 10, 'contentright', 0, '0000-00-00 00:00:00', 1, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=style-line\n\n', 0, 0, ''),
(75, 'Top 1', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do. Used Module Class Suffix: <em class="box">style-glow</em> <em class="box">badge-hot</em>', 11, 'top', 0, '0000-00-00 00:00:00', 1, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=style-glow badge-hot\n\n', 0, 0, ''),
(76, 'Top 2', 'Lorem ipsum dolor sit amet. Used Module Class Suffix: <em class="box">style-glow</em> <em class="box">badge-new</em>', 12, 'top', 0, '0000-00-00 00:00:00', 1, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=style-glow badge-new\n\n', 0, 0, ''),
(77, 'Top 3', 'Lorem ipsum dolor sit amet. Used Module Class Suffix: <em class="box">style-glow</em> <em class="box">color-templatecolor</em> <em class="box">badge-pick</em>', 13, 'top', 0, '0000-00-00 00:00:00', 1, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=style-glow color-templatecolor badge-pick\n\n', 0, 0, ''),
(78, 'Top 4', 'Lorem ipsum dolor sit amet sed tempor. Used Module Class Suffix: <em class="box">style-glow</em> <em class="box">color-templatecolor</em> <em class="box">badge-top</em>', 14, 'top', 0, '0000-00-00 00:00:00', 1, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=style-glow color-templatecolor badge-top\n\n', 0, 0, ''),
(121, 'Bottom (YOOtools)', '<a href="http://tools.yootheme.com" target="_blank" style="display: block; text-align: center; padding-top: 5px;">\r\n  <img class="correct-png" src="images/yootheme/bottom_yootools.png" alt="Visit the YOOtools website!" title="Visit the YOOtools website!" width="127" height="35" />\r\n</a>', 6, 'bottom', 0, '0000-00-00 00:00:00', 0, 'mod_custom', 0, 0, 0, 'moduleclass_sfx=\n\n', 0, 0, ''),
(122, 'Warp5 Framework', 'This template is based on the fast and powerful Warp5 framework. We provide a comprehensive documentation how everything work.\r\n\r\n<p class="readmore"><a class="readmore" href="http://warp.yootheme.com/documentation" target="_blank">Take a look...</a></p>', 2, 'right', 0, '0000-00-00 00:00:00', 0, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=\n\n', 0, 0, ''),
(123, 'Module System', 'The module system provides a clear grid for Joomla modules and a wide diversity of templates for module variations.\r\n\r\n<p class="readmore"><a class="readmore" href="http://warp.yootheme.com/module-system" target="_blank">Read more...</a></p>', 5, 'right', 0, '0000-00-00 00:00:00', 0, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=\n\n', 0, 0, ''),
(82, 'Footer', 'Validates to <a href="http://validator.w3.org/check?uri=http://demo.yootheme.com/aug10" target="_blank">XHTML 1.0</a> and <a href="http://jigsaw.w3.org/css-validator/validator?uri=http://demo.yootheme.com/aug10&amp;profile=css3" target="_blank">CSS 3</a><br/>\r\nCopyright &copy; 2010 <a href="http://www.yootheme.com" target="_blank">YOOtheme</a>', 2, 'footer', 0, '0000-00-00 00:00:00', 0, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=\n\n', 0, 0, ''),
(83, 'Main Top 1', 'Lorem ipsum dolor sit amet, consectetur. Used Module Class Suffix: <em class="box">style-box</em> <em class="box">icon-lock</em>', 3, 'maintop', 0, '0000-00-00 00:00:00', 1, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=style-box icon-lock\n\n', 0, 0, ''),
(158, 'Bottom (ZOO)', '<a href="http://zoo.yootheme.com" target="_blank" style="display: block; text-align: center; padding-top: 5px;">\r\n  <img class="correct-png" src="images/yootheme/bottom_zoo.png" alt="Visit the ZOO website!" title="Visit the ZOO website!" width="58" height="35" />\r\n</a>', 7, 'bottom', 0, '0000-00-00 00:00:00', 0, 'mod_custom', 0, 0, 0, 'moduleclass_sfx=\n\n', 0, 0, ''),
(87, 'Other Menu', '', 4, 'contentright', 0, '0000-00-00 00:00:00', 1, 'mod_mainmenu', 0, 0, 1, 'menutype=othermenu\nmenu_style=list\nstartLevel=0\nendLevel=5\nshowAllChildren=0\nwindow_open=\nshow_whitespace=0\ncache=0\ntag_id=\nclass_sfx=menu-accordion\nmoduleclass_sfx=style-menu\nmaxdepth=10\nmenu_images=0\nmenu_images_align=0\nmenu_images_link=0\nexpand_menu=0\nactivate_parent=0\nfull_active_id=0\nindent_image=0\nindent_image1=\nindent_image2=\nindent_image3=\nindent_image4=\nindent_image5=\nindent_image6=\nspacer=\nend_spacer=\n\n', 0, 0, ''),
(84, 'Main Top 2', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt. Used Module Class Suffix: <em class="box">style-box</em> <em class="box">icon-download</em>', 4, 'maintop', 0, '0000-00-00 00:00:00', 1, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=style-box icon-download\n\n', 0, 0, ''),
(85, 'Main Bottom 1', '<p>Lorem ipsum dolor sit amet, consectetur. Used Module Class Suffix: <em class="box">style-box</em> <em class="box">icon-message</em></p>', 0, 'mainbottom', 0, '0000-00-00 00:00:00', 0, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=style-box icon-message\n\n', 0, 0, ''),
(86, 'Main Bottom 2', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt. Used Module Class Suffix: <em class="box">style-box</em> <em class="box">icon-users</em></p>', 2, 'mainbottom', 0, '0000-00-00 00:00:00', 0, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=style-box icon-users\n\n', 0, 0, ''),
(117, 'YOOcarousel (Frontpage)', '', 6, 'top', 0, '0000-00-00 00:00:00', 0, 'mod_yoo_carousel', 0, 0, 0, 'catid=35\nstyle=slideshow\nmodule_width=800\nmodule_height=250\ntab_width=200\nautoplay=once\nslide_interval=6000\ntransition_duration=300\ntransition_effect=crossfade\ncontrol_panel=none\nrotate_action=mouseover\nrotate_duration=300\nrotate_effect=crossfade\nbuttons=1\norder=o_asc\nreadmore=0\nitems=10\nmoduleclass_sfx=style-blank\ncache=0\ncache_time=900\n\n', 0, 0, ''),
(91, 'Bottom Block', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Used Module Class Suffix: <em class="box">style-glow</em>', 0, 'bottomblock', 0, '0000-00-00 00:00:00', 1, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=style-glow\n\n', 0, 0, ''),
(175, 'Teamlog', '<a href="http://teamlog.yootheme.com" target="_blank" style="display: block; text-align: center;">\r\n<img class="correct-png" src="images/yootheme/icon_teamlog.png" alt="Web based Time Tracking Solution for Joomla! 1.5 focused on simplicity" title="Web based Time Tracking Solution for Joomla! 1.5 focused on simplicity" width="140" height="150" />\r\n</a>\r\n<p>Web based Time Tracking Solution for Joomla! 1.5 focused on simplicity. Get the <a href="http://teamlog.yootheme.com" target="_blank">Teamlog extension</a> for free.</p>', 9, 'right', 0, '0000-00-00 00:00:00', 0, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=style-box color-dark\n\n', 0, 0, ''),
(125, 'YOOsearch', '', 2, 'search', 0, '0000-00-00 00:00:00', 0, 'mod_yoo_search', 0, 0, 0, 'style=default\nbox_width=280\nchar_limit=130\nres_limit=6\ncat_limit=6\ncategories={cat\\ntitle=[YOOtheme]\\nimage=[yootheme/yoosearch/yootheme.png]\\nurl=[http://www.yootheme.com]\\nkeywords=[yootheme, template, templates, themes, theme]\\n}The YOOtheme template club for Joomla 1.0 and 1.5 offers stylish templates with professional Web 2.0 features.{/cat}\\n\\n{cat\\ntitle=[YOOtools]\\nimage=[yootheme/yoosearch/yootools.png]\\nurl=[http://www.yootools.com]\\nkeywords=[yootheme, yootools, features, feature, yoospotlight, yooreflection, yoolightbox, yoocarousel, yooaccordion, yooslider, yoodrawer, yooscroller, yoomaps, yoosearch, yooeffects, yootoppanel, yoologin, yootooltip, yoosnapshots, spotlight, reflection, lightbox, carousel, accordion, slider, drawer, scroller, maps, search, effects, toppanel, login, tooltip, snapshots]}The YOOtools are new YOOtheme extensions for Joomla 1.0 and 1.5. Exclusive YOOtheme modules, compontent and plugins!{/cat}\\n\\n{cat\\ntitle=[Typography]\\nurl=[index.php?option=com_content&view=article&id=46&Itemid=55]\\nimage=[yootheme/yoosearch/typography.png]\\nkeywords=[typography, joomla, style, stylings, HTML, tag]\\n}Take a look at the typography, the style guide and learn all about the possible HTML tag stylings of this YOOtheme templates.{/cat}\\n\\n{cat\\ntitle=[Layout]\\nimage=[yootheme/yoosearch/layout.png]\\nurl=[index.php?option=com_content&view=article&id=47&Itemid=56]\\nkeywords=[layout, joomla, module, position, positions, variation, variations]\\n}Take a look at the layout options and all possible module positions and variations of this YOOtheme template.{/cat}\\n\\n{cat\\ntitle=[Joomla]\\nimage=[yootheme/yoosearch/joomla.png]\\nurl=[index.php?option=com_content&view=frontpage&Itemid=1]\\nkeywords=[joomla]\\n}Take a look at how this YOOtheme template styles the Joomla core articles, components and modules.{/cat}\nmoduleclass_sfx=-blank\ncache=0\ncache_time=900\n\n', 0, 0, ''),
(118, 'Bottom (YOOtheme)', '<a href="http://www.yootheme.com" target="_blank" style="display: block; text-align: center; padding-top: 5px;">\r\n  <img class="correct-png" src="images/yootheme/bottom_yootheme.png" alt="Visit the YOOtheme website!" title="Visit the YOOtheme website!" width="150" height="35" />\r\n</a>', 5, 'bottom', 0, '0000-00-00 00:00:00', 0, 'mod_custom', 0, 0, 0, 'moduleclass_sfx=\n\n', 0, 0, ''),
(124, 'Menu System', 'The menu system enhances Joomla''s menu functions to create clearly arranged interfaces even for comprehensive sites.\r\n\r\n<p class="readmore"><a class="readmore" href="http://warp.yootheme.com/menu-system" target="_blank">Read more...</a></p>', 4, 'right', 0, '0000-00-00 00:00:00', 0, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=\n\n', 0, 0, ''),
(134, 'YOOiecheck', '', 2, 'absolute', 0, '0000-00-00 00:00:00', 1, 'mod_yoo_iecheck', 0, 0, 0, 'message=You are using Internet Explorer 6. Please upgrade your browser to increase safety and your browsing experience. Choose one of the following links to download a modern browser:\nfirefox=1\nsafari=1\nopera=1\nie=1\nmoduleclass_sfx=-blank\n\n', 0, 0, ''),
(151, 'Fireworks Files', '<div style="overflow: hidden;">\r\n<img height="40" width="42" align="right" src="/YOOtheme/Templates/Next/Website/images/yootheme/top_fireworks.png" alt="Fully sliced Fireworks .png files" title="Fully sliced Fireworks .png files" style="margin-left: 10px;" class="correct-png"/>Fully sliced Fireworks PNGs for customizations.\r\n</div>', 6, 'maintop', 0, '0000-00-00 00:00:00', 0, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=\n\n', 0, 0, ''),
(150, 'YOOtools', '<div style="overflow: hidden">\r\n<img class="correct-png" style="margin-left: 10px;" width="55" height="42" align="right" title="Native version for Joomla 1.5" alt="Native version for Joomla 1.5" src="images/yootheme/top_yootools.png" />This template is fully compatible with all <a href="http://www.yootools.com" target="_blank">YOOtools</a>\r\n</div>', 7, 'maintop', 0, '0000-00-00 00:00:00', 0, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=\n\n', 0, 0, ''),
(178, 'Feeds', '<a class="twitter" title="Follow us on Twitter" href="http://twitter.com/yootheme" target="_blank"><img height="25" width="25" alt="Follow us on Twitter" src="images/yootheme/toolbar_twitter.png" class="correct-png" /></a>\r\n<a class="rss" title="Subscribe to our RSS feed" href="http://www.yootheme.com/rss" target="_blank"><img height="25" width="25" alt="Subscribe to our RSS feed" src="images/yootheme/toolbar_feed.png" class="correct-png" /></a>', 0, 'toolbarright', 0, '0000-00-00 00:00:00', 0, 'mod_custom', 0, 0, 0, 'moduleclass_sfx=\n\n', 0, 0, ''),
(168, 'Latest Tweet', '', 0, 'headerright', 0, '0000-00-00 00:00:00', 0, 'mod_yoo_tweet', 0, 0, 0, 'style=single\nfrom_user=yootheme\nto_user=\nref_user=\nhashtag=\nword=\nimage=0\nauthor=0\ndate=0\nimage_size=42\nnum_tweets=5\nmoduleclass_sfx=style-headerbar\ncache=0\ncache_time=15\n\n', 0, 0, ''),
(183, 'Frontpage Menu', '', 1, 'right', 0, '0000-00-00 00:00:00', 0, 'mod_mainmenu', 0, 0, 1, 'menutype=frontpagemenu\nmenu_style=list\nstartLevel=0\nendLevel=0\nshowAllChildren=0\nwindow_open=\nshow_whitespace=0\ncache=0\ntag_id=\nclass_sfx=menu-accordion\nmoduleclass_sfx=style-menu\nmaxdepth=10\nmenu_images=0\nmenu_images_align=0\nmenu_images_link=0\nexpand_menu=0\nactivate_parent=0\nfull_active_id=0\nindent_image=0\nindent_image1=\nindent_image2=\nindent_image3=\nindent_image4=\nindent_image5=\nindent_image6=\nspacer=\nend_spacer=\n\n', 0, 0, ''),
(170, 'Content Left', 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.', 1, 'contentleft', 62, '2010-05-25 12:46:04', 0, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=\n\n', 0, 0, ''),
(171, 'Content Right 1', 'Lorem ipsum dolor sit amet. Used Module Class Suffix: <em class="box">style-line</em>', 9, 'contentright', 0, '0000-00-00 00:00:00', 1, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=\n\n', 0, 0, ''),
(228, 'Frontpage Movie', '<a href="http://zoo.yootheme.com/app-bundle/movie" target="_blank" style="display: block; text-align: center; text-decoration: none;">\r\n	<img src="images/yootheme/home_zoo_movie.png" width="100" height="85" alt="Create great review resource of your favorite movies" title="Create great review resource of your favorite movies" />\r\n	<span style="display: block; font-size: 16px; line-height: 18px; text-transform: uppercase; margin-top: 5px;">Movie<br />Database</span>\r\n</a>', 4, 'top', 0, '0000-00-00 00:00:00', 0, 'mod_custom', 0, 0, 0, 'moduleclass_sfx=style-glass\n\n', 0, 0, ''),
(202, 'ZOO Item', '', 7, 'contentright', 0, '0000-00-00 00:00:00', 1, 'mod_zooitem', 0, 0, 1, 'theme=list-v\nlayout=default\nmedia_position=left\napplication=1\nmode=types\ncategory=\ntype=article\nitem_id=0\nsubcategories=0\ncount=4\norder=alpha\nmenu_item=187\nmoduleclass_sfx=\n\n', 0, 0, ''),
(203, 'ZOO Comment', '', 8, 'contentright', 0, '0000-00-00 00:00:00', 1, 'mod_zoocomment', 0, 0, 1, 'theme=bubble-angled-vl\napplication=1\ncategory=\nsubcategories=1\ncount=4\nshow_avatar=1\navatar_size=40\nshow_author=1\nshow_meta=1\nmoduleclass_sfx=\n\n', 0, 0, ''),
(204, 'ZOO Tag', '', 5, 'contentright', 0, '0000-00-00 00:00:00', 1, 'mod_zootag', 0, 0, 1, 'theme=cloud\napplication=1\ncount=10\norder=alpha\nmenu_item=187\nmoduleclass_sfx=\n\n', 0, 0, ''),
(190, 'ZOO Not Included', '<div class="alert">The displayed content is part of the app bundle for ZOO 2.0 and only shown for demonstration purpose. The app bundle is NOT included when purchasing this template. However you can download ZOO 2.0 at <a href="http://zoo.yootheme.com" target="_blank">http://zoo.yootheme.com</a>.</div>', 2, 'topblock', 62, '2010-06-25 09:36:50', 1, 'mod_custom', 0, 0, 0, 'moduleclass_sfx=style-blank\n\n', 0, 0, ''),
(191, 'Content Right 3', 'Lorem ipsum dolor sit amet. Used Module Class Suffix: <em class="box">style-line</em>', 11, 'contentright', 0, '0000-00-00 00:00:00', 1, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=\n\n', 0, 0, ''),
(205, 'ZOO Category', '', 6, 'contentright', 0, '0000-00-00 00:00:00', 1, 'mod_zoocategory', 0, 0, 1, 'theme=flatlist\napplication=1\ncategory=\ndepth=0\nmenu_item=187\nmoduleclass_sfx=\n\n', 0, 0, ''),
(212, 'ZOO 2.0 News', '<ul class="links" style="margin: 0;">\r\n<li><a href="http://www.yootheme.com/blog/item/root/zoo-20-beta-released" target="_blank">Complete feature list</a></li>\r\n<li><a href="http://www.yootheme.com/blog/item/root/native-comments-for-zoo-20" target="_blank">Native comment system</a></li>\r\n<li><a href="http://www.yootheme.com/blog/item/root/zoo-20-frequently-asked-questions" target="_blank">Frequently Asked Questions</a></li>\r\n<li><a href="http://www.yootheme.com/blog/item/root/zoo-20-element-updates" target="_blank">Element Updates</a></li>\r\n<li><a href="http://www.yootheme.com/blog/item/root/zoo-20-usability" target="_blank">Usability Improvements</a></li>\r\n<li><a href="http://www.yootheme.com/blog/item/root/the-zoo-20-app-concept" target="_blank">The App Concept</a></li>\r\n<li><a href="http://www.yootheme.com/blog/item/root/announcing-zoo-20" target="_blank">Announcing ZOO 2.0</a></li>\r\n</ul>', 3, 'right', 62, '2010-07-20 17:28:30', 0, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=\n\n', 0, 0, ''),
(214, 'Bottom (Warp)', '<a href="http://warp.yootheme.com" target="_blank" style="display: block; text-align: center; padding-top: 5px;">\r\n  <img class="correct-png" src="images/yootheme/bottom_warp.png" alt="Visit the Warp5 website!" title="Visit the Warp5 website!" width="91" height="35" />\r\n</a>', 8, 'bottom', 0, '0000-00-00 00:00:00', 0, 'mod_custom', 0, 0, 0, 'moduleclass_sfx=\n\n', 0, 0, ''),
(224, 'Native Tools for ZOO', '', 5, 'top', 0, '0000-00-00 00:00:00', 1, 'mod_yoo_scroller', 0, 0, 0, 'catid=36\nstyle=blank-h\nmodule_width=798\nmodule_height=180\nslide_size=159\nslide_interval=4000\nautoplay=1\norder=o_asc\nreadmore=0\nitems=8\nmoduleclass_sfx=style-glass\ncache=0\ncache_time=900\n\n', 0, 0, ''),
(225, 'Frontpage Cookbook', '<a href="http://zoo.yootheme.com/app-bundle/cookbook" target="_blank" style="display: block; text-align: center; text-decoration: none;">\r\n	<img src="images/yootheme/home_zoo_cookbook.png" width="100" height="85" alt="Create a great online Cookbook" title="Create a great online Cookbook" />\r\n	<span style="display: block; font-size: 16px; line-height: 18px; text-transform: uppercase; margin-top: 5px;">Online<br />Cookbook</span>\r\n</a>', 3, 'top', 0, '0000-00-00 00:00:00', 0, 'mod_custom', 0, 0, 0, 'moduleclass_sfx=style-glass\n\n', 0, 0, ''),
(226, 'Frontpage Business', '<a href="http://zoo.yootheme.com/app-bundle/business" target="_blank" style="display: block; text-align: center; text-decoration: none;">\r\n	<img src="images/yootheme/home_zoo_business.png" width="100" height="85" alt="Manage companies and their employees" title="Manage companies and their employees" />\r\n	<span style="display: block; font-size: 16px; line-height: 18px; text-transform: uppercase; margin-top: 5px;">Business<br />Directory</span>\r\n</a>', 2, 'top', 0, '0000-00-00 00:00:00', 0, 'mod_custom', 0, 0, 0, 'moduleclass_sfx=style-glass\n\n', 0, 0, ''),
(227, 'Frontpage Product', '<a href="http://zoo.yootheme.com/app-bundle/product" target="_blank" style="display: block; text-align: center; text-decoration: none;">\r\n	<img src="images/yootheme/home_zoo_product.png" width="100" height="85" alt="Clearly arranged catalog with many built-in features" title="Clearly arranged catalog with many built-in features" />\r\n	<span style="display: block; font-size: 16px; line-height: 18px; text-transform: uppercase; margin-top: 5px;">Product<br />Catalog</span>\r\n</a>', 0, 'top', 0, '0000-00-00 00:00:00', 0, 'mod_custom', 0, 0, 0, 'moduleclass_sfx=style-glass\n\n', 0, 0, ''),
(238, 'High quality icon sets', '<ul class="hoverbox" style="margin: 0;">\r\n<li>\r\n	<a href="http://icons.yootheme.com/icon-club#set6" target="_blank">\r\n		<span class="title">Homepage Icon Set</span>\r\n		<span class="subtitle">16 icons released in July 2010</span>\r\n	</a>\r\n</li>\r\n<li>\r\n	<a href="http://icons.yootheme.com/icon-club#set5" target="_blank">\r\n		<span class="title">Contact Icon Set</span>\r\n		<span class="subtitle">10 icons released in July 2010</span>\r\n	</a>\r\n</li>\r\n<li>\r\n	<a href="http://icons.yootheme.com/icon-club#set4" target="_blank">\r\n		<span class="title">Community Icon Set</span>\r\n		<span class="subtitle">12 icons released in July 2010</span>\r\n	</a>\r\n</li>\r\n<li>\r\n	<a href="http://icons.yootheme.com/icon-club#set3" target="_blank">\r\n		<span class="title">Actions Icon Set</span>\r\n		<span class="subtitle">16 icons released in July 2010</span>\r\n	</a>\r\n</li>\r\n<li>\r\n	<a href="http://icons.yootheme.com/icon-club#set2" target="_blank">\r\n		<span class="title">Symbols Icon Set</span>\r\n		<span class="subtitle">24 icons released in July 2010</span>\r\n	</a>\r\n</li>\r\n</ul>', 7, 'right', 0, '0000-00-00 00:00:00', 0, 'mod_custom', 0, 0, 0, 'moduleclass_sfx=\n\n', 0, 0, ''),
(239, 'Icon Set Homepage', '<a href="http://icons.yootheme.com/icon-club#set6" target="_blank" style="display: block; text-align: center; text-decoration: none;">\r\n	<img src="images/yootheme/icons_set06.png" width="128" height="85" alt="Homepage Icon Set" />\r\n	<span style="display: block; font-size: 16px; line-height: 18px; text-transform: uppercase; margin-top: 5px;">Homepage<br />Icon Set</span>\r\n</a>', 7, 'top', 0, '0000-00-00 00:00:00', 1, 'mod_custom', 0, 0, 0, 'moduleclass_sfx=style-glow color-templatecolor\n\n', 0, 0, ''),
(240, 'Icon Set Community', '<a href="http://icons.yootheme.com/icon-club#set4" target="_blank" style="display: block; text-align: center; text-decoration: none;">\r\n	<img src="images/yootheme/icons_set04.png" width="128" height="85" alt="Community Icon Set" />\r\n	<span style="display: block; font-size: 16px; line-height: 18px; text-transform: uppercase; margin-top: 5px;">Community<br />Icon Set</span>\r\n</a>', 8, 'top', 0, '0000-00-00 00:00:00', 1, 'mod_custom', 0, 0, 0, 'moduleclass_sfx=style-glow color-templatecolor\n\n', 0, 0, ''),
(241, 'Icon Set Actions', '<a href="http://icons.yootheme.com/icon-club#set3" target="_blank" style="display: block; text-align: center; text-decoration: none;">\r\n	<img src="images/yootheme/icons_set03.png" width="128" height="85" alt="Actions Icon Set" />\r\n	<span style="display: block; font-size: 16px; line-height: 18px; text-transform: uppercase; margin-top: 5px;">Actions<br />Icon Set</span>\r\n</a>', 9, 'top', 0, '0000-00-00 00:00:00', 1, 'mod_custom', 0, 0, 0, 'moduleclass_sfx=style-glow color-templatecolor\n\n', 0, 0, ''),
(242, 'Icon Set Symbols', '<a href="http://icons.yootheme.com/icon-club#set2" target="_blank" style="display: block; text-align: center; text-decoration: none;">\r\n	<img src="images/yootheme/icons_set02.png" width="128" height="85" alt="Symbols Icon Set" />\r\n	<span style="display: block; font-size: 16px; line-height: 18px; text-transform: uppercase; margin-top: 5px;">Symbols<br />Icon Set</span>\r\n</a>', 10, 'top', 0, '0000-00-00 00:00:00', 1, 'mod_custom', 0, 0, 0, 'moduleclass_sfx=style-glow color-templatecolor\n\n', 0, 0, ''),
(244, 'PRODUCT USAHA', '<p>Lorem ipsum dolor sit amet. Used Module Class Suffix: <em class="box">style-box</em></p>', 2, 'contentright', 0, '0000-00-00 00:00:00', 1, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=style-box\n\n', 0, 0, ''),
(248, 'Content Bottom1', '<p>Lorem ipsum dolor sit amet. Used Module Class Suffix: <em class="box">style-box</em></p>', 0, 'contentbottom', 0, '0000-00-00 00:00:00', 1, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=style-box\n\n', 0, 0, ''),
(249, 'Footer', '<p>Lorem ipsum dolor sit amet. Used Module Class Suffix: <em class="box">style-box</em></p>', 0, 'footer', 0, '0000-00-00 00:00:00', 1, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=style-box\n\n', 0, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `jos_modules_menu`
--

CREATE TABLE IF NOT EXISTS `jos_modules_menu` (
  `moduleid` int(11) NOT NULL DEFAULT '0',
  `menuid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`moduleid`,`menuid`)
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
(19, 1),
(21, 53),
(22, 1),
(25, 0),
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
(51, 0),
(52, 200),
(53, 58),
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
(75, 58),
(76, 58),
(77, 58),
(78, 58),
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
(89, 58),
(91, 58),
(117, 53),
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
(190, 185),
(190, 186),
(190, 188),
(190, 189),
(190, 190),
(190, 191),
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
(227, 53),
(228, 53),
(238, 53),
(239, 193),
(240, 193),
(241, 193),
(242, 193),
(243, 200),
(244, 200),
(248, 53),
(248, 58),
(249, 200);

-- --------------------------------------------------------

--
-- Table structure for table `jos_newsfeeds`
--

CREATE TABLE IF NOT EXISTS `jos_newsfeeds` (
  `catid` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `alias` varchar(255) NOT NULL DEFAULT '',
  `link` text NOT NULL,
  `filename` varchar(200) DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `numarticles` int(11) unsigned NOT NULL DEFAULT '1',
  `cache_time` int(11) unsigned NOT NULL DEFAULT '3600',
  `checked_out` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `rtl` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `element` text NOT NULL,
  `folder` varchar(100) NOT NULL DEFAULT '',
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `published` tinyint(3) NOT NULL DEFAULT '0',
  `iscore` tinyint(3) NOT NULL DEFAULT '0',
  `client_id` tinyint(3) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_folder` (`published`,`client_id`,`access`,`folder`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=39 ;

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
(16, 'Content - Load Module', 'loadmodule', 'content', 0, 6, 1, 0, 0, 0, '0000-00-00 00:00:00', 'enabled=1\nstyle=0\n\n'),
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
(38, 'System - Mootools Upgrade', 'mtupgrade', 'system', 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '');

-- --------------------------------------------------------

--
-- Table structure for table `jos_polls`
--

CREATE TABLE IF NOT EXISTS `jos_polls` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `alias` varchar(255) NOT NULL DEFAULT '',
  `voters` int(9) NOT NULL DEFAULT '0',
  `checked_out` int(11) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `access` int(11) NOT NULL DEFAULT '0',
  `lag` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pollid` int(11) NOT NULL DEFAULT '0',
  `text` text NOT NULL,
  `hits` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
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
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `vote_id` int(11) NOT NULL DEFAULT '0',
  `poll_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
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
  `pollid` int(11) NOT NULL DEFAULT '0',
  `menuid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pollid`,`menuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_poll_menu`
--


-- --------------------------------------------------------

--
-- Table structure for table `jos_sections`
--

CREATE TABLE IF NOT EXISTS `jos_sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `name` text NOT NULL,
  `alias` varchar(255) NOT NULL DEFAULT '',
  `image` text NOT NULL,
  `scope` varchar(50) NOT NULL DEFAULT '',
  `image_position` varchar(90) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `count` int(11) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_scope` (`scope`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `jos_sections`
--

INSERT INTO `jos_sections` (`id`, `title`, `name`, `alias`, `image`, `scope`, `image_position`, `description`, `published`, `checked_out`, `checked_out_time`, `ordering`, `access`, `count`, `params`) VALUES
(4, 'Joomla!', '', 'joomla', 'powered_by.png', 'content', 'right', 'As with previous releases, Joomla! provides a unified and easy-to-use framework for delivering content for Web sites of all kinds. To support the changing nature of the Internet and emerging Web technologies, Joomla! required substantial restructuring of its core functionality and we also used this effort to simplify many challenges within the current user interface. Joomla! 1.5 has many new features.', 1, 0, '0000-00-00 00:00:00', 1, 0, 21, ''),
(5, 'YOOtheme', '', 'yootheme', '', 'content', 'left', '', 1, 0, '0000-00-00 00:00:00', 2, 0, 25, '');

-- --------------------------------------------------------

--
-- Table structure for table `jos_session`
--

CREATE TABLE IF NOT EXISTS `jos_session` (
  `username` varchar(150) DEFAULT '',
  `time` varchar(14) DEFAULT '',
  `session_id` varchar(200) NOT NULL DEFAULT '0',
  `guest` tinyint(4) DEFAULT '1',
  `userid` int(11) DEFAULT '0',
  `usertype` varchar(150) DEFAULT '',
  `gid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `client_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `data` longtext,
  PRIMARY KEY (`session_id`(64)),
  KEY `whosonline` (`guest`,`usertype`),
  KEY `userid` (`userid`),
  KEY `time` (`time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_session`
--

INSERT INTO `jos_session` (`username`, `time`, `session_id`, `guest`, `userid`, `usertype`, `gid`, `client_id`, `data`) VALUES
('', '1314368200', '5163c8a67bcdea5d3f258d1347f9c5ac', 1, 0, '', 0, 0, '__default|a:7:{s:22:"session.client.browser";s:63:"Mozilla/5.0 (Windows NT 6.1; rv:6.0) Gecko/20100101 Firefox/6.0";s:15:"session.counter";i:39;s:8:"registry";O:9:"JRegistry":3:{s:17:"_defaultNameSpace";s:7:"session";s:9:"_registry";a:1:{s:7:"session";a:1:{s:4:"data";O:8:"stdClass":1:{s:15:"_current_preset";s:7:"default";}}}s:7:"_errors";a:0:{}}s:4:"user";O:5:"JUser":20:{s:2:"id";i:0;s:4:"name";N;s:8:"username";N;s:5:"email";N;s:8:"password";N;s:14:"password_clear";s:0:"";s:8:"usertype";N;s:5:"block";N;s:9:"sendEmail";i:0;s:3:"gid";i:0;s:12:"registerDate";N;s:13:"lastvisitDate";N;s:10:"activation";N;s:6:"params";N;s:3:"aid";i:0;s:5:"guest";i:1;s:7:"_params";O:10:"JParameter":7:{s:4:"_raw";s:0:"";s:4:"_xml";N;s:9:"_elements";a:0:{}s:12:"_elementPath";a:1:{i:0;s:59:"C:\\xampp\\htdocs\\156\\libraries\\joomla\\html\\parameter\\element";}s:17:"_defaultNameSpace";s:8:"_default";s:9:"_registry";a:1:{s:8:"_default";a:1:{s:4:"data";O:8:"stdClass":0:{}}}s:7:"_errors";a:0:{}}s:9:"_errorMsg";N;s:7:"_errors";a:0:{}s:10:"superadmin";b:0;}s:19:"session.timer.start";i:1314366000;s:18:"session.timer.last";i:1314368169;s:17:"session.timer.now";i:1314368200;}'),
('admin', '1314368196', 'bb316bc4b74320112d3e7c797f642697', 0, 62, 'Super Administrator', 25, 1, '__default|a:8:{s:15:"session.counter";i:147;s:19:"session.timer.start";i:1314366834;s:18:"session.timer.last";i:1314368196;s:17:"session.timer.now";i:1314368196;s:22:"session.client.browser";s:63:"Mozilla/5.0 (Windows NT 6.1; rv:6.0) Gecko/20100101 Firefox/6.0";s:8:"registry";O:9:"JRegistry":3:{s:17:"_defaultNameSpace";s:7:"session";s:9:"_registry";a:6:{s:7:"session";a:1:{s:4:"data";O:8:"stdClass":7:{s:23:"com_modulesfilter_order";s:10:"m.position";s:27:"com_modulesfilter_order_Dir";s:0:"";s:23:"com_modulesfilter_state";s:0:"";s:26:"com_modulesfilter_position";s:6:"footer";s:22:"com_modulesfilter_type";s:1:"0";s:26:"com_modulesfilter_assigned";s:1:"0";s:17:"com_modulessearch";s:0:"";}}s:11:"application";a:1:{s:4:"data";O:8:"stdClass":1:{s:4:"lang";s:0:"";}}s:10:"com_cpanel";a:1:{s:4:"data";O:8:"stdClass":1:{s:9:"mtupgrade";O:8:"stdClass":1:{s:7:"checked";b:1;}}}s:9:"com_menus";a:1:{s:4:"data";O:8:"stdClass":2:{s:8:"menutype";s:8:"mainmenu";s:8:"mainmenu";O:8:"stdClass":6:{s:12:"filter_order";s:10:"m.ordering";s:16:"filter_order_Dir";s:3:"ASC";s:12:"filter_state";s:0:"";s:10:"limitstart";i:0;s:10:"levellimit";s:2:"10";s:6:"search";s:0:"";}}}s:6:"global";a:1:{s:4:"data";O:8:"stdClass":1:{s:4:"list";O:8:"stdClass":1:{s:5:"limit";s:2:"20";}}}s:11:"com_modules";a:1:{s:4:"data";O:8:"stdClass":1:{s:10:"limitstart";i:0;}}}s:7:"_errors";a:0:{}}s:4:"user";O:5:"JUser":19:{s:2:"id";s:2:"62";s:4:"name";s:13:"Administrator";s:8:"username";s:5:"admin";s:5:"email";s:15:"admin@admin.com";s:8:"password";s:65:"51e52746bed66a2131fe8c99b33774ad:21YCp6UKbSvOz6cPZs1C0mP3NfDUhv0J";s:14:"password_clear";s:0:"";s:8:"usertype";s:19:"Super Administrator";s:5:"block";s:1:"0";s:9:"sendEmail";s:1:"1";s:3:"gid";s:2:"25";s:12:"registerDate";s:19:"2011-08-24 14:32:40";s:13:"lastvisitDate";s:19:"2011-08-26 09:12:58";s:10:"activation";s:0:"";s:6:"params";s:0:"";s:3:"aid";i:2;s:5:"guest";i:0;s:7:"_params";O:10:"JParameter":7:{s:4:"_raw";s:0:"";s:4:"_xml";N;s:9:"_elements";a:0:{}s:12:"_elementPath";a:1:{i:0;s:59:"C:\\xampp\\htdocs\\156\\libraries\\joomla\\html\\parameter\\element";}s:17:"_defaultNameSpace";s:8:"_default";s:9:"_registry";a:1:{s:8:"_default";a:1:{s:4:"data";O:8:"stdClass":0:{}}}s:7:"_errors";a:0:{}}s:9:"_errorMsg";N;s:7:"_errors";a:0:{}}s:13:"session.token";s:32:"433d5c27a459e9528d835f9906165091";}');

-- --------------------------------------------------------

--
-- Table structure for table `jos_stats_agents`
--

CREATE TABLE IF NOT EXISTS `jos_stats_agents` (
  `agent` varchar(255) NOT NULL DEFAULT '',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `hits` int(11) unsigned NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_stats_agents`
--


-- --------------------------------------------------------

--
-- Table structure for table `jos_templates_menu`
--

CREATE TABLE IF NOT EXISTS `jos_templates_menu` (
  `template` text NOT NULL,
  `menuid` int(11) NOT NULL DEFAULT '0',
  `client_id` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`menuid`,`client_id`,`template`(255))
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `username` varchar(150) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  `usertype` varchar(75) NOT NULL DEFAULT '',
  `block` tinyint(4) NOT NULL DEFAULT '0',
  `sendEmail` tinyint(4) DEFAULT '0',
  `gid` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `registerDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lastvisitDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `activation` varchar(100) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usertype` (`usertype`),
  KEY `idx_name` (`name`(255)),
  KEY `gid_block` (`gid`,`block`),
  KEY `username` (`username`),
  KEY `email` (`email`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=63 ;

--
-- Dumping data for table `jos_users`
--

INSERT INTO `jos_users` (`id`, `name`, `username`, `email`, `password`, `usertype`, `block`, `sendEmail`, `gid`, `registerDate`, `lastvisitDate`, `activation`, `params`) VALUES
(62, 'Administrator', 'admin', 'admin@admin.com', '51e52746bed66a2131fe8c99b33774ad:21YCp6UKbSvOz6cPZs1C0mP3NfDUhv0J', 'Super Administrator', 0, 1, 25, '2011-08-24 14:32:40', '2011-08-26 13:54:07', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `jos_weblinks`
--

CREATE TABLE IF NOT EXISTS `jos_weblinks` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `catid` int(11) NOT NULL DEFAULT '0',
  `sid` int(11) NOT NULL DEFAULT '0',
  `title` text NOT NULL,
  `alias` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(250) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hits` int(11) NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `approved` tinyint(1) NOT NULL DEFAULT '1',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
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
-- Table structure for table `jos_zoo_application`
--

CREATE TABLE IF NOT EXISTS `jos_zoo_application` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `application_group` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `params` text NOT NULL,
  PRIMARY KEY (`id`)
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `application_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `parent` int(11) NOT NULL,
  `ordering` int(11) NOT NULL,
  `published` tinyint(1) NOT NULL,
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ALIAS_INDEX` (`alias`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=175 ;

--
-- Dumping data for table `jos_zoo_category`
--


-- --------------------------------------------------------

--
-- Table structure for table `jos_zoo_category_item`
--

CREATE TABLE IF NOT EXISTS `jos_zoo_category_item` (
  `category_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`item_id`)
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `jos_zoo_comment`
--


-- --------------------------------------------------------

--
-- Table structure for table `jos_zoo_item`
--

CREATE TABLE IF NOT EXISTS `jos_zoo_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  PRIMARY KEY (`id`),
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) DEFAULT NULL,
  `element_id` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `value` tinyint(4) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `jos_zoo_rating`
--


-- --------------------------------------------------------

--
-- Table structure for table `jos_zoo_search_index`
--

CREATE TABLE IF NOT EXISTS `jos_zoo_search_index` (
  `item_id` int(11) NOT NULL,
  `element_id` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`item_id`,`element_id`),
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
  PRIMARY KEY (`item_id`,`name`)
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
