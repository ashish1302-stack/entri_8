-- Assignment_8
-- Using Persons_1 and Country_1




SELECT Country_name, COUNT(*) AS NumberOfPersons
FROM Persons_1
GROUP BY Country_name;

SELECT Country_name, COUNT(*) AS NumberOfPersons
FROM Persons_1
GROUP BY Country_name
ORDER BY NumberOfPersons DESC;

SELECT Country_name, AVG(Rating) AS AverageRating
FROM Persons_1
GROUP BY Country_name
HAVING AVG(Rating) > 3.0;

SELECT Country_name
FROM Country_1
WHERE Country_name IN (
    SELECT DISTINCT p.Country_name
    FROM Persons_1 p
    WHERE p.Rating = (
        SELECT Rating
        FROM Persons_1
        WHERE Country_name = 'USA'
        LIMIT 1
    )
);

SELECT Country_name
FROM Country_1
WHERE Population > (
    SELECT AVG(Population)
    FROM Country_1
);


-- NEW Section

CREATE DATABASE Product;

USE Product;

CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    First_name VARCHAR(50),
    Last_name VARCHAR(50),
    Email VARCHAR(100),
    Phone_no VARCHAR(15),
    Address VARCHAR(255),
    City VARCHAR(50),
    State VARCHAR(50),
    Zip_code VARCHAR(10),
    Country VARCHAR(50)
);

USE Product;

INSERT INTO Customer (Customer_Id, First_name, Last_name, Email, Phone_no, Address, City, State, Zip_code, Country) 
VALUES
(1, 'Ashly', 'Johnson', 'ashly.johnson@example.com', '123-456-7890', '123 Elm Street', 'New York', 'New York', '10001', 'USA'),
(2, 'Jibin', 'Jpy', 'jibin.jpy@example.com', '987-654-3210', '456 Maple Avenue', 'San Francisco', 'California', '94101', 'USA'),
(3, 'Goshal', 'Jay', 'goshal.jay@example.com', '345-678-9012', '789 Pine Road', 'Austin', 'Texas', '73301', 'USA'),
(4, 'Richu', 'Zach', 'richu.zach@example.com', '210-543-0987', '101 Oak Lane', 'Chicago', 'Illinois', '60601', 'USA'),
(5, 'Mebin', 'Joby', 'mebin.joby@example.com', '567-890-1234', '202 Birch Street', 'Los Angeles', 'California', '90001', 'USA'),
(6, 'Jonhy', 'John', 'jonhy.john@example.com', '876-543-2109', '303 Willow Avenue', 'Kochi', 'Kerala', '682001', 'India'),
(7, 'Gopika', 'Anil', 'gopika.anil@example.com', '456-789-0123', '404 Cedar Road', 'Mumbai', 'Maharashtra', '400001', 'India'),
(8, 'George', 'Mamen', 'george.mamen@example.com', '654-321-0987', '505 Spruce Lane', 'Bangalore', 'Karnataka', '560001', 'India'),
(9, 'Justin', 'Jose', 'justin.jose@example.com', '789-012-3456', '606 Palm Avenue', 'Delhi', 'Delhi', '110001', 'India'),
(10, 'Mariya', 'Sam', 'mariya.sam@example.com', '321-098-7654', '707 Cypress Street', 'Pune', 'Maharashtra', '411001', 'India');



CREATE VIEW customer_info AS
SELECT CONCAT(First_name, ' ', Last_name) AS Full_Name, Email
FROM Customer;


SELECT * FROM customer_info;

CREATE VIEW US_Customers AS
SELECT *
FROM Customer
WHERE Country = 'USA';

SELECT*FROM us_Customers;

CREATE VIEW Customer_details AS
SELECT 
    CONCAT(First_name, ' ', Last_name) AS Full_Name,
    Email,
    Phone_no,
    State
FROM Customer;

SELECT * FROM Customer_details;

UPDATE Customer
SET Phone_no = 'UpdatedPhoneNumber'
WHERE State = 'California';

SELECT State, COUNT(*) AS Number_of_Customers
FROM Customer
GROUP BY State
HAVING COUNT(*) > 5;

SELECT State, COUNT(*) AS Number_of_Customers
FROM Customer_details
GROUP BY State;

SELECT *
FROM Customer_details
ORDER BY State ASC;






