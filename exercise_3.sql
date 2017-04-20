CREATE DATABASE if not exists power_rangers;
USE power_rangers;

CREATE TABLE if not exists customers (
	cust_id INT,
	fname STRING,
	lname STRING,
	email STRING,
	phone MAP<STRING, STRING>,
	order_ids ARRAY<INT>,
	order_value STRUCT<min:INT,max:INT,avg:INT,total:INT>
)
ROW FORMAT DELIMITED
	FIELDS TERMINATED BY '|'
	COLLECTION ITEMS TERMINATED BY ','
	MAP KEYS TERMINATED BY ':';

desc customers;

ALTER TABLE customers CHANGE fname fullname STRING;

desc customers;