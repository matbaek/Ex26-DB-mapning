use C_DB10_2018;

DROP TABLE Journalist_Editorial;
DROP TABLE Editorial;
DROP TABLE Journalist;
DROP TABLE Ad;
DROP TABLE SalesEmp;
DROP TABLE Employee;

CREATE TABLE Employee (
	ID INT PRIMARY KEY IDENTITY(1, 1),
	Name nVarChar(100) NOT NULL,
	Address nVarChar(100) NOT NULL,
	Zipcode nVarChar(100) NOT NULL,
	City nVarChar(100) NOT NULL,
	TelephoneNumber nVarChar(100) NOT NULL,
	Department nVarChar(100) NOT NULL
)

CREATE TABLE SalesEmp (
	EmployeeID INT PRIMARY KEY REFERENCES Employee(ID),
	CustomerSegment nVarChar(100) NOT NULL,
	Budget INT NOT NULL
)

CREATE TABLE Ad (
	AdID INT PRIMARY KEY IDENTITY(1, 1),
	Customer nVarChar(100) NOT NULL,
	Size INT NOT NULL,
	Price INT NOT NULL,
	SalesEmpID INT FOREIGN KEY REFERENCES SalesEmp(EmployeeID)
)

CREATE TABLE Journalist (
	EmployeeID INT PRIMARY KEY REFERENCES Employee(ID),
	Subject nVarChar(100) NOT NULL,
	PartTime INT NOT NULL,
)

CREATE TABLE Editorial (
	EditorialID INT PRIMARY KEY IDENTITY(1, 1),
	Title nVarChar(100) NOT NULL,
	Priority nVarChar(100) NOT NULL,
	JournalistID INT FOREIGN KEY REFERENCES Journalist(EmployeeID)
)

CREATE TABLE Journalist_Editorial (
	JournalistID INT FOREIGN KEY REFERENCES Journalist(EmployeeID),
	EditorialID INT FOREIGN KEY REFERENCES Editorial(EditorialID)
)


