create database New
use New

-- Create Customers table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(20)
);

-- Create Orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT,
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Create Products table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(100),
    Price DECIMAL(10, 2),
    CategoryID INT,
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

-- Create Categories table
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(100)
);

-- Create OrderDetails table
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY IDENTITY(1,1),
    OrderID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Insert records into Customers table
INSERT INTO Customers (Name, Email, Phone) VALUES
('John Doe', 'john@gmail.com', '123-456-7890'),
('Jane Smith', 'jane@hotmail.com', '987-654-3210'),
('John Juma', 'jjohn@yahoo.com', '123-456-7890'),
('Alice Johnson', 'alice@gmail.com', '456-789-0123'),
('Michael Brown', 'michael@hotmail.ke', '789-012-3456'),
('Emily Davis', 'emily@gmail.com', '012-345-6789'),
('William Wilson', 'william@chuka.ac.com', '234-567-8901'),
('Sophia Martinez', 'sophia@gmail.com', '567-890-1234'),
('David Anderson', 'david@gmail.com', '890-123-4567'),
('Olivia Taylor', 'olivia@yahoo.com', '345-678-9012'),
('James Thomas', 'james@yahoo.com', '678-901-2345'),
('Emma Hernandez', 'emma@hotmail.com', '901-234-5678'),
('Daniel Wright', 'daniel@gmail.com', '432-109-8765'),
('Ava Lopez', 'ava@gmail.com', '654-321-0987'),
('Liam King', 'liam@gmail.com', '321-098-7654'),
('Mia Lee', 'mia@hotmail.com', '543-210-9876'),
('Benjamin Scott', 'benjamin@hotmail.com', '876-543-2109'),
('Charlotte Green', 'charlotte@hotmail.com', '210-987-6543'),
('Ethan Adams', 'ethan@gmail.com', '987-654-3210'),
('Isabella Baker', 'isabella@yahoo.com', '321-543-0987');

-- Insert records into Orders table
INSERT INTO Orders (CustomerID, OrderDate) VALUES
(1, '2024-05-15'),
(2, '2024-05-16'),
(3, '2024-05-17'),
(4, '2024-05-18'),
(5, '2024-05-19'),
(6, '2024-05-20'),
(7, '2024-05-21'),
(8, '2024-05-22'),
(9, '2024-05-23'),
(10, '2024-05-24'),
(11, '2024-05-25'),
(12, '2024-05-26'),
(13, '2024-05-27'),
(14, '2024-05-28'),
(15, '2024-05-29'),
(16, '2024-05-30'),
(17, '2024-05-31'),
(18, '2024-06-01'),
(19, '2024-06-02'),
(20, '2024-06-03'),
(21, '2024-06-04');

-- Insert records into Categories table
INSERT INTO Categories (Name) VALUES
('Electronics'),
('Clothing'),
('Books'),
('Toys'),
('Kitchenware'),
('Furniture'),
('Stationery'),
('Sporting Goods'),
('Jewelry'),
('Automotive'),
('Beauty Products'),
('Home Appliances'),
('Pet Supplies'),
('Gardening Tools'),
('Musical Instruments'),
('Healthcare Products'),
('Art Supplies'),
('Baby Products'),
('Outdoor Gear'),
('Office Supplies');

-- Insert records into Products table
INSERT INTO Products (Name, Price, CategoryID) VALUES
('Laptop', 999.99, 1),
('T-Shirt', 19.99, 2),
('Jeans', 49.99, 1),
('Sneakers', 79.99, 1),
('Dress Shirt', 34.99, 1),
('Skirt', 39.99, 1),
('Hoodie', 54.99, 1),
('Pants', 44.99, 1),
('Jacket', 69.99, 1),
('Dress', 59.99, 1),
('Socks', 9.99, 3),
('Sunglasses', 29.99, 1),
('Hat', 24.99, 1),
('Belt', 19.99, 1),
('Gloves', 14.99, 1),
('Scarf', 19.99, 1),
('Underwear', 12.99, 3),
('Pajamas', 29.99, 1),
('Swimsuit', 39.99, 1),
('Coat', 79.99, 1);

-- Insert records into OrderDetails table
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES
(1, 1, 50),
(2, 2, 30),
(3, 3, 20),
(4, 4, 35),
(5, 5, 100),
(6, 6, 500),
(7, 7, 400),
(8, 8, 200),
(9, 9, 600),
(10, 10,550),
(11, 11, 300),
(12, 12, 450),
(13, 13, 150),
(14, 14, 250),
(15, 15, 650),
(16, 16, 75),
(17, 17, 350),
(18, 18, 45),
(19, 19, 100),
(20, 20, 400);

-- Query to test relationships
SELECT * FROM Customers
SELECT * FROM Orders
SELECT * FROM Products
SELECT * FROM Categories
SELECT * FROM OrderDetails
SELECT * FROM Orders where OrderID = 10
SELECT * FROM Customers where CustomerID = 12
SELECT * FROM Products where ProductID = 15
ALTER TABLE Customers ADD Birthdate DATE
ALTER TABLE Products DROP COLUMN description 
ALTER TABLE Customers ADD Country varchar
ALTER TABLE Products ADD Description VARCHAR
UPDATE Products SET Description = 'hp' WHERE ProductID = 1
ALTER TABLE Products MODIFY COLUMN CategoryID varchar(50)
UPDATE Products SET Name = 'Hoodie', price = 350 where ProductID = 7
UPDATE Customers SET Email = 'emma@hotmail.com' WHERE CustomerID =12
UPDATE Categories SET Name = 'Jewelery' where CategoryID = 9
UPDATE Orders SET OrderDate = '2024-05-27' where OrderID = 13
UPDATE OrderDetails SET Quantity = '5.00' where OrderDetailID = 18
DELETE FROM Products where ProductID = 1


