create user 'testuser'@'%' identified by 'iamgroot';
create user 'testuser'@'localhost' identified by 'iamgroot';
create user 'root'@'localhost' identified by 'iamgroot';


grant all privileges on *.* to 'testuser'@'%';
grant all privileges on *.* to 'testuser'@'localhost';
grant all privileges on *.* to 'root'@'localhost';


CREATE SCHEMA IF NOT EXISTS `MODEL` DEFAULT CHARACTER SET utf8 ;
USE `MODEL` ;

FLUSH PRIVILEGES;

