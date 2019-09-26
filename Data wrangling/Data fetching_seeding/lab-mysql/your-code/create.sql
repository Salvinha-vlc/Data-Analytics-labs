

CREATE TABLE cars(VIN CHAR(17), manufacturer VARCHAR(20), model VARCHAR(50), year INT, color VARCHAR(10));

CREATE TABLE salespersons (staff_id INT, first_name VARCHAR(15), last_name VARCHAR(20), store INT);

CREATE TABLE customers(customer_ID BIGINT, first_name VARCHAR(20), last_name VARCHAR(20), phone_number BIGINT, email VARCHAR(30), address VARCHAR(60), city VARCHAR(30), state_province VARCHAR(20), country VARCHAR(20), zip_postal_code INT);

CREATE TABLE invoices(invoice_ID BIGINT, date DATE, VIN CHAR(17), customer_ID BIGINT, staff_ID INT);

CREATE TABLE stores(store_ID BIGINT, store_name VARCHAR(50));