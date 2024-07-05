create DATABASE Music
use Music

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY IDENTITY(1,1),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100)
);

CREATE TABLE Products (
    product_id INT PRIMARY KEY IDENTITY(1,1),
    product_name VARCHAR(100),
    price DECIMAL(10, 2),
    product_type VARCHAR(50)
);

CREATE TABLE Sales (
    sale_id INT PRIMARY KEY IDENTITY(1,1),
    customer_id INT,
    sale_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE SaleItems (
    sale_item_id INT PRIMARY KEY IDENTITY(1,1),
    sale_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10, 2),
    FOREIGN KEY (sale_id) REFERENCES Sales(sale_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

CREATE TABLE Teachers (
    teacher_id INT PRIMARY KEY IDENTITY(1,1),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    hourly_rate DECIMAL(10, 2)
);

CREATE TABLE Lessons (
    lesson_id INT PRIMARY KEY IDENTITY(1,1),
    teacher_id INT,
    instrument VARCHAR(50),
    lesson_name VARCHAR(100),
    lesson_price DECIMAL(10, 2),
    FOREIGN KEY (teacher_id) REFERENCES Teachers(teacher_id)
);
