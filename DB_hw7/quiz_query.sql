
# ORACLE

-- 1. CREATE TABLE 
-- 외래키가 걸려있지 않는 테이블 먼저 생성해준 후 외래키 걸리는 테이블 생성해줬다. 

-- PROFESSOR TABLE
-- PROFESSOR(pno, pname, pmajor, pdept)
create table professor(
    pno number(4) not null,
    pname varchar2(20),
    pmajor varchar2(5),
    pdept char(2),
    constraint professor_pk primary key (pno)
);

-- COURSE TABLE
-- COURSE(cno, cname, credit, session)
create table course(
    cno char(5) not null,
    cname varchar2(30),
    credit number(1),
    sessions number(1),
    constraint course_pk primary key (cno)
);

-- STUDENT TABLE
-- STUDENT(sno, pno, sname, year, dept)
-- PROFESSOR TABLE의 pno를 외래키로 참조
create table student(
    sno number(4) not null,
    pno number(4), 
    sname varchar2(20),
    year number (1),
    dept char(2),
    constraint student_pk primary key (sno),
    constraint student_fk foreign key (pno)
    references professor(pno)
    on delete set null
);

-- ENROLL TABLE
-- ENROLL(sno, cno, grade, exam)
-- STUDENT TABLEL의 sno를 외래키로 참조
-- COURSE TABEL의 cno를 외래키로 참조
create table enroll(
    sno number(4) not null,
    cno char(5) not null,
    grade char(1),
    exam number(3),
    constraint enroll_sno_fk foreign key (sno)
    references student(sno),
    constraint enroll_cno_fk foreign key (cno)
    references course(cno),
    constraint enroll_pk primary key (sno, cno)
);

-- LECTURE TABLE
-- LECTURE(cno, pno, lec_time, room)
-- COURSE TABLE의 cno를 외래키로 참조
-- PROFESSOR TABLE의 pno를 외래키로 참조
create table lecture(
    cno char (5) not null,
    pno number (4) not null,
    lec_time varchar2(10),
    room varchar2(10),
    constraint lecture_cno_fk foreign key (cno)
    references course(cno),
    constraint lecture_pno_fk foreign key (pno)
    references professor(pno),
    constraint lecture_pk primary key (cno, pno)
);

-- 테이블 확인
select * from student;
select * from professor;
select * from course;
select * from lecture;
select * from enroll;


-- 임의의 데이터 입력
-- 걸려있는 외래키들을 고려해서 순서를 조정하면서 튜플을 추가해야 한다. 
-- ex. 외래키가 걸려있는 테이블에 참조받는 테이블에 없는 값을 추가하며 오류발생. 
-- -> 외래키가 아무것도 걸려있지 않은 테이블에 값을 먼저 추가하자.
insert into professor(
    pno, pname, pmajor, pdept) values (
    2000, 'K', 'DT', 'DT');
    
insert into student(
    sno, pno, sname, year, dept) values (
    1095, 2000, 'Hayeon', 4, 'DT');

insert into course(cno, cname, credit, sessions) values (
    'DT001', 'AI', 3, 1);
    
insert into lecture(cno, pno, lec_time, room) values(
    'DT001', 1106, 'MON123', 'Y901');
    
insert into enroll(sno, cno, grade, exam) values(
    1095, 'DT001', A, 100);
    
insert into professor(
    pno, pname, pmajor, pdept) values (
    2000, 'K', 'DT', 'DT');
    
insert into student(
    sno, pno, sname, year, dept) values (
    1095, 2000, 'Hayeon', 4, 'DT');
    
insert into student(sno, pno, sname, year, dept) values(
    1096, 1106, 'Dayeon', 4, 'CE');

insert into student(sno, pno, sname, year, dept) values(
    1097, 2000, 'Seoyeon', 1, 'DT');

insert into course(cno, cname, credit, sessions) values (
    'DT001', 'AI', 3, 1);
    
insert into lecture(cno, pno, lec_time, room) values(
    'DT001', 1106, 'MON123', 'Y901');
    
insert into enroll(sno, cno, grade, exam) values(
    1095, 'SE001', 'A', 100);
insert into enroll(sno, cno, grade, exam) values(
    1095, 'ME005', 'A', 90);
insert into enroll(sno, cno, grade, exam) values(
    1095, 'CE010', 'A', 100);

insert into enroll(sno, cno, grade, exam) values(
    1097, 'CE001', 'B', 88);
insert into enroll(sno, cno, grade, exam) values(
    1097, 'DT001', 'B', 88);

insert into enroll(sno, cno, grade, exam) values(
    1096, 'ME001', 'A', 100);
    
insert into enroll(sno, cno, grade, exam) values(
    1096, 'SE004', 'A', 100);

insert into student(
    sno, pno, sname, year, dept) values (
    1005, 2000, 'Jimin', 4, 'DT');

insert into professor(pno, pname, pmajor, pdept) values(
    2001, 'Shinsuk Kang', 'CT5', 'CT');

insert into enroll(sno, cno, grade, exam) values(
    1095, 'SE001', 'A', 100);
insert into enroll(sno, cno, grade, exam) values(
    1095, 'ME005', 'A', 90);
insert into enroll(sno, cno, grade, exam) values(
    1095, 'DT008', 'A', 100);

insert into enroll(sno, cno, grade, exam) values(
    1097, 'CE001', 'B', 88);
insert into enroll(sno, cno, grade, exam) values(
    1097, 'DT004', 'B', 88);

insert into enroll(sno, cno, grade, exam) values(
    1096, 'ME001', 'A', 100);
    
insert into enroll(sno, cno, grade, exam) values(
    1096, 'DT002', 'A', 100);

insert into student(
    sno, pno, sname, year, dept) values (
    1004, 2000, 'Yoongi', 4, 'DT');

insert into professor(pno, pname, pmajor, pdept) values(
    2009, 'Yeonseok Yoo', 'DT6', 'DT');

insert into course(cno, cname, credit, sessions) values(
    'DT010', 'Deep Learning', 3, 1);
    
insert into lecture(cno, pno, lec_time, room) values(
    'DT010', 2000 , 'MON456', 'Y911');



-- 1-a. Retrieve names of all senior student in the 'DT' department = DT 학과의 4학년 학생 이름

select sname from student 
where year = 4 and dept='DT';


-- 1-b. Retrieve names of all course taught by Professor 'Jonghoon Chun' = Jonghoon Chun 교수님이 가르치는 모든 강의의 이름

select cname 
from course inner join lecture on (course.cno = lecture.cno)
inner join professor on (professor.pno = lecture.pno)
where pname = 'Jonghoon Chun';


-- 1-c. Retrieve names and majors of all straight 'A' students (students who have a grade 'A' in all their courses) = 모든 과목을 A 받은 학생의 이름

SELECT sname, dept
FROM STUDENT
WHERE NOT EXISTS ( SELECT *
	FROM enroll
	WHERE sno= sno AND NOT(Grade='A'));

-- 1-d. Retrieve names and majors of all students who do not have a grade 'A' in any of their courses = A를 한번도 받지 못한 학생의 이름

SELECT sname, dept
FROM STUDENT
WHERE NOT EXISTS ( SELECT *
	FROM enroll
	WHERE sno= sno AND Grade='A');



-- 1-e. Delete all courses offered by 'CE' department = CE 학과의 모든 강의를 삭제. 
-- course 테이블의 cno를 enroll, lecture 테이블이 참조한다. 때문에 참조하는 테이블의 관련 정보를 먼저 삭제하고 가장 마지막에 course 테이블의 관련 정보를 삭제해야 한다. 

delete from enroll
where cno in (select c.cno from lecture l inner join course c on l.cno=c.cno
inner join professor p on l.pno = p.pno
where pdept=‘CE');
delete from lecture
where cno in (select c.cno from lecture l inner join course c on l.cno=c.cno
inner join professor p on l.pno = p.pno
where pdept='CE');
delete from course
where cno in (select c.cno from lecture l inner join course c on l.cno=c.cno
inner join professor p on l.pno = p.pno
where pdept='CE');


-- 2. university 경우와 마찬가지로, 외래키가 걸려있지 않은 테이블 먼저 생성!

-- DEPARTMENT
-- DEPARTMENT(dnumber, dname, mgrstartdate, dlocation)
create table department(
    dnumber number(4) not null, 
    dname varchar2(20), 
    mgrstartdate date,
    dlocation varchar2(20),
    constraint dept_pk primary key (dnumber)
);

-- PROJECT
-- PROJECT(pnumber, pname, plocation)
create table project(
    pnumber number(4) not null, 
    pname varchar2(20),
    plocation varchar2(10),
    constraint pro_pk primary key (pnumber));

-- EMPLOYEE
-- EMPLOYEE(ssn, fname, lname, bdate, address, sex, salary, superssn, dno)
-- DEPARTMENT의 dnumber를 외래키로 참조한다. (dno) / EMPLOYEE의 ssn을 외래키로 참조한다. (superssn)
create table employee(
    ssn number(3) not null,
    fname varchar2(20),
    lname varchar2(10),
    bdate date,
    address varchar2(10),
    sex char(1),
    salary number(10),
    superssn number (3),
    dno number(5),
    constraint emp_pk primary key (ssn),
    constraint emp_fk foreign key (dno)
    references department(dnumber),
   ); 
   
-- superssn의 외래키제약조건은 데이터 불러올때 오류가 발생해서 나중에 제약추가
alter table employee add foreign key (superssn) references employee(ssn);
    
    
-- WORKS_ON
-- WORKS_ON(ssn, pnumber, hours)
-- EMPLOYEE ssn을 외래키로 참조한다. / PROJECT pnumber를 외래키로 참조한다.
create table works_on(
    ssn number (3) not null,
    pnumber number(4) not null,
    hours number (2),
    constraint wo_pk primary key (ssn, pnumber),
    constraint wo_fk_1 foreign key (ssn)
    references employee(ssn),
    constraint wo_fk_2 foreign key (pnumber)
    references project(pnumber)
);


-- 임의의 데이터 추가 
-- 외래키가 없는 테이블에 데이터를 먼저 추가한 다음에 외래키가 있는 테이블에 데이터를 넣는다. 
insert into department(dnumber, dname, dlocation) values(
    3000, 'Planning', ‘GYEONGGI');
insert into project(pnumber, pname, plocation) values(
    4009, 'Genesis', ‘SEOUL');

insert into employee(ssn, fname, lname, address, sex, salary, superssn, dno) values(
    209, 'Chan', 'Lee', 'GYEONGGI', 'M',  2600, 146, 3008);

insert into works_on(ssn, pnumber, hours) values(
    209, 4009, 12);



--2-a. Retrieve names of employees in department '3' who work more than 10 hours per week on the 'Y' project

select e.fname, e.lname
from works_on w inner join project on w.pnumber = project.pnumber
inner join employee e on w.ssn = e.ssn
inner join department d on d.dnumber = e.dno
where dno = 3 and w.hours > 10 and pname='Y';

--2-b. Retrieve names of employees who are directly supervised by 'Jonghoon Chun'

select fname, lname
from employee
where superssn = (select ssn from employee where fname='Jonghoon' and lname='Chun');

--2-c. For each project, list the project name and the total hours (by all employees) spent on that project

select pname, avg(hours)
from works_on inner join project on works_on.pnumber = project.pnumber
group by pname;

--2-d. Retrieve names of employees who work on every project

SELECT fname, lname
FROM EMPLOYEE E
WHERE NOT EXISTS(
       SELECT P.pnumber
        FROM PROJECT P
        WHERE NOT EXISTS(
                SELECT W.pnumber
                FROM WORKSON W
                WHERE p.pnumber = w.pnumber AND e.ssn = w.ssn
      )
);


 
--2-e. Retrieve names of employees who do not work on any project

SELECT fname, lname
FROM EMPLOYEE E
WHERE NOT EXISTS(
       SELECT P.pnumber
        FROM PROJECT P
        WHERE EXISTS(
                SELECT W.pnumber
                FROM WORKSON W
                WHERE p.pnumber = w.pnumber AND e.ssn = w.ssn
      )
);



--2-f. For each department, retrieve the department numbers and names, and the average salary of employees working in that department

select d.dnumber, d.dname, avg(e.salary)
from department d inner join employee e on d.dnumber = e.dno
group by d.dnumber, d.dname;

--2-g. Retrieve the average salary of all female employees

select avg(salary) as “female average salary” 
from employee
group by sex
having sex = ‘F’;

--2-h . Find the names and address of employees who work on at least one project located in 'Seoul' but whose department has no location in 'Seoul'

select distinct fname, lname, address
from employee e inner join works_on w on e.ssn = w.ssn 
inner join project p on p.pnumber = w.pnumber
inner join department d on d.dnumber = e.dno
where plocation = 'SEOUL' and not dlocation = ‘SEOUL';


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
