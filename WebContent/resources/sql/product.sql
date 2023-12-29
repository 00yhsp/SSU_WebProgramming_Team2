CREATE TABLE IF NOT EXISTS product(
	p_id VARCHAR(10) NOT NULL,
	p_name VARCHAR(10),
	p_unitPrice INTEGER,
	p_description TEXT,
	p_phone VARCHAR(20),
	p_password VARCHAR(20),
	p_category VARCHAR(20),
	p_fileName VARCHAR(20),
	PRIMARY KEY(p_id)
)default CHARSET=utf8;

create table if not exists user(
	userID varchar(10),
	userPassword varchar(10),
	userName varchar(10),
	userGender varchar(20),
	userEmail varchar(30),
	primary key(userID)
) default charset=utf8;

create table Board(
NUM int NOT NULL auto_increment, 
USERNAME varChar(50), 
PASSWORD varChar(50), 
TITLE varChar(50), MEMO varChar(500),
TIME TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(),
HIT int,
REF int, 
INDENT int, 
STEP int,
PRIMARY KEY (`NUM`)
);

drop table product;
drop table user;
drop table Board;

