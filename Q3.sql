--Database: MySQL 5.7.17
CREATE TABLE `project_tracks` (
  `project_id` varchar(45) NOT NULL,
  `step` varchar(45) NOT NULL,
  `project_status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`project_id`,`step`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8

select project_id 
from(
	select project_id, count(project_id) as count
	from (
		select project_id
		from project_tracks
		where project_status ='C'
	) as T2
	group by project_id
) as T1
where count = 1