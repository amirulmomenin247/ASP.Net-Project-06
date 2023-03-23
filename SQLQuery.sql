﻿CREATE TABLE Tags 
(
	TagId INT NOT NULL IDENTITY PRIMARY KEY,
	TagName NVARCHAR (30) NOT NULL
)
GO

CREATE TABLE Publishers
( 
	PublisherId INT IDENTITY PRIMARY KEY,
	PublisherName NVARCHAR (40) NOT NULL,
	PublisherEmail NVARCHAR (50) NULL
 )
GO

 CREATE TABLE Authors
 (
	AuthorId INT IDENTITY PRIMARY KEY,
	AuthorName NVARCHAR(50) NOT NULL,
	AuthorEmail NVARCHAR(50) NULL
)
GO

CREATE TABLE Books
( 
	BookId INT IDENTITY PRIMARY KEY,
	BookTitle NVARCHAR (40) NOT NULL,
	BookPrice MONEY NOT NULL,
	PublishDate DATE NOT NULL,
	Available BIT DEFAULT 0,
	BookImg NVARCHAR (50) NULL,
	PublisherId INT NOT NULL REFERENCES Publishers(PublisherId)
)
GO

CREATE TABLE BookTags
(
	BookId INT NOT NULL REFERENCES Books (BookId),
	TagId INT NOT NULL REFERENCES Tags (TagId),
	AuthorId INT NOT NULL REFERENCES Authors (AuthorId),
	PRIMARY KEY (BookId,TagId, AuthorId)
)
GO