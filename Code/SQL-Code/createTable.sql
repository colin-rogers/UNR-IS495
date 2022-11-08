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
	FOREING KEY (GenreID) REFERENCES Genre(GenreID),
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
