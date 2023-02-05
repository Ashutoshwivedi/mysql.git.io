show databases;

USE topmentor_7th_jan_2023;
show tables;
-- CREATE TABLE customers (name VARCHAR(255), address VARCHAR(255))
-- select * from customers_07012023;


Create table real_estate (serial_number							VARCHAR(255),
						 X1_transaction_date 					VARCHAR(255),
                         X2_house_age 							VARCHAR(255),
                         X3_distance_to_the_nearest_MRT_station VARCHAR(255) ,
                         X4_number_of_convenience_stores 		varchar(255),
                         X5_latitude 							varchar(255),
                         X6_longitude 							varchar(255),
                         Y_house_price_of_unit_area 			varchar(255))
select * from real_estate;