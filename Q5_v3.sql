CREATE TABLE `menu` (
  `dish` varchar(45) NOT NULL,
  PRIMARY KEY (`dish`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `chef_skills` (
  `chef` varchar(45) NOT NULL,
  `dish` varchar(45) NOT NULL,
  PRIMARY KEY (`chef`,`dish`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

select distinct chef
from chef_skills as c1
where not exists(
	select dish from menu as m1
    where m1.dish not in(
		select c2.dish
        from chef_skills as c2
        where c1.chef = c2.chef
    ) 
);