-- Database: ArtemKino

-- DROP DATABASE IF EXISTS "ArtemKino";

CREATE DATABASE "ArtemKino"
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Russian_Russia.1251'
    LC_CTYPE = 'Russian_Russia.1251'
    LOCALE_PROVIDER = 'libc'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;
	
CREATE TABLE tuv_seansi(
	seansi_id int PRIMARY KEY,
	nosaukums varchar(50),
	vecums varchar(3),
	laiks varchar(12),
	ilgums varchar(7),
	zale varchar(3),
	filmas_id int,
	constraint fk_filmas
		foreign key(filmas_id)
			references filmas(filmas_id)
);

create table filmas(
	filmas_id int primary key,
	img bytea,
	nosaukums varchar(50),
	description varchar(120)
);

create table users(
	user_id int primary key,
	usern varchar(30),
	passw varchar(50),
	email varchar(50),
	birthdate date
);
