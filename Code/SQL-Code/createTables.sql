CREATE TABLE Author (
	AuthorID int PRIMARY KEY,
	FirstName varchar(255),
	LastName varchar(255)
);

CREATE TABLE Publisher (
	PublisherID int PRIMARY KEY,
	FirstName varchar(255),
	LastName varchar(255),
	YearPublished varchar(4)
);

CREATE TABLE Book (
	RFID int PRIMARY KEY,
	Title varchar(255),
	Edition int,
  	AuthorID int,
  	GenreID int,
  	PublisherID int,
	
	FOREIGN KEY (AuthorID) REFERENCES Author(AuthorID),
	FOREIGN KEY (GenreID) REFERENCES Genre(GenreID),
	FOREIGN KEY (PublisherID) REFERENCES Publisher(PublisherID)
);

CREATE TABLE BookRecord (
  	RecordID int PRIMARY KEY,
	CheckOutDate datetime,
	ReturnDate datetime,
	RFID int,
	FineID int,
  	UserID int
	
	FOREIGN KEY (RFID) REFERENCES Book(RFID),
	FOREIGN KEY (FineID) REFERENCES Fine(FineID),
	FOREIGN KEY (UserID) REFERENCES User(UserID)
);

CREATE TABLE Genre (
	GenreID int PRIMARY KEY,
	Description varchar(255)
);

CREATE TABLE Employee (
	EmployeeID int PRIMARY KEY,
	FirstName varchar(255),
	LastName varchar(255),
	UserID int,
	
	FOREIGN KEY (UserID) REFERENCES Account(UserID)
);

CREATE TABLE Account (
	UserID int PRIMARY KEY,
	Username varchar(255),
	Password varchar(255),
	TypeID int,
	
	FOREIGN KEY (TypeID) REFERENCES AccountType(TypeID)
);

CREATE TABLE AccountType (
	TypeID int PRIMARY KEY,
	Description varchar(255)
);

CREATE TABLE Reservation (
	ReservationID int PRIMARY KEY,
	UserID int,
	CreationDate datetime,
	StatusID int,
	
	FOREIGN KEY (UserID) REFERENCES Account(UserID),
	FOREIGN KEY (StatusID) REFERENCES ReservationStatus(StatusID)
);

CREATE TABLE ReservationStatus (
	StatusID int PRIMARY KEY,
	Description varchar(255)
);

CREATE TABLE Fine (
	FineID int PRIMARY KEY,
	Amount money,
	RecordID int,
	RFID int,
	
	FOREIGN KEY (RecordID) REFERENCES BookRecord(RecordID),
	FOREIGN KEY (RFID) REFERENCES Book(RFID)
);
