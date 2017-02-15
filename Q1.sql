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
    SET MESSAGE_TEXT = 'Insertion error: The room is not available on given arr_date';
    END IF;
END; //
DELIMITER ;