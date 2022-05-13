-- create table
CREATE TABLE products (
	id INT, 
    name VARCHAR (50),
    price INT,
    on_sale BOOLEAN
);

-- Add Column
ALTER TABLE products
ADD COLUMN featured boolean;

-- Drop Column
ALTER TABLE products
DROP COLUMN featured;

-- Drop table
DROP TABLE products;

-- Delete DB
DROP DATABASE practice;
