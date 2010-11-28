DROP TABLE IF EXISTS `permissions`;

#
# Table structure for table 'permissions'
#

CREATE TABLE `permissions` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY (`name`)
);


#
# Dumping data for table 'permissions'
#

INSERT INTO `permissions` (`id`, `name`, `description`) VALUES
	(1,'view_pages','Specifies if a user can view pages'),
	(2,'edit_pages','Specifies if a user can edit pages'),
	(3,'delete_pages','Specifies if a user can edit pages'),
	(4,'add_users','Specifies if a user can add new users'),
	(5,'list_users','Specifies if a user can list users'),
	(6,'delete_users','Specifies if a user can delete users');


DROP TABLE IF EXISTS `groups`;

#
# Table structure for table 'groups'
#

CREATE TABLE `groups` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY (`name`)
);


#
# Dumping data for table 'groups'
#

INSERT INTO `groups` (`id`, `name`, `description`) VALUES
	(1,'admin','Administrator'),
	(2,'members','General User');

DROP TABLE IF EXISTS `group_permission_xref`;

#
# Table structure for table 'group_permission_xref'
#

CREATE TABLE `group_permission_xref` (
  `group_id` mediumint(8) unsigned NOT NULL,
  `permission_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`group_id`, `permission_id`)
);


#
# Dumping data for table 'group_permission_xref'
#

INSERT INTO `group_permission_xref` (`group_id`, `permission_id`) VALUES
	(1,1),
	(1,2),
	(1,3),
	(1,4),
	(1,5),
	(1,6),
	(2,1);


DROP TABLE IF EXISTS `meta`;

#
# Table structure for table 'meta'
#

CREATE TABLE `meta` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
);


#
# Dumping data for table 'meta'
#

INSERT INTO `meta` (`id`, `user_id`, `first_name`, `last_name`, `company`, `phone`) VALUES
	('1','1','Admin','istrator','ADMIN','0');

DROP TABLE IF EXISTS `users`;

#
# Table structure for table 'users'
#

CREATE TABLE `users` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` mediumint(8) unsigned NOT NULL,
  `ip_address` char(16) NOT NULL,
  `username` varchar(15) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(40) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) unsigned NOT NULL,
  `last_login` int(11) unsigned DEFAULT NULL,
  `active` tinyint(1) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
);


#
# Dumping data for table 'users'
#

INSERT INTO `users` (`id`, `group_id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `created_on`, `last_login`, `active`) VALUES
	('1','1','127.0.0.1','administrator','59beecdf7fc966e2f17fd8f65a4a9aeb09d4a3d4','9462e8eee0','admin@admin.com','',NULL,'1268889823','1268889823','1');
