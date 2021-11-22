# ORACLE

--3. CREATE TABLE : 외래키 없는 테이블 먼저 생성!

-- WAREHOUSE(code, address, phone)
create table warehouse(
    code char(5) not null,
    address varchar2(80),
    phone number (15), 
    constraint warehouse_pk primary key (code)
    );

-- AUTHOR(name, address, url)
create table author(
	name varchar2(20) not null, 
	address varchar2(80) not null, 
	url varchar2(100), 
	constraint author_pk primary key(name, address)
);

-- PUBLISHER(name, address, phone, url)
create table publisher(
	name varchar2(20) not null, 
	address varchar2(80), 
	phone number(15), 
	url varchar2(100), 
	constraint publisher_pk primary key (name) 
); 

-- BOOK(ISBN, title, year, price)
create table book (
	isbn number(4) not null, 
	title varchar2(80), 
	year number(4), 
	price number(6), 
	constraint book_pk primary key (isbn)
);

-- SHOPPING_BASKET(basketid)
create table shopping_basket(
	basketid char(6) not null, 
	constraint shop_pk primary key (basketid)
);

-- CUSTOMER(email, name, address, phone)
create table customer(
	email varchar2(50) not null, 
	name varchar2(20), 
	address varchar2(80), 
	phone number(15), 
	constraint cust_pk primary key (email)
);

-- STOCKS(ISBN, code, num)
create table stocks(
	ISBN number(4) not null, 
	code char(5) not null, 
	num number(6), 
	constraint stocks_pk primary key (isbn, code), 
	constraint stocks_fk_isbn foreign key (isbn)
   	references book(isbn), 
	constraint stocks_fk_code foreign key (code)
	references warehouse(code)
);

-- WRITTEN_BY(name, address, ISBN)
create table written_by(
	name varchar2(20) not null, 
	address varchar2(80) not null, 
	isbn number(4) not null , 
	constraint written_fk_isbn foreign key (isbn)
   	references book(isbn), 
    constraint written_pk primary key (isbn)
);

alter table written_by add foreign key (name, address) references author(name, address);

-- PUBLISHED_BY(name, ISBN)
create table published_by (
	name varchar2(20) not null, 
	isbn number(4) not null, 
	constraint published_pk primary key (name, isbn), 
	constraint published_fk_name foreign key (name)
   	references publisher(name), 
	constraint publisehd_fk_isbn foreign key (isbn)
	references book(isbn)
);

-- CONTAINS(basketid, ISBN, num)
create table contains(
	basketid char(6) not null, 
	isbn number(4) not null ,
	num number(3) , 
	constraint contains_pk primary key (basketid), 
	constraint contains_fk_bi foreign key (basketid)
   	references shopping_basket(basketid), 
	constraint contains_isbn foreign key (isbn)
   	references book(isbn)
); 

-- BASKET_OF(email, basketid)
create table basket_of (
	email varchar2(50) not null ,
	basketid char(6) not null, 
	constraint basketof_pk primary key (email, basketid), 
	constraint basketof_fk_email foreign key (email)
   	references customer(email), 
	constraint basketof_fk_bi foreign key (basketid)
   	references shopping_basket(basketid)
);


--3-a. 'Rolling J.K' 작가가 2017년도에 집필한 모든 도서
select title
from author a inner join written_by w on (w.address = a.address and w.name = a.name)
inner join book b on w.isbn = b.isbn
where a.name = 'Rolling J.K' and b.year=2017;

--3-b. 'Harry' 출판사의 출판도서 주 Gun Ro 작가가 집필하고 가격이 40000이 넘는 도서 제목
select title
from published_by p inner join book b on p.isbn = b.isbn 
inner join written_by w on w.isbn = p.isbn
where p.name = 'Harry' and w.name = 'Gun Ro' and price >= 40000;

--3-c. 'Gun Ro' 작가 도서 중 warehouse에 600부 이상 재고가 있느 도서
select title
from stocks s inner join written_by w on w.isbn = s.isbn
inner join book b on w.isbn = b.isbn
where w.name = 'Gun Ro' and s.num > 600;


--3-d. 'CCC003' 장바구니에 담기 책의 총 가격
select price*num as price
from contains c inner join basket_of bo on C.basketid = bo.basketid
inner join book b on b.isbn = c.isbn
where bo.basketid = ‘CCC003';

--3-e. Park Ji Sung 고객이 장바구니 등록한 도서 중 warehouse에 재고가 없는 도서
SELECT d.title 
FROM Customer a , Basket_of b , contains c , book d , Stocks e 
WHERE a.name = 'Park Ji Sung' AND a.email = b.email AND b.basketid = c.basketid 
AND c.isbn = d.isbn AND d.isbn = e.isbn(+) 
GROUP BY d.isbn, d.title 
HAVING NVL(SUM(e.num), 0) = 0 ; 
