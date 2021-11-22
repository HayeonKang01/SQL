# ORACLE
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








