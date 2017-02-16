--Database: MySQL 5.7.17
CREATE TABLE `GradeReport` (
  `SID` varchar(45) NOT NULL,
  `ClassName` varchar(45) NOT NULL,
  `Grade` varchar(45) NOT NULL,
  PRIMARY KEY (`SID`,`ClassName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `GradeReport` (`SID`, `ClassName`, `Grade`) VALUES ('123', 'ART123', 'A');
INSERT INTO `GradeReport` (`SID`, `ClassName`, `Grade`) VALUES ('123', 'BUS456', 'B');
INSERT INTO `GradeReport` (`SID`, `ClassName`, `Grade`) VALUES ('666', 'REL100', 'D');
INSERT INTO `GradeReport` (`SID`, `ClassName`, `Grade`) VALUES ('666', 'ECO966', 'A');
INSERT INTO `GradeReport` (`SID`, `ClassName`, `Grade`) VALUES ('666', 'BUS456', 'B');
INSERT INTO `GradeReport` (`SID`, `ClassName`, `Grade`) VALUES ('345', 'BUS456', 'A');
INSERT INTO `GradeReport` (`SID`, `ClassName`, `Grade`) VALUES ('345', 'ECO966', 'F');

SELECT ClassName, COUNT(SID) AS StudentEnrolled
FROM GradeReport
GROUP BY ClassName;