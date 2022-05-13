-- PART 1
CREATE TABLE Authors (
	AuthorID INTEGER PRIMARY KEY auto_increment,
    FullName VARCHAR(50) NOT NULL,
    BirthCountry VARCHAR(50) NOT NULL);
    
insert into Authors(FullName, BirthCountry)
values ("Jane Austen", "England")

insert into Authors(FullName, BirthCountry)
values ("Charles Dickens", "England")

insert into Authors(FullName, BirthCountry)
values ("Mark Twain", "United States")

SELECT * FROM Authors

-- PART 2
CREATE TABLE Books (
	BookID INTEGER PRIMARY KEY AUTO_INCREMENT,
    Name NVARCHAR(50) NOT NULL,
    AuthorID INTEGER,
    FOREIGN KEY(AuthorID) REFERENCES Authors(AuthorID))

insert into Books(Name, AuthorID)
values ("Pride and Prejudice", 1)

insert into Books(Name, AuthorID)
values ("Sense and Sensibility", 1)

insert into Books(Name, AuthorID)
values ("The Pickwick Papers", 2)

SELECT * FROM Books

-- Part 3
SELECT AuthorID, Name, FullName FROM sakila.authors
INNER JOIN sakila.books USING (AuthorID)

Create View AuthorBooks as
select FullName As AuthorName, Name AS BookName
FROM sakila.authors
INNER JOIN sakila.books USING (AuthorID)
ORDER BY AuthorName

SELECT * FROM AuthorBooks