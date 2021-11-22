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


