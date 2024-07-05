CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(100),
    ManagerID INT
);

SELECT 
    EmployeeName
FROM 
    Employees
WHERE 
    ManagerID IS NULL;
