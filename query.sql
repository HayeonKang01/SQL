-- 1. 
create table professor(
    pno number(4) not null,
    pname varchar2(20),
    pmajor varchar2(5),
    pdept char(2),
    constraint professor_pk primary key (pno)
);

create table course(
    cno char(5) not null,
    cname varchar2(30),
    credit number(1),
    sessions number(1),
    constraint course_pk primary key (cno)
);

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


select * from student;
select * from professor;
select * from course;
select * from lecture;
select * from enroll;

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
    
select * from student;
select * from professor;
select * from course;
select * from lecture;
select * from enroll;

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






create table professor(
    pno number(4) not null,
    pname varchar2(20),
    pmajor varchar2(5),
    pdept char(2),
    constraint professor_pk primary key (pno)
);

create table course(
    cno char(5) not null,
    cname varchar2(30),
    credit number(1),
    sessions number(1),
    constraint course_pk primary key (cno)
);

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




-- 학번: 60191095
-- 이름: 강하연
-- 교과목: 데이터베이스
-- 강좌번호: 5947

-- 1-a. 

select sname from student 
where year = 4 and dept='DT';

-- 1-b. 
select cname 
from course inner join lecture on (course.cno = lecture.cno)
inner join professor on (professor.pno = lecture.pno)
where pname = 'Jonghoon Chun';

select * from enroll;
-- 1-c
SELECT sname, dept
FROM STUDENT
WHERE NOT EXISTS ( SELECT *
	FROM enroll
	WHERE sno= sno AND NOT(Grade='A'));

-- 1-d
SELECT sname, dept
FROM STUDENT
WHERE NOT EXISTS ( SELECT *
	FROM enroll
	WHERE sno= sno AND Grade='A');



-- 1-e

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


-- 2.

create table department(
    dnumber number(4) not null, 
    dname varchar2(20), 
    mgrstartdate date,
    dlocation varchar2(20),
    constraint dept_pk primary key (dnumber)
);

create table project(
    pnumber number(4) not null, 
    pname varchar2(20),
    plocation varchar2(10),
    constraint pro_pk primary key (pnumber));

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
   ); # superssn은 데이터 불러올때 오류나서 나중에 제약추가

alter table employee add foreign key (superssn) references employee(ssn);
    
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



insert into department(dnumber, dname, dlocation) values(
    3000, 'Planning', ‘GYEONGGI');

insert into project(pnumber, pname, plocation) values(
    4009, 'Genesis', ‘SEOUL');

insert into employee(ssn, fname, lname, address, sex, salary, superssn, dno) values(
    209, 'Chan', 'Lee', 'GYEONGGI', 'M',  2600, 146, 3008);

insert into works_on(ssn, pnumber, hours) values(
    209, 4009, 12);


--2-a
select e.fname, e.lname
from works_on w inner join project on w.pnumber = project.pnumber
inner join employee e on w.ssn = e.ssn
inner join department d on d.dnumber = e.dno
where dno = 3 and w.hours > 10 and pname='Y';

--2-b
select fname, lname
from employee
where superssn = (select ssn from employee where fname='Jonghoon' and lname='Chun');

--2-c
select pname, avg(hours)
from works_on inner join project on works_on.pnumber = project.pnumber
group by pname;

--2-d.. 
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







 
--2-e
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



--2-f. 
select d.dnumber, d.dname, avg(e.salary)
from department d inner join employee e on d.dnumber = e.dno
group by d.dnumber, d.dname;

--2-g. 
select avg(salary) as “female average salary” 
from employee
group by sex
having sex = ‘F’;

--2-h 
select distinct fname, lname, address
from employee e inner join works_on w on e.ssn = w.ssn 
inner join project p on p.pnumber = w.pnumber
inner join department d on d.dnumber = e.dno
where plocation = 'SEOUL' and not dlocation = ‘SEOUL';








--3. 
create table warehouse(
    code char(5) not null,
    address varchar2(80),
    phone number (15), 
    constraint warehouse_pk primary key (code)
    );

create table author(
	name varchar2(20) not null, 
	address varchar2(80) not null, 
	url varchar2(100), 
	constraint author_pk primary key(name, address)
);

create table publisher(
	name varchar2(20) not null, 
	address varchar2(80), 
	phone number(15), 
	url varchar2(100), 
	constraint publisher_pk primary key (name) 
); 

create table book (
	isbn number(4) not null, 
	title varchar2(80), 
	year number(4), 
	price number(6), 
	constraint book_pk primary key (isbn)
);

create table shopping_basket(
	basketid char(6) not null, 
	constraint shop_pk primary key (basketid)
);

create table customer(
	email varchar2(50) not null, 
	name varchar2(20), 
	address varchar2(80), 
	phone number(15), 
	constraint cust_pk primary key (email)
);

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

create table written_by(
	name varchar2(20) not null, 
	address varchar2(80) not null, 
	isbn number(4) not null , 
	constraint written_fk_isbn foreign key (isbn)
   	references book(isbn), 
    constraint written_pk primary key (isbn)
);

alter table written_by add foreign key (name, address) references author(name, address);


create table published_by (
	name varchar2(20) not null, 
	isbn number(4) not null, 
	constraint published_pk primary key (name, isbn), 
	constraint published_fk_name foreign key (name)
   	references publisher(name), 
	constraint publisehd_fk_isbn foreign key (isbn)
	references book(isbn)
);

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

create table basket_of (
	email varchar2(50) not null ,
	basketid char(6) not null, 
	constraint basketof_pk primary key (email, basketid), 
	constraint basketof_fk_email foreign key (email)
   	references customer(email), 
	constraint basketof_fk_bi foreign key (basketid)
   	references shopping_basket(basketid)
);


--3-a. 
select title
from author a inner join written_by w on (w.address = a.address and w.name = a.name)
inner join book b on w.isbn = b.isbn
where a.name = 'Rolling J.K' and b.year=2017;

--3-b. 
select title
from published_by p inner join book b on p.isbn = b.isbn 
inner join written_by w on w.isbn = p.isbn
where p.name = 'Harry' and w.name = 'Gun Ro' and price >= 40000;

--3-c. 
select title
from stocks s inner join written_by w on w.isbn = s.isbn
inner join book b on w.isbn = b.isbn
where w.name = 'Gun Ro' and s.num > 600;


--3-d.
select price*num as price
from contains c inner join basket_of bo on C.basketid = bo.basketid
inner join book b on b.isbn = c.isbn
where bo.basketid = ‘CCC003';

--3-e. 
SELECT d.title 
FROM Customer a , Basket_of b , contains c , book d , Stocks e 
WHERE a.name = 'Park Ji Sung' AND a.email = b.email AND b.basketid = c.basketid 
AND c.isbn = d.isbn AND d.isbn = e.isbn(+) 
GROUP BY d.isbn, d.title 
HAVING NVL(SUM(e.num), 0) = 0 ; 