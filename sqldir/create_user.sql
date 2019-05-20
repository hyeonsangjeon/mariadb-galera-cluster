create user 'testuser'@'%' identified by 'iamgroot';
create user 'testuser'@'localhost' identified by 'iamgroot';
create user 'root'@'localhost' identified by 'iamgroot';

grant all privileges on *.* to 'testuser'@'%';
grant all privileges on *.* to 'testuser'@'localhost';
grant all privileges on *.* to 'root'@'localhost';

