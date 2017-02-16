--Database: MySQL 5.7.17
CREATE TABLE `hotel_stays` (
  `room_num` int(11) NOT NULL,
  `arr_date` date NOT NULL,
  `dep_date` date NOT NULL,
  `guest_name` varchar(45) NOT NULL,
  PRIMARY KEY (`room_num`,`arr_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8

DELIMITER //
CREATE TRIGGER insert_arr_dep_chk BEFORE INSERT ON hotel_stays
FOR EACH ROW
BEGIN
	IF NEW.arr_date > NEW.dep_date THEN
    SIGNAL SQLSTATE '45000'
	SET MESSAGE_TEXT = 'Insertion error: arr_date cannot be larger than dep_date';
	END IF;
END; //
DELIMITER ;

DELIMITER //
CREATE TRIGGER update_arr_dep_chk BEFORE UPDATE ON hotel_stays
FOR EACH ROW
BEGIN
	IF NEW.arr_date >  NEW.dep_date THEN
    SIGNAL SQLSTATE '45000'
	SET MESSAGE_TEXT = 'Update error: arr_date cannot be larger than dep_date';
	END IF;
END; //
DELIMITER ;

DELIMITER //
CREATE TRIGGER insert_room_free_chk BEFORE INSERT ON hotel_stays
FOR EACH ROW
BEGIN
	IF NEW.arr_date < (SELECT MAX(dep_date) FROM hotel_stays WHERE room_num = NEW.room_num) THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Insertion error: The room is not available on given arr_date';
    END IF;
END; //
DELIMITER ;

DELIMITER //
CREATE TRIGGER update_room_free_chk BEFORE UPDATE ON hotel_stays
FOR EACH ROW
BEGIN
	IF NEW.arr_date < (SELECT MAX(dep_date) FROM hotel_stays WHERE room_num = NEW.room_num) THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Update error: The room is not available on given arr_date';
    END IF;
END; //
DELIMITER ;

INSERT INTO hotel_stays(room_num, arr_date, dep_date, guest_name)
VALUES (123, '2016-02-02', '2016-02-06', 'A');

INSERT INTO hotel_stays(room_num, arr_date, dep_date, guest_name)
VALUES (123, '2016-02-04', '2016-02-08', 'B');

INSERT INTO hotel_stays(room_num, arr_date, dep_date, guest_name)
VALUES (201, '2016-02-10', '2016-02-06', 'C');