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

-- Review table
CREATE TABLE reviews (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    restaurant_id BIGINT NOT NULL REFERENCES restaurants(id) ON DELETE CASCADE,
    name VARCHAR(50) NOT NULL,
    review TEXT,  --unlimited character
    rating INT NOT NULL check(rating >=1 and rating <= 5)
);

--aggregate functions

--Count
SELECT COUNT(*) from reviews;

--Min
SELECT MIN(rating) from reviews;

--Max
SELECT MAX(rating) from reviews;

--AVG
SELECT trunc(AVG(rating), 2) AS average_review from reviews;

SELECT trunc(AVG(rating),2) AS average_rating from reviews where restaurant_id = 1;

SELECT * from reviews;

SELECT restaurant_id, count(restaurant_id) from reviews group by restaurant_id;

-- inner join
SELECT * from restaurants inner join reviews on restaurant_id = reviews.restaurant_id;

-- Left join
SELECT * from restaurants left join reviews on restaurant_id = reviews.restaurant_id;

-- Query for joining review and avg rating
SELECT * from restaurants left join (SELECT restaurant_id, count(*), trunc(avg(rating), 1) as average_rating from reviews group by restaurant_id) reviews on id = reviews.restaurant_id;

-- For one restaurant

SELECT * from restaurants left join (SELECT restaurant_id, count(*), trunc(avg(rating), 1) as average_rating from reviews group by restaurant_id) reviews on id = reviews.restaurant_id where id = $1;

--Alter table
ALTER TABLE reviews
DROP CONSTRAINT "reviews_restaurant_id_fkey"; 

ALTER TABLE reivews
ADD CONSTRAINT "reviews_restaurant_id_fkey" FOREIGN KEY (restaurant_id) REFERENCES restaurants(id) ON DELETE CASCADE;