
-- use artbindu;
/*
drop table if exists UserTable;
DROP TRIGGER IF EXISTS tg_create_dynamic_id_by_userType;
*/

CREATE TABLE UserTable (
  id VARCHAR(10) NOT NULL PRIMARY KEY DEFAULT '0', 
  name VARCHAR(30),
  usertype VARCHAR(15)
);

DELIMITER $$
CREATE TRIGGER tg_create_dynamic_id_by_userType
BEFORE INSERT ON UserTable
FOR EACH ROW
BEGIN
  set @num = (select count(id)+1 from UserTable where usertype like NEW.usertype);
  set @max_userid_len = 7;
  SET NEW.id = CONCAT(
			IF(NEW.usertype like 'Admin', 'A', IF(NEW.usertype like 'Customer', 'C', 'U')), 
            LPAD(@num, @max_userid_len - 1, '0')
	  );
END$$
DELIMITER ;

INSERT INTO UserTable 
(name, usertype) VALUES 
('Jhon', 'Admin'), 
('Mark', 'Customer'), 
('reddy', 'User'), 
('biswa', 'Admin'),
('Sindhu', 'Admin');

select * from UserTable
order by id;


