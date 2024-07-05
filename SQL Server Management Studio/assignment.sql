create database Walusala
use Walusala

-- Create Customers table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Address VARCHAR(100),
    City VARCHAR(50),
    State VARCHAR(50),
    Country VARCHAR(50),
    Phone VARCHAR(20)
);

-- Create Orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Create Products table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    ProductName VARCHAR(100),
    CategoryID INT,
    UnitPrice DECIMAL(10, 2),
    UnitsInStock INT,
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

-- Create Categories table
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY AUTO_INCREMENT,
    CategoryName VARCHAR(100)
);

-- Create OrderDetails table
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    UnitPrice DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Insert records into Customers table
INSERT INTO Customers (FirstName, LastName, Email, Address, City, State, Country, Phone)
VALUES 
('John', 'Doe', 'john@example.com', '123 Main St', 'Springfield', 'IL', 'USA', '123-456-7890'),
('Jane', 'Smith', 'jane@example.com', '456 Oak St', 'Bristol', 'TN', 'USA', '234-567-8901'),
('John', 'Doe', 'john@example.com', '123 Maple Ave', 'Springfield', 'IL', 'USA', '345-678-9012'),
('Emily', 'Johnson', 'emily@example.com', '789 Elm St', 'Portland', 'OR', 'USA', '456-789-0123'),
('Michael', 'Williams', 'michael@example.com', '567 Pine St', 'Seattle', 'WA', 'USA', '567-890-1234'),
('Sarah', 'Brown', 'sarah@example.com', '890 Cedar St', 'Austin', 'TX', 'USA', '678-901-2345'),
('David', 'Martinez', 'david@example.com', '234 Birch St', 'Miami', 'FL', 'USA', '789-012-3456'),
('Jessica', 'Jones', 'jessica@example.com', '456 Walnut St', 'Denver', 'CO', 'USA', '890-123-4567'),
('Matthew', 'Garcia', 'matthew@example.com', '678 Cherry St', 'Phoenix', 'AZ', 'USA', '901-234-5678'),
('Emma', 'Rodriguez', 'emma@example.com', '901 Oakwood Ave', 'Houston', 'TX', 'USA', '012-345-6789'),
('Daniel', 'Lopez', 'daniel@example.com', '345 Pinecrest Dr', 'Los Angeles', 'CA', 'USA', '123-456-7890'),
('Olivia', 'Hernandez', 'olivia@example.com', '678 Elmwood Dr', 'San Francisco', 'CA', 'USA', '234-567-8901'),
('James', 'Gonzalez', 'james@example.com', '123 Maplewood Dr', 'New York', 'NY', 'USA', '345-678-9012'),
('Sophia', 'Perez', 'sophia@example.com', '890 Birchwood Dr', 'Chicago', 'IL', 'USA', '456-789-0123'),
('Alexander', 'Wilson', 'alexander@example.com', '456 Cedarwood Dr', 'Dallas', 'TX', 'USA', '567-890-1234'),
('Isabella', 'Anderson', 'isabella@example.com', '567 Oakridge Dr', 'Philadelphia', 'PA', 'USA', '678-901-2345'),
('William', 'Taylor', 'william@example.com', '678 Pinehill Dr', 'Atlanta', 'GA', 'USA', '789-012-3456'),
('Ava', 'Thomas', 'ava@example.com', '901 Elmhill Dr', 'Miami', 'FL', 'USA', '890-123-4567'),
('Michael', 'Jackson', 'michaelj@example.com', '234 Birchwood Dr', 'Seattle', 'WA', 'USA', '901-234-5678'),
('Mia', 'White', 'mia@example.com', '345 Pinewood Dr', 'San Diego', 'CA', 'USA', '012-345-6789')

-- Insert records into Orders table
INSERT INTO Orders (CustomerID, OrderDate, TotalAmount)
VALUES 
(1, '2024-05-17', 150.00),
(2, '2024-05-18', 200.00),
(3, '2024-05-19', 150.50),
(4, '2024-05-20', 300.75),
(5, '2024-05-21', 180.25),
(6, '2024-05-22', 250.00),
(7, '2024-05-23', 175.80),
(8, '2024-05-24', 220.30),
(9, '2024-05-25', 190.60),
(10, '2024-05-26', 270.90),
(11, '2024-05-27', 160.25),
(12, '2024-05-28', 310.40),
(13, '2024-05-29', 225.75),
(14, '2024-05-30', 195.20),
(15, '2024-05-31', 280.30),
(16, '2024-06-01', 205.60),
(17, '2024-06-02', 335.20),
(18, '2024-06-03', 245.75),
(19, '2024-06-04', 185.90),
(20, '2024-06-05', 295.40)

-- Insert records into Products table
INSERT INTO Products (ProductName, CategoryID, UnitPrice, UnitsInStock)
VALUES 
('Laptop', 999.99, 1),
('T-Shirt', 19.99, 2),
('Product C', 3, 20.50, 30),
('Product D', 4, 10.25, 40),
('Product E', 5, 18.75, 25),
('Product F', 6, 12.60, 35),
('Product G', 7, 22.40, 20),
('Product H', 8, 14.30, 45),
('Product I', 9, 17.20, 55),
('Product J', 10, 9.80, 60),
('Product K', 11, 25.50, 70),
('Product L', 12, 8.90, 80),
('Product M', 13, 30.75, 90),
('Product N', 14, 11.20, 100),
('Product O', 15, 19.65, 110),
('Product P', 16, 14.80, 120),
('Product Q', 17, 26.30, 130),
('Product R', 18, 7.50, 140),
('Product S', 19, 21.90, 150),
('Product T', 20, 16.40, 160)

-- Insert records into Categories table
INSERT INTO Categories (CategoryName)
VALUES 
('Electronics'),
('Clothing'),
('Category 3'),
('Category 4'),
('Category 5'),
('Category 6'),
('Category 7'),
('Category 8'),
('Category 9'),
('Category 10'),
('Category 11'),
('Category 12'),
('Category 13'),
('Category 14'),
('Category 15'),
('Category 16'),
('Category 17'),
('Category 18'),
('Category 19'),
('Category 20')

-- Insert records into OrderDetails table
INSERT INTO OrderDetails (OrderID, ProductID, Quantity, UnitPrice)
VALUES 
(1, 1, 2, 10.00),
(1, 2, 1, 15.00),
(3, 4, 2, 20.50),
(5, 6, 3, 25.25),
(7, 8, 4, 30.75),
(9, 10, 5, 35.50),
(11, 12, 6, 40.25),
(13, 14, 7, 45.00),
(15, 16, 8, 50.50),
(17, 18, 9, 55.75),
(19, 20, 10, 60.25),
(21, 22, 11, 65.00),
(23, 24, 12, 70.25),
(25, 26, 13, 75.50),
(27, 28, 14, 80.75),
(29, 30, 15, 85.25),
(31, 32, 16, 90.50),
(33, 34, 17, 95.75),
(35, 36, 18, 100.25),
(37, 38, 19, 105.50)
