CREATE DATABASE IF NOT EXISTS `order-directory` ; USE `order-directory`;


-- _____________________________________________________________________________________________________________________
-- Q1) Create tables

CREATE TABLE IF NOT EXISTS supplier(
SUPP_ID int primary key,
SUPP_NAME varchar(50) NOT NULL,
SUPP_CITY varchar(50),
SUPP_PHONE varchar(10) NOT NULL
);
CREATE TABLE IF NOT EXISTS customer(
CUS_ID INT NOT NULL,
CUS_NAME VARCHAR(20) NOT NULL,
CUS_PHONE VARCHAR(10) NOT NULL,
CUS_CITY varchar(30) NOT NULL,
CUS_GENDER CHAR,
PRIMARY KEY (CUS_ID));
CREATE TABLE IF NOT EXISTS category (
CAT_ID INT NOT NULL,
CAT_NAME VARCHAR(20) NOT NULL,
PRIMARY KEY (CAT_ID)
);
CREATE TABLE IF NOT EXISTS product (
PRO_ID INT NOT NULL,
PRO_NAME VARCHAR(20) NOT NULL DEFAULT "Dummy",
PRO_DESC VARCHAR(60),
CAT_ID INT NOT NULL,
PRIMARY KEY (PRO_ID),
FOREIGN KEY (CAT_ID) REFERENCES CATEGORY (CAT_ID)
);
CREATE TABLE IF NOT EXISTS supplier_pricing (
PRICING_ID INT NOT NULL,
PRO_ID INT NOT NULL,
SUPP_ID INT NOT NULL,
SUPP_PRICE INT DEFAULT 0,
PRIMARY KEY (PRICING_ID),
FOREIGN KEY (PRO_ID) REFERENCES PRODUCT (PRO_ID),
FOREIGN KEY (SUPP_ID) REFERENCES SUPPLIER(SUPP_ID)
);
CREATE TABLE IF NOT EXISTS `order` (
ORD_ID INT NOT NULL,
ORD_AMOUNT INT NOT NULL,
ORD_DATE DATE,
CUS_ID INT NOT NULL,
PRICING_ID INT NOT NULL,
PRIMARY KEY (ORD_ID),
FOREIGN KEY (CUS_ID) REFERENCES CUSTOMER(CUS_ID),
FOREIGN KEY (PRICING_ID) REFERENCES SUPPLIER_PRICING(PRICING_ID)
);
CREATE TABLE IF NOT EXISTS rating (
RAT_ID INT NOT NULL,
ORD_ID INT NOT NULL,
RAT_RATSTARS INT NOT NULL,
PRIMARY KEY (RAT_ID),
FOREIGN KEY (ORD_ID) REFERENCES `order`(ORD_ID)
);


-- _____________________________________________________________________________________________________________________
-- Q2) Insert into tables

INSERT INTO SUPPLIER VALUES(1,'Rajesh Retails','Delhi','1234567890');
INSERT INTO SUPPLIER VALUES(2,'Appario Ltd.','Mumbai','2589631470');
INSERT INTO SUPPLIER VALUES(3,'Knome products','Banglore','9785462315');
INSERT INTO SUPPLIER VALUES(4,'Bansal Retails','Kochi','8975463285');
INSERT INTO SUPPLIER VALUES(5,'Mittal Ltd.','Lucknow','7898456532');
INSERT INTO CUSTOMER VALUES(1,'AAKASH','9999999999','DELHI','M');
INSERT INTO CUSTOMER VALUES(2,"AMAN",'9785463215',"NOIDA",'M');
INSERT INTO CUSTOMER VALUES(3,'NEHA','9999999999','MUMBAI','F');
INSERT INTO CUSTOMER VALUES(4,'MEGHA','9994562399','KOLKATA','F');
INSERT INTO CUSTOMER VALUES(5,'PULKIT','7895999999','LUCKNOW','M');
INSERT INTO CATEGORY VALUES( 1,'BOOKS');
INSERT INTO CATEGORY VALUES(2,'GAMES');
INSERT INTO CATEGORY VALUES(3,'GROCERIES');
INSERT INTO CATEGORY VALUES (4,'ELECTRONICS');
INSERT INTO CATEGORY VALUES(5,'CLOTHES');
INSERT INTO PRODUCT VALUES(1,'GTA V','Windows 7 and above with i5 processor and 8GB RAM',2);
INSERT INTO PRODUCT VALUES(2,'TSHIRT','SIZE-L with Black, Blue and White variations',5);
INSERT INTO PRODUCT VALUES(3,'ROG LAPTOP','Windows 10 with 15inch screen, i7 processor, 1TB SSD',4);
INSERT INTO PRODUCT VALUES(4,'OATS','Highly Nutritious from Nestle',3);
INSERT INTO PRODUCT VALUES(5,'HARRY POTTER','Best Collection of all time by J.K Rowling',1);
INSERT INTO PRODUCT VALUES(6,'MILK','1L Toned MIlk',3);
INSERT INTO PRODUCT VALUES(7,'Boat EarPhones','1.5Meter long Dolby Atmos',4);
INSERT INTO PRODUCT VALUES(8,'Jeans','Stretchable Denim Jeans with various sizes and color',5);
INSERT INTO PRODUCT VALUES(9,'Project IGI','compatible with windows 7 and above',2);
INSERT INTO PRODUCT VALUES(10,'Hoodie','Black GUCCI for 13 yrs and above',5);
INSERT INTO PRODUCT VALUES(11,'Rich Dad Poor Dad','Written by RObert Kiyosaki',1);
INSERT INTO PRODUCT VALUES(12,'Train Your Brain','By Shireen Stephen',1);
INSERT INTO SUPPLIER_PRICING VALUES(1,1,2,1500);
INSERT INTO SUPPLIER_PRICING VALUES(2,3,5,30000);
INSERT INTO SUPPLIER_PRICING VALUES(3,5,1,3000);
INSERT INTO SUPPLIER_PRICING VALUES(4,2,3,2500);
INSERT INTO SUPPLIER_PRICING VALUES(5,4,1,1000);
INSERT INTO SUPPLIER_PRICING VALUES(6,12,2,780);
INSERT INTO SUPPLIER_PRICING VALUES(7,12,4,789);
INSERT INTO SUPPLIER_PRICING VALUES(8,3,1,31000);
INSERT INTO SUPPLIER_PRICING VALUES(9,1,5,1450);
INSERT INTO SUPPLIER_PRICING VALUES(10,4,2,999); 
INSERT INTO SUPPLIER_PRICING VALUES(11,7,3,549);
INSERT INTO SUPPLIER_PRICING VALUES(12,7,4,529);
INSERT INTO SUPPLIER_PRICING VALUES(13,6,2,105);
INSERT INTO SUPPLIER_PRICING VALUES(14,6,1,99);
INSERT INTO SUPPLIER_PRICING VALUES(15,2,5,2999);
INSERT INTO SUPPLIER_PRICING VALUES(16,5,2,2999);
INSERT INTO `ORDER` VALUES (101,1500,'2021-10-06',2,1);
INSERT INTO `ORDER` VALUES(102,1000,'2021-10-12',3,5);
INSERT INTO `ORDER` VALUES(103,30000,'2021-09-16',5,2);
INSERT INTO `ORDER` VALUES(104,1500,'2021-10-05',1,1);
INSERT INTO `ORDER` VALUES(105,3000,'2021-08-16',4,3);
INSERT INTO `ORDER` VALUES(106,1450,'2021-08-18',1,9);
INSERT INTO `ORDER` VALUES(107,789,'2021-09-01',3,7);
INSERT INTO `ORDER` VALUES(108,780,'2021-09-07',5,6);
INSERT INTO `ORDER` VALUES(109,3000,'2021-0-10',5,3);
INSERT INTO `ORDER` VALUES(110,2500,'2021-09-10',2,4);
INSERT INTO `ORDER` VALUES(111,1000,'2021-09-15',4,5);
INSERT INTO `ORDER` VALUES(112,789,'2021-09-16',4,7);
INSERT INTO `ORDER` VALUES(113,31000,'2021-09-16',1,8);
INSERT INTO `ORDER` VALUES(114,1000,'2021-09-16',3,5);
INSERT INTO `ORDER` VALUES(115,3000,'2021-09-16',5,3);
INSERT INTO `ORDER` VALUES(116,99,'2021-09-17',2,14);
INSERT INTO RATING VALUES(1,101,4);
INSERT INTO RATING VALUES(2,102,3);
INSERT INTO RATING VALUES(3,103,1);
INSERT INTO RATING VALUES(4,104,2);
INSERT INTO RATING VALUES(5,105,4);
INSERT INTO RATING VALUES(6,106,3);
INSERT INTO RATING VALUES(7,107,4);
INSERT INTO RATING VALUES(8,108,4);
INSERT INTO RATING VALUES(9,109,3);
INSERT INTO RATING VALUES(10,110,5);
INSERT INTO RATING VALUES(11,111,3);
INSERT INTO RATING VALUES(12,112,4);
INSERT INTO RATING VALUES(13,113,2);
INSERT INTO RATING VALUES(14,114,1);
INSERT INTO RATING VALUES(15,115,1);
INSERT INTO RATING VALUES(16,116,0);


-- _____________________________________________________________________________________________________________________
-- Q3) Display the total number of customers based on gender who have placed orders of worth at least Rs.3000
-- --------> query result based on each order placed by a customer ---------
SELECT CUS_GENDER, COUNT(*) AS COUNT FROM CUSTOMER WHERE CUS_ID IN (SELECT CUS_ID FROM `ORDER` where ORD_AMOUNT >= 3000) GROUP BY CUS_GENDER;
-- --------> query result based on total worth of all orders placed per customer ----------
SELECT CUS_GENDER, COUNT(*) AS COUNT FROM CUSTOMER WHERE CUS_ID IN (SELECT CUS_ID FROM `ORDER` GROUP BY CUS_ID HAVING SUM(ORD_AMOUNT) >= 3000) GROUP BY CUS_GENDER;

-- _____________________________________________________________________________________________________________________
-- Q4) Display all the orders along with product name ordered by a customer having Customer_Id=2
SELECT ORD.*, PROD.PRO_NAME FROM `ORDER` ORD INNER JOIN SUPPLIER_PRICING PRICE ON PRICE.PRICING_ID = ORD.PRICING_ID INNER JOIN PRODUCT PROD ON PROD.PRO_ID = PRICE.PRO_ID WHERE ORD.CUS_ID = 2;

-- _____________________________________________________________________________________________________________________
-- Q5) Display the Supplier details who can supply more than one product
SELECT SUPP_ID, COUNT(SUPP_ID) AS COUNT FROM SUPPLIER_PRICING GROUP BY SUPP_ID HAVING COUNT(SUPP_ID) > 1;

-- _____________________________________________________________________________________________________________________
-- Q6) Find the least expensive product from each category and print the table with category id, name, product name and price of the product
SELECT CATEGORY.CAT_ID,CATEGORY.CAT_NAME,PRODUCT.PRO_NAME, MIN(SUPP_PRICE) AS PRICE_OF_PRODUCT
FROM SUPPLIER_PRICING
INNER JOIN PRODUCT ON SUPPLIER_PRICING.PRO_ID = PRODUCT.PRO_ID 
INNER JOIN CATEGORY ON PRODUCT.CAT_ID = CATEGORY.CAT_ID 
GROUP BY CATEGORY.CAT_ID;

-- _____________________________________________________________________________________________________________________
-- Q7) Display the Id and Name of the Product ordered after "2021-10-05"
SELECT PRO_ID, PRO_NAME FROM PRODUCT WHERE PRO_ID IN 
(SELECT PRO_ID FROM SUPPLIER_PRICING WHERE PRICING_ID IN 
(SELECT PRICING_ID FROM `ORDER` WHERE ORD_DATE > '2021-10-05'));

-- _____________________________________________________________________________________________________________________
-- Q8) Display customer name and gender whose names start or end with character 'A'
SELECT CUS_NAME, CUS_GENDER FROM CUSTOMER WHERE UPPER(CUS_NAME) LIKE '%A' OR UPPER(CUS_NAME) LIKE 'A%';

-- _____________________________________________________________________________________________________________________
-- Q9) Create Stored Procedure
DELIMITER &&
CREATE PROCEDURE get_supplier_review_details() 
BEGIN
SELECT SUPPLIER.SUPP_ID, SUPPLIER.SUPP_NAME, RATING.RAT_RATSTARS, 
CASE 
	WHEN RATING.RAT_RATSTARS = 5 THEN 'Excellent Service' 
	WHEN RATING.RAT_RATSTARS >= 4 THEN 'Good Service' 
	WHEN RATING.RAT_RATSTARS > 2 THEN 'Average Service' 
	ELSE 'Poor Service' 
END AS TYPE_OF_SERVICE 
FROM RATING 
INNER JOIN `ORDER` ORD ON RATING.ORD_ID = ORD.ORD_ID
INNER JOIN SUPPLIER_PRICING PRICE ON PRICE.PRICING_ID = ORD.PRICING_ID
INNER JOIN SUPPLIER ON SUPPLIER.SUPP_ID = PRICE.SUPP_ID;
END &&
DELIMITER ;


CALL get_supplier_review_details();



