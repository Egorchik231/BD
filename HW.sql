-- Task 1 and 2

drop database if exists example;
create database example;
use example;

drop table if exists users;
create table users(
	id bigint unsigned auto_increment unique,
	name char(15),
	created_at datetime,
	updated_at datetime
);

insert into users (name) values ('q'),('qt'),('r'),('e'),('w');

update users 
	set
		created_at = now(),
		updated_at = now(); 


drop table if exists users;
create table users(
	id bigint unsigned auto_increment unique,
	name char(15),
	created_at varchar(30),
	updated_at varchar(30)
);

insert into users (name, created_at, updated_at) values 
	('q', '20.10.2017 8:10', '20.10.2017 8:10'),
	('qt', '20.10.2017 8:10', '20.10.2017 8:10'),
	('r', '20.10.2017 8:10', '20.10.2017 8:10'),
	('e', '20.10.2017 8:10', '20.10.2017 8:10'),
	('w', '20.10.2017 8:10', '20.10.2017 8:10');

ALTER TABLE users ADD new_created_at DATETIME;
UPDATE users SET new_created_at = STR_TO_DATE(created_at, '%d.%m.%Y %l:%i');
ALTER TABLE users DROP created_at, CHANGE new_created_at created_at DATETIME;

ALTER TABLE users ADD new_updated_at DATETIME;
UPDATE users SET new_updated_at = STR_TO_DATE(updated_at, '%d.%m.%Y %l:%i');
ALTER TABLE users DROP updated_at, CHANGE new_updated_at updated_at DATETIME;
		

-- Task 3

drop table if exists warehouse;
create table warehouse(
	value int unsigned
);

INSERT INTO `warehouse` VALUES ('86785'),
('62565'),
('66106'),
('324'),
('26704'),
('77'),
('0'),
('33292'),
('45'),
('74500'),
('0'),
('29226'),
('356'),
('0'),
('25193'),
('33059'),
('57699'),
('2'),
('27748'),
('34932'),
('12'),
('37964'),
('34'),
('2772'),
('25629'),
('90397'),
('0'),
('31719'),
('2822'),
('0'),
('19585'),
('4323');

select value from warehouse 
	ORDER BY value = 0, value;

/*Lesson "Агрегация данных"*/
	-- Task 1
	
drop table if exists users;
create table users(
	id serial,
	name char(15),
	birthday date,
	created_at datetime default now()
);


INSERT INTO `users` VALUES ('1','a','2000-08-31','2014-05-09 19:57:57'),
('2','qui','2007-08-02','1974-08-10 05:43:14'),
('3','eligendi','1985-04-24','1981-04-27 02:52:09'),
('4','perspiciatis','1974-05-04','2007-01-14 17:14:23'),
('5','quia','1987-06-26','2011-10-05 22:51:42'),
('6','repudiandae','1975-09-24','2005-06-29 23:42:56'),
('7','vel','1975-07-29','1993-11-16 18:43:42'),
('8','et','1979-07-19','1988-06-13 15:49:54'),
('9','distinctio','2002-11-22','1986-04-17 09:35:03'),
('10','nihil','1997-07-27','2001-08-14 09:36:42'),
('11','veniam','1974-05-02','2001-11-30 21:19:34'),
('12','ab','2014-03-07','1992-12-14 01:47:45'),
('13','qui','2015-07-10','2016-01-11 16:01:59'),
('14','et','2010-07-14','1975-08-22 09:29:17'),
('15','hic','1990-05-27','2011-01-27 20:17:23'),
('16','sit','2002-01-26','2002-04-25 16:42:47'),
('17','eveniet','1987-10-15','2009-10-16 18:49:59'),
('18','et','1978-03-21','2004-03-18 14:35:57'),
('19','dicta','1974-08-26','1996-06-14 23:41:17'),
('20','quis','1975-09-02','1973-03-24 16:32:08'); 

select (date_format(now(), '%Y') - avg(date_format(birthday, '%Y'))) as Average_age from users ;

-- Task 2

select 
	date_format(date_format(birthday, '2020-%m-%d') , '%a') as `DayName`,
	count(*) as number_of_birthdays
	

from users
group by `DayName`
