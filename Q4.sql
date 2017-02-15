--Database: MySQL 5.7.17
CREATE TABLE `mail_list` (
  `name` varchar(45) DEFAULT NULL,
  `address` varchar(256) DEFAULT NULL,
  `id` varchar(45) NOT NULL,
  `same_family` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SET SQL_SAFE_UPDATES=0;
delete from mail_list
where id in(
	    select id from(
			select l2.id
			from mail_list l1,  mail_list l2
			where l1.same_family = l2.id
		)
	    as to_delete_list
);
SET SQL_SAFE_UPDATES=1;