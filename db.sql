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


-- Yelp Table
CREATE TABLE restaurants (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    location VARCHAR(50) NOT NULL,
    price_range INT NOT NULL check(price_range >= 1 and price_range <= 5)
);

-- Create entry into DB table
INSERT INTO restaurants (name, location, price_range)
VALUES ('Pizza Hut', 'San Jose', 2);

-- CREATE entry with returning
INSERT INTO restaurants (name, location, price_range)
VALUES ('Mos Burger', 'San Francisco', 4) returning *;

--Update entry
UPDATE restaurants 
SET name = 'Panda Express', 
    location = 'Boston',
    price_range = 2
WHERE id = 7;

--Delete query
DELETE FROM restaurants where id = 8;