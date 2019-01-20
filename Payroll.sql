USE C_DB10_2018;

CREATE TABLE Employee (
	EmployeeID INT PRIMARY KEY IDENTITY(1, 1),
	Name nVarChar(100) NOT NULL,
	Address nVarChar(100) NOT NULL,
	Zipcode INT NOT NULL,
	Department nVarChar(100) NOT NULL,
	TelephoneNo nVarChar(100) NOT NULL
)

CREATE TABLE HourlyPaid (
	EmployeeID INT PRIMARY KEY REFERENCES Employee(EmployeeID),
	SalaryForTheYear FLOAT NOT NULL,
	TaxForTheYear FLOAT NOT NULL,
	WeeklyDeduction nVarChar(100) NOT NULL,
	TaxPercentage nVarChar(100) NOT NULL
)

CREATE TABLE MonthlyPaid (
	EmployeeID INT PRIMARY KEY REFERENCES Employee(EmployeeID),
	SalaryForTheYear FLOAT NOT NULL,
	TaxForTheYear FLOAT NOT NULL,
	WeeklyDeduction nVarChar(100) NOT NULL,
	TaxPercentage nVarChar(100) NOT NULL
)

CREATE TABLE TimeSheet (
	TimeSheetID INT PRIMARY KEY IDENTITY(1, 1),
	Hours FLOAT NOT NULL,
	HourlyPaidID INT FOREIGN KEY REFERENCES HourlyPaid(EmployeeID)
)

CREATE TABLE Task (
	TaskID INT PRIMARY KEY IDENTITY(1, 1),
	Type nVarChar(100) NOT NULL,
	Hours FLOAT NOT NULL
)

CREATE TABLE TimeSheet_Task (
	TimeSheetID INT FOREIGN KEY REFERENCES TimeSheet(TimeSheetID),
	TaskID INT FOREIGN KEY REFERENCES Task(TaskID)
)