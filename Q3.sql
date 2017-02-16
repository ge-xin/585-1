--Database: MySQL 5.7.17
CREATE TABLE `project_tracks` (
  `project_id` varchar(45) NOT NULL,
  `step` varchar(45) NOT NULL,
  `project_status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`project_id`,`step`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `project_tracks` (`project_id`, `step`, `project_status`) VALUES ('P100', '0', 'C');
INSERT INTO `project_tracks` (`project_id`, `step`, `project_status`) VALUES ('P100', '1', 'W');
INSERT INTO `project_tracks` (`project_id`, `step`, `project_status`) VALUES ('P100', '2', 'W');
INSERT INTO `project_tracks` (`project_id`, `step`, `project_status`) VALUES ('P201', '0', 'C');
INSERT INTO `project_tracks` (`project_id`, `step`, `project_status`) VALUES ('P201', '1', 'C');
INSERT INTO `project_tracks` (`project_id`, `step`, `project_status`) VALUES ('P333', '0', 'W');
INSERT INTO `project_tracks` (`project_id`, `step`, `project_status`) VALUES ('P333', '1', 'W');
INSERT INTO `project_tracks` (`project_id`, `step`, `project_status`) VALUES ('P333', '2', 'W');
INSERT INTO `project_tracks` (`project_id`, `step`, `project_status`) VALUES ('P333', '3', 'W');
INSERT INTO `project_tracks` (`project_id`, `step`, `project_status`) VALUES ('P444', '0', 'C');
INSERT INTO `project_tracks` (`project_id`, `step`, `project_status`) VALUES ('P555', '0', 'W');
INSERT INTO `project_tracks` (`project_id`, `step`, `project_status`) VALUES ('P666', '0', 'C');
INSERT INTO `project_tracks` (`project_id`, `step`, `project_status`) VALUES ('P666', '1', 'C');

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
where count = 1;