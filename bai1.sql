create database demo;
use demo;
CREATE TABLE Student (
    id INT AUTO_INCREMENT,
    name VARCHAR(200) not null,
    age INT not null,
    country VARCHAR(50) not null
);
CREATE TABLE Class (
	id INT not null,
    name varchar(50) not null
);
CREATE TABLE Teacher (
    id INT not null,
    name VARCHAR(200) NOT NULL,
    age INT NOT NULL,
    country VARCHAR(50) NOT NULL
);
