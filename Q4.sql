-- Database: MySQL 5.7.17
CREATE TABLE `mail_list` (
  `name` varchar(45) DEFAULT NULL,
  `address` varchar(256) DEFAULT NULL,
  `id` varchar(45) NOT NULL,
  `same_family` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `mail_list` (`name`, `address`, `id`) VALUES ('Alice', 'A', '10');
INSERT INTO `mail_list` (`name`, `address`, `id`) VALUES ('Bob', 'B', '15');
INSERT INTO `mail_list` (`name`, `address`, `id`) VALUES ('Carmen', 'C', '22');
INSERT INTO `mail_list` (`name`, `address`, `id`, `same_family`) VALUES ('Diego', 'A', '9', '10');
INSERT INTO `mail_list` (`name`, `address`, `id`, `same_family`) VALUES ('Ella', 'B', '3', '15');
INSERT INTO `mail_list` (`name`, `address`, `id`) VALUES ('Farkhad', 'D', '11');


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