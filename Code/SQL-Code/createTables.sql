CREATE TABLE Author (
	AuthorID	char(4) PRIMARY KEY NOT NULL,
	FirstName	varchar(20) NOT NULL,
	LastName	varchar(30) NOT NULL
);

CREATE TABLE Genre (
	GenreID			char(3) PRIMARY KEY NOT NULL,
	GenreDescription	varchar(255) NOT NULL
);

CREATE TABLE Publisher (
	PublisherID	char(5) PRIMARY KEY NOT NULL,
	CompanyName	varchar(100) NOT NULL
);

CREATE TABLE AccountType (
	TypeID		char(1) PRIMARY KEY NOT NULL,
	TypeDescription varchar(100) NOT NULL
);

CREATE TABLE Person (
	UserID		char(6) PRIMARY KEY,
	FirstName	varchar(20) NOT NULL,
	LastName	varchar(30) NOT NULL,
	UserPhone	char(15) NOT NULL,
	UserAddress 	varchar(30) NOT NULL,
	City		varchar(20) NOT NULL,
	UserState	varchar(2) NOT NULL,
	Zip			varchar(12)  NOT NULL
);

CREATE TABLE UserAccount (
	UserID		char(6) PRIMARY KEY NOT NULL,
	UserPassword	varchar(255) NOT NULL,
	TypeID		char(6) NOT NULL,

	FOREIGN KEY (UserID) REFERENCES Person(UserID),
	FOREIGN KEY (TypeID) REFERENCES AccountType(TypeID)
);

CREATE TABLE Book (
	RFID		char(6) NOT NULL PRIMARY KEY,
	Title		varchar(255) NOT NULL,
	Edition		char(2),
	YearPublished	char(4) NOT NULL,
	AuthorID	char(4) NOT NULL,
	GenreID		char(3) NOT NULL,
	PublisherID	char(5) NOT NULL,

	FOREIGN KEY (AuthorID) REFERENCES Author(AuthorID),
	FOREIGN KEY (GenreID) REFERENCES Genre(GenreID),
	FOREIGN KEY (PublisherID) REFERENCES Publisher(PublisherID)
);

CREATE TABLE BookReservation (
	RFID		char(6) NOT NULL,
	UserID		char(6) NOT NULL,
	CheckoutDate	datetime NOT NULL,
	ReturnDate	datetime NOT NULL,

	FOREIGN KEY (UserID) REFERENCES Person(UserID),
	FOREIGN KEY (RFID) REFERENCES Book(RFID),
	
	PRIMARY KEY(RFID, CheckoutDate)
);
