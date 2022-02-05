Вам необходимо написать SQL запросы, перечисленные ниже.
Результатом вашей домашней работы для каждого пункта должны быть SQL запрос, написанный под заданием.
Кроме того, после каждого задания у вас есть ответ правильной выборки для самоконтроля.

1.	Выбрать все строки из таблицы c перевозчиками.
SELECT * FROM Shippers;
+-----------+------------------+----------------+
| ShipperID | ShipperName      | Phone          |
+-----------+------------------+----------------+
|         1 | Speedy Express   | (503) 555-9831 |
|         2 | United Package   | (503) 555-3199 |
|         3 | Federal Shipping | (503) 555-9931 |
+-----------+------------------+----------------+

2.	Выбрать первые 3 строки из таблицы c сотрудниками.
SELECT * FROM Employees LIMIT 3;
+----------------------------------------------------------------------------------------------
|          1 | Davolio   | Nancy     | 1968-12-08 | EmpID1.pic | Education includes a BA in na.
|          2 | Fuller    | Andrew    | 1952-02-19 | EmpID2.pic | Andrew received his BTS vice. 
|          3 | Leverling | Janet     | 1963-08-30 | EmpID3.pic | Janet has a BS degree in ative
+----------------------------------------------------------------------------------------------

3.	Из таблицы сотрудников выбрать все имена, фамилии, дни рождения в следующем порядке: BirthDate, FirstName, LastName, количество строк в выборке ограничить 3-мя.
SELECT BirthDate, FirstName, LastName FROM Employees LIMIT 3;
+------------+-----------+-----------+
| BirthDate  | FirstName | LastName  |
+------------+-----------+-----------+
| 1968-12-08 | Nancy     | Davolio   |
| 1952-02-19 | Andrew    | Fuller    |
| 1963-08-30 | Janet     | Leverling |
+------------+-----------+-----------+

4.	Выбрать имена и фамлии сотрудников, родившихся в 1958 году.
SELECT  FirstName, LastName FROM Employees WHERE year(BirthDate) = 1958
+-----------+----------+
| FirstName | LastName |
+-----------+----------+
| Margaret  | Peacock  |
| Laura     | Callahan |
+-----------+----------+

5.	Выбрать все товары с ценой от 23 до 25.
SELECT * FROM Products WHERE PRICE BETWEEN 23 AND 25;
+-----------+------------------------------+------------+------------+-------------------+-------+
| ProductID | ProductName                  | SupplierID | CategoryID | Unit              | Price |
+-----------+------------------------------+------------+------------+-------------------+-------+
|         6 | Grandma's Boysenberry Spread |          3 |          2 | 12 - 8 oz jars    | 25.00 |
|        14 | Tofu                         |          6 |          7 | 40 - 100 g pkgs.  | 23.25 |
|        55 | Pbtu chinois                 |         25 |          6 | 24 boxes x 2 pies | 24.00 |
+-----------+------------------------------+------------+------------+-------------------+-------+

6.	Найти товары с минимальной ценой.
SELECT * FROM Products WHERE Price = (SELECT MIN(Price) FROM Products);
+-----------+-------------+------------+------------+-------+-------+
| ProductID | ProductName | SupplierID | CategoryID | Unit  | Price |
+-----------+-------------+------------+------------+-------+-------+
|        33 | Geitost     |         15 |          4 | 500 g |  2.50 |
+-----------+-------------+------------+------------+-------+-------+

7.	Найти товары с максимальной ценой. 
SELECT * FROM Products WHERE Price = (SELECT MAX(Price) FROM Products);
+-----------+---------------+------------+------------+--------------------+--------+
| ProductID | ProductName   | SupplierID | CategoryID | Unit               | Price  |
+-----------+---------------+------------+------------+--------------------+--------+
|        38 | Cute de Blaye |         18 |          1 | 12 - 75 cl bottles | 263.50 |
+-----------+---------------+------------+------------+--------------------+--------+

8.	Выбрать все товары, у которых Unit '10 pkgs.'.
SELECT * FROM Products WHERE Unit LIKE '10 pkgs.';
+-----------+-------------+------------+------------+----------+-------+
| ProductID | ProductName | SupplierID | CategoryID | Unit     | Price |
+-----------+-------------+------------+------------+----------+-------+
|        48 | Chocolade   |         22 |          3 | 10 pkgs. | 12.75 |
+-----------+-------------+------------+------------+----------+-------+

9.	Выбрать адреса поставщиков, которые проживают в одном из городов: Tokyo, Frankfurt, Osaka. 
SELECT Address FROM Suppliers WHERE City = 'Tokyo' OR City = 'Frankfurt' OR City = 'Osaka';
+---------------------------+
| Address                   |
+---------------------------+
| 9-8 Sekimai Musashino-shi |
| 92 Setsuko Chuo-ku        |
| Bogenallee 51             |
+---------------------------+

10.	Выбрать название товаров начинающихся с буквы “G”, у которых цена больше 37.
SELECT ProductName FROM Products WHERE ProductName LIKE 'G%' AND Price > 37;
+------------------------+
| ProductName            |
+------------------------+
| Gnocchi di nonna Alice |
+------------------------+

11.	 Вывести список стран начинающихся на S и состоящих из 5 букв, из которых есть поставщики. 
SELECT Country FROM Suppliers WHERE Country LIKE 'S%' AND LENGTH(Country)=5;
+---------+
| Country |
+---------+
| Spain   |
+---------+

12.	 Вывести сумму всех товаров, в названии которых содержится ”od”, столбец назвать Summ.
SELECT SUM(Price) AS 'Summ'  FROM Products WHERE ProductName LIKE '%od%';
+--------+
| Summ   |
+--------+
| 131.00 |
+--------+

13.	 Вывести среднюю сумму товаров, поставляемых в бутылках, округлив до 2-х знаков после запятой, столбец назвать Summ. 
SELECT ROUND(AVG(Price),2) as 'Summ' FROM Products WHERE Unit LIKE'%bottle%';
+-------+
| Summ  |
+-------+
| 37.03 |
+-------+

14.	 Найти количество клиентов, которые НЕ проживают в Франции и Германии,  столбец назвать Countt.
SELECT COUNT(*) AS 'Countt' FROM Customers WHERE Country Not IN ('France','Germany');
+--------+
| Countt |
+--------+
|     69 |
+--------+

15.	 Вывести имена сотрудников, родившихся после 01.01.1968 года. Отсортировать результат по имени. 
SELECT FirstName FROM Employees WHERE BirthDate > '1968-01-01' ORDER BY BirthDate DESC;
+-----------+
| FirstName |
+-----------+
| Anne      |
| Nancy     |
+-----------+

16.	 Выбрать названия товаров, у которых Price = 13 или 15 и отсортировать по возрастанию, использовать Select команды с объединением результатов через UNION.
SELECT ProductName FROM Products WHERE price =13 
UNION
SELECT ProductName FROM Products WHERE price =15
ORDER BY ProductName ASC;
+---------------------------------+
| ProductName                     |
+---------------------------------+
| Original Frankfurter grine Soae |
| Outback Lager                   |
| Rud Kaviar                      |
+---------------------------------+

17.	 Показать имена товаров, в названии которых третья буква m и названия их поставщиков.
SELECT ProductName, SupplierName FROM Products 
Inner JOIN Suppliers on Products.SupplierID=Suppliers.SupplierID WHERE ProductName like '__m%';
+---------------------------+-----------------------------------+
| ProductName               | SupplierName                      |
+---------------------------+-----------------------------------+
| Gumbur Gummiburchen       | Heli Swaren GmbH & Co. KG         |
| Camembert Pierrot         | Gai puturage                      |
| Wimmers gute Semmelknudel | Plutzer Lebensmittelgroumurkte AG |
+---------------------------+-----------------------------------+

18.	Показать имена и фамилии сотрудника, который оформил заказ 1996-11-27 (написать запрос двумя способами: через INNER Join, и используя подзапрос).
SELECT FirstName, LastName FROM Orders 
INNER JOIN Employees ON Orders.EmployeeID=Employees.EmployeeID  WHERE OrderDate = '1996-11-27';

SELECT FirstName, LastName FROM Employees WHERE EmployeeID IN (SELECT EmployeeID FROM Orders WHERE OrderDate = '1996-11-27');
+-----------+-----------+
| FirstName | LastName  |
+-----------+-----------+
| Janet     | Leverling |
+-----------+-----------+


19.	Выбрать все товары, у которых поставщик «Grandma Kelly's Homestead» и цена > 27. В результате вывести 3 колонки: Product, Supplier, Price.
SELECT ProductName, SupplierName, Price FROM Products 
INNER JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID WHERE SupplierName = "Grandma Kelly's Homestead" AND Price > 27;
+---------------------------------+---------------------------+-------+
| ProductName                     | SupplierName              | Price |
+---------------------------------+---------------------------+-------+
| Uncle Bob's Organic Dried Pears | Grandma Kelly's Homestead | 30.00 |
| Northwoods Cranberry Sauce      | Grandma Kelly's Homestead | 40.00 |
+---------------------------------+---------------------------+-------+

20.	 Вывести суммарное количество продукта 'Queso Cabrales' (столбец обозвать Summ), отправленного всем покупателям (написать запрос двумя способами: через INNER Join, и используя подзапрос).
SELECT SUM(Quantity) AS 'Summ' FROM OrderDetails
Inner JOIN Products ON OrderDetails.ProductID=Products.ProductID WHERE ProductName ='Queso Cabrales';

SELECT SUM(Quantity) AS 'Summ' FROM OrderDetails WHERE ProductID IN (SELECT ProductID FROM Products WHERE ProductName ='Queso Cabrales');
+------+
| Summ |
+------+
|  182 |
+------+

21.	Показать все заказы, которые были отправлены по адресу «Ekergatan 24» с их заказчиками и сотрудниками. В результате вывести 3 колонки – ID заказа, имя заказчика, имя сотрудника, фамилия сотрудника.
SELECT Orders.OrderID, Customers.CustomerName, Employees.FirstName, Employees.LastName FROM ((Orders 
INNER JOIN Employees ON Employees.EmployeeID = Orders.EmployeeID )
INNER JOIN Customers ON Customers.CustomerID = Orders.CustomerID)    
WHERE Customers.Address  = 'Ekergatan 24';
+---------+----------------+-----------+-----------+
| OrderID | CustomerName   | FirstName | LastName  |
+---------+----------------+-----------+-----------+
|   10264 | Folk och fe HB | Michael   | Suyama    |
|   10327 | Folk och fe HB | Andrew    | Fuller    |
|   10378 | Folk och fe HB | Steven    | Buchanan  |
|   10434 | Folk och fe HB | Janet     | Leverling |
+---------+----------------+-----------+-----------+

22.	Преобразовать предыдущий запрос таким образом, чтобы те же данные выводились в 3-х колонках – объединить LastName и FirstName из Employees в одну колонку через пробел и назвать ее EmployeeName (2 LEFT JOINS). 
SELECT Orders.OrderID, Customers.CustomerName, CONCAT(Employees.FirstName, ' ' ,Employees.LastName) AS EmployeeName FROM ((Orders 
INNER JOIN Employees ON Employees.EmployeeID = Orders.EmployeeID )
INNER JOIN Customers ON Customers.CustomerID = Orders.CustomerID)    
WHERE Customers.Address  = 'Ekergatan 24';
+---------+----------------+-----------------+
| OrderID | CustomerName   | EmployeeName    |
+---------+----------------+-----------------+
|   10264 | Folk och fe HB | Michael Suyama  |
|   10327 | Folk och fe HB | Andrew Fuller   |
|   10378 | Folk och fe HB | Steven Buchanan |
|   10434 | Folk och fe HB | Janet Leverling |
+---------+----------------+-----------------+

23.	Показать все продукты, содержащиеся в заказах 1997-го года и в названии которых менее 5 букв. В результате вывести OrderID, OrderDate, ProductName (написать запрос двумя способами: через INNER JOINS, и используя подзапросы).
SELECT Orders.OrderId, Orders.OrderDate, Products.ProductName FROM Orders  
INNER JOIN OrderDetails ON OrderDetails.OrderId = Orders.OrderId
INNER JOIN Products ON Products.ProductID = OrderDetails.ProductId

WHERE YEAR(orderDate)  = 1997 AND LENGTH(Products.ProductName) < 5;
+---------+------------+-------------+
| OrderID | OrderDate  | ProductName |
+---------+------------+-------------+
|   10409 | 1997-01-09 | Tofu        |
|   10412 | 1997-01-13 | Tofu        |
|   10427 | 1997-01-27 | Tofu        |
+---------+------------+-------------+

24.	Показать названия продуктов и их категорий, которые используются в заказах от заказчика по имени Blondel père et fils и категории которых состоят как минимум из 2-х слов.
WHERE ProductID IN (
SELECT OrderDetails.ProductID  FROM OrderDetails WHERE OrderID IN 
(SELECT Orders.OrderID FROM Orders WHERE CustomerID in
(SELECT Customers.CustomerID FROM Customers where CustomerName='Blondel pere et fils')))   AND
CategoryName LIKE '% %';
+----------------+------------------------+
| CategoryName   | ProductName            |
+----------------+------------------------+
| Dairy Products | Mozzarella di Giovanni |
+----------------+------------------------+

25.	 Вывести количество заказчиков (колонку назвать Buyers), которые сделали заказали один из  продуктов: «Queso Cabrales», «Gustaf's Knäckebröd», «Louisiana Fiery Hot Pepper Sauce», «Schoggi Schokolade», «Gnocchi di nonna Alice».
SELECT count(DISTINCT Orders.CustomerID) as 'Buyers'  FROM Orders WHERE OrderID in

(SELECT OrderDetails.OrderID FROM OrderDetails WHERE ProductID IN 

(SELECT Products.ProductID FROM Products WHERE Products.ProductName = "Queso Cabrales" 
 or Products.ProductName = "Gustaf's Knäckebröd" 
 or Products.ProductName =  "Louisiana Fiery Hot Pepper Sauce" 
 or Products.ProductName = "Schoggi Schokolade" 
 or Products.ProductName =  "Gnocchi di nonna Alice"));
+--------+
| Buyers |
+--------+
|     25 |
+--------+