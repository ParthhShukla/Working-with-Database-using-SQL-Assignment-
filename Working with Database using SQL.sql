create database marketco;
use marketco;

CREATE TABLE Company (
    CompanyID INT PRIMARY KEY AUTO_INCREMENT,
    CompanyName VARCHAR(45),
    Street VARCHAR(45),
    City VARCHAR(45),
    State VARCHAR(2),
    Zip VARCHAR(10)
);

-- -- Statement to create the Contact table:

CREATE TABLE Contact (
    ContactID INT PRIMARY KEY AUTO_INCREMENT,
    CompanyID INT NOT NULL,
    FirstName VARCHAR(45),
    LastName VARCHAR(45),
    Street VARCHAR(45),
    City VARCHAR(45),
    State VARCHAR(2),
    Zip VARCHAR(10),
    IsMain BOOLEAN,
    Email VARCHAR(45),
    Phone VARCHAR(12),
    FOREIGN KEY (CompanyID) REFERENCES Company(CompanyID)
);

-- Statement to create the Employee table:

CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(45),
    LastName VARCHAR(45),
    Salary DECIMAL(10,2),
    HireDate DATE,
    JobTitle VARCHAR(25),
    Email VARCHAR(45),
    Phone VARCHAR(12)
);

-- statement to create contact table.

CREATE TABLE ContactEmployee (
    ContactEmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    ContactID INT NOT NULL,
    EmployeeID INT NOT NULL,
    ContactDate DATE,
    Description VARCHAR(100),
    FOREIGN KEY (ContactID) REFERENCES Contact(ContactID),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);

--  Statement to update Lesley Bland’s phone number:
--  nullifying sql safe update. 
SET SQL_SAFE_UPDATES = 0;

UPDATE Employee
SET Phone = '215-555-8800'
WHERE FirstName = 'Lesley' AND LastName = 'Bland';

UPDATE Company
SET CompanyName = 'Urban Outfitters'
WHERE CompanyName = 'Urban Outfitters, Inc.';

-- doubtfull ( query )

DELETE ContactEmployee
FROM ContactEmployee
JOIN Contact ON Contact.ContactID = ContactEmployee.ContactID
JOIN Employee ON Employee.EmployeeID = ContactEmployee.EmployeeID
WHERE Contact.FirstName = 'Dianne'
  AND Contact.LastName = 'Connor'
  AND Employee.FirstName = 'Jack'
  AND Employee.LastName = 'Lee';

SELECT Employee.FirstName, Employee.LastName
FROM ContactEmployee
JOIN Contact ON Contact.ContactID = ContactEmployee.ContactID
JOIN Company ON Company.CompanyID = Contact.CompanyID
JOIN Employee ON Employee.EmployeeID = ContactEmployee.EmployeeID
WHERE Company.CompanyName = 'Toll Brothers';

  -- Significance of % and _ operators in the LIKE statement:
  -- ans. % is used to find particular alphabet at end or in the beginning 
  -- ans. _ is used as a blank onlly where any suitable worrd as string can be write 
  
  -- ain normalization in databases:
  -- normalisation means organizing things  into separate boxes so there's no mess and no duplicates. In databases, it keeps data neat and clean and avoid repeatation of information. 
  
  -- 10) What does a join in MySQL mean?
  -- A JOIN combines rows from two or more tables based on related columns. It allows querying data that spans multiple tables.

  -- DDL, DCL, and DML in MySQL:

  -- DDL (Data Definition Language) Manages table structures (e.g., CREATE, ALTER, DROP).
  -- DCL (Data Control Language) Control access (e.g., GRANT, REVOKE).
  -- DML (Data Manipulation Language) Handling of data (e.g., INSERT, UPDATE, DELETE).
  
  -- Role and types of MySQL JOINs:

 -- The JOIN clause retrieves related data from multiple tables. Common types:

-- INNER JOIN: Matches rows with common values.
-- LEFT JOIN: Includes unmatched rows from the left table.
-- RIGHT JOIN: Includes unmatched rows from the right table.
-- FULL OUTER JOIN: Includes unmatched rows from both tables. 