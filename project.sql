
drop table bill;
drop table customer;
drop table class;
drop table transport;
drop table route;
drop sequence billing;
create table route
(
route_id number(5) constraint pk_id primary key,
source varchar2(25),
destination varchar2(25)
);
desc route;
create table class(
class_id number(5) constraint pk_cid primary key,
name varchar2(25),
cost number(6)
);

create table transport(
name varchar2(25) primary key,
route_id number(5) constraint ch_rid references route(route_id),
arrival varchar2(10),
dept varchar2(10)
);
desc transport;

REM : INSERTING TUPLES INTO THE TABLE
insert into route values(1001,'Chennai','Trichy');
insert into route values(1002,'Chennai','Bangalore');
insert into route values(1003,'Trichy', 'Chennai');
insert into route values(1004,'Chennai','Delhi');
insert into route values(1005,'Kolkata','Nagpur');
insert into route values(1006,'Bhopal','Hyderabad');
insert into route values(1007,'Delhi','Shimla');
insert into route values(1008,'Trivandrum','Chennai');
insert into route values(1009,'Jaipur','Secunderabad');
insert into route values(1010,'Mumbai','Dehradun');

insert into class values(101,'sleeper class',350);
insert into class values(102,'chair car',250);
insert into class values(103,'second class',300);
insert into class values(104,'3 tier AC sleeper class',650);
insert into class values(105,'AC chair car',400);
insert into class values(106,'First class AC',800);
insert into class values(107,'First class',550);
insert into class values(108,'2 tier AC sleeper class',750);
insert into class values(109,'Chair car',250);
insert into class values(110,'second sitting',250);


select * from route;
select * from class;

insert into transport values('Rajdhani Express',1001,'6:30 am','8:30 pm');
insert into transport values('Shatabdhi Express',1002,'6:30 pm','8:30 am');
insert into transport values('Torando Express',1003,'7:00 am','10:00 pm');
insert into transport values('Ajmer Express',1004,'11:00 am','7:00 pm');
insert into transport values('Amritsar Express',1005,'2:00 pm','6:00 am');
insert into transport values('Amarnath Express',1006,'2:30 pm','6:30 am');
insert into transport values('Pallavan Express',1007,'6:30 am','12:00 pm');
insert into transport values('Podhigai Express',1008,'8:00 pm','6:00 am');
insert into transport values('Hyderabad Express',1009,'4:00 pm','4:00 am');
insert into transport values('Allepey Express',1010,'6:00 pm','6:00 am');



 create sequence billing
 START WITH 1
 INCREMENT BY 1;

 
 create table customer
 (
 id number(4) primary key,
 name varchar2(40) not null,
 passwd varchar2(40) not null,
 phno number(10),
 email varchar2(40)
 );

 create table bill
 (
 bill_id number(20) primary key,
 cust_name varchar2(40) not null,
 transport_name varchar2(40) not null,
 class_name varchar2(40) not null,
 no_of_tick number(2),
date_journey date,
tot_cost number(5)
 );

CREATE OR REPLACE TRIGGER billing_id
BEFORE INSERT ON bill
FOR EACH ROW
BEGIN
SELECT billing.NEXTVAL INTO:NEW.bill_id
FROM   DUAL;
END;
/
create or replace procedure bill_calc(p1 in class.cost%type,qty in number,tot out number)
is
begin
tot:=p1*qty;
end;
/
