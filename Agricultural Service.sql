USE C_DB10_2018;

CREATE TABLE Property (
	PropertyID INT IDENTITY(1, 1) PRIMARY KEY,
	Name nVarChar(100) NOT NULL,
	Size INT NOT NULL,
	Address nVarChar(100) NOT NULL
)

CREATE TABLE Field (
	FieldID INT IDENTITY(1, 1) PRIMARY KEY,
	Location nVarChar(100) NOT NULL,
	Size INT NOT NULL,
	SoilQuality nVarChar(100) NOT NULL,
	PropertyID INT FOREIGN KEY REFERENCES Property(PropertyID)
)

CREATE TABLE Machine (
	MachineID INT IDENTITY(1, 1) PRIMARY KEY,
	Brand nVarChar(100) NOT NULL,
	Model nVarChar(100) NOT NULL,
	Year INT NOT NULL
)

CREATE TABLE Field_Machine (
	FieldID INT FOREIGN KEY REFERENCES Field(FieldID),
	MachineID INT FOREIGN KEY REFERENCES Machine(MachineID)
)

 CREATE TABLE Tractor (
	MachineID INT PRIMARY KEY REFERENCES Machine(MachineID),
	Horsepower nVarChar(100) NOT NULL
 )
 
 CREATE TABLE Harvester (
	MachineID INT PRIMARY KEY REFERENCES Machine(MachineID),
	Performance nVarChar(100) NOT NULL
 )
 
 CREATE TABLE Plow (
	MachineID INT PRIMARY KEY REFERENCES Machine(MachineID),
	NoOfChisels nVarChar(100) NOT NULL
 )