use master

drop database southland_school
go

drop database westland_school
go

drop database northland_school
go

drop database school_district
go

create database southland_school
go

use southland_school

create table students(
student_id int primary key,
student_name varchar(255))

create table classes(
class_id int primary key ,
class_level int,
class_name varchar(255))

create table grades(
class_id int,
student_id int,
midterm_exam decimal(6,2),
final_exam decimal(6,2))
go

insert into students values (1,'johnny appleseed')
insert into students values (2,'zebulon pike')
insert into students values (3,'sarah lee')
insert into students values (4,'jessica fletcher')

insert into classes values (1,9,'h101-world history')
insert into classes values (2,9,'s101-introduction to science')
insert into classes values (3,10,'h203-history of scranton, pennsylvania')
insert into classes values (4,10,'s201-basic alchemy')

insert into grades values (1,1,45.0,52.0)
insert into grades values (2,1,75.0,88.0)
insert into grades values (3,3,71.0,64.5)
insert into grades values (4,3,88.0,75.5)
insert into grades values (1,2,77.3,80.0)
insert into grades values (2,2,64.5,72.0)
insert into grades values (3,4,59.5,68.0)
insert into grades values (4,4,86.0,91.5)

create database westland_school
go

use westland_school

create table students(
student_id int primary key,
student_name varchar(255))

create table classes(
class_id int primary key ,
class_level int,
class_name varchar(255))

create table grades(
class_id int,
student_id int,
midterm_exam decimal(5,2),
final_exam decimal(5,2))
go

insert into students values (1,'martin prince')
insert into students values (2,'bart simpson')
insert into students values (3,'lisa simpson')
insert into students values (4,'milhouse van houten')

insert into classes values (1,9,'h101-world history')
insert into classes values (2,9,'s101-introduction to science')
insert into classes values (3,10,'h203-history of scranton, pennsylvania')
insert into classes values (4,10,'s201-basic alchemy')

insert into grades values (1,1,98.0,99.0)
insert into grades values (2,1,97.5,98.0)
insert into grades values (3,3,80.0,89.5)
insert into grades values (4,3,88.0,86.5)
insert into grades values (1,2,34.3,45.0)
insert into grades values (2,2,49.5,51.0)
insert into grades values (3,4,68.5,70.0)
insert into grades values (4,4,55.0,62.5)


create database northland_school
go

use northland_school

create table kids(
student_id int primary key,
firstname varchar(50),
lastname varchar(50))

create table courses(
course_id int primary key,
course_code varchar(10),
course_description varchar(100))

create table course_grades(
course_id int,
student_id int,
course_grade decimal(5,2))
go

insert into kids values (1,'cugel','the clever')
insert into kids values (2,'ulan','dhor')
insert into kids values (3,'rogol','domedonfors')
insert into kids values (4,'wayfarer','liane')

insert into courses values(1,'9h101','world history')
insert into courses values(2,'9s101','introduction to science')
insert into courses values(3,'10h203','history of scranton, pennsylvania')
insert into courses values(4,'10s201','basic alchemy')

insert into course_grades values(1,1,44.0)
insert into course_grades values(2,1,38.0)
insert into course_grades values(3,3,68.5)
insert into course_grades values(4,3,88.1)
insert into course_grades values(1,2,75.0)
insert into course_grades values(2,2,67.0)
insert into course_grades values(3,4,64.0)
insert into course_grades values(4,4,72.5)

create database school_district
go

use school_district
go

create table schools
(school_id int identity(1,1) primary key,
school_name varchar(255))

create table students
(student_id int identity(1,1) primary key,
school_id int,
student_name varchar(255))

create table courses
(course_id int identity(1,1) primary key,
school_id int,
course_level int,
course_code varchar(10),
course_name varchar(255))

create table course_grades
(student_id int,
course_id int,
final_grade decimal(5,2))