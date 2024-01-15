-- ## DBMS Assignment - 9 ()
-- ---

-- ####  Table Info:
-- - Borrower (Id, Name)
create table Borrower (id varcahr(10) primary key, name varchar(30));

-- - Book (Id, Title, Author, Subject)
create table Book (id varchar(10) primary key, title varchar(50), author varchar(30), subject varchar(20));

-- - Borrows (B_Id, Book_Id, Date_Of_Issue, Date_Of_Return)
create table Borrows(b_id varchar(10), book_id varchar(10), date_of_issue date, date_of_return date); 

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

-- Insert data of Book
insert into Book (id, title, author, subject) values ('bk001', 'Why I Love India', 'B. Mandal', 'Adventure');
insert into Book values('bk002', 'Duchakay Dunia', 'Bimal Mukherjee', 'Adventure');
insert into Book('bk003', '', '', 'sociology');
insert into Book('bk004', '', 'A. Das', 'psychology');
insert into Book('bk005', '', '', 'psychology');
insert into Book('bk006', '', 'G. Morrison', 'philosophy');
insert into Book('bk007', '', '', 'sociology');
insert into Book('bk008', '', 'A. Das', 'philosophy');
insert into Book('bk009', '', '', 'History');
insert into Book('bk010', '', '', 'psychology');
insert into Book('bk011', 'Indian History', '', 'History');
insert into Book('bk012', 'History of Europe', 'G. Morrison', 'History');

-- Insert data of Borrows
insert into Borrows (b_Id, book_Id, date_Of_Issue, date_Of_Return) values ('br001', 'bk002', '2022-01-07', '2023-01-01');
insert into Borrows values ('br001', 'bk009', '2021-05-08', '2022-07-12');
insert into Borrows values ('br002', 'bk008', '2020-05-09', '2021-08-14');
insert into Borrows values ('br001', 'bk007', '2022-12-05', '2023-01-15');
insert into Borrows values ('br001', 'bk006', '2021-11-04', '2022-09-01');
insert into Borrows values ('br001', 'bk004', '2022-03-03', '2022-12-08');
insert into Borrows values ('br001', 'bk003', '2021-04-02', '2021-10-09');
insert into Borrows values ('br001', 'bk002', '2022-05-11', '2022-07-06');
insert into Borrows values ('br001', 'bk001', '2022-08-12', null);
insert into Borrows values ('br001', 'bk010', '2021-07-13', '2022-02-03');
insert into Borrows values ('br001', 'bk011', '2021-05-14', '2021-06-08');
insert into Borrows values ('br001', 'bk012', '2021-09-15', '2022-08-19');
insert into Borrows values ('br001', 'bk013', '2021-10-16', '2022-09-20');
insert into Borrows values ('br001', 'bk004', '2021-11-17', '2023-11-21');
insert into Borrows values ('br001', 'bk005', '2021-03-18', '2023-12-24');
insert into Borrows values ('br001', 'bk002', '2023-12-19', null);
insert into Borrows values ('br001', 'bk003', '2023-02-06', null);
insert into Borrows values ('br001', 'bk005', '2023-07-26', null);

-- #### Assignment List
-- Properly implement the integrity constraints and execute the following queries:

-- 1. Display the details of all the books on sociology and psychology.
select * from Book where subject in ('sociology', 'psychology');

-- 2. Find all the books written by A. Das on philosophy.
select * from Book where author like "A. Das" and subject like 'philosophy';

-- 3. Find out the total number of books in the library.
select count(id) from Book;

-- 4. Find out the names of the borrowers who have borrowed at least on ebook on History.
select Bor.name, Bk.subject
      from Borrower Bor inner join Borrows Bos inner join Book Bk 
           on Bor.id = Bos.b_id and Bos.book_Id = Bk.id
      where Bk.subject like 'History';

-- 5. Display the names of the borrowers who have issued books written by G. Morrison
select Bor.name, Bk.author
      from Borrower Bor inner join Borrows Bos inner join Book Bk 
           on Bor.id = Bos.b_id and Bos.book_Id = Bk.id
      where Bk.author like 'G. Morrison';

-- 6. Find out the titles and authors of all the books issued by the borrower whose id is 'BR003'
select Bor.name, Bk.title, Bk.author
      from Borrower Bor inner join Borrows Bos inner join Book Bk 
           on Bor.id = Bos.b_id and Bos.book_Id = Bk.id
      where Bor.id like 'BR003';


   
