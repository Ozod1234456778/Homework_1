salesman_id |    name    |   city   | commission 
-------------+------------+----------+------------
        5001 | James Hoog | New York |       0.15
        5002 | Nail Knite | Paris    |       0.13
        5005 | Pit Alex   | London   |       0.11
        5006 | Mc Lyon    | Paris    |       0.14
        5007 | Paul Adam  | Rome     |       0.13
        5003 | Lauson Hen | San Jose |       0.12



create table sales (Salesman_id int, name varchar(50), city varchar(50), comission decimal (10,2))
drop table sales
select * from sales
insert into sales values (5001, 'James Hoog', 'New York', 0.15)
insert into sales values (5002, 'Nail Knite', 'Paris', 0.13)
insert into sales values (5005, 'Pit Alex', 'London', 0.11)
insert into sales values (5006, 'Mc Lyon', 'Paris', 0.14)
insert into sales values (5007, 'Paul Adam', 'Rome', 0.13)
insert into sales values (5003, 'Lauson Hen', 'San Jose', 0.12)

--numeric type(butun sonlar uchun) ---> int
--qoldiqli sonlar --> decimal(10,2)
--text format uchun(string) --> varchar(50)
--sanalar un --> date


ord_no      purch_amt   ord_date    customer_id  salesman_id
----------  ----------  ----------  -----------  -----------
70001       150.5       2012-10-05  3005         5002
70009       270.65      2012-09-10  3001         5005
70002       65.26       2012-10-05  3002         5001
70004       110.5       2012-08-17  3009         5003
c70005       2400.6      2012-07-27  3007         5001
70008       5760        2012-09-10  3002         5001
70010       1983.43     2012-10-10  3004         5006
70003       2480.4      2012-10-10  3009         5003
70012       250.45      2012-06-27  3008         5002
70003       2480.4      2012-10-10  3009         5003
70013       3045.6      2012-04-25  3002         5001
