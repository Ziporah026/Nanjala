Create Database Online
Use Online

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    Customer_Name VARCHAR(50) NOT NULL,
    Customer_Email VARCHAR(50) NOT NULL,
    Customer_Address VARCHAR(50) NOT NULL
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    OrderDate DATE NOT NULL,
    OrderTotalAmount DECIMAL(10,2) NOT NULL,
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers (CustomerID)
);

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    Quantity DECIMAL(10,2) NOT NULL,
    UnitPrice DECIMAL(10,2) NOT NULL,
    OrderID INT,
    ProductID INT,
    FOREIGN KEY (OrderID) REFERENCES Orders (OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products (ProductID)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    ProductName VARCHAR(50) NOT NULL,
    UnitPrice DECIMAL(10,2) NOT NULL,
    CategoryID INT,
    FOREIGN KEY (CategoryID) REFERENCES Categories (CategoryID)
);

CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    CategoryName VARCHAR(50) NOT NULL
);

-- Inserting values into Customers
INSERT INTO Customers (Customer_Name, Customer_Email, Customer_Address) VALUES
('Alice Johnson', 'alice.johnson@gmail.com', 'Maple Street'),
('Bob Smith', 'bob.smith@hotmail.com', 'Oak Avenue'),
('Carol White', 'carol.white@outlook.com', 'Pine Road'),
('David Brown', 'david.brown@gmail.com', 'Elm Street'),
('Eve Davis', 'eve.davis@hotmail.com', 'Birch Boulevard');

-- Inserting values into Orders
INSERT INTO Orders (OrderDate, OrderTotalAmount, CustomerID) VALUES
('2024-01-15', 250.75, 1),
('2024-02-20', 150.00, 2),
('2024-03-05', 350.50, 3),
('2024-04-10', 275.99, 4),
('2024-05-25', 499.90, 5);

-- Inserting values into Products
INSERT INTO Products (ProductName, UnitPrice, CategoryID) VALUES
('Laptop', 1200.00, 1),
('Smartphone', 800.00, 1),
('Tablet', 450.00, 1),
('Monitor', 300.00, 2),
('Keyboard', 100.00, 2);

-- Inserting values into Categories
INSERT INTO Categories (CategoryName) VALUES
('Electronics'),
('Computer Accessories'),
('Home Appliances'),
('Furniture'),
('Books');

-- Inserting values into OrderDetails
INSERT INTO OrderDetails (Quantity, UnitPrice, OrderID, ProductID) VALUES
(1, 1200.00, 1, 1),
(2, 800.00, 2, 2),
(1, 450.00, 3, 3),
(3, 300.00, 4, 4),
(5, 100.00, 5, 5);

