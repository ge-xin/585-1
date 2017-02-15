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
	select * 
    from menu as m1
    where not exists(
		select * 
        from chef_skills as c2
        where (c2.chef = c1.chef) and (c2.dish = m1.dish) 
    )
);

