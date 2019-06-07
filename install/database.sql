/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : perfex

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2019-06-07 15:41:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tblactivity_log
-- ----------------------------
DROP TABLE IF EXISTS `tblactivity_log`;
CREATE TABLE `tblactivity_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` mediumtext NOT NULL,
  `date` datetime NOT NULL,
  `staffid` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `staffid` (`staffid`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblannouncements
-- ----------------------------
DROP TABLE IF EXISTS `tblannouncements`;
CREATE TABLE `tblannouncements` (
  `announcementid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `message` text,
  `showtousers` int(11) NOT NULL,
  `showtostaff` int(11) NOT NULL,
  `showname` int(11) NOT NULL,
  `dateadded` datetime NOT NULL,
  `userid` varchar(100) NOT NULL,
  PRIMARY KEY (`announcementid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblclients
-- ----------------------------
DROP TABLE IF EXISTS `tblclients`;
CREATE TABLE `tblclients` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `company` varchar(191) DEFAULT NULL,
  `vat` varchar(50) DEFAULT NULL,
  `phonenumber` varchar(30) DEFAULT NULL,
  `country` int(11) NOT NULL DEFAULT '0',
  `city` varchar(100) DEFAULT NULL,
  `zip` varchar(15) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `website` varchar(150) DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `active` int(11) NOT NULL DEFAULT '1',
  `leadid` int(11) DEFAULT NULL,
  `billing_street` varchar(200) DEFAULT NULL,
  `billing_city` varchar(100) DEFAULT NULL,
  `billing_state` varchar(100) DEFAULT NULL,
  `billing_zip` varchar(100) DEFAULT NULL,
  `billing_country` int(11) DEFAULT '0',
  `shipping_street` varchar(200) DEFAULT NULL,
  `shipping_city` varchar(100) DEFAULT NULL,
  `shipping_state` varchar(100) DEFAULT NULL,
  `shipping_zip` varchar(100) DEFAULT NULL,
  `shipping_country` int(11) DEFAULT '0',
  `longitude` varchar(191) DEFAULT NULL,
  `latitude` varchar(191) DEFAULT NULL,
  `default_language` varchar(40) DEFAULT NULL,
  `default_currency` int(11) NOT NULL DEFAULT '0',
  `show_primary_contact` int(11) NOT NULL DEFAULT '0',
  `stripe_id` varchar(40) DEFAULT NULL,
  `registration_confirmed` int(11) NOT NULL DEFAULT '1',
  `addedfrom` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`userid`),
  KEY `country` (`country`),
  KEY `leadid` (`leadid`),
  KEY `company` (`company`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblconsents
-- ----------------------------
DROP TABLE IF EXISTS `tblconsents`;
CREATE TABLE `tblconsents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action` varchar(10) NOT NULL,
  `date` datetime NOT NULL,
  `ip` varchar(40) NOT NULL,
  `contact_id` int(11) NOT NULL DEFAULT '0',
  `lead_id` int(11) NOT NULL DEFAULT '0',
  `description` text,
  `opt_in_purpose_description` text,
  `purpose_id` int(11) NOT NULL,
  `staff_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `purpose_id` (`purpose_id`),
  KEY `contact_id` (`contact_id`),
  KEY `lead_id` (`lead_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblconsent_purposes
-- ----------------------------
DROP TABLE IF EXISTS `tblconsent_purposes`;
CREATE TABLE `tblconsent_purposes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text,
  `date_created` datetime NOT NULL,
  `last_updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblcontacts
-- ----------------------------
DROP TABLE IF EXISTS `tblcontacts`;
CREATE TABLE `tblcontacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `is_primary` int(11) NOT NULL DEFAULT '1',
  `firstname` varchar(191) NOT NULL,
  `lastname` varchar(191) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phonenumber` varchar(100) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `new_pass_key` varchar(32) DEFAULT NULL,
  `new_pass_key_requested` datetime DEFAULT NULL,
  `email_verified_at` datetime DEFAULT NULL,
  `email_verification_key` varchar(32) DEFAULT NULL,
  `email_verification_sent_at` datetime DEFAULT NULL,
  `last_ip` varchar(40) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `last_password_change` datetime DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `profile_image` varchar(191) DEFAULT NULL,
  `direction` varchar(3) DEFAULT NULL,
  `invoice_emails` tinyint(1) NOT NULL DEFAULT '1',
  `estimate_emails` tinyint(1) NOT NULL DEFAULT '1',
  `credit_note_emails` tinyint(1) NOT NULL DEFAULT '1',
  `contract_emails` tinyint(1) NOT NULL DEFAULT '1',
  `task_emails` tinyint(1) NOT NULL DEFAULT '1',
  `project_emails` tinyint(1) NOT NULL DEFAULT '1',
  `ticket_emails` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `firstname` (`firstname`),
  KEY `lastname` (`lastname`),
  KEY `email` (`email`),
  KEY `is_primary` (`is_primary`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblcontacts_project
-- ----------------------------
DROP TABLE IF EXISTS `tblcontacts_project`;
CREATE TABLE `tblcontacts_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contact_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblcontact_permissions
-- ----------------------------
DROP TABLE IF EXISTS `tblcontact_permissions`;
CREATE TABLE `tblcontact_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permission_id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblcontracts
-- ----------------------------
DROP TABLE IF EXISTS `tblcontracts`;
CREATE TABLE `tblcontracts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` longtext,
  `description` text,
  `subject` varchar(191) DEFAULT NULL,
  `client` int(11) NOT NULL,
  `datestart` date DEFAULT NULL,
  `dateend` date DEFAULT NULL,
  `contract_type` int(11) DEFAULT NULL,
  `addedfrom` int(11) NOT NULL,
  `dateadded` datetime NOT NULL,
  `isexpirynotified` int(11) NOT NULL DEFAULT '0',
  `contract_value` decimal(15,2) DEFAULT NULL,
  `trash` tinyint(1) DEFAULT '0',
  `not_visible_to_client` tinyint(1) NOT NULL DEFAULT '0',
  `hash` varchar(32) DEFAULT NULL,
  `signed` tinyint(1) NOT NULL DEFAULT '0',
  `signature` varchar(40) DEFAULT NULL,
  `acceptance_firstname` varchar(50) DEFAULT NULL,
  `acceptance_lastname` varchar(50) DEFAULT NULL,
  `acceptance_email` varchar(100) DEFAULT NULL,
  `acceptance_date` datetime DEFAULT NULL,
  `acceptance_ip` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `client` (`client`),
  KEY `contract_type` (`contract_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblcontracts_types
-- ----------------------------
DROP TABLE IF EXISTS `tblcontracts_types`;
CREATE TABLE `tblcontracts_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblcontract_comments
-- ----------------------------
DROP TABLE IF EXISTS `tblcontract_comments`;
CREATE TABLE `tblcontract_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` mediumtext,
  `contract_id` int(11) NOT NULL,
  `staffid` int(11) NOT NULL,
  `dateadded` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblcontract_renewals
-- ----------------------------
DROP TABLE IF EXISTS `tblcontract_renewals`;
CREATE TABLE `tblcontract_renewals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contractid` int(11) NOT NULL,
  `old_start_date` date NOT NULL,
  `new_start_date` date NOT NULL,
  `old_end_date` date DEFAULT NULL,
  `new_end_date` date DEFAULT NULL,
  `old_value` decimal(15,2) DEFAULT NULL,
  `new_value` decimal(15,2) DEFAULT NULL,
  `date_renewed` datetime NOT NULL,
  `renewed_by` varchar(100) NOT NULL,
  `renewed_by_staff_id` int(11) NOT NULL DEFAULT '0',
  `is_on_old_expiry_notified` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblcountries
-- ----------------------------
DROP TABLE IF EXISTS `tblcountries`;
CREATE TABLE `tblcountries` (
  `country_id` int(5) NOT NULL AUTO_INCREMENT,
  `iso2` char(2) DEFAULT NULL,
  `short_name` varchar(80) NOT NULL DEFAULT '',
  `long_name` varchar(80) NOT NULL DEFAULT '',
  `iso3` char(3) DEFAULT NULL,
  `numcode` varchar(6) DEFAULT NULL,
  `un_member` varchar(12) DEFAULT NULL,
  `calling_code` varchar(8) DEFAULT NULL,
  `cctld` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=251 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblcreditnotes
-- ----------------------------
DROP TABLE IF EXISTS `tblcreditnotes`;
CREATE TABLE `tblcreditnotes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clientid` int(11) NOT NULL,
  `deleted_customer_name` varchar(100) DEFAULT NULL,
  `number` int(11) NOT NULL,
  `prefix` varchar(50) DEFAULT NULL,
  `number_format` int(11) NOT NULL DEFAULT '1',
  `datecreated` datetime NOT NULL,
  `date` date NOT NULL,
  `adminnote` text,
  `terms` text,
  `clientnote` text,
  `currency` int(11) NOT NULL,
  `subtotal` decimal(15,2) NOT NULL,
  `total_tax` decimal(15,2) NOT NULL DEFAULT '0.00',
  `total` decimal(15,2) NOT NULL,
  `adjustment` decimal(15,2) DEFAULT NULL,
  `addedfrom` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT '1',
  `project_id` int(11) NOT NULL DEFAULT '0',
  `discount_percent` decimal(15,2) DEFAULT '0.00',
  `discount_total` decimal(15,2) DEFAULT '0.00',
  `discount_type` varchar(30) NOT NULL,
  `billing_street` varchar(200) DEFAULT NULL,
  `billing_city` varchar(100) DEFAULT NULL,
  `billing_state` varchar(100) DEFAULT NULL,
  `billing_zip` varchar(100) DEFAULT NULL,
  `billing_country` int(11) DEFAULT NULL,
  `shipping_street` varchar(200) DEFAULT NULL,
  `shipping_city` varchar(100) DEFAULT NULL,
  `shipping_state` varchar(100) DEFAULT NULL,
  `shipping_zip` varchar(100) DEFAULT NULL,
  `shipping_country` int(11) DEFAULT NULL,
  `include_shipping` tinyint(1) NOT NULL,
  `show_shipping_on_credit_note` tinyint(1) NOT NULL DEFAULT '1',
  `show_quantity_as` int(11) NOT NULL DEFAULT '1',
  `reference_no` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `currency` (`currency`),
  KEY `clientid` (`clientid`),
  KEY `project_id` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblcreditnote_refunds
-- ----------------------------
DROP TABLE IF EXISTS `tblcreditnote_refunds`;
CREATE TABLE `tblcreditnote_refunds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `credit_note_id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `refunded_on` date NOT NULL,
  `payment_mode` varchar(40) NOT NULL,
  `note` text,
  `amount` decimal(15,2) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblcredits
-- ----------------------------
DROP TABLE IF EXISTS `tblcredits`;
CREATE TABLE `tblcredits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_id` int(11) NOT NULL,
  `credit_id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `date_applied` datetime NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblcurrencies
-- ----------------------------
DROP TABLE IF EXISTS `tblcurrencies`;
CREATE TABLE `tblcurrencies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `symbol` varchar(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `decimal_separator` varchar(5) DEFAULT NULL,
  `thousand_separator` varchar(5) DEFAULT NULL,
  `placement` varchar(10) DEFAULT NULL,
  `isdefault` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblcustomers_groups
-- ----------------------------
DROP TABLE IF EXISTS `tblcustomers_groups`;
CREATE TABLE `tblcustomers_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblcustomer_admins
-- ----------------------------
DROP TABLE IF EXISTS `tblcustomer_admins`;
CREATE TABLE `tblcustomer_admins` (
  `staff_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `date_assigned` text NOT NULL,
  KEY `customer_id` (`customer_id`),
  KEY `staff_id` (`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblcustomer_groups
-- ----------------------------
DROP TABLE IF EXISTS `tblcustomer_groups`;
CREATE TABLE `tblcustomer_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupid` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `groupid` (`groupid`),
  KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblcustomfields
-- ----------------------------
DROP TABLE IF EXISTS `tblcustomfields`;
CREATE TABLE `tblcustomfields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldto` varchar(15) NOT NULL,
  `name` varchar(150) NOT NULL,
  `slug` varchar(150) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `type` varchar(20) NOT NULL,
  `options` mediumtext,
  `display_inline` tinyint(1) NOT NULL DEFAULT '0',
  `field_order` int(11) DEFAULT '0',
  `active` int(11) NOT NULL DEFAULT '1',
  `show_on_pdf` int(11) NOT NULL DEFAULT '0',
  `show_on_ticket_form` tinyint(1) NOT NULL DEFAULT '0',
  `only_admin` tinyint(1) NOT NULL DEFAULT '0',
  `show_on_table` tinyint(1) NOT NULL DEFAULT '0',
  `show_on_client_portal` int(11) NOT NULL DEFAULT '0',
  `disalow_client_to_edit` int(11) NOT NULL DEFAULT '0',
  `bs_column` int(11) NOT NULL DEFAULT '12',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblcustomfieldsvalues
-- ----------------------------
DROP TABLE IF EXISTS `tblcustomfieldsvalues`;
CREATE TABLE `tblcustomfieldsvalues` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `relid` int(11) NOT NULL,
  `fieldid` int(11) NOT NULL,
  `fieldto` varchar(15) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `relid` (`relid`),
  KEY `fieldto` (`fieldto`),
  KEY `fieldid` (`fieldid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbldepartments
-- ----------------------------
DROP TABLE IF EXISTS `tbldepartments`;
CREATE TABLE `tbldepartments` (
  `departmentid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `imap_username` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `email_from_header` tinyint(1) NOT NULL DEFAULT '0',
  `host` varchar(150) DEFAULT NULL,
  `password` mediumtext,
  `encryption` varchar(3) DEFAULT NULL,
  `delete_after_import` int(11) NOT NULL DEFAULT '0',
  `calendar_id` mediumtext,
  `hidefromclient` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`departmentid`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbldismissed_announcements
-- ----------------------------
DROP TABLE IF EXISTS `tbldismissed_announcements`;
CREATE TABLE `tbldismissed_announcements` (
  `dismissedannouncementid` int(11) NOT NULL AUTO_INCREMENT,
  `announcementid` int(11) NOT NULL,
  `staff` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  PRIMARY KEY (`dismissedannouncementid`),
  KEY `announcementid` (`announcementid`),
  KEY `staff` (`staff`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblemailtemplates
-- ----------------------------
DROP TABLE IF EXISTS `tblemailtemplates`;
CREATE TABLE `tblemailtemplates` (
  `emailtemplateid` int(11) NOT NULL AUTO_INCREMENT,
  `type` mediumtext NOT NULL,
  `slug` varchar(100) NOT NULL,
  `language` varchar(40) DEFAULT NULL,
  `name` mediumtext NOT NULL,
  `subject` mediumtext NOT NULL,
  `message` text NOT NULL,
  `fromname` mediumtext NOT NULL,
  `fromemail` varchar(100) DEFAULT NULL,
  `plaintext` int(11) NOT NULL DEFAULT '0',
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `order` int(11) NOT NULL,
  PRIMARY KEY (`emailtemplateid`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblestimates
-- ----------------------------
DROP TABLE IF EXISTS `tblestimates`;
CREATE TABLE `tblestimates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sent` tinyint(1) NOT NULL DEFAULT '0',
  `datesend` datetime DEFAULT NULL,
  `clientid` int(11) NOT NULL,
  `deleted_customer_name` varchar(100) DEFAULT NULL,
  `project_id` int(11) NOT NULL DEFAULT '0',
  `number` int(11) NOT NULL,
  `prefix` varchar(50) DEFAULT NULL,
  `number_format` int(11) NOT NULL DEFAULT '0',
  `hash` varchar(32) DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `date` date NOT NULL,
  `expirydate` date DEFAULT NULL,
  `currency` int(11) NOT NULL,
  `subtotal` decimal(15,2) NOT NULL,
  `total_tax` decimal(15,2) NOT NULL DEFAULT '0.00',
  `total` decimal(15,2) NOT NULL,
  `adjustment` decimal(15,2) DEFAULT NULL,
  `addedfrom` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `clientnote` text,
  `adminnote` text,
  `discount_percent` decimal(15,2) DEFAULT '0.00',
  `discount_total` decimal(15,2) DEFAULT '0.00',
  `discount_type` varchar(30) DEFAULT NULL,
  `invoiceid` int(11) DEFAULT NULL,
  `invoiced_date` datetime DEFAULT NULL,
  `terms` text,
  `reference_no` varchar(100) DEFAULT NULL,
  `sale_agent` int(11) NOT NULL DEFAULT '0',
  `billing_street` varchar(200) DEFAULT NULL,
  `billing_city` varchar(100) DEFAULT NULL,
  `billing_state` varchar(100) DEFAULT NULL,
  `billing_zip` varchar(100) DEFAULT NULL,
  `billing_country` int(11) DEFAULT NULL,
  `shipping_street` varchar(200) DEFAULT NULL,
  `shipping_city` varchar(100) DEFAULT NULL,
  `shipping_state` varchar(100) DEFAULT NULL,
  `shipping_zip` varchar(100) DEFAULT NULL,
  `shipping_country` int(11) DEFAULT NULL,
  `include_shipping` tinyint(1) NOT NULL,
  `show_shipping_on_estimate` tinyint(1) NOT NULL DEFAULT '1',
  `show_quantity_as` int(11) NOT NULL DEFAULT '1',
  `pipeline_order` int(11) NOT NULL DEFAULT '0',
  `is_expiry_notified` int(11) NOT NULL DEFAULT '0',
  `acceptance_firstname` varchar(50) DEFAULT NULL,
  `acceptance_lastname` varchar(50) DEFAULT NULL,
  `acceptance_email` varchar(100) DEFAULT NULL,
  `acceptance_date` datetime DEFAULT NULL,
  `acceptance_ip` varchar(40) DEFAULT NULL,
  `signature` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `clientid` (`clientid`),
  KEY `currency` (`currency`),
  KEY `project_id` (`project_id`),
  KEY `sale_agent` (`sale_agent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblevents
-- ----------------------------
DROP TABLE IF EXISTS `tblevents`;
CREATE TABLE `tblevents` (
  `eventid` int(11) NOT NULL AUTO_INCREMENT,
  `title` mediumtext NOT NULL,
  `description` text,
  `userid` int(11) NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime DEFAULT NULL,
  `public` int(11) NOT NULL DEFAULT '0',
  `color` varchar(10) DEFAULT NULL,
  `isstartnotified` tinyint(1) NOT NULL DEFAULT '0',
  `reminder_before` int(11) NOT NULL DEFAULT '0',
  `reminder_before_type` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`eventid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblexpenses
-- ----------------------------
DROP TABLE IF EXISTS `tblexpenses`;
CREATE TABLE `tblexpenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` int(11) NOT NULL,
  `currency` int(11) NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `tax` int(11) DEFAULT NULL,
  `tax2` int(11) NOT NULL DEFAULT '0',
  `reference_no` varchar(100) DEFAULT NULL,
  `note` text,
  `expense_name` varchar(191) DEFAULT NULL,
  `clientid` int(11) NOT NULL,
  `project_id` int(11) NOT NULL DEFAULT '0',
  `billable` int(11) DEFAULT '0',
  `invoiceid` int(11) DEFAULT NULL,
  `paymentmode` varchar(50) DEFAULT NULL,
  `date` date NOT NULL,
  `recurring_type` varchar(10) DEFAULT NULL,
  `repeat_every` int(11) DEFAULT NULL,
  `recurring` int(11) NOT NULL DEFAULT '0',
  `cycles` int(11) NOT NULL DEFAULT '0',
  `total_cycles` int(11) NOT NULL DEFAULT '0',
  `custom_recurring` int(11) NOT NULL DEFAULT '0',
  `last_recurring_date` date DEFAULT NULL,
  `create_invoice_billable` tinyint(1) DEFAULT NULL,
  `send_invoice_to_customer` tinyint(1) NOT NULL,
  `recurring_from` int(11) DEFAULT NULL,
  `dateadded` datetime NOT NULL,
  `addedfrom` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `clientid` (`clientid`),
  KEY `project_id` (`project_id`),
  KEY `category` (`category`),
  KEY `currency` (`currency`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblexpenses_categories
-- ----------------------------
DROP TABLE IF EXISTS `tblexpenses_categories`;
CREATE TABLE `tblexpenses_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblfiles
-- ----------------------------
DROP TABLE IF EXISTS `tblfiles`;
CREATE TABLE `tblfiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rel_id` int(11) NOT NULL,
  `rel_type` varchar(20) NOT NULL,
  `file_name` varchar(191) NOT NULL,
  `filetype` varchar(40) DEFAULT NULL,
  `visible_to_customer` int(11) NOT NULL DEFAULT '0',
  `attachment_key` varchar(32) DEFAULT NULL,
  `external` varchar(40) DEFAULT NULL,
  `external_link` text,
  `thumbnail_link` text COMMENT 'For external usage',
  `staffid` int(11) NOT NULL,
  `contact_id` int(11) DEFAULT '0',
  `task_comment_id` int(11) NOT NULL DEFAULT '0',
  `dateadded` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rel_id` (`rel_id`),
  KEY `rel_type` (`rel_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblform_questions
-- ----------------------------
DROP TABLE IF EXISTS `tblform_questions`;
CREATE TABLE `tblform_questions` (
  `questionid` int(11) NOT NULL AUTO_INCREMENT,
  `rel_id` int(11) NOT NULL,
  `rel_type` varchar(20) DEFAULT NULL,
  `question` mediumtext NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `question_order` int(11) NOT NULL,
  PRIMARY KEY (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblform_question_box
-- ----------------------------
DROP TABLE IF EXISTS `tblform_question_box`;
CREATE TABLE `tblform_question_box` (
  `boxid` int(11) NOT NULL AUTO_INCREMENT,
  `boxtype` varchar(10) NOT NULL,
  `questionid` int(11) NOT NULL,
  PRIMARY KEY (`boxid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblform_question_box_description
-- ----------------------------
DROP TABLE IF EXISTS `tblform_question_box_description`;
CREATE TABLE `tblform_question_box_description` (
  `questionboxdescriptionid` int(11) NOT NULL AUTO_INCREMENT,
  `description` mediumtext NOT NULL,
  `boxid` mediumtext NOT NULL,
  `questionid` int(11) NOT NULL,
  PRIMARY KEY (`questionboxdescriptionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblform_results
-- ----------------------------
DROP TABLE IF EXISTS `tblform_results`;
CREATE TABLE `tblform_results` (
  `resultid` int(11) NOT NULL AUTO_INCREMENT,
  `boxid` int(11) NOT NULL,
  `boxdescriptionid` int(11) DEFAULT NULL,
  `rel_id` int(11) NOT NULL,
  `rel_type` varchar(20) DEFAULT NULL,
  `questionid` int(11) NOT NULL,
  `answer` text,
  `resultsetid` int(11) NOT NULL,
  PRIMARY KEY (`resultid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblgdpr_requests
-- ----------------------------
DROP TABLE IF EXISTS `tblgdpr_requests`;
CREATE TABLE `tblgdpr_requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clientid` int(11) NOT NULL DEFAULT '0',
  `contact_id` int(11) NOT NULL DEFAULT '0',
  `lead_id` int(11) NOT NULL DEFAULT '0',
  `request_type` varchar(191) DEFAULT NULL,
  `status` varchar(40) DEFAULT NULL,
  `request_date` datetime NOT NULL,
  `request_from` varchar(150) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblinvoicepaymentrecords
-- ----------------------------
DROP TABLE IF EXISTS `tblinvoicepaymentrecords`;
CREATE TABLE `tblinvoicepaymentrecords` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoiceid` int(11) NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `paymentmode` varchar(40) DEFAULT NULL,
  `paymentmethod` varchar(191) DEFAULT NULL,
  `date` date NOT NULL,
  `daterecorded` datetime NOT NULL,
  `note` text NOT NULL,
  `transactionid` mediumtext,
  PRIMARY KEY (`id`),
  KEY `invoiceid` (`invoiceid`),
  KEY `paymentmethod` (`paymentmethod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblinvoices
-- ----------------------------
DROP TABLE IF EXISTS `tblinvoices`;
CREATE TABLE `tblinvoices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sent` tinyint(1) NOT NULL DEFAULT '0',
  `datesend` datetime DEFAULT NULL,
  `clientid` int(11) NOT NULL,
  `deleted_customer_name` varchar(100) DEFAULT NULL,
  `number` int(11) NOT NULL,
  `prefix` varchar(50) DEFAULT NULL,
  `number_format` int(11) NOT NULL DEFAULT '0',
  `datecreated` datetime NOT NULL,
  `date` date NOT NULL,
  `duedate` date DEFAULT NULL,
  `currency` int(11) NOT NULL,
  `subtotal` decimal(15,2) NOT NULL,
  `total_tax` decimal(15,2) NOT NULL DEFAULT '0.00',
  `total` decimal(15,2) NOT NULL,
  `adjustment` decimal(15,2) DEFAULT NULL,
  `addedfrom` int(11) DEFAULT NULL,
  `hash` varchar(32) NOT NULL,
  `status` int(11) DEFAULT '1',
  `clientnote` text,
  `adminnote` text,
  `last_overdue_reminder` date DEFAULT NULL,
  `cancel_overdue_reminders` int(11) NOT NULL DEFAULT '0',
  `allowed_payment_modes` mediumtext,
  `token` mediumtext,
  `discount_percent` decimal(15,2) DEFAULT '0.00',
  `discount_total` decimal(15,2) DEFAULT '0.00',
  `discount_type` varchar(30) NOT NULL,
  `recurring` int(11) NOT NULL DEFAULT '0',
  `recurring_type` varchar(10) DEFAULT NULL,
  `custom_recurring` tinyint(1) NOT NULL DEFAULT '0',
  `cycles` int(11) NOT NULL DEFAULT '0',
  `total_cycles` int(11) NOT NULL DEFAULT '0',
  `is_recurring_from` int(11) DEFAULT NULL,
  `last_recurring_date` date DEFAULT NULL,
  `terms` text,
  `sale_agent` int(11) NOT NULL DEFAULT '0',
  `billing_street` varchar(200) DEFAULT NULL,
  `billing_city` varchar(100) DEFAULT NULL,
  `billing_state` varchar(100) DEFAULT NULL,
  `billing_zip` varchar(100) DEFAULT NULL,
  `billing_country` int(11) DEFAULT NULL,
  `shipping_street` varchar(200) DEFAULT NULL,
  `shipping_city` varchar(100) DEFAULT NULL,
  `shipping_state` varchar(100) DEFAULT NULL,
  `shipping_zip` varchar(100) DEFAULT NULL,
  `shipping_country` int(11) DEFAULT NULL,
  `include_shipping` tinyint(1) NOT NULL,
  `show_shipping_on_invoice` tinyint(1) NOT NULL DEFAULT '1',
  `show_quantity_as` int(11) NOT NULL DEFAULT '1',
  `project_id` int(11) DEFAULT '0',
  `subscription_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `currency` (`currency`),
  KEY `clientid` (`clientid`),
  KEY `project_id` (`project_id`),
  KEY `sale_agent` (`sale_agent`),
  KEY `total` (`total`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblitemable
-- ----------------------------
DROP TABLE IF EXISTS `tblitemable`;
CREATE TABLE `tblitemable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rel_id` int(11) NOT NULL,
  `rel_type` varchar(15) NOT NULL,
  `description` mediumtext NOT NULL,
  `long_description` mediumtext,
  `qty` decimal(15,2) NOT NULL,
  `rate` decimal(15,2) NOT NULL,
  `unit` varchar(40) DEFAULT NULL,
  `item_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rel_id` (`rel_id`),
  KEY `rel_type` (`rel_type`),
  KEY `qty` (`qty`),
  KEY `rate` (`rate`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblitems
-- ----------------------------
DROP TABLE IF EXISTS `tblitems`;
CREATE TABLE `tblitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` mediumtext NOT NULL,
  `long_description` text,
  `rate` decimal(15,2) NOT NULL,
  `tax` int(11) DEFAULT NULL,
  `tax2` int(11) DEFAULT NULL,
  `unit` varchar(40) DEFAULT NULL,
  `group_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `tax` (`tax`),
  KEY `tax2` (`tax2`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblitems_groups
-- ----------------------------
DROP TABLE IF EXISTS `tblitems_groups`;
CREATE TABLE `tblitems_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblitem_tax
-- ----------------------------
DROP TABLE IF EXISTS `tblitem_tax`;
CREATE TABLE `tblitem_tax` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itemid` int(11) NOT NULL,
  `rel_id` int(11) NOT NULL,
  `rel_type` varchar(20) NOT NULL,
  `taxrate` decimal(15,2) NOT NULL,
  `taxname` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `itemid` (`itemid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblknowedge_base_article_feedback
-- ----------------------------
DROP TABLE IF EXISTS `tblknowedge_base_article_feedback`;
CREATE TABLE `tblknowedge_base_article_feedback` (
  `articleanswerid` int(11) NOT NULL AUTO_INCREMENT,
  `articleid` int(11) NOT NULL,
  `answer` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`articleanswerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblknowledge_base
-- ----------------------------
DROP TABLE IF EXISTS `tblknowledge_base`;
CREATE TABLE `tblknowledge_base` (
  `articleid` int(11) NOT NULL AUTO_INCREMENT,
  `articlegroup` int(11) NOT NULL,
  `subject` mediumtext NOT NULL,
  `description` text NOT NULL,
  `slug` mediumtext NOT NULL,
  `active` tinyint(4) NOT NULL,
  `datecreated` datetime NOT NULL,
  `article_order` int(11) NOT NULL DEFAULT '0',
  `staff_article` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`articleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblknowledge_base_groups
-- ----------------------------
DROP TABLE IF EXISTS `tblknowledge_base_groups`;
CREATE TABLE `tblknowledge_base_groups` (
  `groupid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `group_slug` text,
  `description` mediumtext,
  `active` tinyint(4) NOT NULL,
  `color` varchar(10) DEFAULT '#28B8DA',
  `group_order` int(11) DEFAULT '0',
  PRIMARY KEY (`groupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblleads
-- ----------------------------
DROP TABLE IF EXISTS `tblleads`;
CREATE TABLE `tblleads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hash` varchar(65) DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `company` varchar(191) DEFAULT NULL,
  `description` text,
  `country` int(11) NOT NULL DEFAULT '0',
  `zip` varchar(15) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `assigned` int(11) NOT NULL DEFAULT '0',
  `dateadded` datetime NOT NULL,
  `from_form_id` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL,
  `source` int(11) NOT NULL,
  `lastcontact` datetime DEFAULT NULL,
  `dateassigned` date DEFAULT NULL,
  `last_status_change` datetime DEFAULT NULL,
  `addedfrom` int(11) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `website` varchar(150) DEFAULT NULL,
  `leadorder` int(11) DEFAULT '1',
  `phonenumber` varchar(50) DEFAULT NULL,
  `date_converted` datetime DEFAULT NULL,
  `lost` tinyint(1) NOT NULL DEFAULT '0',
  `junk` int(11) NOT NULL DEFAULT '0',
  `last_lead_status` int(11) NOT NULL DEFAULT '0',
  `is_imported_from_email_integration` tinyint(1) NOT NULL DEFAULT '0',
  `email_integration_uid` varchar(30) DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL DEFAULT '0',
  `default_language` varchar(40) DEFAULT NULL,
  `client_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `company` (`company`),
  KEY `email` (`email`),
  KEY `assigned` (`assigned`),
  KEY `status` (`status`),
  KEY `source` (`source`),
  KEY `lastcontact` (`lastcontact`),
  KEY `dateadded` (`dateadded`),
  KEY `leadorder` (`leadorder`),
  KEY `from_form_id` (`from_form_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblleads_email_integration
-- ----------------------------
DROP TABLE IF EXISTS `tblleads_email_integration`;
CREATE TABLE `tblleads_email_integration` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'the ID always must be 1',
  `active` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `imap_server` varchar(100) NOT NULL,
  `password` mediumtext NOT NULL,
  `check_every` int(11) NOT NULL DEFAULT '5',
  `responsible` int(11) NOT NULL,
  `lead_source` int(11) NOT NULL,
  `lead_status` int(11) NOT NULL,
  `encryption` varchar(3) DEFAULT NULL,
  `folder` varchar(100) NOT NULL,
  `last_run` varchar(50) DEFAULT NULL,
  `notify_lead_imported` tinyint(1) NOT NULL DEFAULT '1',
  `notify_lead_contact_more_times` tinyint(1) NOT NULL DEFAULT '1',
  `notify_type` varchar(20) DEFAULT NULL,
  `notify_ids` mediumtext,
  `mark_public` int(11) NOT NULL DEFAULT '0',
  `only_loop_on_unseen_emails` tinyint(1) NOT NULL DEFAULT '1',
  `delete_after_import` int(11) NOT NULL DEFAULT '0',
  `create_task_if_customer` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblleads_sources
-- ----------------------------
DROP TABLE IF EXISTS `tblleads_sources`;
CREATE TABLE `tblleads_sources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblleads_status
-- ----------------------------
DROP TABLE IF EXISTS `tblleads_status`;
CREATE TABLE `tblleads_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `statusorder` int(11) DEFAULT NULL,
  `color` varchar(10) DEFAULT '#28B8DA',
  `isdefault` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbllead_activity_log
-- ----------------------------
DROP TABLE IF EXISTS `tbllead_activity_log`;
CREATE TABLE `tbllead_activity_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `leadid` int(11) NOT NULL,
  `description` mediumtext NOT NULL,
  `additional_data` text,
  `date` datetime NOT NULL,
  `staffid` int(11) NOT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `custom_activity` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbllead_integration_emails
-- ----------------------------
DROP TABLE IF EXISTS `tbllead_integration_emails`;
CREATE TABLE `tbllead_integration_emails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` mediumtext,
  `body` mediumtext,
  `dateadded` datetime NOT NULL,
  `leadid` int(11) NOT NULL,
  `emailid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblmail_queue
-- ----------------------------
DROP TABLE IF EXISTS `tblmail_queue`;
CREATE TABLE `tblmail_queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `engine` varchar(40) DEFAULT NULL,
  `email` varchar(191) NOT NULL,
  `cc` text,
  `bcc` text,
  `message` mediumtext NOT NULL,
  `alt_message` mediumtext,
  `status` enum('pending','sending','sent','failed') DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `headers` text,
  `attachments` mediumtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblmigrations
-- ----------------------------
DROP TABLE IF EXISTS `tblmigrations`;
CREATE TABLE `tblmigrations` (
  `version` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblmilestones
-- ----------------------------
DROP TABLE IF EXISTS `tblmilestones`;
CREATE TABLE `tblmilestones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `description` text,
  `description_visible_to_customer` tinyint(1) DEFAULT '0',
  `due_date` date NOT NULL,
  `project_id` int(11) NOT NULL,
  `color` varchar(10) DEFAULT NULL,
  `milestone_order` int(11) NOT NULL DEFAULT '0',
  `datecreated` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblmodules
-- ----------------------------
DROP TABLE IF EXISTS `tblmodules`;
CREATE TABLE `tblmodules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module_name` varchar(55) NOT NULL,
  `installed_version` varchar(11) NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblnewsfeed_comment_likes
-- ----------------------------
DROP TABLE IF EXISTS `tblnewsfeed_comment_likes`;
CREATE TABLE `tblnewsfeed_comment_likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `postid` int(11) NOT NULL,
  `commentid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `dateliked` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblnewsfeed_posts
-- ----------------------------
DROP TABLE IF EXISTS `tblnewsfeed_posts`;
CREATE TABLE `tblnewsfeed_posts` (
  `postid` int(11) NOT NULL AUTO_INCREMENT,
  `creator` int(11) NOT NULL,
  `datecreated` datetime NOT NULL,
  `visibility` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `pinned` int(11) NOT NULL,
  `datepinned` datetime DEFAULT NULL,
  PRIMARY KEY (`postid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblnewsfeed_post_comments
-- ----------------------------
DROP TABLE IF EXISTS `tblnewsfeed_post_comments`;
CREATE TABLE `tblnewsfeed_post_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text,
  `userid` int(11) NOT NULL,
  `postid` int(11) NOT NULL,
  `dateadded` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblnewsfeed_post_likes
-- ----------------------------
DROP TABLE IF EXISTS `tblnewsfeed_post_likes`;
CREATE TABLE `tblnewsfeed_post_likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `postid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `dateliked` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblnotes
-- ----------------------------
DROP TABLE IF EXISTS `tblnotes`;
CREATE TABLE `tblnotes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rel_id` int(11) NOT NULL,
  `rel_type` varchar(20) NOT NULL,
  `description` text,
  `date_contacted` datetime DEFAULT NULL,
  `addedfrom` int(11) NOT NULL,
  `dateadded` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rel_id` (`rel_id`),
  KEY `rel_type` (`rel_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblnotifications
-- ----------------------------
DROP TABLE IF EXISTS `tblnotifications`;
CREATE TABLE `tblnotifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `isread` int(11) NOT NULL DEFAULT '0',
  `isread_inline` tinyint(1) NOT NULL DEFAULT '0',
  `date` datetime NOT NULL,
  `description` text NOT NULL,
  `fromuserid` int(11) NOT NULL,
  `fromclientid` int(11) NOT NULL DEFAULT '0',
  `from_fullname` varchar(100) NOT NULL,
  `touserid` int(11) NOT NULL,
  `fromcompany` int(11) DEFAULT NULL,
  `link` mediumtext,
  `additional_data` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbloptions
-- ----------------------------
DROP TABLE IF EXISTS `tbloptions`;
CREATE TABLE `tbloptions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `value` longtext NOT NULL,
  `autoload` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=409 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblpayment_modes
-- ----------------------------
DROP TABLE IF EXISTS `tblpayment_modes`;
CREATE TABLE `tblpayment_modes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text,
  `show_on_pdf` int(11) NOT NULL DEFAULT '0',
  `invoices_only` int(11) NOT NULL DEFAULT '0',
  `expenses_only` int(11) NOT NULL DEFAULT '0',
  `selected_by_default` int(11) NOT NULL DEFAULT '1',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblpinned_projects
-- ----------------------------
DROP TABLE IF EXISTS `tblpinned_projects`;
CREATE TABLE `tblpinned_projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblprojectdiscussioncomments
-- ----------------------------
DROP TABLE IF EXISTS `tblprojectdiscussioncomments`;
CREATE TABLE `tblprojectdiscussioncomments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `discussion_id` int(11) NOT NULL,
  `discussion_type` varchar(10) NOT NULL,
  `parent` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `content` text NOT NULL,
  `staff_id` int(11) NOT NULL,
  `contact_id` int(11) DEFAULT '0',
  `fullname` varchar(191) DEFAULT NULL,
  `file_name` varchar(191) DEFAULT NULL,
  `file_mime_type` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblprojectdiscussions
-- ----------------------------
DROP TABLE IF EXISTS `tblprojectdiscussions`;
CREATE TABLE `tblprojectdiscussions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `subject` varchar(191) NOT NULL,
  `description` text NOT NULL,
  `show_to_customer` tinyint(1) NOT NULL DEFAULT '0',
  `datecreated` datetime NOT NULL,
  `last_activity` datetime DEFAULT NULL,
  `staff_id` int(11) NOT NULL DEFAULT '0',
  `contact_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblprojects
-- ----------------------------
DROP TABLE IF EXISTS `tblprojects`;
CREATE TABLE `tblprojects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `description` text,
  `status` int(11) NOT NULL DEFAULT '0',
  `clientid` int(11) NOT NULL,
  `billing_type` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `deadline` date DEFAULT NULL,
  `project_created` date NOT NULL,
  `date_finished` datetime DEFAULT NULL,
  `progress` int(11) DEFAULT '0',
  `progress_from_tasks` int(11) NOT NULL DEFAULT '1',
  `project_cost` decimal(15,2) DEFAULT NULL,
  `project_rate_per_hour` decimal(15,2) DEFAULT NULL,
  `estimated_hours` decimal(15,2) DEFAULT NULL,
  `addedfrom` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `clientid` (`clientid`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblproject_activity
-- ----------------------------
DROP TABLE IF EXISTS `tblproject_activity`;
CREATE TABLE `tblproject_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL DEFAULT '0',
  `contact_id` int(11) NOT NULL DEFAULT '0',
  `fullname` varchar(100) DEFAULT NULL,
  `visible_to_customer` int(11) NOT NULL DEFAULT '0',
  `description_key` varchar(191) NOT NULL COMMENT 'Language file key',
  `additional_data` text,
  `dateadded` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblproject_files
-- ----------------------------
DROP TABLE IF EXISTS `tblproject_files`;
CREATE TABLE `tblproject_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(191) NOT NULL,
  `subject` varchar(191) DEFAULT NULL,
  `description` text,
  `filetype` varchar(50) DEFAULT NULL,
  `dateadded` datetime NOT NULL,
  `last_activity` datetime DEFAULT NULL,
  `project_id` int(11) NOT NULL,
  `visible_to_customer` tinyint(1) DEFAULT '0',
  `staffid` int(11) NOT NULL,
  `contact_id` int(11) NOT NULL DEFAULT '0',
  `external` varchar(40) DEFAULT NULL,
  `external_link` text,
  `thumbnail_link` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblproject_members
-- ----------------------------
DROP TABLE IF EXISTS `tblproject_members`;
CREATE TABLE `tblproject_members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`),
  KEY `staff_id` (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblproject_notes
-- ----------------------------
DROP TABLE IF EXISTS `tblproject_notes`;
CREATE TABLE `tblproject_notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `staff_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblproject_settings
-- ----------------------------
DROP TABLE IF EXISTS `tblproject_settings`;
CREATE TABLE `tblproject_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `value` text,
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblproposals
-- ----------------------------
DROP TABLE IF EXISTS `tblproposals`;
CREATE TABLE `tblproposals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(191) DEFAULT NULL,
  `content` longtext,
  `addedfrom` int(11) NOT NULL,
  `datecreated` datetime NOT NULL,
  `total` decimal(15,2) DEFAULT NULL,
  `subtotal` decimal(15,2) NOT NULL,
  `total_tax` decimal(15,2) NOT NULL DEFAULT '0.00',
  `adjustment` decimal(15,2) DEFAULT NULL,
  `discount_percent` decimal(15,2) NOT NULL,
  `discount_total` decimal(15,2) NOT NULL,
  `discount_type` varchar(30) DEFAULT NULL,
  `show_quantity_as` int(11) NOT NULL DEFAULT '1',
  `currency` int(11) NOT NULL,
  `open_till` date DEFAULT NULL,
  `date` date NOT NULL,
  `rel_id` int(11) DEFAULT NULL,
  `rel_type` varchar(40) DEFAULT NULL,
  `assigned` int(11) DEFAULT NULL,
  `hash` varchar(32) NOT NULL,
  `proposal_to` varchar(191) DEFAULT NULL,
  `country` int(11) NOT NULL DEFAULT '0',
  `zip` varchar(50) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `allow_comments` tinyint(1) NOT NULL DEFAULT '1',
  `status` int(11) NOT NULL,
  `estimate_id` int(11) DEFAULT NULL,
  `invoice_id` int(11) DEFAULT NULL,
  `date_converted` datetime DEFAULT NULL,
  `pipeline_order` int(11) NOT NULL DEFAULT '0',
  `is_expiry_notified` int(11) NOT NULL DEFAULT '0',
  `acceptance_firstname` varchar(50) DEFAULT NULL,
  `acceptance_lastname` varchar(50) DEFAULT NULL,
  `acceptance_email` varchar(100) DEFAULT NULL,
  `acceptance_date` datetime DEFAULT NULL,
  `acceptance_ip` varchar(40) DEFAULT NULL,
  `signature` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblproposal_comments
-- ----------------------------
DROP TABLE IF EXISTS `tblproposal_comments`;
CREATE TABLE `tblproposal_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` mediumtext,
  `proposalid` int(11) NOT NULL,
  `staffid` int(11) NOT NULL,
  `dateadded` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblrelated_items
-- ----------------------------
DROP TABLE IF EXISTS `tblrelated_items`;
CREATE TABLE `tblrelated_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rel_id` int(11) NOT NULL,
  `rel_type` varchar(30) NOT NULL,
  `item_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblreminders
-- ----------------------------
DROP TABLE IF EXISTS `tblreminders`;
CREATE TABLE `tblreminders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` text,
  `date` datetime NOT NULL,
  `isnotified` int(11) NOT NULL DEFAULT '0',
  `rel_id` int(11) NOT NULL,
  `staff` int(11) NOT NULL,
  `rel_type` varchar(40) NOT NULL,
  `notify_by_email` int(11) NOT NULL DEFAULT '1',
  `creator` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rel_id` (`rel_id`),
  KEY `rel_type` (`rel_type`),
  KEY `staff` (`staff`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblroles
-- ----------------------------
DROP TABLE IF EXISTS `tblroles`;
CREATE TABLE `tblroles` (
  `roleid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `permissions` longtext,
  PRIMARY KEY (`roleid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblsales_activity
-- ----------------------------
DROP TABLE IF EXISTS `tblsales_activity`;
CREATE TABLE `tblsales_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rel_type` varchar(20) DEFAULT NULL,
  `rel_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `additional_data` text,
  `staffid` varchar(11) DEFAULT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblservices
-- ----------------------------
DROP TABLE IF EXISTS `tblservices`;
CREATE TABLE `tblservices` (
  `serviceid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`serviceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblsessions
-- ----------------------------
DROP TABLE IF EXISTS `tblsessions`;
CREATE TABLE `tblsessions` (
  `id` varchar(128) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  `data` blob NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ci_sessions_timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblshared_customer_files
-- ----------------------------
DROP TABLE IF EXISTS `tblshared_customer_files`;
CREATE TABLE `tblshared_customer_files` (
  `file_id` int(11) NOT NULL,
  `contact_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblspam_filters
-- ----------------------------
DROP TABLE IF EXISTS `tblspam_filters`;
CREATE TABLE `tblspam_filters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(40) NOT NULL,
  `rel_type` varchar(10) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblstaff
-- ----------------------------
DROP TABLE IF EXISTS `tblstaff`;
CREATE TABLE `tblstaff` (
  `staffid` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `facebook` mediumtext,
  `linkedin` mediumtext,
  `phonenumber` varchar(30) DEFAULT NULL,
  `skype` varchar(50) DEFAULT NULL,
  `password` varchar(250) NOT NULL,
  `datecreated` datetime NOT NULL,
  `profile_image` varchar(191) DEFAULT NULL,
  `last_ip` varchar(40) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `last_activity` datetime DEFAULT NULL,
  `last_password_change` datetime DEFAULT NULL,
  `new_pass_key` varchar(32) DEFAULT NULL,
  `new_pass_key_requested` datetime DEFAULT NULL,
  `admin` int(11) NOT NULL DEFAULT '0',
  `role` int(11) DEFAULT NULL,
  `active` int(11) NOT NULL DEFAULT '1',
  `default_language` varchar(40) DEFAULT NULL,
  `direction` varchar(3) DEFAULT NULL,
  `media_path_slug` varchar(191) DEFAULT NULL,
  `is_not_staff` int(11) NOT NULL DEFAULT '0',
  `hourly_rate` decimal(15,2) NOT NULL DEFAULT '0.00',
  `two_factor_auth_enabled` tinyint(1) DEFAULT '0',
  `two_factor_auth_code` varchar(100) DEFAULT NULL,
  `two_factor_auth_code_requested` datetime DEFAULT NULL,
  `email_signature` text,
  PRIMARY KEY (`staffid`),
  KEY `firstname` (`firstname`),
  KEY `lastname` (`lastname`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblstaff_departments
-- ----------------------------
DROP TABLE IF EXISTS `tblstaff_departments`;
CREATE TABLE `tblstaff_departments` (
  `staffdepartmentid` int(11) NOT NULL AUTO_INCREMENT,
  `staffid` int(11) NOT NULL,
  `departmentid` int(11) NOT NULL,
  PRIMARY KEY (`staffdepartmentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblstaff_permissions
-- ----------------------------
DROP TABLE IF EXISTS `tblstaff_permissions`;
CREATE TABLE `tblstaff_permissions` (
  `staff_id` int(11) NOT NULL,
  `feature` varchar(40) NOT NULL,
  `capability` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblsubscriptions
-- ----------------------------
DROP TABLE IF EXISTS `tblsubscriptions`;
CREATE TABLE `tblsubscriptions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `description` text,
  `description_in_item` tinyint(1) NOT NULL DEFAULT '0',
  `clientid` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `currency` int(11) NOT NULL,
  `tax_id` int(11) NOT NULL DEFAULT '0',
  `stripe_plan_id` text,
  `stripe_subscription_id` text NOT NULL,
  `next_billing_cycle` bigint(20) DEFAULT NULL,
  `ends_at` bigint(20) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT '1',
  `project_id` int(11) NOT NULL DEFAULT '0',
  `hash` varchar(32) NOT NULL,
  `created` datetime NOT NULL,
  `created_from` int(11) NOT NULL,
  `date_subscribed` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `clientid` (`clientid`),
  KEY `currency` (`currency`),
  KEY `tax_id` (`tax_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbltaggables
-- ----------------------------
DROP TABLE IF EXISTS `tbltaggables`;
CREATE TABLE `tbltaggables` (
  `rel_id` int(11) NOT NULL,
  `rel_type` varchar(20) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `tag_order` int(11) NOT NULL DEFAULT '0',
  KEY `rel_id` (`rel_id`),
  KEY `rel_type` (`rel_type`),
  KEY `tag_id` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbltags
-- ----------------------------
DROP TABLE IF EXISTS `tbltags`;
CREATE TABLE `tbltags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbltasks
-- ----------------------------
DROP TABLE IF EXISTS `tbltasks`;
CREATE TABLE `tbltasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` mediumtext,
  `description` text,
  `priority` int(11) DEFAULT NULL,
  `dateadded` datetime NOT NULL,
  `startdate` date NOT NULL,
  `duedate` date DEFAULT NULL,
  `datefinished` datetime DEFAULT NULL,
  `addedfrom` int(11) NOT NULL,
  `is_added_from_contact` tinyint(1) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `recurring_type` varchar(10) DEFAULT NULL,
  `repeat_every` int(11) DEFAULT NULL,
  `recurring` int(11) NOT NULL DEFAULT '0',
  `is_recurring_from` int(11) DEFAULT NULL,
  `cycles` int(11) NOT NULL DEFAULT '0',
  `total_cycles` int(11) NOT NULL DEFAULT '0',
  `custom_recurring` tinyint(1) NOT NULL DEFAULT '0',
  `last_recurring_date` date DEFAULT NULL,
  `rel_id` int(11) DEFAULT NULL,
  `rel_type` varchar(30) DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL DEFAULT '0',
  `billable` tinyint(1) NOT NULL DEFAULT '0',
  `billed` tinyint(1) NOT NULL DEFAULT '0',
  `invoice_id` int(11) NOT NULL DEFAULT '0',
  `hourly_rate` decimal(15,2) NOT NULL DEFAULT '0.00',
  `milestone` int(11) DEFAULT '0',
  `kanban_order` int(11) NOT NULL DEFAULT '0',
  `milestone_order` int(11) NOT NULL DEFAULT '0',
  `visible_to_client` tinyint(1) NOT NULL DEFAULT '0',
  `deadline_notified` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `rel_id` (`rel_id`),
  KEY `rel_type` (`rel_type`),
  KEY `milestone` (`milestone`),
  KEY `kanban_order` (`kanban_order`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbltaskstimers
-- ----------------------------
DROP TABLE IF EXISTS `tbltaskstimers`;
CREATE TABLE `tbltaskstimers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) NOT NULL,
  `start_time` varchar(64) NOT NULL,
  `end_time` varchar(64) DEFAULT NULL,
  `staff_id` int(11) NOT NULL,
  `hourly_rate` decimal(15,2) NOT NULL DEFAULT '0.00',
  `note` text,
  PRIMARY KEY (`id`),
  KEY `task_id` (`task_id`),
  KEY `staff_id` (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbltasks_checklist_templates
-- ----------------------------
DROP TABLE IF EXISTS `tbltasks_checklist_templates`;
CREATE TABLE `tbltasks_checklist_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbltask_assigned
-- ----------------------------
DROP TABLE IF EXISTS `tbltask_assigned`;
CREATE TABLE `tbltask_assigned` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `staffid` int(11) NOT NULL,
  `taskid` int(11) NOT NULL,
  `assigned_from` int(11) NOT NULL DEFAULT '0',
  `is_assigned_from_contact` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `taskid` (`taskid`),
  KEY `staffid` (`staffid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbltask_checklist_items
-- ----------------------------
DROP TABLE IF EXISTS `tbltask_checklist_items`;
CREATE TABLE `tbltask_checklist_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taskid` int(11) NOT NULL,
  `description` text NOT NULL,
  `finished` int(11) NOT NULL DEFAULT '0',
  `dateadded` datetime NOT NULL,
  `addedfrom` int(11) NOT NULL,
  `finished_from` int(11) DEFAULT '0',
  `list_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `taskid` (`taskid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbltask_comments
-- ----------------------------
DROP TABLE IF EXISTS `tbltask_comments`;
CREATE TABLE `tbltask_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `taskid` int(11) NOT NULL,
  `staffid` int(11) NOT NULL,
  `contact_id` int(11) NOT NULL DEFAULT '0',
  `file_id` int(11) NOT NULL DEFAULT '0',
  `dateadded` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `file_id` (`file_id`),
  KEY `taskid` (`taskid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbltask_followers
-- ----------------------------
DROP TABLE IF EXISTS `tbltask_followers`;
CREATE TABLE `tbltask_followers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `staffid` int(11) NOT NULL,
  `taskid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbltaxes
-- ----------------------------
DROP TABLE IF EXISTS `tbltaxes`;
CREATE TABLE `tbltaxes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `taxrate` decimal(15,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbltickets
-- ----------------------------
DROP TABLE IF EXISTS `tbltickets`;
CREATE TABLE `tbltickets` (
  `ticketid` int(11) NOT NULL AUTO_INCREMENT,
  `adminreplying` int(11) NOT NULL DEFAULT '0',
  `userid` int(11) NOT NULL,
  `contactid` int(11) NOT NULL DEFAULT '0',
  `email` text,
  `name` text,
  `department` int(11) NOT NULL,
  `priority` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `service` int(11) DEFAULT NULL,
  `ticketkey` varchar(32) NOT NULL,
  `subject` varchar(191) NOT NULL,
  `message` text,
  `admin` int(11) DEFAULT NULL,
  `date` datetime NOT NULL,
  `project_id` int(11) NOT NULL DEFAULT '0',
  `lastreply` datetime DEFAULT NULL,
  `clientread` int(11) NOT NULL DEFAULT '0',
  `adminread` int(11) NOT NULL DEFAULT '0',
  `assigned` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ticketid`),
  KEY `service` (`service`),
  KEY `department` (`department`),
  KEY `status` (`status`),
  KEY `userid` (`userid`),
  KEY `priority` (`priority`),
  KEY `project_id` (`project_id`),
  KEY `contactid` (`contactid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbltickets_pipe_log
-- ----------------------------
DROP TABLE IF EXISTS `tbltickets_pipe_log`;
CREATE TABLE `tbltickets_pipe_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `email_to` varchar(100) NOT NULL,
  `name` varchar(191) NOT NULL,
  `subject` varchar(191) NOT NULL,
  `message` mediumtext NOT NULL,
  `email` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbltickets_predefined_replies
-- ----------------------------
DROP TABLE IF EXISTS `tbltickets_predefined_replies`;
CREATE TABLE `tbltickets_predefined_replies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `message` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbltickets_priorities
-- ----------------------------
DROP TABLE IF EXISTS `tbltickets_priorities`;
CREATE TABLE `tbltickets_priorities` (
  `priorityid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`priorityid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbltickets_status
-- ----------------------------
DROP TABLE IF EXISTS `tbltickets_status`;
CREATE TABLE `tbltickets_status` (
  `ticketstatusid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `isdefault` int(11) NOT NULL DEFAULT '0',
  `statuscolor` varchar(7) DEFAULT NULL,
  `statusorder` int(11) DEFAULT NULL,
  PRIMARY KEY (`ticketstatusid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblticket_attachments
-- ----------------------------
DROP TABLE IF EXISTS `tblticket_attachments`;
CREATE TABLE `tblticket_attachments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ticketid` int(11) NOT NULL,
  `replyid` int(11) DEFAULT NULL,
  `file_name` varchar(191) NOT NULL,
  `filetype` varchar(50) DEFAULT NULL,
  `dateadded` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblticket_replies
-- ----------------------------
DROP TABLE IF EXISTS `tblticket_replies`;
CREATE TABLE `tblticket_replies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ticketid` int(11) NOT NULL,
  `userid` int(11) DEFAULT NULL,
  `contactid` int(11) NOT NULL DEFAULT '0',
  `name` text,
  `email` text,
  `date` datetime NOT NULL,
  `message` text,
  `attachment` int(11) DEFAULT NULL,
  `admin` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbltodos
-- ----------------------------
DROP TABLE IF EXISTS `tbltodos`;
CREATE TABLE `tbltodos` (
  `todoid` int(11) NOT NULL AUTO_INCREMENT,
  `description` text NOT NULL,
  `staffid` int(11) NOT NULL,
  `dateadded` datetime NOT NULL,
  `finished` tinyint(1) NOT NULL,
  `datefinished` datetime DEFAULT NULL,
  `item_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`todoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbltracked_mails
-- ----------------------------
DROP TABLE IF EXISTS `tbltracked_mails`;
CREATE TABLE `tbltracked_mails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(32) NOT NULL,
  `rel_id` int(11) NOT NULL,
  `rel_type` varchar(40) NOT NULL,
  `date` datetime NOT NULL,
  `email` varchar(100) NOT NULL,
  `opened` tinyint(1) NOT NULL DEFAULT '0',
  `date_opened` datetime DEFAULT NULL,
  `subject` mediumtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbluser_auto_login
-- ----------------------------
DROP TABLE IF EXISTS `tbluser_auto_login`;
CREATE TABLE `tbluser_auto_login` (
  `key_id` char(32) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_agent` varchar(150) NOT NULL,
  `last_ip` varchar(40) NOT NULL,
  `last_login` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `staff` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbluser_meta
-- ----------------------------
DROP TABLE IF EXISTS `tbluser_meta`;
CREATE TABLE `tbluser_meta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `staff_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `client_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `contact_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(191) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`umeta_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblvault
-- ----------------------------
DROP TABLE IF EXISTS `tblvault`;
CREATE TABLE `tblvault` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `server_address` varchar(191) NOT NULL,
  `port` int(11) DEFAULT NULL,
  `username` varchar(191) NOT NULL,
  `password` text NOT NULL,
  `description` text,
  `creator` int(11) NOT NULL,
  `creator_name` varchar(100) DEFAULT NULL,
  `visibility` tinyint(1) NOT NULL DEFAULT '1',
  `share_in_projects` tinyint(1) NOT NULL DEFAULT '0',
  `last_updated` datetime DEFAULT NULL,
  `last_updated_from` varchar(100) DEFAULT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblviews_tracking
-- ----------------------------
DROP TABLE IF EXISTS `tblviews_tracking`;
CREATE TABLE `tblviews_tracking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rel_id` int(11) NOT NULL,
  `rel_type` varchar(40) NOT NULL,
  `date` datetime NOT NULL,
  `view_ip` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblweb_to_lead
-- ----------------------------
DROP TABLE IF EXISTS `tblweb_to_lead`;
CREATE TABLE `tblweb_to_lead` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_key` varchar(32) NOT NULL,
  `lead_source` int(11) NOT NULL,
  `lead_status` int(11) NOT NULL,
  `notify_lead_imported` int(11) NOT NULL DEFAULT '1',
  `notify_type` varchar(20) DEFAULT NULL,
  `notify_ids` mediumtext,
  `responsible` int(11) NOT NULL DEFAULT '0',
  `name` varchar(191) NOT NULL,
  `form_data` mediumtext,
  `recaptcha` int(11) NOT NULL DEFAULT '0',
  `submit_btn_name` varchar(40) DEFAULT NULL,
  `success_submit_msg` text,
  `language` varchar(40) DEFAULT NULL,
  `allow_duplicate` int(11) NOT NULL DEFAULT '1',
  `mark_public` int(11) NOT NULL DEFAULT '0',
  `track_duplicate_field` varchar(20) DEFAULT NULL,
  `track_duplicate_field_and` varchar(20) DEFAULT NULL,
  `create_task_on_duplicate` int(11) NOT NULL DEFAULT '0',
  `dateadded` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
