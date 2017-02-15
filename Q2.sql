CREATE TABLE `GradeReport` (
  `SID` varchar(45) DEFAULT NULL,
  `ClassName` varchar(45) DEFAULT NULL,
  `Grade` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8

SELECT ClassName, COUNT(SID) AS StudentEnrolled
FROM GradeReport
GROUP BY ClassName
