-- Database: MySQL 5.7.17
CREATE TABLE `menu` (
  `dish` varchar(45) NOT NULL,
  PRIMARY KEY (`dish`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `chef_skills` (
  `chef` varchar(45) NOT NULL,
  `dish` varchar(45) NOT NULL,
  PRIMARY KEY (`chef`,`dish`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `chef_skills` (`chef`, `dish`) VALUES ('A', 'Mint chocolate brownie');
INSERT INTO `chef_skills` (`chef`, `dish`) VALUES ('B', 'Upside down pineapple cake');
INSERT INTO `chef_skills` (`chef`, `dish`) VALUES ('B', 'Creme brulee');
INSERT INTO `chef_skills` (`chef`, `dish`) VALUES ('B', 'Mint chocolate brownie');
INSERT INTO `chef_skills` (`chef`, `dish`) VALUES ('C', 'Upside down pineapple cake');
INSERT INTO `chef_skills` (`chef`, `dish`) VALUES ('C', 'Creme brulee');
INSERT INTO `chef_skills` (`chef`, `dish`) VALUES ('D', 'Apple pie');
INSERT INTO `chef_skills` (`chef`, `dish`) VALUES ('D', 'Upside down pineapple cake');
INSERT INTO `chef_skills` (`chef`, `dish`) VALUES ('D', 'Creme brulee');
INSERT INTO `chef_skills` (`chef`, `dish`) VALUES ('E', 'Apple pie');
INSERT INTO `chef_skills` (`chef`, `dish`) VALUES ('E', 'Upside down pineapple cake');
INSERT INTO `chef_skills` (`chef`, `dish`) VALUES ('E', 'Creme brulee');
INSERT INTO `chef_skills` (`chef`, `dish`) VALUES ('E', 'Bananas Foster');

INSERT INTO `menu` (`dish`) VALUES ('Apple pie');
INSERT INTO `menu` (`dish`) VALUES ('Upside down pineapple cake');
INSERT INTO `menu` (`dish`) VALUES ('Creme brulee');

select distinct chef
from chef_skills as c1
where not exists(
	select * 
    from menu as m1
    where not exists(
		select * 
        from chef_skills as c2
        where (c2.chef = c1.chef) and (c2.dish = m1.dish) 
    )
);

