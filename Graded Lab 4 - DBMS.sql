create database greatlearning;

use greatlearning;

create table supplier(SUPP_ID INT auto_increment Primary key,
SUPP_NAME varchar(50) NOT NULL,
SUPP_CITY varchar(50) NOT NULL,
SUPP_PHONE varchar(50) NOT NULL);

create table customer(CUS_ID INT auto_increment Primary key,
CUS_NAME VARCHAR(20) NOT NULL,
CUS_PHONE VARCHAR(10) NOT NULL,
CUS_CITY VARCHAR(30) NOT NULL,
CUS_GENDER CHAR
);

create table category(CAT_ID INT auto_increment Primary key,
CAT_NAME varchar(50) NOT NULL);

create table product(PRO_ID INT auto_increment Primary key,
PRO_NAME VARCHAR(20) NOT NULL DEFAULT "Dummy",
PRO_DESCE VARCHAR(60) NOT NULL,
CAT_ID INT,
FOREIGN KEY (CAT_ID) REFERENCES category(CAT_ID)
);

create table supplier_pricing(PRICING_ID INT auto_increment Primary key,
PRO_ID INT,
FOREIGN KEY (PRO_ID) REFERENCES product(PRO_ID),
SUPP_ID INT,
FOREIGN KEY (SUPP_ID) REFERENCES supplier(SUPP_ID),
SUPP_PRICE INT DEFAULT 0);

create table orders(
ORD_ID INT auto_increment Primary key,
ORD_AMOUNT INT NOT NULL,
ORD_DATE DATE NOT NULL,
CUS_ID INT,
FOREIGN KEY (CUS_ID) REFERENCES customer(CUS_ID),
PRICING_ID INT,
FOREIGN KEY (PRICING_ID) 
REFERENCES supplier_pricing(PRICING_ID));

create table rating(RAT_ID INT auto_increment Primary key,
ORD_ID INT,
FOREIGN KEY (ORD_ID) REFERENCES orderss(ORD_ID),
RAT_RATSTARS INT NOT NULL);

INSERT INTO supplier VALUES
(1,'Rajesh Retails', 'Delhi', 1234567890),
(2,'Appario Ltd.', 'Mumbai', 2589631470),
(3,'Knome products', 'Banglore', 9785462315),
(4,'Bansal Retails', 'Kochi', 8975463285),
(5, 'Mittal Ltd.', 'Lucknow', 7898456532);

INSERT INTO customer VALUES
(1, 'AAKASH',9999999999, 'DELHI', 'M'),
(2, 'AMAN', 9785463215, 'NOIDA', 'M'),
(3, 'NEHA', 9999999999, 'MUMBAI', 'F'),
(4, 'MEGHA', 9994562399, 'KOLKATA', 'F'),
(5, 'PULKIT', 7895999999, 'LUCKNOW', 'M');

INSERT INTO category VALUES
(1, 'BOOKS'),
(2, 'GAMES'),
(3, 'GROCERIES'),
(4, 'ELECRONICS'),
(5, 'CLOTHES');

INSERT INTO product VALUES
(1, 'GTA V','Windows 7 and above with i5 processor and 8GB RAM', 2),
(2, 'TSHIRT', 'SIZE-L with Black, Blue and White variations', 5),
(3, 'ROG LAPTOP', 'Windows 10 with 15inch screen, i7 processor, 1TB SSD', 4),
(4, 'OATS', 'Highly Nutritious from Nestle', 3),
(5, 'HARRY POTTER', 'Best Collection of all time by J.K Rowling', 1),
(6, 'MILK', '1L Toned MIlk', 3),
(7, 'BOAT EARPHONES', '1.5Meter long Dolby Atmos', 4),
(8, 'JEANS', 'Stretchable Denim Jeans with various sizes and color', 5),
(9, 'PRJECT IGI', 'compatible with windows 7 and above', 2),
(10, 'HOODIE', 'Black GUCCI for 13 yrs and above', 5),
(11, 'RICH DAD POOR DAD', 'Written by RObert Kiyosaki', 1),
(12, 'TRAIN YOUR BRAIN', 'By Shireen Stephen', 1);

INSERT INTO supplier_pricing (PRICING_ID, PRO_ID, SUPP_ID, SUPP_PRICE)
VALUES 
    (1, 1, 2, 1500),
    (2, 3, 5, 30000),
    (3, 5, 1, 3000),
    (4, 2, 3, 2500),
    (5, 4, 1, 1000),
    (6, 12, 2, 780),
    (7, 12, 4, 789),
    (8, 3, 1, 31000),
    (9, 1, 5, 1450),
    (10, 4, 2, 999),
    (11, 7, 3, 549),
    (12, 7, 4, 529),
    (13, 6, 2, 105),
    (14, 6, 1, 99),
    (15, 2, 5, 2999),
    (16, 5, 2, 2999);


INSERT INTO orders (ORD_ID, ORD_AMOUNT, ORD_DATE, CUS_ID, PRICING_ID)
VALUES 
    (101, 1500, '2021-10-06', 2, 1),
    (102, 1000, '2021-10-12', 3, 5),
    (103, 30000, '2021-09-16', 5, 2),
    (104, 1500, '2021-10-05', 1, 1),
    (105, 3000, '2021-08-16', 4, 3),
    (106, 1450, '2021-08-18', 1, 9),
    (107, 789, '2021-09-01', 3, 7),
    (108, 780, '2021-09-07', 5, 6),
    (109, 3000, '2021-10-10', 5, 3),
    (110, 2500, '2021-09-10', 2, 4),
    (111, 1000, '2021-09-15', 4, 5),
    (112, 789, '2021-09-16', 4, 7),
    (113, 31000, '2021-09-16', 1, 8),
    (114, 1000, '2021-09-16', 3, 5),
    (115, 3000, '2021-09-16', 5, 3),
    (116, 99, '2021-09-17', 2, 14);

INSERT INTO rating (RAT_ID, ORD_ID, RAT_RATSTARS)
VALUES 
    (1, 101, 4),
    (2, 102, 3),
    (3, 103, 1),
    (4, 104, 2),
    (5, 105, 4),
    (6, 106, 3),
    (7, 107, 4),
    (8, 108, 4),
    (9, 109, 3),
    (10, 110, 5),
    (11, 111, 3),
    (12, 112, 4),
    (13, 113, 2),
    (14, 114, 1),
    (15, 115, 1),
    (16, 116, 0);
-- select * from customer;

-- Display the total number of customers based on gender who have placed individual orderss of worth at least Rs.3000.

SELECT COUNT(t2.CUS_GENDER) AS NoOfCustomers, t2.CUS_GENDER, t2.ORD_AMOUNT 
FROM ( SELECT t1.CUS_ID, t1.CUS_GENDER, t1.ORD_AMOUNT, t1.CUS_NAME 
FROM ( SELECT orders.CUS_ID, orders.ORD_AMOUNT, customer.CUS_GENDER, customer.CUS_NAME 
FROM orders INNER JOIN customer ON orders.CUS_ID = customer.CUS_ID WHERE orders.ORD_AMOUNT >= 3000 ) 
AS t1 ) AS t2 GROUP BY t2.CUS_GENDER, t2.ORD_AMOUNT;

-- Display all the orderss along with product name ordersed by a customer having Customer_Id=2
SELECT o.ORD_ID, p.PRO_NAME, o.ORD_AMOUNT, o.ORD_DATE FROM orders o JOIN supplier_pricing sp ON o.PRICING_ID = sp.PRICING_ID JOIN product p ON sp.PRO_ID = p.PRO_ID WHERE o.CUS_ID = 2;

-- Display the Supplier details who can supply more than one product.
SELECT s.*, COUNT(sp.PRICING_ID) AS ProductCount FROM supplier s JOIN supplier_pricing sp ON s.SUPP_ID = sp.SUPP_ID GROUP BY s.SUPP_ID HAVING ProductCount > 1;

-- Find the least expensive product from each category and print the table with category id, name, product name and price of the product
SELECT c.CAT_ID, c.CAT_NAME, p.PRO_NAME, MIN(sp.SUPP_PRICE) AS Price FROM category c JOIN product p ON c.CAT_ID = p.CAT_ID JOIN supplier_pricing sp ON p.PRO_ID = sp.PRO_ID GROUP BY c.CAT_ID, c.CAT_NAME, p.PRO_NAME;

-- Display the Id and Name of the Product ordersed after “2021-10-05”.
SELECT o.ORD_ID, p.PRO_NAME FROM orders o JOIN supplier_pricing sp ON o.PRICING_ID = sp.PRICING_ID JOIN product p ON sp.PRO_ID = p.PRO_ID WHERE o.ORD_DATE > '2021-10-05';

-- Display customer name and gender whose names start or end with character 'A'.
SELECT CUS_NAME, CUS_GENDER FROM customer WHERE CUS_NAME LIKE 'A%' OR CUS_NAME LIKE '%A';

-- Create a stored procedure to display supplier id, name, Rating(Average rating of all the products sold by every customer) 
-- and Type_of_Service. For Type_of_Service, If rating =5, print “Excellent Service”,If rating >4 print “Good Service”, 
-- If rating >2 print “Average Service” else print “Poor Service”. Note that there should be one rating per supplier.

DELIMITER &&  
CREATE PROCEDURE proc()
BEGIN
select report.supp_id,report.supp_name,report.Average,
CASE
	WHEN report.Average =5 THEN 'Excellent Service'
    	WHEN report.Average >4 THEN 'Good Service'
    	WHEN report.Average >2 THEN 'Average Service'
    	ELSE 'Poor Service'
END AS Type_of_Service from 
(select final.supp_id, supplier.supp_name, final.Average from
(select test2.supp_id, sum(test2.rat_ratstars)/count(test2.rat_ratstars) as Average from
(select supplier_pricing.supp_id, test.ORD_ID, test.RAT_RATSTARS from supplier_pricing inner join
(select orders.pricing_id, rating.ORD_ID, rating.RAT_RATSTARS from orders inner join rating on rating.`ord_id` = orders.ord_id ) as test
on test.pricing_id = supplier_pricing.pricing_id) 
as test2 group by supplier_pricing.supp_id) 
as final inner join supplier where final.supp_id = supplier.supp_id) as report;
END &&  
DELIMITER ;  
call proc();

