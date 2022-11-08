CREATE TABLE Author (
	AuthorID int,
	FirstName varchar(255),
	LastName varchar(255)
);

CREATE TABLE Publisher (
	PublisherID int,
	FirstName varchar(255),
	LastName varchar(255),
	YearPublished varchar(4)
);

CREATE TABLE Book (
	RFID int,
	Title varchar(255),
	Edition int,
  	AuthorID int,
  	GenreID int,
  	PublisherID int
);

CREATE TABLE BookRecord (
  	RecordID int,
	CheckOutDate datetime,
	ReturnDate datetime,
	RFID int,
	FineID int,
  	UserID int
);
