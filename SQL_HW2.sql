SQL_DDL
Первая часть.

Таблица employees


1.	Создать таблицу employees
- id. serial,  primary key,
- employee_name. Varchar(50), not null

create table employees (
	id serial primary key,
	employee_name varchar(50) not null

);
select * from employees;

2.	Наполнить таблицу employees 70 строками.

insert into employees (employee_name)
values ('Alexey'),
('Anatoliy'),
('Andrey'),
('Anton'),
('Artur'),
('Boris'),
('Vadim'),
('Viktor'),
('Vladimir'),
('Denis'),
('Ivan'),
('Kirill'),
('Maxim'),
('Nikita'),
('Pavel'),
('Sergey'),
('Timur'),
('Yan'),
('Alisa'),
('Alina'),
('Alla'),
('Varvara'),
('Veronika'),
('Darya'),
('Diana'),
('Dina'),
('Elena'),
('Zoya'),
('Inna'),
('Karina'),
('Klara'),
('Kristina'),
('Larisa'),
('Maya'),
('Margarita'),
('Marina'),
('Nina'),
('Olga'),
('Rosa'),
('Regina'),
('Sofia'),
('Tamara'),
('Elina'),
('Yulia'),
('Yana'),
('Oliver'),
('Harry'),
('Jacob'),
('Thomas'),
('Oscar'),
('James'),
('George'),
('Amelia'),
('Olivia'),
('Emily'),
('Ava'),
('Jessica'),
('Mia'),
('Ruby'),
('Lily'),
('Liam'),
('Mason'),
('Ethan'),
('Emma'),
('Ava'),
('Harper'),
('Sam'),
('Calvin'),
('Edgar'),
('Lola');
Таблица salary


3.	Создать таблицу salary
- id. Serial  primary key,
- monthly_salary. Int, not null

create table salary(
	id serial primary key,
	monthly_salary int not null
);
select * from salary;


4.	Наполнить таблицу salary 15 строками:
- 1000
- 1100
- 1200
- 1300
- 1400
- 1500
- 1600
- 1700
- 1800
- 1900
- 2000
- 2100
- 2200
- 2300
- 2400
- 2500


insert into salary(monthly_salary)
values(1000),
	  (1100),
	  (1200),
	  (1300),
	  (1400),
	  (1500),
	  (1600),
	  (1700),
	  (1800),
	 (1900),
	 (2000),
	 (2100),
	(2200),
(2300),
(2400);
	  
select * from salary;


Таблица employee_salary


5.	Создать таблицу employee_salary
- id. Serial  primary key,
- employee_id. Int, not null, unique
- salary_id. Int, not null

create table employee_salary (
id serial primary key,
employee_id int unique not null,
salary_id int not null); 



6.	Наполнить таблицу employee_salary 40 строками:
- в 10 строк из 40 вставить несуществующие employee_id

id	employee_id	salary_id
1	3	7
2	1	4
3	5	9
4	40	13
5	23	4
6	11	2
7	52	10
8	15	13
9	26	4
10	16	1
11	33	7
...	...	...



insert into employee_salary(employee_id, salary_id)
values(1, 7),
	  (2, 4),
	  (3, 9),
	  (4, 13),
	  (5, 4),
	  (6, 2),
	  (7, 10),
	  (8, 13),
	  (9, 4),
	 (10, 1),
	 (11, 7 ),
	 (12, 8),
	(13, 2),
	(14, 3),
	(15, 5),
	(16, 6),
	(34, 9),
	(35, 11),
	(36, 4),
	(37, 15),
	(38, 14),
	(39, 13),
	(40, 10),
	(41, 2),
	(42, 1),
	(43, 3),
	(44, 5),
	(45, 9),
	(46, 15),
	(47, 14),
	(71, 1),
	(72, 4),
	(73, 6),
	(74, 8),
	(75, 13),
	(76, 11),
	(77, 12),
	(78, 9),
	(79, 10),
	(80, 7);	
  
select * from employee_salary;



Таблица roles

7.	Создать таблицу roles
- id. Serial  primary key,
- role_name. int, not null, unique

create table roles(
	id serial primary key,
	role_name int unique not null
);

8.	Поменять тип столба role_name с int на varchar(30)

alter table role alter column role_name type varchar(30);

9.	Наполнить таблицу roles 20 строками:

id	role_name
1	Junior Python developer
2	Middle Python developer
3	Senior Python developer
4	Junior Java developer
5	Middle Java developer
6	Senior Java developer
7	Junior JavaScript developer
8	Middle JavaScript developer
9	Senior JavaScript developer
10	Junior Manual QA engineer
11	Middle Manual QA engineer
12	Senior Manual QA engineer
13	Project Manager
14	Designer
15	HR
16	CEO
17	Sales manager
18	Junior Automation QA engineer
19	Middle Automation QA engineer
20	Senior Automation QA engineer

insert into roles(role_name)
values ('Junior Python developer'),
('Middle Python developer'),
('Senior Python developer'),
('Junior Java developer'),
('Middle Java developer'),
('Senior Java developer'),
('Junior JavaScript developer'),
('Middle JavaScript developer'),
('Senior JavaScript developer'),
('Junior Manual QA engineer'),
('Middle Manual QA engineer'),
('Senior Manual QA engineer'),
('Project Manager'),
('Designer'),
('HR'),
('CEO'),
('Sales manager'),
('Junior Automation QA engineer'),
('Middle Automation QA engineer'),
('Senior Automation QA engineer');

select * from roles;
Таблица roles_employee


10.	Создать таблицу roles_employee
- id. Serial  primary key,
- employee_id. Int, not null, unique (внешний ключ для таблицы employees, поле id)
- role_id. Int, not null (внешний ключ для таблицы roles, поле id)

create table roles_employee (
id serial primary key,
employee_id int unique not null,
role_id int not null,
foreign key (employee_id)
	references employees(id),
foreign key (role_id)
	references roles(id)
);
select * from roles_employee;

11.	Наполнить таблицу roles_employee 40 строками:

id	employee_id	role_id
1	7	2
2	20	4
3	3	9
4	5	13
5	23	4
6	11	2
7	10	9
8	22	13
9	21	3
10	34	4
11	6	7
...	...	...

insert into roles_employee (employee_id, role_id)
values (7, 2),
(20, 4),
(3, 9),
(5, 13),
(23, 4),
(11, 2),
(10, 9),
(22, 13),
(21, 3),
(34, 4),
(35, 7),
(36, 8),
(37, 9),
(38, 10),
(39, 11),
(40, 12),
(41, 13),
(42, 14),
(43, 15),
(44, 16),
(45, 17),
(46, 18),
(47, 19),
(48, 20),
(49, 1),
(51, 2),
(52, 3),
(53, 4),
(54, 5),
(55, 6),
(56, 7),
(57, 8),
(58, 8),
(59, 9),
(60, 10),
(61, 11),
(62, 12),
(63, 13),
(64, 14),
(65, 15);

