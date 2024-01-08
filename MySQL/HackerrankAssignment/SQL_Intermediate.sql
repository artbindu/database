-- st.replace(/(\<[a-z]+\>)|(\<\/[a-z]+\>)|(\&nbsp\;)/gi, '')
-- =======================Sample Test===============
/* 
Count the Employees:
The data for the number employed at several famous IT companies is maintained in the COMPANY table. 
Write a query to print the IDs of the companies that have more than 10000 employees, in ascending order of ID.
*/

Select C.ID from COMPANY where C.employees > 10000;


-- =======================Exercise-01===============
/*
Products Without Sales:
Given the product and invoice details for products at an online store, find all the products that were not sold. 
For each such product, display its SKU and product name. Order the result by SKU, ascending.

There are two table: PRODUCT, INVOICE_ITEM
*/

create table PRODUCT (
	id int(3) primary key, 
    sku int(10), 
    product_name varchar(30), 
    product_description varchar(100), 
    current_price int(5),
    quantity_in_stock int(5),
    is_active boolean
    );
insert into PRODUCT values (1, 330120, 'Game of Thrones - URBAN DECAY', 'Game of Thrones eyshadow Palette', 65, 122, 1);
insert into PRODUCT values (2, 330121, 'Advance Night Repair - ESTEEE', 'desc2', 98, 51, 1);
insert into PRODUCT values (3, 330121, 'Rose Deep Hydration - Fresh', 'desc2', 45, 34, 1);
    
create table INVOICE_ITEM (
	id int(5) primary key,
    invoice_id int(5),
    product_id int(3),
    quantity int(5),
    price int(5),
    line_total_price int(7)
	);
insert into INVOICE_ITEM values (1, 1, 1, 20, 65, 1300);
insert into INVOICE_ITEM values (5, 4, 1, 5, 65, 325);
insert into INVOICE_ITEM values (6, 4, 2, 10, 95, 950);

select I1.product_id, count(I1.quantity) as totalQuantity
    from Invoice_Item I1 group by I1.product_id;
    
select P.SKU, P.product_name
    from 
        PRODUCT P 
        left outer join 
        (select product_id, count(quantity) as tquantity from INVOICE_ITEM group by product_id) I
        on P.id = I.product_id
    where I.product_id is null;
        
        
        
-- =======================Exercise-02===============

/*
Invoices per Country
A business is analyzing data by country. For each country, display the country name, total number of invoices, 
and their average amount. Format the average as a floating-point number with 6 decimal places. Return only those 
countries where their average invoice amount is greater than the average invoice amount over all invoices.

There are 4 tables: country, city, customer, invoice
		Country (id(int) pk, country_name(string))
        City (id(int) pk, city_name(st), postal_code(st), country_id(int) -> fk(Country))
        Customer (id(int) pk, customer_name(st), city_id(int) -> fk(City), customer_address(st), contact_person(st), email(st), phone varchar(128), is_active(bool))
        Invoice (id(int) pk, invoice_number(st), customer_id int(10) -> fk(Customer), user_account_id int(10), total_price(number))
*/

create table Country (
		id int(5) primary key, country_name varchar(128)
    );
create table City (
		id int(7) primary key, city_name varchar(128), 
        postal_code varchar(16), country_id int(5)
	);
create table Customer (
		id int(10) primary key, customer_name varchar(128), 
        city_id int(7), customer_address varchar(255),
        contact_person varchar(255), email varchar(128),
        phone varchar(128), is_active boolean
	);
create table Invoice (
		id int(10) primary key, invoice_number varchar(255),
        customer_id int(10), user_account_id int(10), total_price decimal(8,2)
	);
    
insert into Country values (1, 'Austria');
insert into Country values (2, 'Germany');
insert into Country values (3, 'United Kingdom');
select * from Country;

insert into City values (1, 'Wien', 1010, 1);
insert into City values (2, 'Berlin', 10115, 2);
insert into City values (3, 'Humburg', 20095, 2);
insert into City values (4, 'London', 'EC4V 4AD', 3);
select * from City;

insert into Customer values (1, 'Drogerie Wien', 1, 'Deckergass 15A', 'Email Steinbech', 'dw@email.com', '+98765', 1);
insert into Customer values (2, 'Cosmetic Store', 4, 'CS 34', 'J Corbyn', 'cs@email.com', '+25345', 1);
insert into Customer values (3, 'Kosmetikstudio', 3, 'KS 33', 'W Brandt', 'ds@email.com', '+45444', 1);
insert into Customer values (4, 'Neue Kosmetik', 1, 'NK 13', null, 'nk@email.com', '+6456675', 1);
insert into Customer values (5, 'Bio Kosmetik', 2, 'BK 34', 'C Zetkin', 'bk@email.com', '+2347566', 1);
insert into Customer values (6, 'K-Wien', 1, 'KW stree, 14A', 'MR Kallat', 'kwi@email.com', '+6452467', 1);
insert into Customer values (7, 'Natural Cosmetics', 4, 'cosmic strick, 15B', 'G Jackson', 'nco@email.com', '+34278567', 1);
insert into Customer values (8, 'Kosmetik Plus', 2, '15C', 'A merkel', 'kp@email.com', '+8970657', 1);
insert into Customer values (9, 'New Line Cosmetics', 4, '18A mannual Road', 'P Peter', 'nlc@email.com', '+456889', 1);
select * from Customer;

insert into Invoice values (1, 'inv001', 7, 4, 1436);
insert into Invoice values (2, 'inv002', 9, 2, 1000);
insert into Invoice values (3, 'inv003', 3, 2, 360);
insert into Invoice values (4, 'inv004', 5, 2, 1675);
insert into Invoice values (5, 'inv005', 6, 2, 9500);
insert into Invoice values (6, 'inv006', 4, 2, 150);
select * from Invoice;

/*
For each country, display the country name, total number of invoices, and their average amount. 
Format the average as a floating-point number with 6 decimal places. Return only those 
countries where their average invoice amount is greater than the average invoice amount over all invoices.
*/

-- Invoice table total price of purches price according to customer
select I.customer_id, sum(I.total_price) as cus_tprice, count(I.id) as cus_tinvoice from Invoice I group by I.customer_id;
-- Map Customer Table & Invoice Table to find Total price according to customer
select Cu.id as customer_id_left, Cu.city_id, I1.customer_id as customer_id_right, I1.cus_tprice, I1.cus_tinvoice
	from 
			Customer Cu
        inner join 
			(select I.customer_id, sum(I.total_price) as cus_tprice, count(I.id) as cus_tinvoice from Invoice I group by I.customer_id) I1
        on Cu.id = I1.customer_id;
-- Merge Customer Table & Invoice Table to find City wise customer total invoice & toal price
select Cu.city_id, sum(I1.cus_tprice) as city_cus_tprice, sum(I1.cus_tinvoice) as city_cus_tinvoice, count(Cu.city_id) as city_tcustomer
	from 
			Customer Cu
        inner join 
			(select I.customer_id, sum(I.total_price) as cus_tprice, count(I.id) as cus_tinvoice from Invoice I group by I.customer_id) I1
        on Cu.id = I1.customer_id
	group by Cu.city_id;
-- Merge Country & City table
select C.id as city_id_left, C.country_id, Cu1.city_id as city_id_right, Cu1.city_cus_tprice, Cu1.city_cus_tinvoice, Cu1.city_tcustomer
	from
			City C
        inner join
			(select Cu.city_id, sum(I1.cus_tprice) as city_cus_tprice, sum(I1.cus_tinvoice) as city_cus_tinvoice, count(Cu.city_id) as city_tcustomer
				from 
						Customer Cu
					inner join 
						(select I.customer_id, sum(I.total_price) as cus_tprice, count(I.id) as cus_tinvoice from Invoice I group by I.customer_id) I1
					on Cu.id = I1.customer_id
				group by Cu.city_id) Cu1
		on C.id = Cu1.city_id;
-- Merge Merge Country & City table and filter group wise by country_id
select C.country_id, sum(Cu1.city_cus_tprice) as cuntry_total_cus_price, sum(Cu1.city_cus_tinvoice) as cuntry_total_cus_invoice
	from
			City C
        inner join
			(select Cu.city_id, sum(I1.cus_tprice) as city_cus_tprice, sum(I1.cus_tinvoice) as city_cus_tinvoice, count(Cu.city_id) as city_tcustomer
				from 
						Customer Cu
					inner join 
						(select I.customer_id, sum(I.total_price) as cus_tprice, count(I.id) as cus_tinvoice from Invoice I group by I.customer_id) I1
					on Cu.id = I1.customer_id
				group by Cu.city_id) Cu1
		on C.id = Cu1.city_id
	group by C.country_id;
    
-- Merge Country & City table to find
select Cn.id as Cn_id_left, Cn.country_name, C1.country_id as Cn_id_right, 
		C1.cuntry_total_cus_price, C1.cuntry_total_cus_invoice, (C1.cuntry_total_cus_price/C1.cuntry_total_cus_invoice) as cuntry_total_avg_price
	from 
			Country Cn
		inner join
			(select C.country_id, sum(Cu1.city_cus_tprice) as cuntry_total_cus_price, sum(Cu1.city_cus_tinvoice) as cuntry_total_cus_invoice
				from
						City C
					inner join
						(select Cu.city_id, sum(I1.cus_tprice) as city_cus_tprice, sum(I1.cus_tinvoice) as city_cus_tinvoice, count(Cu.city_id) as city_tcustomer
							from 
									Customer Cu
								inner join 
									(select I.customer_id, sum(I.total_price) as cus_tprice, count(I.id) as cus_tinvoice from Invoice I group by I.customer_id) I1
								on Cu.id = I1.customer_id
							group by Cu.city_id) Cu1
					on C.id = Cu1.city_id
				group by C.country_id) C1
		on Cn.id = C1.country_id;

    




