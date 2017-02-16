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

select chef 
from chef_skills 
where chef_skills.dish in(
	select dish from menu
)
group by chef
having count(chef) = (
	select count(dish) from menu
);