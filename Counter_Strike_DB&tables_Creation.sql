drop database if exists CounterStrike;
create database CounterStrike;

use CounterStrike;


-- Table 1 --
drop table if exists users;
create table users(
	id serial PRIMARY KEY,
	name varchar(20),
	nickname varchar(16) unique,
	pass varchar(16),
	hash_pass varchar(255),
	email varchar(40) unique,
	phone bigint unsigned unique,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	isBanned bool COMMENT '������� ����������',
	VIP bool COMMENT '������� ��� �������',
	phone_approved bool COMMENT '�������������� ��������',
	mail_approved bool COMMENT '�������������� �����'
);

-- Table 2 --
drop table if exists maps;
create table maps (
	id serial PRIMARY KEY,
	name varchar(20) UNIQUE,
	official_compitition bool COMMENT '�������� �� �� ���. ��������',
	created_at datetime DEFAULT now(),
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT '��� ����� ��� ����';

-- Table 3 --
drop table if exists users_activity;
CREATE TABLE users_activity ( 
	id serial PRIMARY KEY,
	user_id BIGINT UNSIGNED NOT NULL,
	map_id  BIGINT UNSIGNED NOT NULL COMMENT '����� ����',
	game_time DATETIME DEFAULT CURRENT_TIMESTAMP,
	win bool COMMENT '������� ��� ���',
-- 	KEY index_of_user_id (user_id),
-- 	KEY index_of_map_id (map_id),
	FOREIGN KEY (user_id) REFERENCES users(id),
	FOREIGN KEY (map_id) REFERENCES maps(id)
) COMMENT '��������� ���� ������������';

-- Table 4 --
drop table if exists shop_catalogs;
CREATE TABLE shop_catalogs ( 
	id SERIAL PRIMARY KEY,
    name VARCHAR(255) COMMENT '�������� �������� ���������',
    UNIQUE unique_name(name(10))
);

-- Table 5 --
drop table if exists shop_products;
CREATE TABLE shop_products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) COMMENT '��������',
    desription TEXT COMMENT '��������',
    price DECIMAL (11,2) COMMENT '����',
    catalog_id BIGINT UNSIGNED NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    KEY index_of_catalog_id (catalog_id),
    FOREIGN KEY (catalog_id) REFERENCES shop_catalogs(id)
) COMMENT '������ � ��������';

-- Table 6 --
drop table if exists user_inventory;
CREATE TABLE user_inventory (
    id SERIAL PRIMARY KEY,
    user_id BIGINT UNSIGNED NOT NULL,
    catalog_id BIGINT UNSIGNED NOT NULL,
    products_id BIGINT UNSIGNED NOT NULL,
    add_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	KEY index_of_user_id (user_id),
	KEY index_of_catalog_id (catalog_id),
	KEY index_of_products_id (products_id),
	FOREIGN KEY (user_id) REFERENCES users(id),
	FOREIGN KEY (catalog_id) REFERENCES shop_catalogs(id),
	FOREIGN KEY (products_id) REFERENCES shop_products(id)
) COMMENT '�������� � ��������� ������';

-- Table 7 --
drop table if exists user_referals;
CREATE TABLE user_referals (
    id SERIAL PRIMARY KEY,
    user_id BIGINT UNSIGNED NOT NULL,
    referal_id BIGINT UNSIGNED NOT NULL,
    registered_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	KEY index_of_user_id (user_id),
	KEY index_of_referal_id (referal_id),
	FOREIGN KEY (user_id) REFERENCES users(id),
	FOREIGN KEY (referal_id) REFERENCES users(id)
) COMMENT '���������� � ������������ ������������� �������';

-- Table 8 --
drop table if exists guns_type;
CREATE TABLE guns_type (
	id SERIAL PRIMARY KEY,
    name CHAR(50),
    UNIQUE unique_name(name(10))
) COMMENT '���� ������';
-- Table 9 --
drop table if exists guns;
CREATE TABLE guns (
	id serial PRIMARY KEY,
	name char(20),
	type_id BIGINT UNSIGNED NOT NULL,
	used_by_terrorists bool,
	used_by_counter_terrorists bool,
	FOREIGN KEY (type_id) REFERENCES guns_type(id)
) COMMENT '��� ��������� ������';

-- Table 10 --
drop table if exists gun_sets;
CREATE TABLE gun_sets (
	id serial PRIMARY KEY,
	gun_price INT UNSIGNED NOT NULL COMMENT '���� �������',
	gun_id BIGINT UNSIGNED NOT NULL,
	damage_body INT UNSIGNED NOT NULL COMMENT '���� � ����',
	damage_head INT UNSIGNED NOT NULL COMMENT '���� � ������',
	damage_hands_feet INT UNSIGNED NOT NULL COMMENT '���� � ����������',
	accuracy_in_running int UNSIGNED COMMENT '�������� �� ����',
	accuracy_staying int UNSIGNED COMMENT '������� ����',
	accuracy_in_air int UNSIGNED COMMENT '�������� � ������/�������',
	accuracy_in_zoom int UNSIGNED COMMENT '�������� � �������',
	shoot_speed int UNSIGNED COMMENT '�������� ��������',
	recharging_speed int UNSIGNED COMMENT '�������� �����������',
	FOREIGN KEY (gun_id) REFERENCES guns(id) 
) COMMENT '��������� ������';