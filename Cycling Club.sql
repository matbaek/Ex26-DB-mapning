USE C_DB10_2018;

CREATE TABLE CyclingClub (
	CyclingClubID INT PRIMARY KEY IDENTITY(1, 1),
	Name nVarChar(100) NOT NULL,
	President nVarChar(100) NOT NULL,
	Address nVarChar(100) NOT NULL
)

CREATE TABLE Cyclist (
	CyclistID INT PRIMARY KEY IDENTITY(1, 1),
	Name nVarChar(100) NOT NULL,
	Address nVarChar(100) NOT NULL,
	Age INT NOT NULL,
	TelephoneNo nVarChar(100) NOT NULL,
	CyclingClubID INT FOREIGN KEY REFERENCES CyclingClub(CyclingClubID)
)

CREATE TABLE Bicycle (
	BicycleID INT PRIMARY KEY IDENTITY(1, 1),
	Brand nVarChar(100) NOT NULL,
	Year INT NOT NULL,
	Colour nVarChar(100) NOT NULL,
	Size INT NOT NULL
)

CREATE TABLE Bicycle_Cyclist (
	BicycleID INT FOREIGN KEY REFERENCES Bicycle(BicycleID),
	CyclistID INT FOREIGN KEY REFERENCES Cyclist(CyclistID)
)

CREATE TABLE Tandem (
	BicycleID INT PRIMARY KEY REFERENCES Bicycle(BicycleID),
	NoOfSeats INT NOT NULL,
	[Length] INT NOT NULL
)

CREATE TABLE Racer (
	BicycleID INT PRIMARY KEY REFERENCES Bicycle(BicycleID),
	Weight INT NOT NULL,
	NoOfGearBlades INT NOT NULL
)

CREATE TABLE Country (
	BicycleID INT PRIMARY KEY REFERENCES Bicycle(BicycleID),
	FrameType nVarChar(100) NOT NULL,
	Tire nVarChar(100) NOT NULL
)