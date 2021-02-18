CREATE TABLE Employees (
    EmployeeId INT PRIMARY KEY NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    FirstName VARCHAR(50) NOT NULL,
    Department VARCHAR(25) NOT NULL,
    Email VARCHAR(65) NOT NULL
)

CREATE TRIGGER NoJefferys
ON Employees
INSTEAD OF INSERT
AS
BEGIN
    DECLARE @fn varchar(50)
    SELECT @fn=FirstName FROM Employees
    IF (@fn ='Jeffery')
    BEGIN
        RAISERROR ('You may not add people named Jeffery to this table')
    END
    ELSE
        INSERT INTO Employees (FirstName) values (@fn)
END