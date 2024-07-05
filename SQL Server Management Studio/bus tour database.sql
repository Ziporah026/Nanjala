create DATABASE Tour
use Tour

CREATE TABLE Tours (
    tour_id INT PRIMARY KEY IDENTITY(1,1),
    tour_name VARCHAR(100)
);

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY IDENTITY(1,1),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100)
);

CREATE TABLE Guides (
    guide_id INT PRIMARY KEY IDENTITY(1,1),
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

CREATE TABLE Reservations (
    reservation_id INT PRIMARY KEY IDENTITY(1,1),
    tour_id INT,
    customer_id INT,
    reservation_date DATE,
    guide_id INT,
    FOREIGN KEY (tour_id) REFERENCES Tours(tour_id),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (guide_id) REFERENCES Guides(guide_id)
);

-- Insert values into Tours table
INSERT INTO Tours (tour_name) VALUES 
('City Tour'),
('Historical Sites Tour'),
('Nature Expedition'),
('Food Tasting Adventure'),
('Art and Culture Walk');

-- Insert values into Customers table
INSERT INTO Customers (first_name, last_name, email) VALUES 
('John', 'Smith', 'john.smith@example.com'),
('Emma', 'Johnson', 'emma.johnson@example.com'),
('Michael', 'Williams', 'michael.williams@example.com'),
('Sarah', 'Brown', 'sarah.brown@example.com'),
('David', 'Jones', 'david.jones@example.com');

-- Insert values into Guides table
INSERT INTO Guides (first_name, last_name) VALUES 
('Emily', 'Anderson'),
('James', 'Wilson'),
('Olivia', 'Garcia'),
('Daniel', 'Martinez'),
('Sophia', 'Lopez');

-- Insert values into Reservations table
INSERT INTO Reservations (tour_id, customer_id, reservation_date, guide_id) VALUES 
(1, 1, '2024-07-06', 1),
(3, 2, '2024-07-08', 2),
(2, 3, '2024-07-09', 3),
(4, 4, '2024-07-10', 4),
(5, 5, '2024-07-11', 5);

select * from Tours
select * from Customers
select * from Guides
select * from Reservations


