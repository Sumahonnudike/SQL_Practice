-- 1 --
-- Which shippers do we have?

mysql> select * from shippers;
+------------+-------------------+----------------+
| shipper_id | company_name      | phone          |
+------------+-------------------+----------------+
|          1 | Speedy Express    | (503) 555-9831 |
|          2 | United Package    | (503) 555-3199 |
|          3 | Federal Shipping  | (503) 555-9931 |
|          4 | Alliance Shippers | 1-800-222-0451 |
|          5 | UPS               | 1-800-782-7892 |
|          6 | DHL               | 1-800-225-5345 |
+------------+-------------------+----------------+
6 rows in set (0.31 sec)

-- 2 --
-- In the Categories table, selecting all the fields using this SQL: Select * from Categories …will return 4 columns. We only want to see two columns, CategoryName and Description

mysql> desc categories;
+---------------+-------------+------+-----+---------+-------+
| Field         | Type        | Null | Key | Default | Extra |
+---------------+-------------+------+-----+---------+-------+
| category_id   | smallint    | NO   | PRI | NULL    |       |
| category_name | varchar(15) | NO   |     | NULL    |       |
| description   | text        | YES  |     | NULL    |       |
| pictures      | blob        | YES  |     | NULL    |       |
+---------------+-------------+------+-----+---------+-------+
4 rows in set (0.34 sec)

mysql> select category_name, description from categories;
+----------------+------------------------------------------------------------+
| category_name  | description                                                |
+----------------+------------------------------------------------------------+
| Beverages      | Soft drinks, coffees, teas, beers, and ales                |
| Condiments     | Sweet and savory sauces, relishes, spreads, and seasonings |
| Confections    | Desserts, candies, and sweet breads                        |
| Dairy Products | Cheeses                                                    |
| Grains/Cereals | Breads, crackers, pasta, and cereal                        |
| Meat/Poultry   | Prepared meats                                             |
| Produce        | Dried fruit and bean curd                                  |
| Seafood        | Seaweed and fish                                           |
+----------------+------------------------------------------------------------+

-- 3 --
-- 3. Sales Representatives We’d like to see just the FirstName, LastName, and HireDate of all the employees with the Title of Sales Representative. Write a SQL statement that returns only those employees

mysql> select first_name, last_name, hire_date from employees where title = 'Sales Representative';
+------------+-----------+------------+
| first_name | last_name | hire_date  |
+------------+-----------+------------+
| Nancy      | Davolio   | 1992-05-01 |
| Janet      | Leverling | 1992-04-01 |
| Margaret   | Peacock   | 1993-05-03 |
| Michael    | Suyama    | 1993-10-17 |
| Robert     | King      | 1994-01-02 |
| Anne       | Dodsworth | 1994-11-15 |
+------------+-----------+------------+
6 rows in set (0.03 sec)

-- 4 --
-- 4. Sales Representatives in the United States Now we’d like to see the same columns as above, but only for those employees that both have the title of Sales Representative, and also are in the United States.

mysql> select first_name, last_name, hire_date from employees where title = 'Sales Representative' and country ='USA';
+------------+-----------+------------+
| first_name | last_name | hire_date  |
+------------+-----------+------------+
| Nancy      | Davolio   | 1992-05-01 |
| Janet      | Leverling | 1992-04-01 |
| Margaret   | Peacock   | 1993-05-03 |
+------------+-----------+------------+
3 rows in set (0.00 sec)

-- 5 --
-- 5. Orders placed by specific EmployeeID Show all the orders placed by a specific employee. The EmployeeID for this Employee (Steven Buchanan) is 5.

mysql> select order_id, order_date From orders where employee_id = '5';
+----------+------------+
| order_id | order_date |
+----------+------------+
|    10248 | 1996-07-04 |
|    10254 | 1996-07-11 |
|    10269 | 1996-07-31 |
|    10297 | 1996-09-04 |
|    10320 | 1996-10-03 |
|    10333 | 1996-10-18 |
|    10358 | 1996-11-20 |
|    10359 | 1996-11-21 |
|    10372 | 1996-12-04 |
|    10378 | 1996-12-10 |
|    10397 | 1996-12-27 |
|    10463 | 1997-03-04 |
|    10474 | 1997-03-13 |
|    10477 | 1997-03-17 |
|    10529 | 1997-05-07 |
|    10549 | 1997-05-27 |
|    10569 | 1997-06-16 |
|    10575 | 1997-06-20 |
|    10607 | 1997-07-22 |
|    10648 | 1997-08-28 |
|    10649 | 1997-08-28 |
|    10650 | 1997-08-29 |
|    10654 | 1997-09-02 |
|    10675 | 1997-09-19 |
|    10711 | 1997-10-21 |
|    10714 | 1997-10-22 |
|    10721 | 1997-10-29 |
|    10730 | 1997-11-05 |
|    10761 | 1997-12-02 |
|    10812 | 1998-01-02 |
|    10823 | 1998-01-09 |
|    10841 | 1998-01-20 |
|    10851 | 1998-01-26 |
|    10866 | 1998-02-03 |
|    10869 | 1998-02-04 |
|    10870 | 1998-02-04 |
|    10872 | 1998-02-05 |
|    10874 | 1998-02-06 |
|    10899 | 1998-02-20 |
|    10922 | 1998-03-03 |
|    10954 | 1998-03-17 |
|    11043 | 1998-04-22 |
+----------+------------+
42 rows in set (0.00 sec)

-- 6 --
-- 6. Suppliers and ContactTitles In the Suppliers table, show the SupplierID, ContactName, and ContactTitle for those Suppliers whose ContactTitle is not Marketing Manager

mysql> select supplier_id, contact_name, contact_title from suppliers where contact_title != 'Marketing Manager';
+-------------+----------------------------+------------------------------+
| supplier_id | contact_name               | contact_title                |
+-------------+----------------------------+------------------------------+
|           1 | Charlotte Cooper           | Purchasing Manager           |
|           2 | Shelley Burke              | Order Administrator          |
|           3 | Regina Murphy              | Sales Representative         |
|           5 | Antonio del Valle Saavedra | Export Administrator         |
|           6 | Mayumi Ohno                | Marketing Representative     |
|           8 | Peter Wilson               | Sales Representative         |
|           9 | Lars Peterson              | Sales Agent                  |
|          11 | Petra Winkler              | Sales Manager                |
|          12 | Martin Bein                | International Marketing Mgr. |
|          13 | Sven Petersen              | Coordinator Foreign Markets  |
|          14 | Elio Rossi                 | Sales Representative         |
|          16 | Cheryl Saylor              | Regional Account Rep.        |
|          17 | Michael Björn              | Sales Representative         |
|          18 | Guylène Nodier             | Sales Manager                |
|          19 | Robb Merchant              | Wholesale Account Agent      |
|          20 | Chandra Leka               | Owner                        |
|          21 | Niels Petersen             | Sales Manager                |
|          22 | Dirk Luchte                | Accounting Manager           |
|          23 | Anne Heikkonen             | Product Manager              |
|          24 | Wendy Mackenzie            | Sales Representative         |
|          26 | Giovanni Giudici           | Order Administrator          |
|          27 | Marie Delamare             | Sales Manager                |
|          28 | Eliane Noz                 | Sales Representative         |
|          29 | Chantal Goulet             | Accounting Manager           |
+-------------+----------------------------+------------------------------+
24 rows in set (0.04 sec)

-- 7 --
-- Products with “queso” in ProductName In the products table, we’d like to see the ProductID and ProductName for those products where the ProductName includes the string “queso”.

mysql> select product_id, product_name from products where product_name like '%queso%';
+------------+---------------------------+
| product_id | product_name              |
+------------+---------------------------+
|         11 | Queso Cabrales            |
|         12 | Queso Manchego La Pastora |
+------------+---------------------------+
2 rows in set (0.05 sec)

-- 8 --
-- Orders shipping to France or Belgium Looking at the Orders table, there’s a field called ShipCountry. Write a query that shows the OrderID, CustomerID, and ShipCountry for the orders where the ShipCountry is either France or Belgium.

mysql> select order_id, customer_id, ship_country from orders where ship_country = 'France' or ship_country ='Belgium');
+----------+-------------+--------------+
| order_id | customer_id | ship_country |
+----------+-------------+--------------+
|    10248 | VINET       | France       |
|    10251 | VICTE       | France       |
|    10252 | SUPRD       | Belgium      |
|    10265 | BLONP       | France       |
|    10274 | VINET       | France       |
|    10295 | VINET       | France       |
|    10297 | BLONP       | France       |
|    10302 | SUPRD       | Belgium      |
|    10311 | DUMON       | France       |
|    10331 | BONAP       | France       |
|    10334 | VICTE       | France       |
|    10340 | BONAP       | France       |
|    10350 | LAMAI       | France       |
|    10358 | LAMAI       | France       |
|    10360 | BLONP       | France       |
|    10362 | BONAP       | France       |
|    10371 | LAMAI       | France       |
|    10408 | FOLIG       | France       |
|    10413 | LAMAI       | France       |
|    10425 | LAMAI       | France       |
|    10436 | BLONP       | France       |
|    10449 | BLONP       | France       |
|    10450 | VICTE       | France       |
|    10454 | LAMAI       | France       |
|    10458 | SUPRD       | Belgium      |
|    10459 | VICTE       | France       |
|    10463 | SUPRD       | Belgium      |
|    10470 | BONAP       | France       |
|    10475 | SUPRD       | Belgium      |
|    10478 | VICTE       | France       |
|    10480 | FOLIG       | France       |
|    10493 | LAMAI       | France       |
|    10500 | LAMAI       | France       |
|    10511 | BONAP       | France       |
|    10525 | BONAP       | France       |
|    10529 | MAISD       | Belgium      |
|    10546 | VICTE       | France       |
|    10559 | BLONP       | France       |
|    10566 | BLONP       | France       |
|    10584 | BLONP       | France       |
|    10609 | DUMON       | France       |
|    10610 | LAMAI       | France       |
|    10628 | BLONP       | France       |
|    10631 | LAMAI       | France       |
|    10634 | FOLIG       | France       |
|    10649 | MAISD       | Belgium      |
|    10663 | BONAP       | France       |
|    10671 | FRANR       | France       |
|    10679 | BLONP       | France       |
|    10683 | DUMON       | France       |
|    10715 | BONAP       | France       |
|    10730 | BONAP       | France       |
|    10732 | BONAP       | France       |
|    10737 | VINET       | France       |
|    10738 | SPECD       | France       |
|    10739 | VINET       | France       |
|    10755 | BONAP       | France       |
|    10760 | MAISD       | Belgium      |
|    10763 | FOLIG       | France       |
|    10767 | SUPRD       | Belgium      |
|    10787 | LAMAI       | France       |
|    10789 | FOLIG       | France       |
|    10806 | VICTE       | France       |
|    10814 | VICTE       | France       |
|    10826 | BLONP       | France       |
|    10827 | BONAP       | France       |
|    10832 | LAMAI       | France       |
|    10841 | SUPRD       | Belgium      |
|    10843 | VICTE       | France       |
|    10846 | SUPRD       | Belgium      |
|    10850 | VICTE       | France       |
|    10858 | LACOR       | France       |
|    10860 | FRANR       | France       |
|    10871 | BONAP       | France       |
|    10876 | BONAP       | France       |
|    10885 | SUPRD       | Belgium      |
|    10890 | DUMON       | France       |
|    10892 | MAISD       | Belgium      |
|    10896 | MAISD       | Belgium      |
|    10907 | SPECD       | France       |
|    10923 | LAMAI       | France       |
|    10927 | LACOR       | France       |
|    10930 | SUPRD       | Belgium      |
|    10932 | BONAP       | France       |
|    10940 | BONAP       | France       |
|    10964 | SPECD       | France       |
|    10971 | FRANR       | France       |
|    10972 | LACOR       | France       |
|    10973 | LACOR       | France       |
|    10978 | MAISD       | Belgium      |
|    11004 | MAISD       | Belgium      |
|    11035 | SUPRD       | Belgium      |
|    11038 | SUPRD       | Belgium      |
|    11043 | SPECD       | France       |
|    11051 | LAMAI       | France       |
|    11076 | BONAP       | France       |
+----------+-------------+--------------+
96 rows in set (0.00 sec)

-- 9 --
Orders shipping to any country in Latin America Now, instead of just wanting to return all the orders from France of Belgium, we want to show all the orders from any Latin American country. But we don’t have a list of Latin American countries in a table in the Northwind database. So, we’re going to just use this list of Latin American countries that happen to be in the Orders table: Brazil , Mexico ,Argentina ,Venezuela.
 It doesn’t make sense to use multiple Or statements anymore, it would get too convoluted. Use the In statement
 
 mysql> select order_id, customer_id, ship_country from orders where ship_country in ('Brazil', 'Mexico', 'Argentina', 'Venezuela');
+----------+-------------+--------------+
| order_id | customer_id | ship_country |
+----------+-------------+--------------+
|    10250 | HANAR       | Brazil       |
|    10253 | HANAR       | Brazil       |
|    10256 | WELLI       | Brazil       |
|    10257 | HILAA       | Venezuela    |
|    10259 | CENTC       | Mexico       |
|    10261 | QUEDE       | Brazil       |
|    10268 | GROSR       | Venezuela    |
|    10276 | TORTU       | Mexico       |
|    10283 | LILAS       | Venezuela    |
|    10287 | RICAR       | Brazil       |
|    10290 | COMMI       | Brazil       |
|    10291 | QUEDE       | Brazil       |
|    10292 | TRADH       | Brazil       |
|    10293 | TORTU       | Mexico       |
|    10296 | LILAS       | Venezuela    |
|    10299 | RICAR       | Brazil       |
|    10304 | TORTU       | Mexico       |
|    10308 | ANATR       | Mexico       |
|    10319 | TORTU       | Mexico       |
|    10322 | PERIC       | Mexico       |
|    10330 | LILAS       | Venezuela    |
|    10347 | FAMIA       | Brazil       |
|    10354 | PERIC       | Mexico       |
|    10357 | LILAS       | Venezuela    |
|    10365 | ANTON       | Mexico       |
|    10372 | QUEEN       | Brazil       |
|    10379 | QUEDE       | Brazil       |
|    10381 | LILAS       | Venezuela    |
|    10386 | FAMIA       | Brazil       |
|    10395 | HILAA       | Venezuela    |
|    10405 | LINOD       | Venezuela    |
|    10406 | QUEEN       | Brazil       |
|    10409 | OCEAN       | Argentina    |
|    10414 | FAMIA       | Brazil       |
|    10420 | WELLI       | Brazil       |
|    10421 | QUEDE       | Brazil       |
|    10423 | GOURL       | Brazil       |
|    10447 | RICAR       | Brazil       |
|    10448 | RANCH       | Argentina    |
|    10461 | LILAS       | Venezuela    |
|    10466 | COMMI       | Brazil       |
|    10474 | PERIC       | Mexico       |
|    10476 | HILAA       | Venezuela    |
|    10481 | RICAR       | Brazil       |
|    10485 | LINOD       | Venezuela    |
|    10486 | HILAA       | Venezuela    |
|    10487 | QUEEN       | Brazil       |
|    10490 | HILAA       | Venezuela    |
|    10494 | COMMI       | Brazil       |
|    10496 | TRADH       | Brazil       |
|    10498 | HILAA       | Venezuela    |
|    10499 | LILAS       | Venezuela    |
|    10502 | PERIC       | Mexico       |
|    10507 | ANTON       | Mexico       |
|    10512 | FAMIA       | Brazil       |
|    10518 | TORTU       | Mexico       |
|    10521 | CACTU       | Argentina    |
|    10531 | OCEAN       | Argentina    |
|    10535 | ANTON       | Mexico       |
|    10541 | HANAR       | Brazil       |
|    10543 | LILAS       | Venezuela    |
|    10552 | HILAA       | Venezuela    |
|    10563 | RICAR       | Brazil       |
|    10573 | ANTON       | Mexico       |
|    10576 | TORTU       | Mexico       |
|    10581 | FAMIA       | Brazil       |
|    10585 | WELLI       | Brazil       |
|    10587 | QUEDE       | Brazil       |
|    10601 | HILAA       | Venezuela    |
|    10606 | TRADH       | Brazil       |
|    10613 | HILAA       | Venezuela    |
|    10622 | RICAR       | Brazil       |
|    10625 | ANATR       | Mexico       |
|    10637 | QUEEN       | Brazil       |
|    10638 | LINOD       | Venezuela    |
|    10641 | HILAA       | Venezuela    |
|    10644 | WELLI       | Brazil       |
|    10645 | HANAR       | Brazil       |
|    10647 | QUEDE       | Brazil       |
|    10648 | RICAR       | Brazil       |
|    10650 | FAMIA       | Brazil       |
|    10652 | GOURL       | Brazil       |
|    10659 | QUEEN       | Brazil       |
|    10676 | TORTU       | Mexico       |
|    10677 | ANTON       | Mexico       |
|    10682 | ANTON       | Mexico       |
|    10685 | GOURL       | Brazil       |
|    10690 | HANAR       | Brazil       |
|    10697 | LINOD       | Venezuela    |
|    10704 | QUEEN       | Brazil       |
|    10705 | HILAA       | Venezuela    |
|    10709 | GOURL       | Brazil       |
|    10716 | RANCH       | Argentina    |
|    10720 | QUEDE       | Brazil       |
|    10725 | FAMIA       | Brazil       |
|    10728 | QUEEN       | Brazil       |
|    10729 | LINOD       | Venezuela    |
|    10734 | GOURL       | Brazil       |
|    10759 | ANATR       | Mexico       |
|    10770 | HANAR       | Brazil       |
|    10777 | GOURL       | Brazil       |
|    10780 | LILAS       | Venezuela    |
|    10782 | CACTU       | Argentina    |
|    10783 | HANAR       | Brazil       |
|    10785 | GROSR       | Venezuela    |
|    10786 | QUEEN       | Brazil       |
|    10790 | GOURL       | Brazil       |
|    10794 | QUEDE       | Brazil       |
|    10796 | HILAA       | Venezuela    |
|    10803 | WELLI       | Brazil       |
|    10809 | WELLI       | Brazil       |
|    10811 | LINOD       | Venezuela    |
|    10813 | RICAR       | Brazil       |
|    10819 | CACTU       | Argentina    |
|    10823 | LILAS       | Venezuela    |
|    10828 | RANCH       | Argentina    |
|    10830 | TRADH       | Brazil       |
|    10834 | TRADH       | Brazil       |
|    10838 | LINOD       | Venezuela    |
|    10839 | TRADH       | Brazil       |
|    10840 | LINOD       | Venezuela    |
|    10842 | TORTU       | Mexico       |
|    10851 | RICAR       | Brazil       |
|    10856 | ANTON       | Mexico       |
|    10863 | HILAA       | Venezuela    |
|    10868 | QUEEN       | Brazil       |
|    10877 | RICAR       | Brazil       |
|    10881 | CACTU       | Argentina    |
|    10886 | HANAR       | Brazil       |
|    10898 | OCEAN       | Argentina    |
|    10899 | LILAS       | Venezuela    |
|    10900 | WELLI       | Brazil       |
|    10901 | HILAA       | Venezuela    |
|    10903 | HANAR       | Brazil       |
|    10905 | WELLI       | Brazil       |
|    10913 | QUEEN       | Brazil       |
|    10914 | QUEEN       | Brazil       |
|    10915 | TORTU       | Mexico       |
|    10916 | RANCH       | Argentina    |
|    10919 | LINOD       | Venezuela    |
|    10922 | HANAR       | Brazil       |
|    10925 | HANAR       | Brazil       |
|    10926 | ANATR       | Mexico       |
|    10935 | WELLI       | Brazil       |
|    10937 | CACTU       | Argentina    |
|    10954 | LINOD       | Venezuela    |
|    10957 | HILAA       | Venezuela    |
|    10958 | OCEAN       | Argentina    |
|    10959 | GOURL       | Brazil       |
|    10960 | HILAA       | Venezuela    |
|    10961 | QUEEN       | Brazil       |
|    10969 | COMMI       | Brazil       |
|    10976 | HILAA       | Venezuela    |
|    10981 | HANAR       | Brazil       |
|    10986 | OCEAN       | Argentina    |
|    10989 | QUEDE       | Brazil       |
|    10995 | PERIC       | Mexico       |
|    10997 | LILAS       | Venezuela    |
|    11014 | LINOD       | Venezuela    |
|    11019 | RANCH       | Argentina    |
|    11022 | HANAR       | Brazil       |
|    11039 | LINOD       | Venezuela    |
|    11042 | COMMI       | Brazil       |
|    11049 | GOURL       | Brazil       |
|    11052 | HANAR       | Brazil       |
|    11054 | CACTU       | Argentina    |
|    11055 | HILAA       | Venezuela    |
|    11059 | RICAR       | Brazil       |
|    11065 | LILAS       | Venezuela    |
|    11068 | QUEEN       | Brazil       |
|    11069 | TORTU       | Mexico       |
|    11071 | LILAS       | Venezuela    |
|    11073 | PERIC       | Mexico       |
+----------+-------------+--------------+
173 rows in set (0.00 sec)

-- 10 --
-- For all the employees in the Employees table, show the FirstName, LastName, Title, and BirthDate. Order the results by BirthDate, so we have the oldest employees first

mysql> select first_name, last_name, title, birth_date from employees order by birth_date;
+------------+-----------+--------------------------+---------------------+
| first_name | last_name | title                    | birth_date          |
+------------+-----------+--------------------------+---------------------+
| Margaret   | Peacock   | Sales Representative     | 1937-09-19 00:00:00 |
| Nancy      | Davolio   | Sales Representative     | 1948-12-08 00:00:00 |
| Andrew     | Fuller    | Vice President, Sales    | 1952-02-19 00:00:00 |
| Steven     | Buchanan  | Sales Manager            | 1955-03-04 00:00:00 |
| Laura      | Callahan  | Inside Sales Coordinator | 1958-01-09 00:00:00 |
| Robert     | King      | Sales Representative     | 1960-05-29 00:00:00 |
| Michael    | Suyama    | Sales Representative     | 1963-07-02 00:00:00 |
| Janet      | Leverling | Sales Representative     | 1963-08-30 00:00:00 |
| Anne       | Dodsworth | Sales Representative     | 1966-01-27 00:00:00 |
+------------+-----------+--------------------------+---------------------+
9 rows in set (0.00 sec)

-- 11 --
-- Showing only the Date with a DateTime field In the output of the query above, showing the Employees in order of BirthDate, we see the time of the BirthDate field, which we don’t want. Show only the date portion of the BirthDate field.
 
 mysql> select first_name, last_name, title, date(birth_date) from employees order by birth_date;
+------------+-----------+--------------------------+------------------+
| first_name | last_name | title                    | date(birth_date) |
+------------+-----------+--------------------------+------------------+
| Margaret   | Peacock   | Sales Representative     | 1937-09-19       |
| Nancy      | Davolio   | Sales Representative     | 1948-12-08       |
| Andrew     | Fuller    | Vice President, Sales    | 1952-02-19       |
| Steven     | Buchanan  | Sales Manager            | 1955-03-04       |
| Laura      | Callahan  | Inside Sales Coordinator | 1958-01-09       |
| Robert     | King      | Sales Representative     | 1960-05-29       |
| Michael    | Suyama    | Sales Representative     | 1963-07-02       |
| Janet      | Leverling | Sales Representative     | 1963-08-30       |
| Anne       | Dodsworth | Sales Representative     | 1966-01-27       |
+------------+-----------+--------------------------+------------------+
9 rows in set (0.03 sec)

-- 12 --
-- Get employees full name 
mysql> select first_name, last_name, concat (first_name, ' ', last_name) from employees;
+------------+-----------+-------------------------------------+
| first_name | last_name | concat (first_name, ' ', last_name) |
+------------+-----------+-------------------------------------+
| Nancy      | Davolio   | Nancy Davolio                       |
| Andrew     | Fuller    | Andrew Fuller                       |
| Janet      | Leverling | Janet Leverling                     |
| Margaret   | Peacock   | Margaret Peacock                    |
| Steven     | Buchanan  | Steven Buchanan                     |
| Michael    | Suyama    | Michael Suyama                      |
| Robert     | King      | Robert King                         |
| Laura      | Callahan  | Laura Callahan                      |
| Anne       | Dodsworth | Anne Dodsworth                      |
+------------+-----------+-------------------------------------+
9 rows in set (0.00 sec)

-- 13 --
-- OrderDetails amount per line item with computed

mysql> select order_id, product_id, unit_price, quantity, unit_price* quantity as total_price from order_Details limit 25;
+----------+------------+------------+----------+--------------------+
| order_id | product_id | unit_price | quantity | total_price        |
+----------+------------+------------+----------+--------------------+
|    10248 |         11 |         14 |       12 |                168 |
|    10248 |         42 | 9.80000019 |       10 |         98.0000019 |
|    10248 |         72 | 34.7999992 |        5 |         173.999996 |
|    10249 |         14 | 18.6000004 |        9 |        167.4000036 |
|    10249 |         51 | 42.4000015 |       40 |         1696.00006 |
|    10250 |         41 | 7.69999981 |       10 |         76.9999981 |
|    10250 |         51 | 42.4000015 |       35 |       1484.0000525 |
|    10250 |         65 | 16.7999992 |       15 | 251.99998799999997 |
|    10251 |         22 | 16.7999992 |        6 | 100.79999519999998 |
|    10251 |         57 | 15.6000004 |       15 |         234.000006 |
|    10251 |         65 | 16.7999992 |       20 |         335.999984 |
|    10252 |         20 | 64.8000031 |       40 |        2592.000124 |
|    10252 |         33 |          2 |       25 |                 50 |
|    10252 |         60 | 27.2000008 |       40 | 1088.0000320000001 |
|    10253 |         31 |         10 |       20 |                200 |
|    10253 |         39 | 14.3999996 |       42 |  604.7999831999999 |
|    10253 |         49 |         16 |       40 |                640 |
|    10254 |         24 |  3.5999999 |       15 |         53.9999985 |
|    10254 |         55 | 19.2000008 |       21 |        403.2000168 |
|    10254 |         74 |          8 |       21 |                168 |
|    10255 |          2 | 15.1999998 |       20 |         303.999996 |
|    10255 |         16 | 13.8999996 |       35 |         486.499986 |
|    10255 |         36 | 15.1999998 |       25 |         379.999995 |
|    10255 |         59 |         44 |       30 |               1320 |
|    10256 |         53 | 26.2000008 |       15 |         393.000012 |
+----------+------------+------------+----------+--------------------+
25 rows in set (0.00 sec)

-- 14 --
-- How many customers are in customers table

mysql> select count(*) as total_customers from customers;
+-----------------+
| total_customers |
+-----------------+
|              91 |
+-----------------+
1 row in set (0.11 sec)

-- 15 --
-- retrive the first order from orders;

mysql> select min(order_date) From orders;
+-----------------+
| min(order_date) |
+-----------------+
| 1996-07-04      |
+-----------------+
1 row in set (0.05 sec)

-- 16 --
-- Countries where there are customers

mysql> select distinct country from customers;
+-------------+
| country     |
+-------------+
| Germany     |
| Mexico      |
| UK          |
| Sweden      |
| France      |
| Spain       |
| Canada      |
| Argentina   |
| Switzerland |
| Brazil      |
| Austria     |
| Italy       |
| Portugal    |
| USA         |
| Venezuela   |
| Ireland     |
| Belgium     |
| Norway      |
| Denmark     |
| Finland     |
| Poland      |
+-------------+
21 rows in set (0.00 sec)

-- 17 --
-- Contact titles for customers

mysql> select contact_title, count(contact_title) as cnt  from customers group by contact_title order by cnt;
+--------------------------------+-----+
| contact_title                  | cnt |
+--------------------------------+-----+
| Assistant Sales Representative |   1 |
| Owner/Marketing Assistant      |   1 |
| Order Administrator            |   2 |
| Assistant Sales Agent          |   2 |
| Sales Agent                    |   5 |
| Marketing Assistant            |   6 |
| Sales Associate                |   7 |
| Accounting Manager             |  10 |
| Sales Manager                  |  11 |
| Marketing Manager              |  12 |
| Sales Representative           |  17 |
| Owner                          |  17 |
+--------------------------------+-----+
12 rows in set (0.00 sec)

-- 18 --
-- Fetch Products with associated supplier names

mysql> select product_id, product_name, company_name from products join suppliers on products.supplier_id = suppliers.supplier_id;
+------------+----------------------------------+----------------------------------------+
| product_id | product_name                     | company_name                           |
+------------+----------------------------------+----------------------------------------+
|          2 | Chang                            | Exotic Liquids                         |
|          3 | Aniseed Syrup                    | Exotic Liquids                         |
|          4 | Chef Anton's Cajun Seasoning     | New Orleans Cajun Delights             |
|          5 | Chef Anton's Gumbo Mix           | New Orleans Cajun Delights             |
|         65 | Louisiana Fiery Hot Pepper Sauce | New Orleans Cajun Delights             |
|         66 | Louisiana Hot Spiced Okra        | New Orleans Cajun Delights             |
|          6 | Grandma's Boysenberry Spread     | Grandma Kelly's Homestead              |
|          7 | Uncle Bob's Organic Dried Pears  | Grandma Kelly's Homestead              |
|          8 | Northwoods Cranberry Sauce       | Grandma Kelly's Homestead              |
|          9 | Mishi Kobe Niku                  | Tokyo Traders                          |
|         10 | Ikura                            | Tokyo Traders                          |
|         74 | Longlife Tofu                    | Tokyo Traders                          |
|         11 | Queso Cabrales                   | Cooperativa de Quesos 'Las Cabras'     |
|         12 | Queso Manchego La Pastora        | Cooperativa de Quesos 'Las Cabras'     |
|         13 | Konbu                            | Mayumi's                               |
|         14 | Tofu                             | Mayumi's                               |
|         15 | Genen Shouyu                     | Mayumi's                               |
|         16 | Pavlova                          | Pavlova, Ltd.                          |
|         17 | Alice Mutton                     | Pavlova, Ltd.                          |
|         18 | Carnarvon Tigers                 | Pavlova, Ltd.                          |
|         63 | Vegie-spread                     | Pavlova, Ltd.                          |
|         70 | Outback Lager                    | Pavlova, Ltd.                          |
|          1 | Chai                             | Specialty Biscuits, Ltd.               |
|         19 | Teatime Chocolate Biscuits       | Specialty Biscuits, Ltd.               |
|         20 | Sir Rodney's Marmalade           | Specialty Biscuits, Ltd.               |
|         21 | Sir Rodney's Scones              | Specialty Biscuits, Ltd.               |
|         68 | Scottish Longbreads              | Specialty Biscuits, Ltd.               |
|         22 | Gustaf's Knäckebröd              | PB Knäckebröd AB                       |
|         23 | Tunnbröd                         | PB Knäckebröd AB                       |
|         24 | Guaraná Fantástica               | Refrescos Americanas LTDA              |
|         25 | NuNuCa Nuß-Nougat-Creme          | Heli Süßwaren GmbH & Co. KG            |
|         26 | Gumbär Gummibärchen              | Heli Süßwaren GmbH & Co. KG            |
|         27 | Schoggi Schokolade               | Heli Süßwaren GmbH & Co. KG            |
|         28 | Rössle Sauerkraut                | Plutzer Lebensmittelgroßmärkte AG      |
|         29 | Thüringer Rostbratwurst          | Plutzer Lebensmittelgroßmärkte AG      |
|         64 | Wimmers gute Semmelknödel        | Plutzer Lebensmittelgroßmärkte AG      |
|         75 | Rhönbräu Klosterbier             | Plutzer Lebensmittelgroßmärkte AG      |
|         77 | Original Frankfurter grüne Soße  | Plutzer Lebensmittelgroßmärkte AG      |
|         30 | Nord-Ost Matjeshering            | Nord-Ost-Fisch Handelsgesellschaft mbH |
|         31 | Gorgonzola Telino                | Formaggi Fortini s.r.l.                |
|         32 | Mascarpone Fabioli               | Formaggi Fortini s.r.l.                |
|         72 | Mozzarella di Giovanni           | Formaggi Fortini s.r.l.                |
|         33 | Geitost                          | Norske Meierier                        |
|         69 | Gudbrandsdalsost                 | Norske Meierier                        |
|         71 | Flotemysost                      | Norske Meierier                        |
|         34 | Sasquatch Ale                    | Bigfoot Breweries                      |
|         35 | Steeleye Stout                   | Bigfoot Breweries                      |
|         67 | Laughing Lumberjack Lager        | Bigfoot Breweries                      |
|         36 | Inlagd Sill                      | Svensk Sjöföda AB                      |
|         37 | Gravad lax                       | Svensk Sjöföda AB                      |
|         73 | Röd Kaviar                       | Svensk Sjöföda AB                      |
|         38 | Côte de Blaye                    | Aux joyeux ecclésiastiques             |
|         39 | Chartreuse verte                 | Aux joyeux ecclésiastiques             |
|         40 | Boston Crab Meat                 | New England Seafood Cannery            |
|         41 | Jack's New England Clam Chowder  | New England Seafood Cannery            |
|         42 | Singaporean Hokkien Fried Mee    | Leka Trading                           |
|         43 | Ipoh Coffee                      | Leka Trading                           |
|         44 | Gula Malacca                     | Leka Trading                           |
|         45 | Rogede sild                      | Lyngbysild                             |
|         46 | Spegesild                        | Lyngbysild                             |
|         47 | Zaanse koeken                    | Zaanse Snoepfabriek                    |
|         48 | Chocolade                        | Zaanse Snoepfabriek                    |
|         49 | Maxilaku                         | Karkki Oy                              |
|         50 | Valkoinen suklaa                 | Karkki Oy                              |
|         76 | Lakkalikööri                     | Karkki Oy                              |
|         51 | Manjimup Dried Apples            | G'day, Mate                            |
|         52 | Filo Mix                         | G'day, Mate                            |
|         53 | Perth Pasties                    | G'day, Mate                            |
|         54 | Tourtière                        | Ma Maison                              |
|         55 | Pâté chinois                     | Ma Maison                              |
|         56 | Gnocchi di nonna Alice           | Pasta Buttini s.r.l.                   |
|         57 | Ravioli Angelo                   | Pasta Buttini s.r.l.                   |
|         58 | Escargots de Bourgogne           | Escargots Nouveaux                     |
|         59 | Raclette Courdavault             | Gai pâturage                           |
|         60 | Camembert Pierrot                | Gai pâturage                           |
|         61 | Sirop d'érable                   | Forêts d'érables                       |
|         62 | Tarte au sucre                   | Forêts d'érables                       |
+------------+----------------------------------+----------------------------------------+
77 rows in set (0.04 sec)

-- 19 --
-- fetch Orders and the Shipper that was used

mysql> select order_id, date(order_date) order_date, company_name from orders o join shippers s on o.ship_via=s.shipper_id where order_id < 10300 order by order_id;
+----------+------------------+------------------+
| order_id | order_date       | company_name     |
+----------+------------------+------------------+
|    10248 | 1996-07-04       | Federal Shipping |
|    10249 | 1996-07-05       | Speedy Express   |
|    10250 | 1996-07-08       | United Package   |
|    10251 | 1996-07-08       | Speedy Express   |
|    10252 | 1996-07-09       | United Package   |
|    10253 | 1996-07-10       | United Package   |
|    10254 | 1996-07-11       | United Package   |
|    10255 | 1996-07-12       | Federal Shipping |
|    10256 | 1996-07-15       | United Package   |
|    10257 | 1996-07-16       | Federal Shipping |
|    10258 | 1996-07-17       | Speedy Express   |
|    10259 | 1996-07-18       | Federal Shipping |
|    10260 | 1996-07-19       | Speedy Express   |
|    10261 | 1996-07-19       | United Package   |
|    10262 | 1996-07-22       | Federal Shipping |
|    10263 | 1996-07-23       | Federal Shipping |
|    10264 | 1996-07-24       | Federal Shipping |
|    10265 | 1996-07-25       | Speedy Express   |
|    10266 | 1996-07-26       | Federal Shipping |
|    10267 | 1996-07-29       | Speedy Express   |
|    10268 | 1996-07-30       | Federal Shipping |
|    10269 | 1996-07-31       | Speedy Express   |
|    10270 | 1996-08-01       | Speedy Express   |
|    10271 | 1996-08-01       | United Package   |
|    10272 | 1996-08-02       | United Package   |
|    10273 | 1996-08-05       | Federal Shipping |
|    10274 | 1996-08-06       | Speedy Express   |
|    10275 | 1996-08-07       | Speedy Express   |
|    10276 | 1996-08-08       | Federal Shipping |
|    10277 | 1996-08-09       | Federal Shipping |
|    10278 | 1996-08-12       | United Package   |
|    10279 | 1996-08-13       | United Package   |
|    10280 | 1996-08-14       | Speedy Express   |
|    10281 | 1996-08-14       | Speedy Express   |
|    10282 | 1996-08-15       | Speedy Express   |
|    10283 | 1996-08-16       | Federal Shipping |
|    10284 | 1996-08-19       | Speedy Express   |
|    10285 | 1996-08-20       | United Package   |
|    10286 | 1996-08-21       | Federal Shipping |
|    10287 | 1996-08-22       | Federal Shipping |
|    10288 | 1996-08-23       | Speedy Express   |
|    10289 | 1996-08-26       | Federal Shipping |
|    10290 | 1996-08-27       | Speedy Express   |
|    10291 | 1996-08-27       | United Package   |
|    10292 | 1996-08-28       | United Package   |
|    10293 | 1996-08-29       | Federal Shipping |
|    10294 | 1996-08-30       | United Package   |
|    10295 | 1996-09-02       | United Package   |
|    10296 | 1996-09-03       | Speedy Express   |
|    10297 | 1996-09-04       | United Package   |
|    10298 | 1996-09-05       | United Package   |
|    10299 | 1996-09-06       | United Package   |
+----------+------------------+------------------+
52 rows in set (0.04 sec)

 
 