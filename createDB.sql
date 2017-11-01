create database PDO;
use PDO;
create table tablekey
(
	pdoID int unsigned auto_increment primary key,
	userID int unsigned not null,
	key0 char(200) not null,
	key1 char(200) null,
	key2 char(200) null,
	key3 char(200) null,
	key4 char(200) null,
	key5 char(200) null,
	key6 char(200) null,
	key7 char(200) null
)character set = utf8;

create table tablevalue
(
	pdoID int unsigned auto_increment primary key,
	userID int unsigned not null,
	value0 text null,
	value1 text null,
	value2 text null,
	value3 text null,
	value4 text null,
	value5 text null,
	value6 text null,
	value7 text null,
	index(userID)
)character set = utf8;

create table tablequery
(
	pdoID int unsigned auto_increment primary key,
	userID int unsigned not null,
	datetime DATE null,
	spend float null,
	place text null,
	index(userID)
)character set = utf8;

create table tablerelation
(
	pdo1 int unsigned not null,
	pdo2 int unsigned not null,
	index(pdo1),
	index(pdo2)
)character set = utf8;
