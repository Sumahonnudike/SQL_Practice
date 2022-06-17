-- 20 --
-- Categories, and the total P in each category

mysql> select c.category_id, category_name, count(product_id) from categories c
    -> join P p on c.category_id = p.category_id
    -> group by category_id;
+-------------+----------------+-------------------+
| category_id | category_name  | count(product_id) |
+-------------+----------------+-------------------+
|           1 | Beverages      |                12 |
|           2 | Condiments     |                12 |
|           3 | Confections    |                13 |
|           4 | Dairy P |                10 |
|           5 | Grains/Cereals |                 7 |
|           6 | Meat/Poultry   |                 6 |
|           7 | Produce        |                 5 |
|           8 | Seafood        |                12 |
+-------------+----------------+-------------------+
8 rows in set (0.04 sec)

-- 21 --
-- Total customers per country/city

mysql> select country, city, count(customer_id) as totcust from customers group by country,city order by totcust desc;
+-------------+-----------------+---------+
| country     | city            | totcust |
+-------------+-----------------+---------+
| UK          | London          |       6 |
| Mexico      | México D.F.     |       5 |
| Brazil      | Sao Paulo       |       4 |
| Argentina   | Buenos Aires    |       3 |
| Brazil      | Rio de Janeiro  |       3 |
| Spain       | Madrid          |       3 |
| France      | Nantes          |       2 |
| Portugal    | Lisboa          |       2 |
| USA         | Portland        |       2 |
| France      | Paris           |       2 |
| Germany     | Mannheim        |       1 |
| France      | Strasbourg      |       1 |
| France      | Marseille       |       1 |
| Canada      | Tsawassen       |       1 |
| Switzerland | Bern            |       1 |
| Germany     | Aachen          |       1 |
| Austria     | Graz            |       1 |
| France      | Lille           |       1 |
| Sweden      | Bräcke          |       1 |
| Germany     | München         |       1 |
| Italy       | Torino          |       1 |
| Spain       | Barcelona       |       1 |
| Spain       | Sevilla         |       1 |
| Brazil      | Campinas        |       1 |
| USA         | Eugene          |       1 |
| Venezuela   | Caracas         |       1 |
| Venezuela   | San Cristóbal   |       1 |
| USA         | Elgin           |       1 |
| Ireland     | Cork            |       1 |
| UK          | Cowes           |       1 |
| Germany     | Brandenburg     |       1 |
| France      | Versailles      |       1 |
| France      | Toulouse        |       1 |
| Canada      | Vancouver       |       1 |
| USA         | Walla Walla     |       1 |
| Germany     | Frankfurt a.M.  |       1 |
| USA         | San Francisco   |       1 |
| Venezuela   | Barquisimeto    |       1 |
| Venezuela   | I. de Margarita |       1 |
| Germany     | Berlin          |       1 |
| Italy       | Bergamo         |       1 |
| Belgium     | Bruxelles       |       1 |
| Canada      | Montréal        |       1 |
| Germany     | Leipzig         |       1 |
| USA         | Anchorage       |       1 |
| Germany     | Köln            |       1 |
| Sweden      | Luleå           |       1 |
| Austria     | Salzburg        |       1 |
| Germany     | Cunewalde       |       1 |
| USA         | Albuquerque     |       1 |
| Italy       | Reggio Emilia   |       1 |
| Switzerland | Genève          |       1 |
| Norway      | Stavern         |       1 |
| USA         | Boise           |       1 |
| Denmark     | Kobenhavn       |       1 |
| USA         | Lander          |       1 |
| Belgium     | Charleroi       |       1 |
| USA         | Butte           |       1 |
| Germany     | Münster         |       1 |
| USA         | Kirkland        |       1 |
| Denmark     | Århus           |       1 |
| France      | Lyon            |       1 |
| France      | Reims           |       1 |
| Germany     | Stuttgart       |       1 |
| Finland     | Oulu            |       1 |
| Brazil      | Resende         |       1 |
| USA         | Seattle         |       1 |
| Finland     | Helsinki        |       1 |
| Poland      | Warszawa        |       1 |
+-------------+-----------------+---------+
69 rows in set (0.00 sec)

-- 22 --
-- P that need reordering

mysql> select product_id, product_name, units_in_stock, reorder_level from P where units_in_stock <= reorder_level order by reorder_level;
+------------+---------------------------+----------------+---------------+
| product_id | product_name              | units_in_stock | reorder_level |
+------------+---------------------------+----------------+---------------+
|          5 | Chef Anton's Gumbo Mix    |              0 |             0 |
|         17 | Alice Mutton              |              0 |             0 |
|         29 | Thüringer Rostbratwurst   |              0 |             0 |
|         53 | Perth Pasties             |              0 |             0 |
|         21 | Sir Rodney's Scones       |              3 |             5 |
|         74 | Longlife Tofu             |              4 |             5 |
|         30 | Nord-Ost Matjeshering     |             10 |            15 |
|         45 | Rogede sild               |              5 |            15 |
|         49 | Maxilaku                  |             10 |            15 |
|         68 | Scottish Longbreads       |              6 |            15 |
|         31 | Gorgonzola Telino         |              0 |            20 |
|         66 | Louisiana Hot Spiced Okra |              4 |            20 |
|          2 | Chang                     |             17 |            25 |
|          3 | Aniseed Syrup             |             13 |            25 |
|         32 | Mascarpone Fabioli        |              9 |            25 |
|         37 | Gravad lax                |             11 |            25 |
|         43 | Ipoh Coffee               |             17 |            25 |
|         48 | Chocolade                 |             15 |            25 |
|         11 | Queso Cabrales            |             22 |            30 |
|         56 | Gnocchi di nonna Alice    |             21 |            30 |
|         64 | Wimmers gute Semmelknödel |             22 |            30 |
|         70 | Outback Lager             |             15 |            30 |
+------------+---------------------------+----------------+---------------+

-- 23 --
-- P that need reordering, continued

mysql> select product_id, product_name, units_in_stock, reorder_level from P where units_in_stock+units_on_order <= reorder_level and discontinued = 0 order by reorder_level;
+------------+-----------------------+----------------+---------------+
| product_id | product_name          | units_in_stock | reorder_level |
+------------+-----------------------+----------------+---------------+
|         30 | Nord-Ost Matjeshering |             10 |            15 |
|         70 | Outback Lager         |             15 |            30 |
+------------+-----------------------+----------------+---------------+
2 rows in set (0.02 sec)

-- 24 --
-- Customer list by region

mysql> select customer_id, company_name, region from customers order by case when region is null then 1 else 0 end , region, customer_id;
+-------------+--------------------------------------+---------------+
| customer_id | company_name                         | region        |
+-------------+--------------------------------------+---------------+
| OLDWO       | Old World Delicatessen               | AK            |
| BOTTM       | Bottom-Dollar Markets                | BC            |
| LAUGB       | Laughing Bacchus Wine Cellars        | BC            |
| LETSS       | Let's Stop N Shop                    | CA            |
| HUNGO       | Hungry Owl All-Night Grocers         | Co. Cork      |
| GROSR       | GROSELLA-Restaurante                 | DF            |
| SAVEA       | Save-a-lot Markets                   | ID            |
| ISLAT       | Island Trading                       | Isle of Wight |
| LILAS       | LILA-Supermercado                    | Lara          |
| THECR       | The Cracker Box                      | MT            |
| RATTC       | Rattlesnake Canyon Grocery           | NM            |
| LINOD       | LINO-Delicateses                     | Nueva Esparta |
| GREAL       | Great Lakes Food Market              | OR            |
| HUNGC       | Hungry Coyote Import Store           | OR            |
| LONEP       | Lonesome Pine Restaurant             | OR            |
| THEBI       | The Big Cheese                       | OR            |
| MEREP       | Mère Paillarde                       | Québec        |
| HANAR       | Hanari Carnes                        | RJ            |
| QUEDE       | Que Delícia                          | RJ            |
| RICAR       | Ricardo Adocicados                   | RJ            |
| COMMI       | Comércio Mineiro                     | SP            |
| FAMIA       | Familia Arquibaldo                   | SP            |
| GOURL       | Gourmet Lanchonetes                  | SP            |
| QUEEN       | Queen Cozinha                        | SP            |
| TRADH       | Tradiçao Hipermercados               | SP            |
| WELLI       | Wellington Importadora               | SP            |
| HILAA       | HILARION-Abastos                     | Táchira       |
| LAZYK       | Lazy K Kountry Store                 | WA            |
| TRAIH       | Trail's Head Gourmet Provisioners    | WA            |
| WHITC       | White Clover Markets                 | WA            |
| SPLIR       | Split Rail Beer & Ale                | WY            |
| ALFKI       | Alfreds Futterkiste                  | NULL          |
| ANATR       | Ana Trujillo Emparedados y helados   | NULL          |
| ANTON       | Antonio Moreno Taquería              | NULL          |
| AROUT       | Around the Horn                      | NULL          |
| BERGS       | Berglunds snabbköp                   | NULL          |
| BLAUS       | Blauer See Delikatessen              | NULL          |
| BLONP       | Blondesddsl père et fils             | NULL          |
| BOLID       | Bólido Comidas preparadas            | NULL          |
| BONAP       | Bon app'                             | NULL          |
| BSBEV       | B's Beverages                        | NULL          |
| CACTU       | Cactus Comidas para llevar           | NULL          |
| CENTC       | Centro comercial Moctezuma           | NULL          |
| CHOPS       | Chop-suey Chinese                    | NULL          |
| CONSH       | Consolidated Holdings                | NULL          |
| DRACD       | Drachenblut Delikatessen             | NULL          |
| DUMON       | Du monde entier                      | NULL          |
| EASTC       | Eastern Connection                   | NULL          |
| ERNSH       | Ernst Handel                         | NULL          |
| FISSA       | FISSA Fabrica Inter. Salchichas S.A. | NULL          |
| FOLIG       | Folies gourmandes                    | NULL          |
| FOLKO       | Folk och fä HB                       | NULL          |
| FRANK       | Frankenversand                       | NULL          |
| FRANR       | France restauration                  | NULL          |
| FRANS       | Franchi S.p.A.                       | NULL          |
| FURIB       | Furia Bacalhau e Frutos do Mar       | NULL          |
| GALED       | Galería del gastrónomo               | NULL          |
| GODOS       | Godos Cocina Típica                  | NULL          |
| KOENE       | Königlich Essen                      | NULL          |
| LACOR       | La corne d'abondance                 | NULL          |
| LAMAI       | La maison d'Asie                     | NULL          |
| LEHMS       | Lehmanns Marktstand                  | NULL          |
| MAGAA       | Magazzini Alimentari Riuniti         | NULL          |
| MAISD       | Maison Dewey                         | NULL          |
| MORGK       | Morgenstern Gesundkost               | NULL          |
| NORTS       | North/South                          | NULL          |
| OCEAN       | Océano Atlántico Ltda.               | NULL          |
| OTTIK       | Ottilies Käseladen                   | NULL          |
| PARIS       | Paris spécialités                    | NULL          |
| PERIC       | Pericles Comidas clásicas            | NULL          |
| PICCO       | Piccolo und mehr                     | NULL          |
| PRINI       | Princesa Isabel Vinhos               | NULL          |
| QUICK       | QUICK-Stop                           | NULL          |
| RANCH       | Rancho grande                        | NULL          |
| REGGC       | Reggiani Caseifici                   | NULL          |
| RICSU       | Richter Supermarkt                   | NULL          |
| ROMEY       | Romero y tomillo                     | NULL          |
| SANTG       | Santé Gourmet                        | NULL          |
| SEVES       | Seven Seas Imports                   | NULL          |
| SIMOB       | Simons bistro                        | NULL          |
| SPECD       | Spécialités du monde                 | NULL          |
| SUPRD       | Suprêmes délices                     | NULL          |
| TOMSP       | Toms Spezialitäten                   | NULL          |
| TORTU       | Tortuga Restaurante                  | NULL          |
| VAFFE       | Vaffeljernet                         | NULL          |
| VICTE       | Victuailles en stock                 | NULL          |
| VINET       | Vins et alcools Chevalier            | NULL          |
| WANDK       | Die Wandernde Kuh                    | NULL          |
| WARTH       | Wartian Herkku                       | NULL          |
| WILMK       | Wilman Kala                          | NULL          |
| WOLZA       | Wolski  Zajazd                       | NULL          |
+-------------+--------------------------------------+---------------+
91 rows in set (0.04 sec)

-- 25 --
-- High freight charges

mysql> select ship_country, avg(freight) as averagefreight  from O group by ship_country order by averagefreight desc limit 3;
+--------------+--------------------+
| ship_country | averagefreight     |
+--------------+--------------------+
| Austria      |      184.787500619 |
| Ireland      |         145.012629 |
| USA          | 112.87942658734427 |
+--------------+--------------------+
3 rows in set (0.00 sec)

-- 26 --
-- High frieght charges in the year 2015

mysql> select ship_country, avg(freight) as averagefreight  from O
    ->     where order_date >= '19980101' and order_date <= '19981231'
    ->      group by ship_country order by averagefreight desc limit 3;
+--------------+--------------------+
| ship_country | averagefreight     |
+--------------+--------------------+
| Ireland      |      339.422489125 |
| Austria      | 217.34182137272725 |
| USA          | 153.32230792387182 |
+--------------+--------------------+
3 rows in set (0.00 sec)


-- 27 --
-- High freight charges with between clause

mysql> select ship_country, avg(freight) as averagefreight  from O
    ->     where order_date between '19980101' and '19981231'
    ->      group by ship_country order by averagefreight desc limit 3;
+--------------+--------------------+
| ship_country | averagefreight     |
+--------------+--------------------+
| Ireland      |      339.422489125 |
| Austria      | 217.34182137272725 |
| USA          | 153.32230792387182 |
+--------------+--------------------+
3 rows in set (0.00 sec)


-- 28 --
-- High freight charges - last year

mysql>  select ship_country, avg(freight) as averagefreight  from O
    ->     where YEAR(order_date) = YEAR(date_sub((select max(order_date) from O), INTERVAL 1 YEAR))
    ->      group by ship_country order by averagefreight desc limit 3;
+--------------+--------------------+
| ship_country | averagefreight     |
+--------------+--------------------+
| Austria      | 178.36428571714288 |
| Switzerland  | 117.17749967499999 |
| Sweden       |       105.15999935 |
+--------------+--------------------+
3 rows in set (0.06 sec)
 
-- verified with actual date parameters
 
mysql> select ship_country, avg(freight) as averagefreight  from O
    ->          where order_date >= '19970101' and order_date <= '19971231'
    ->        group by ship_country order by averagefreight desc limit 3;
+--------------+--------------------+
| ship_country | averagefreight     |
+--------------+--------------------+
| Austria      | 178.36428571714288 |
| Switzerland  | 117.17749967499999 |
| Sweden       |       105.15999935 |
+--------------+--------------------+
3 rows in set (0.00 sec)

-- 29 --
-- Employee-wise Inventory list

mysql> Select E.employee_id ,E.last_name ,O.order_id ,P.product_name ,OD.quantity
    -> From Employees E
    -> join Orders O on O.employee_id = E.employee_id
    -> join Order_details OD on O.order_id = OD.order_id
    -> join Products P on P.product_id = OD.product_id Order by O.order_id ,P.product_id ;
	
Actual query retred 2155 rows
So only 10 records are shown here
+-------------+-----------+----------+----------------------------------+----------+
| employee_id | last_name | order_id | product_name                     | quantity |
+-------------+-----------+----------+----------------------------------+----------+
|           5 | Buchanan  |    10248 | Queso Cabrales                   |       12 |
|           5 | Buchanan  |    10248 | Singaporean Hokkien Fried Mee    |       10 |
|           5 | Buchanan  |    10248 | Mozzarella di Giovanni           |        5 |
|           6 | Suyama    |    10249 | Tofu                             |        9 |
|           6 | Suyama    |    10249 | Manjimup Dried Apples            |       40 |
|           4 | Peacock   |    10250 | Jack's New England Clam Chowder  |       10 |
|           4 | Peacock   |    10250 | Manjimup Dried Apples            |       35 |
|           4 | Peacock   |    10250 | Louisiana Fiery Hot Pepper Sauce |       15 |
|           3 | Leverling |    10251 | Gustaf's Knäckebröd              |        6 |
|           3 | Leverling |    10251 | Ravioli Angelo                   |       15 |
+-------------+-----------+----------+----------------------------------+----------+
10 rows in set (0.01 sec)

-- 30 --
-- Customers with no orders

mysql> select c.customer_id from customers c left join orders o on c.customer_id = o.customer_id where o.customer_id is null;
+-------------+
| customer_id |
+-------------+
| FISSA       |
| PARIS       |
+-------------+
2 rows in set (0.00 sec)

mysql> Select customer_id From customers Where customer_id not in (select customer_id from Orders);
+-------------+
| customer_id |
+-------------+
| FISSA       |
| PARIS       |
+-------------+
2 rows in set (0.00 sec)

-- 31 -- 
-- Customers with no orders for EmployeeID 4

mysql> select c.customer_id from customers c left join orders o on c.customer_id = o.customer_id and o.employee_id = 4 where o.customer_id is null;
+-------------+
| customer_id |
+-------------+
| CONSH       |
| DUMON       |
| FISSA       |
| FRANR       |
| GROSR       |
| LAUGB       |
| LAZYK       |
| NORTS       |
| PARIS       |
| PERIC       |
| PRINI       |
| SANTG       |
| SEVES       |
| SPECD       |
| THEBI       |
| VINET       |
+-------------+
16 rows in set (0.00 sec)

mysql> Select customer_id From customers Where customer_id not in (select customer_id from Orders where employee_id = 4) ;
+-------------+
| customer_id |
+-------------+
| CONSH       |
| DUMON       |
| FISSA       |
| FRANR       |
| GROSR       |
| LAUGB       |
| LAZYK       |
| NORTS       |
| PARIS       |
| PERIC       |
| PRINI       |
| SANTG       |
| SEVES       |
| SPECD       |
| THEBI       |
| VINET       |
+-------------+
16 rows in set (0.00 sec)

