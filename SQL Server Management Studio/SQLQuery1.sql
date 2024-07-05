create database Zajenda
use Zajenda
create table suppliers(
suppliersID int PRIMARY KEY,
suppliersName varchar(255),
suppliersContact varchar(100),
suppliersCounty varchar(80),
suppliersGender varchar(80),
);

INSERT INTO suppliers (suppliersID, suppliersName, suppliersContact, suppliersCounty, suppliersGender)
VALUES
(1234, 'Jesse', '0712345678', 'Bungoma', 'Male'),
(2345, 'Ziporah', '0723456789', 'Kakamega', 'Female'),
(3456, 'Vivianne', '0734567890', 'Kisumu', 'Female'),
(4567, 'Erichsen', '1234567890', 'Norway', 'Male'),
(5678, 'Olsen', '2345678901', 'Seatle', 'Female'),
(6789, 'Finn', '3456789021', 'Miami', 'Male'),
(7890, 'Leila', '5678902134', 'Chuka', 'Female'),
(8901, 'Peter', '7890213456', 'Kajiado', 'Male'),
(9012, 'David', '9021345678', 'Kikuyu', 'Male'),
(0123, 'Gracious', '2134567890', 'Nandi', 'Female'),
(1457, 'Elena', '1345678902', 'Malindi', 'Female'),
(1345, 'Ronald', '3487659021', 'Lodwar', 'Male'),
(7968, 'Alice', '3456098721', 'Nyamira', 'Female'),
(6435, 'Nimrod', '3456781209', 'Nyeri', 'Male'),
(0034, 'Blessing', '3456129078', 'Mombasa', 'Female');

SELECT * FROM suppliers;

SELECT * FROM suppliers where suppliersID = 0123;
SELECT * FROM suppliers where suppliersContact = '1234567890';
SELECT * FROM suppliers where suppliersName = 'Blessing';
SELECT * FROM suppliers where suppliersCounty = 'Kajiado';
SELECT * FROM suppliers where suppliersGender = 'Female';
