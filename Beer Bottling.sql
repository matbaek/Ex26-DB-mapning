USE C_DB10_2018;

DROP TABLE [Order];
DROP TABLE BeerBottling;
DROP TABLE Packaging;

CREATE TABLE Packaging (
	PackagingID INT IDENTITY(1, 1) PRIMARY KEY,
	Type nVarChar(100) NOT NULL,
	Size INT NOT NULL,
	Amount INT NOT NULL
)

CREATE TABLE BeerBottling (
	BeerBottlingID INT IDENTITY(1, 1) PRIMARY KEY,
	BottlingDate DATETIME2 NOT NULL,
	Amount INT NOT NULL,
	PackagingID INT FOREIGN KEY REFERENCES Packaging(PackagingID)
)

CREATE TABLE [Order] (
	OrderID INT IDENTITY(1, 1) PRIMARY KEY,
	Date DATETIME2 NOT NULL,
	Amount INT NOT NULL,
	PackagingID INT FOREIGN KEY REFERENCES Packaging(PackagingID)
)
