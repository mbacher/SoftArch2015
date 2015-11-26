create user 'softarch_user'@'localhost' identified by '12345';
grant all privileges on *.* to 'softarch_user'@'localhost';
flush privileges;
