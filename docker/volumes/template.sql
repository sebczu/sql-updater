CREATE SCHEMA IF NOT EXISTS example CHARACTER SET utf8 COLLATE utf8_bin;
CREATE USER IF NOT EXISTS 'example'@'%' IDENTIFIED BY 'example';
GRANT ALL ON example.* TO 'example'@'%';