-- ## DBMS Assignment - 9 ()
-- ---
use artbindu;

-- ####  Table Info:
-- - Borrower (Id, Name)
create table Borrower (id varchar(10) primary key, name varchar(30));

-- - Book (Id, Title, Author, Subject)
create table Book (id varchar(10) primary key, title varchar(50), author varchar(30), subject varchar(20));

-- - Borrows (B_Id, Book_Id, Date_Of_Issue, Date_Of_Return)
create table Borrows(b_id varchar(10), book_id varchar(10), date_of_issue date, date_of_return date); 
drop table Borrows;

-- Insert data of Borrower
insert into Borrower (id, name) values ('br001', 'B. Mandal');
insert into Borrower values ('br002', 'BS Mandal');
insert into Borrower values ('br003', 'SN Mandal');
insert into Borrower values ('br004', 'BND Mandal');
insert into Borrower values ('br005', 'K. Maity');
insert into Borrower values ('br006', 'TK Mitrya');
insert into Borrower values ('br007', 'P Manna');
insert into Borrower values ('br008', 'S Sau');
insert into Borrower values ('br009', 'KP Jana');

select * from Borrower;

-- Insert data of Book
insert into Book (id, title, author, subject) values ('bk001', 'Why I Love India', 'B. Mandal', 'Adventure');
insert into Book values('bk002', 'Duchakay Dunia', 'Bimal Mukherjee', 'Adventure');
insert into Book values('bk003', 'The Social Construction', 'Peter L. Berger', 'sociology');
insert into Book values('bk004', 'The Way of Thinking', 'A. Das', 'psychology');
insert into Book values('bk005', 'THinking, Fast and Slow', 'Daniel Kahneman', 'psychology');
insert into Book values('bk006', 'The Philosophy Book', 'G. Morrison', 'philosophy');
insert into Book values('bk007', 'Etica Protestante', 'Max Weber', 'sociology');
insert into Book values('bk008', 'The Art of War in Indian Peninsula', 'A. Das', 'philosophy');
insert into Book values('bk009', 'The Last Mughal', 'William Dalrymple', 'History');
insert into Book values('bk010', 'Blink: The Power of Thinking', 'Robert Greene', 'psychology');
insert into Book values('bk011', 'Indian History', 'T. K. Dutta', 'History');
insert into Book values('bk012', 'History of Europe', 'G. Morrison', 'History');
insert into Book values('bk013', 'Meditations', 'Marcus Aurelius', 'philosophy');
insert into Book values('bk014', 'The Discovery of India', 'Jawaharlal Nehru', 'History');
insert into Book values('bk015', 'Geography of India', 'Majit Husain', 'Geography');

Select * from Book;

-- Insert data of Borrows
insert into Borrows (b_Id, book_Id, date_Of_Issue, date_Of_Return) values ('br001', 'bk002', '2022-01-07', '2023-01-01');
insert into Borrows values ('br001', 'bk009', '2021-05-08', '2022-07-12');
insert into Borrows values ('br002', 'bk008', '2020-05-09', '2021-08-14');
insert into Borrows values ('br004', 'bk007', '2022-12-05', '2023-01-15');
insert into Borrows values ('br005', 'bk006', '2021-11-04', '2022-09-01');
insert into Borrows values ('br003', 'bk004', '2022-03-03', '2022-12-08');
insert into Borrows values ('br007', 'bk003', '2021-04-02', '2021-10-09');
insert into Borrows values ('br009', 'bk002', '2022-05-11', '2022-07-06');
insert into Borrows values ('br001', 'bk001', '2022-08-12', null);
insert into Borrows values ('br005', 'bk010', '2021-07-13', '2022-02-03');
insert into Borrows values ('br009', 'bk011', '2021-05-14', '2021-06-08');
insert into Borrows values ('br005', 'bk012', '2021-09-15', '2022-08-19');
insert into Borrows values ('br004', 'bk013', '2021-10-16', '2022-09-20');
insert into Borrows values ('br003', 'bk004', '2022-12-17', '2023-11-21');
insert into Borrows values ('br002', 'bk005', '2021-03-18', '2023-12-24');
insert into Borrows values ('br001', 'bk002', '2023-12-19', null);
insert into Borrows values ('br009', 'bk003', '2023-02-06', null);
insert into Borrows values ('br002', 'bk005', '2023-07-26', null);

select * from Borrows;


-- #### Assignment List
-- Properly implement the integrity constraints and execute the following queries:

-- 1. Display the details of all the books on sociology and psychology.
select * from Book where subject in ('sociology', 'psychology') order by subject desc;

-- 2. Find all the books written by A. Das on philosophy.
select * from Book where author like "A. Das" and subject like 'philosophy';

-- 3. Find out the total number of books in the library.
select count(id) as "total books" from Book;

-- 4. Find out the names of the borrowers who have borrowed at least on ebook on History.
select Bor.name, Bk.title, Bk.subject
      from Borrower Bor inner join Borrows Bos inner join Book Bk 
           on Bor.id = Bos.b_id and Bos.book_Id = Bk.id
      where Bk.subject like 'History';
-- or
select Bor.name, Bk.title, Bk.subject
		from Borrower Bor, Borrows Bos, Book Bk 
			where Bor.id = Bos.b_id and Bos.book_Id = Bk.id
			and Bk.subject like 'History';

-- 5. Display the names of the borrowers who have issued books written by G. Morrison
select Bor.name, Bk.title, Bk.author
      from Borrower Bor inner join Borrows Bos inner join Book Bk 
           on Bor.id = Bos.b_id and Bos.book_Id = Bk.id
	  where Bk.author like 'G. Morrison';
-- or
select Bor.name, Bk.title, Bk.author
      from Borrower Bor, Borrows Bos, Book Bk 
			where Bor.id = Bos.b_id and Bos.book_Id = Bk.id
			and Bk.author like 'G. Morrison';
      
-- 6. Find out the titles and authors of all the books issued by the borrower whose id is 'BR003'
select Bor.name, Bk.title, Bk.author
      from Borrower Bor inner join Borrows Bos inner join Book Bk 
           on Bor.id = Bos.b_id and Bos.book_Id = Bk.id
      where Bor.id like 'BR003';
-- or
select Bor.name, Bk.title, Bk.author
      from Borrower Bor, Borrows Bos, Book Bk 
			where Bor.id = Bos.b_id and Bos.book_Id = Bk.id
			and Bor.id like 'BR003';

   
