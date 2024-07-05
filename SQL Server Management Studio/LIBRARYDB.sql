create Database LibraryDB
use LibraryDB

-- Creating the Books table
CREATE TABLE Books (
    BookID INT PRIMARY KEY IDENTITY(1,1),
    Title VARCHAR(255) NOT NULL,
    AuthorID INT,
    PublishedYear INT,
	ISBN INT,
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

-- Creating the Authors table
CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    BirthDate DATE
);

-- Creating the Members table
CREATE TABLE Members (
    MemberID INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    DateOfBirth DATE,
    Address VARCHAR(255),
    Email VARCHAR(100)
);

-- Creating the Loans table
CREATE TABLE Loans (
    LoanID INT PRIMARY KEY IDENTITY(1,1),
    BookID INT,
    MemberID INT,
    LoanDate DATE,
    ReturnDate DATE,
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);

-- Inserting sample data into Books
INSERT INTO Books (Title, AuthorID, PublishedYear, ISBN)
VALUES
('1984', 1, 1949, '1234567890123'),
('Pride and Prejudice', 2, 1813, '2345678901234'),
('Adventures of Huckleberry Finn', 3, 1884, '1256789034567');

-- Inserting sample data into Authors
INSERT INTO Authors (FirstName, LastName, BirthDate)
VALUES
('George', 'Orwell', '1903-06-25'),
('Jane', 'Austen', '1775-12-16'),
('Mark', 'Twain', '1835-11-30');

-- Inserting sample data into Members
INSERT INTO Members (FirstName, LastName, DateOfBirth, Address, Email)
VALUES
('John', 'Doe', '1990-01-01', '123 Elm Street', 'john.doe@hotmail.com'),
('Jane', 'Smith', '1985-02-14', '456 Oak Avenue', 'jane.smith@yahoo.com'),
('Ziporah', 'Nanjala', '1998-06-21', '134 Bungoma', 'nanjala@gmail.com');

-- Inserting sample data into Loans
INSERT INTO Loans (MemberID, LoanDate, ReturnDate)
VALUES
(1, '2023-01-01', '2023-01-15'),
(2, '2023-02-01', '2023-02-15'),
(3, '2024-03-22', '2024-03-22');

SELECT * FROM Books
SELECT * FROM Authors
SELECT * FROM Members
SELECT * FROM Loans

--Altering the tables
ALTER TABLE Books ADD Genre varchar;
ALTER TABLE Books MODIFY COLUMN Genre bigINT;
ALTER TABLE Members ADD PhoneNumber INT(13);

--Updating records
UPDATE Books SET Name = '1984', Genre = 'Thriller' where BookID = 1;
UPDATE Books SET Name = 'Pride and Prejudice', Genre = 'Young Adult' where BookID = 2;
UPDATE Books SET Name = 'Adventures of Huckleberry Finn', Genre = 'Fantasy' where BookID = 3;
UPDATE Authors SET BirthDate = '1997-06-21' WHERE AuthorID = 1; 
UPDATE Members SET Email = 'jane123@hotmail.com' WHERE MemberID = 2; 

--Deleting records
DELETE FROM Loans WHERE MemberID = 3
DELETE FROM Members WHERE FirstName = 'Jane'

--Dropping tables
DROP TABLE Loans
DROP TABLE Members

--Inner joining of tables
SELECT * FROM Books INNER  JOIN Authors ON Books.BookID = Authors.AuthorID;
SELECT * FROM Books INNER  JOIN Members ON Books.BookID = Members.MemberID;
SELECT * FROM Books INNER  JOIN Loans ON Books.BookID = Loans.LoanID;

--Natural joint
SELECT * FROM Books NATURAL JOIN Authors;

--left outer jon
SELECT * FROM Books LEFT OUTER JOIN Authors ON Books.BookID = Authors.AuthorID;
SELECT * FROM Books LEFT OUTER JOIN Members ON Books.BookID = Members.MemberID;

--Right outer join
SELECT * FROM Books RIGHT OUTER JOIN Authors ON Books.BookID = Authors.AuthorID;
SELECT * FROM Books RIGHT OUTER JOIN Members ON Books.BookID = Members.MemberID;
SELECT * FROM Books RIGHT OUTER JOIN Members ON Books.Title = Members.FirstName;

--full outer join
SELECT * FROM Books FULL OUTER JOIN Authors ON Books.BookID = Authors.AuthorID;
SELECT * FROM Books FULL OUTER JOIN Members ON Books.BookID = Members.MemberID;
SELECT * FROM Books FULL OUTER JOIN Members ON Books.Title = Members.FirstName;

--Left join excluding inner join
SELECT * FROM Books LEFT JOIN Authors ON Books.BookID = Authors.AuthorID WHERE Authors.AuthorID IS NULL;

--Right join excluding inner join
SELECT * FROM Books RIGHT JOIN Authors ON Books.BookID = Authors.AuthorID WHERE Authors.AuthorID IS NULL;

--full outer excluding inner join
SELECT * FROM Books FULL OUTER JOIN Authors ON Books.BookID = Authors.AuthorID WHERE Books.BookID IS NULL OR Authors.AuthorID IS NULL;

--CROSS JOINT
SELECT * FROM Books CROSS JOIN Authors;
SELECT * FROM Books CROSS JOIN Members;
SELECT * FROM Authors CROSS JOIN Members;