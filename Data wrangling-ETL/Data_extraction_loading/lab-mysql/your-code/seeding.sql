--  Create Stores Table
INSERT INTO stores (store_ID, store_name) VALUES
(2,'Madrid'), (3, 'Valencia'), (4,'Castellon');
SELECT * from stores;

-- Create Cars table 
INSERT INTO cars (car_ID, VIN, manufacturer, model, year, store_ID, color) VALUES
(0,	'3K096I98581DHSNUP', 'Volkswagen', 'Tiguan', 2019, 1, 'Blue'), 
(1, 'ZM8G7BEUQZ97IH46V', 'Peugeot', 'Rifter', 2019, 2, 'Red');

-- Add duplicate VIN into cars 
INSERT INTO cars (car_ID, VIN, manufacturer, model, year, store_ID, color) VALUES
(2, 'ZM8G7BEUQZ97IH46V', 'Peugeot', 'Rifter', 2019, 2, 'Red');

-- Create customers table
INSERT INTO customers (customer_ID, first_name, last_name, phone_number, email, address, city, state_province, country, zip_postal_code)
VALUES
(10001, 	'Lionel', 'Picasso', 	'34 636 17 63 82',' ', 'Paseo de la Chopera, 14' , 'Madrid' , 'Madrid', 'Spain', 28045), 
(20001, 	'Abraham', 'Lincoln', 	'31 305 907 7086', ' ', 'Av. Vallcarca 120', 'Barcelona', 'Barcelona', 'Spain', 08023);

SELECT * from customers;
