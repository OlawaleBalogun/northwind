-- USE northwind;
-- Q1
-- SELECT COUNT(*) AS total_orders
-- FROM salesorder;
-- Q2
-- SELECT
    -- productname,
    -- unitprice
-- FROM product
-- ORDER BY unitprice DESC;
-- Q3
-- SELECT 
   -- c.categoryname,
    -- COUNT(p.productid) AS productcount
-- FROM product p
-- JOIN category c
   -- ON p.categoryid = c.categoryid
-- GROUP BY c.categoryname
-- ORDER BY productcount DESC;

-- Q4
-- SELECT DISTINCT country
-- FROM customer
-- ORDER BY country;

-- Q5
-- SELECT 
   -- p.productname,
    -- SUM(od.quantity) AS totalquantityordered
-- FROM orderdetail od
-- JOIN product p
   -- ON od.productid = p.productid
-- GROUP BY p.productname
-- ORDER BY totalquantityordered DESC;

-- Q6
-- SELECT 
    -- c.companyname,
    -- COUNT(o.orderid) AS ordercount
-- FROM customer c
-- JOIN salesorder o
    -- ON c.custid = o.custid
-- GROUP BY c.companyname
-- ORDER BY ordercount DESC
-- LIMIT 5;

-- Q7
-- SELECT 
    -- c.categoryname,
    -- AVG(p.unitprice) AS avg_unit_price
-- FROM product p
-- JOIN category c
    -- ON p.categoryid = c.categoryid
-- GROUP BY c.categoryname
-- ORDER BY avg_unit_price DESC;

-- Q8
-- SELECT 
    -- CONCAT(firstname, ' ', lastname) AS full_name,
    -- title,
    -- YEAR(hiredate) AS hire_year
-- FROM employee;

-- Q9
-- SELECT 
   -- YEAR(orderdate) AS order_year,
    -- COUNT(orderid) AS total_orders
-- FROM salesorder
-- GROUP BY YEAR(orderdate)
-- ORDER BY order_year;

-- Q10
-- SELECT 
   -- c.categoryname,
    -- SUM(
       -- od.unitprice * od.quantity * (1 - od.discount)
   -- ) AS total_revenue
-- FROM orderdetail od
-- JOIN product p
   -- ON od.productid = p.productid
-- JOIN category c
    -- ON p.categoryid = c.categoryid
-- GROUP BY c.categoryname
-- ORDER BY total_revenue DESC;

-- Q11
-- SELECT 
    -- s.companyname,
    -- COUNT(o.orderid) AS total_orders
-- FROM shipper s
-- JOIN salesorder o
    -- ON s.shipperid = o.shipperid
-- GROUP BY s.companyname
-- ORDER BY total_orders DESC
-- LIMIT 1;

-- Q12

-- SELECT 
    -- COUNT(*) AS discontinued_products
-- FROM product
-- WHERE discontinued = 1;

-- SELECT 
   -- productname
-- FROM product
-- WHERE discontinued = 1;
-- There are 8 discontinued products

-- Q13
-- SELECT 
    -- c.companyname,
    -- SUM(
       -- od.unitprice * od.quantity * (1 - od.discount)
    -- ) AS total_revenue
-- FROM customer c
-- JOIN salesorder o
   -- ON c.custid = o.custid
-- JOIN orderdetail od
   -- ON o.orderid = od.orderid
-- GROUP BY c.companyname
-- ORDER BY total_revenue DESC;

-- Q14
-- SELECT 
    -- o.orderid,
    -- c.companyname,
    -- o.orderdate
-- FROM salesorder o
-- JOIN customer c
    -- ON o.custid = c.custid
-- WHERE YEAR(o.orderdate) = 2006
-- ORDER BY o.orderdate;
-- The years in this data are 2006, 2007, 2008. There is no 1997, hence the use of 2006

-- Q15
-- SELECT 
    -- CONCAT(e.firstname, ' ', e.lastname) AS full_name,
    -- COUNT(o.orderid) AS order_count
-- FROM employee e
-- JOIN salesorder o
    -- ON e.employeeid = o.employeeid
-- GROUP BY e.employeeid, e.firstname, e.lastname
-- HAVING COUNT(o.orderid) > 80
-- ORDER BY order_count DESC;

-- Q16
-- List late orders
-- SELECT 
    -- orderid,
    -- orderdate,
    -- requireddate,
    -- shippeddate
-- FROM salesorder
-- WHERE shippeddate > requireddate
-- ORDER BY shippeddate;
-- Percentage of late orders
-- SELECT 
   -- ROUND(
     --   (
       --     COUNT(CASE 
         --       WHEN shippeddate > requireddate 
           --     THEN 1 
            -- END) * 100.0
        -- ) / COUNT(*),
        -- 2
    -- ) AS late_order_percentage
-- FROM salesorder;

-- Q17
-- SELECT s.companyname, COUNT(p.productid) AS productcount
-- FROM supplier s
-- JOIN product p ON s.supplierid = p.supplierid
-- GROUP BY s.companyname
-- ORDER BY productcount DESC;

-- Q18
-- SELECT productname, unitprice
-- FROM product
-- WHERE unitprice > (SELECT AVG(unitprice) FROM product);

-- Q20
-- SELECT o.orderid,
   --    c.companyname,
     --  o.orderdate,
       -- SUM(od.unitprice * od.quantity * (1 - od.discount)) AS totalvalue
-- FROM salesorder o
-- JOIN orderdetail od ON o.orderid = od.orderid
-- JOIN customer c ON o.custid = c.custid
-- GROUP BY o.orderid, c.companyname, o.orderdate
-- ORDER BY totalvalue DESC
-- LIMIT 10;

-- Q20
-- SELECT c.custid, c.companyname
-- FROM customer c
-- LEFT JOIN salesorder o ON c.custid = o.custid
-- WHERE o.orderid IS NULL;

-- Q21
-- SELECT e.employeeid,
       -- CONCAT(e.firstname, ' ', e.lastname) AS employeename,
       -- AVG(DATEDIFF(o.shippeddate, o.orderdate)) AS avgshipdays
-- FROM employee e
-- JOIN salesorder o ON e.employeeid = o.employeeid
-- WHERE o.shippeddate IS NOT NULL
-- GROUP BY e.employeeid, employeename
-- ORDER BY avgshipdays ASC;

-- Q22
-- SELECT p.productname, s.companyname, s.country
-- FROM product p
-- JOIN supplier s ON p.supplierid = s.supplierid
-- WHERE s.country = 'Germany';

-- Q23
-- SELECT c.categoryname, p.productname, p.unitprice
-- FROM product p
-- JOIN category c ON p.categoryid = c.categoryid
-- WHERE p.unitprice = (
   -- SELECT MAX(p2.unitprice)
    -- FROM product p2
    -- WHERE p2.categoryid = p.categoryid
-- );

-- Q24
-- SELECT YEAR(orderdate) AS orderyear,
   --    QUARTER(orderdate) AS orderquarter,
     --  COUNT(orderid) AS ordercount
-- FROM salesorder
-- GROUP BY YEAR(orderdate), QUARTER(orderdate)
-- ORDER BY orderyear, orderquarter;

-- Q25
-- SELECT DISTINCT custid
-- FROM salesorder
-- WHERE YEAR(orderdate) = 2006
-- AND custid NOT IN (
   -- SELECT custid
    -- FROM salesorder
    -- WHERE YEAR(orderdate) = 2007

-- );

-- Q26
-- SELECT e.firstname AS employeefirstname,
   --    e.lastname AS employeelastname,
     --  m.firstname AS managerfirstname,
       -- m.lastname AS managerlastname
-- FROM employee e
-- LEFT JOIN employee m ON e.employeeid = m.employeeid;

-- Q27
-- SELECT c.companyname,
   --    SUM(od.unitprice * od.quantity * od.discount) AS totaldiscount
-- FROM customer c
-- JOIN salesorder o ON c.custid = o.custid
-- JOIN orderdetail od ON o.orderid = od.orderid
-- GROUP BY c.companyname
-- ORDER BY totaldiscount DESC;

-- Q28
-- SELECT o.orderid,
   --    c.companyname,
     --  SUM(od.unitprice * od.quantity * (1 - od.discount)) AS totalvalue
-- FROM salesorder o
-- JOIN customer c ON o.custid = c.custid
-- JOIN orderdetail od ON o.orderid = od.orderid
-- GROUP BY o.orderid, c.companyname
-- HAVING SUM(od.unitprice * od.quantity * (1 - od.discount)) > 5000;

-- Q29
-- WITH monthlyrevenue AS (
    -- SELECT
       -- YEAR(so.orderdate) AS orderyear,
        -- MONTH(so.orderdate) AS ordermonth,
        -- SUM(sod.unitprice * sod.quantity * (1 - sod.discount)) AS totalrevenue
    -- FROM salesorder so
    -- JOIN orderdetail sod
       -- ON so.orderid = sod.orderid
    -- GROUP BY YEAR(so.orderdate), MONTH(so.orderdate)
-- )

-- SELECT
   -- orderyear,
    -- ordermonth,
    -- totalrevenue,
    -- totalrevenue -
    -- LAG(totalrevenue, 1)
    -- OVER (ORDER BY orderyear, ordermonth) AS revenuechange
-- FROM monthlyrevenue
-- ORDER BY orderyear, ordermonth;

-- Q30
-- WITH productrevenue AS (
   -- SELECT
     --   c.categoryname,
       -- p.productname,
        -- SUM(od.unitprice * od.quantity * (1 - od.discount)) AS totalrevenue,
        -- RANK() OVER (
           -- PARTITION BY c.categoryname
            -- ORDER BY SUM(od.unitprice * od.quantity * (1 - od.discount)) DESC
        -- ) AS ranking
    -- FROM product p
    -- JOIN category c
       -- ON p.categoryid = c.categoryid
    -- JOIN orderdetail sod
       -- ON p.productid = od.productid
    -- GROUP BY c.categoryname, p.productname
-- )

-- SELECT *
-- FROM productrevenue
-- WHERE ranking <= 3
-- ORDER BY categoryname, ranking;

-- Q31
-- SELECT
   -- c.custid,
    -- c.companyname,
    -- DATEDIFF(
       -- (SELECT MAX(orderdate) FROM salesorder),
        -- MAX(so.orderdate)
    -- ) AS recency,
    -- COUNT(DISTINCT so.orderid) AS frequency,
    -- SUM(od.unitprice * od.quantity * (1 - od.discount)) AS monetary
-- FROM customer c
-- JOIN salesorder so
   -- ON c.custid = so.custid
-- JOIN orderdetail od
   -- ON so.orderid = od.orderid
-- GROUP BY c.custid, c.companyname
-- ORDER BY monetary DESC;

-- Q32
-- WITH customerspending AS (
   -- SELECT
     --   c.custid,
       -- SUM(od.unitprice * od.quantity * (1 - od.discount)) AS totalspent
    -- FROM customer c
    -- JOIN salesorder so
       -- ON c.custid = so.custid
    -- JOIN orderdetail od
       -- ON so.orderid = od.orderid
    -- GROUP BY c.custid
-- )

-- SELECT
   -- CASE
     --   WHEN totalspent > 10000 THEN 'Platinum'
       -- WHEN totalspent BETWEEN 5000 AND 10000 THEN 'Gold'
        -- WHEN totalspent BETWEEN 1000 AND 4999 THEN 'Silver'
        -- ELSE 'Bronze'
    -- END AS spendingtier,
    -- COUNT(*) AS customercount
-- FROM customerspending
-- GROUP BY spendingtier
-- ORDER BY customercount DESC;

-- Q33
-- SELECT
   -- CONCAT(e.firstname, ' ', e.lastname) AS employeename,
    -- SUM(od.unitprice * od.quantity * (1 - od.discount)) AS employeerevenue,
    -- ROUND(
       -- (
         --   SUM(od.unitprice * od.quantity * (1 - od.discount))
           -- /
            -- (
               -- SELECT SUM(
                 --   unitprice * quantity * (1 - discount)
                -- )
                -- FROM orderdetail
            -- )
        -- ) * 100,
        -- 2
    -- ) AS revenuepercent
-- FROM employee e
-- JOIN salesorder so
   -- ON e.employeeid = so.employeeid
-- JOIN orderdetail od
   -- ON so.orderid = od.orderid
-- GROUP BY employeename
-- ORDER BY revenuepercent DESC;

-- Q34
-- WITH monthlyorders AS (
--     SELECT
--         YEAR(orderdate) AS orderyear,
--         MONTH(orderdate) AS ordermonth,
--         COUNT(orderid) AS ordercount
--     FROM salesorder
--     GROUP BY YEAR(orderdate), MONTH(orderdate)
-- )

-- SELECT
--     orderyear,
--     ordermonth,
--     ordercount,
--     SUM(ordercount)
--     OVER (
--         ORDER BY orderyear, ordermonth
--         ROWS UNBOUNDED PRECEDING
--     ) AS runningtotal
-- FROM monthlyorders
-- ORDER BY orderyear, ordermonth;

-- Q35
-- DROP VIEW vwordersummary
-- CREATE VIEW vwordersummary AS
-- SELECT
--     so.orderid,
--     c.companyname AS customername,
--     CONCAT(e.firstname, ' ', e.lastname) AS employeename,
--     s.companyname AS shippername,
--     so.orderdate,
--     so.shippeddate,
--     DATEDIFF(so.shippeddate, so.orderdate) AS daystoship,
--     SUM(
--         od.unitprice * od.quantity * (1 - od.discount)
--     ) AS totalvalue
-- FROM salesorder so
-- JOIN customer c
--     ON so.custid = c.custid
-- JOIN employee e
--     ON so.employeeid = e.employeeid
-- JOIN shipper s
--     ON so.shipperid = s.shipperid
-- JOIN orderdetail od
--     ON so.orderid = od.orderid
-- GROUP BY
--     so.orderid,
--     c.companyname,
--     e.firstname,
--     e.lastname,
--     s.companyname,
--     so.orderdate,
--     so.shippeddate;

-- Q36
-- DELIMITER //

-- CREATE PROCEDURE getcustomerreport(
--     IN customeridparam VARCHAR(20)
-- )
-- BEGIN
--     SELECT
--         COUNT(DISTINCT so.orderid) AS totalorders,
--         SUM(od.unitprice * od.quantity * (1 - od.discount)) AS totalrevenue,
--         AVG(ordervalue.totalvalue) AS averageordervalue,
--         MAX(so.orderdate) AS lastorderdate
--     FROM salesorder so
--     JOIN orderdetail od
--         ON so.orderid = od.orderid
--     JOIN (
--         SELECT
--             orderid,
--             SUM(unitprice * quantity * (1 - discount)) AS totalvalue
--         FROM orderdetail
--         GROUP BY orderid
--     ) ordervalue
--         ON so.orderid = ordervalue.orderid
--     WHERE so.custid = custidparam;
-- END //

-- DELIMITER ;

-- Q37
-- WITH countrysales AS (
--     SELECT
--         c.country,
--         p.productname,
--         SUM(od.quantity) AS totalquantity,
--         RANK() OVER (
--             PARTITION BY c.country
--             ORDER BY SUM(od.quantity) DESC
--         ) AS ranking
--     FROM customer c
--     JOIN salesorder so
--         ON c.custid = so.custid
--     JOIN orderdetail od
--         ON so.orderid = od.orderid
--     JOIN product p
--         ON od.productid = p.productid
--     GROUP BY c.country, p.productname
-- )

-- SELECT *
-- FROM countrysales
-- WHERE ranking <= 3
-- ORDER BY country, ranking;

-- Q38
-- SELECT
--     p.productid,
--     p.productname
-- FROM product p
-- WHERE p.productid NOT IN (
--     SELECT DISTINCT od.productid
--     FROM salesorder so
--     JOIN orderdetail od
--         ON so.orderid = od.orderid
--     WHERE so.orderdate >= (
--         SELECT DATE_SUB(MAX(orderdate), INTERVAL 12 MONTH)
--         FROM salesorder
--     )
-- );
-- All the products have been ordered within 12 months

-- Q39
-- WITH quarterlyrevenue AS (
--     SELECT
--         YEAR(so.orderdate) AS orderyear,
--         QUARTER(so.orderdate) AS orderquarter,
--         SUM(od.unitprice * od.quantity * (1 - od.discount)) AS totalrevenue
--     FROM salesorder so
--     JOIN orderdetail od
--         ON so.orderid = od.orderid
--     GROUP BY
--         YEAR(so.orderdate),
--         QUARTER(so.orderdate)
-- )

-- SELECT
--     orderyear,
--     orderquarter,
--     totalrevenue,
--     ROUND(
--         (
--             totalrevenue -
--             LAG(totalrevenue)
--             OVER (
--                 PARTITION BY orderyear
--                 ORDER BY orderquarter
--             )
--         )
--         /
--         LAG(totalrevenue)
--         OVER (
--             PARTITION BY orderyear
--             ORDER BY orderquarter
--         ) * 100,
--         2
--     ) AS growthrate
-- FROM quarterlyrevenue
-- ORDER BY orderyear, orderquarter;

-- Q40
-- SELECT
--     so1.custid,
--     so1.orderid,
--     so1.orderdate,
--     COUNT(so2.orderid) AS ordercount
-- FROM salesorder so1
-- JOIN salesorder so2
--     ON so1.custid = so2.custid
--     AND DATEDIFF(
--         so2.orderdate,
--         so1.orderdate
--     ) BETWEEN 0 AND 7
-- GROUP BY
--     so1.custid,
--     so1.orderid,
--     so1.orderdate
-- HAVING COUNT(so2.orderid) >= 3
-- ORDER BY so1.custid;

-- Q41
-- SELECT
--     s.companyname,
--     COUNT(DISTINCT p.productid) AS totalproducts,
--     SUM(od.quantity) AS totalquantity,
--     SUM(od.unitprice * od.quantity * (1 - od.discount)) AS totalrevenue,
--     AVG(DATEDIFF(so.shippeddate, so.orderdate)) AS avgshipdays
-- FROM supplier s
-- JOIN product p
--     ON s.supplierid = p.supplierid
-- JOIN orderdetail od
--     ON p.productid = od.productid
-- JOIN salesorder so
--     ON od.orderid = so.orderid
-- GROUP BY s.companyname
-- ORDER BY totalrevenue DESC;

-- Q42
-- WITH territoryrevenue AS (
--     SELECT
--         e.country,
--         SUM(od.unitprice * od.quantity * (1 - od.discount)) AS totalrevenue
--     FROM employee e
--     JOIN salesorder so
--         ON e.employeeid = so.employeeid
--     JOIN orderdetail od
--         ON so.orderid = od.orderid
--     GROUP BY e.country
-- ),

-- employeerevenue AS (
--     SELECT
--         e.country,
--         CONCAT(e.firstname, ' ', e.lastname) AS employeename,
--         SUM(od.unitprice * od.quantity * (1 - od.discount)) AS totalrevenue
--     FROM employee e
--     JOIN salesorder so
--         ON e.employeeid = so.employeeid
--     JOIN orderdetail od
--         ON so.orderid = od.orderid
--     GROUP BY e.country, employeename
-- )

-- SELECT
--     tr.country,
--     tr.totalrevenue,
--     er.employeename,
--     er.totalrevenue AS employeerevenue
-- FROM territoryrevenue tr
-- JOIN employeerevenue er
--     ON tr.country = er.country
-- WHERE tr.totalrevenue = (
--     SELECT MAX(totalrevenue)
--     FROM territoryrevenue
-- )
-- ORDER BY er.totalrevenue DESC
-- LIMIT 1;

-- Q43
-- SELECT
--     YEAR(so.orderdate) AS orderyear,
--     MONTH(so.orderdate) AS ordermonth,
--     COUNT(DISTINCT so.orderid) AS totalorders,
--     SUM(
--         od.unitprice * od.quantity * (1 - od.discount)
--     ) AS totalrevenue,
--     ROUND(
--         SUM(
--             od.unitprice * od.quantity * (1 - od.discount)
--         )
--         /
--         COUNT(DISTINCT so.orderid),
--         2
--     ) AS averageordervalue,
--     COUNT(DISTINCT so.custid) AS uniquecustomers
-- FROM salesorder so
-- JOIN orderdetail od
--     ON so.orderid = od.orderid
-- GROUP BY
--     YEAR(so.orderdate),
--     MONTH(so.orderdate)
-- ORDER BY orderyear, ordermonth;

-- The single best performing month
-- SELECT
--     YEAR(so.orderdate) AS orderyear,
--     MONTH(so.orderdate) AS ordermonth,
--     COUNT(DISTINCT so.orderid) AS totalorders,
--     SUM(od.unitprice * od.quantity * (1 - od.discount)) AS totalrevenue,
--     ROUND(
--         SUM(od.unitprice * od.quantity * (1 - od.discount))
--         / COUNT(DISTINCT so.orderid),
--         2
--     ) AS averageordervalue,
--     COUNT(DISTINCT so.custid) AS uniquecustomers
-- FROM salesorder so
-- JOIN orderdetail od
--     ON so.orderid = od.orderid
-- GROUP BY
--     YEAR(so.orderdate),
--     MONTH(so.orderdate)
-- ORDER BY totalrevenue DESC
-- LIMIT 1;

-- Q44
-- SELECT
--     p.productid,
--     p.productname,
--     p.unitsinstock,
--     p.reorderlevel,
--     CASE
--         WHEN p.unitsinstock = 0 THEN 'Critical'
--         WHEN p.unitsinstock < p.reorderlevel THEN 'Low'
--         ELSE 'OK'
--     END AS urgency
-- FROM product p
-- WHERE p.unitsinstock < p.reorderlevel
-- AND p.discontinued = 0
-- ORDER BY p.unitsinstock;

-- Q45
-- WITH customersegment AS (
--     SELECT
--         c.custid,
--         COUNT(DISTINCT so.orderid) AS ordercount,
--         SUM(
--             od.unitprice * od.quantity * (1 - od.discount)
--         ) AS totalrevenue
--     FROM customer c
--     JOIN salesorder so
--         ON c.custid = so.custid
--     JOIN orderdetail od
--         ON so.orderid = od.orderid
--     GROUP BY c.custid
-- )

-- SELECT
--     CASE
--         WHEN ordercount >= 6 THEN 'Loyal'
--         WHEN ordercount BETWEEN 3 AND 5 THEN 'Regular'
--         ELSE 'Occasional'
--     END AS customersegment,
--     SUM(totalrevenue) AS segmentrevenue
-- FROM customersegment
-- GROUP BY customersegment
-- ORDER BY segmentrevenue DESC;

-- Q46
-- SELECT
--     c.country,
--     COUNT(DISTINCT c.custid) AS totalcustomers,
--     COUNT(DISTINCT so.orderid) AS totalorders,
--     SUM(
--         od.unitprice * od.quantity * (1 - od.discount)
--     ) AS totalrevenue,
--     ROUND(
--         SUM(
--             od.unitprice * od.quantity * (1 - od.discount)
--         )
--         /
--         COUNT(DISTINCT so.orderid),
--         2
--     ) AS averageordervalue
-- FROM customer c
-- JOIN salesorder so
--     ON c.custid = so.custid
-- JOIN orderdetail od
--     ON so.orderid = od.orderid
-- GROUP BY c.country
-- ORDER BY totalrevenue DESC;

-- Q47
-- WITH categoryrevenue AS (
--     SELECT
--         c.categoryname,
--         YEAR(so.orderdate) AS orderyear,
--         SUM(
--             od.unitprice * od.quantity * (1 - od.discount)
--         ) AS totalrevenue
--     FROM category c
--     JOIN product p
--         ON c.categoryid = p.categoryid
--     JOIN orderdetail od
--         ON p.productid = od.productid
--     JOIN salesorder so
--         ON od.orderid = so.orderid
--     GROUP BY
--         c.categoryname,
--         YEAR(so.orderdate)
-- ),

-- revenuecompare AS (
--     SELECT
--         categoryname,
--         orderyear,
--         totalrevenue,
--         LAG(totalrevenue)
--         OVER (
--             PARTITION BY categoryname
--             ORDER BY orderyear
--         ) AS previousrevenue
--     FROM categoryrevenue
-- )

-- SELECT
--     categoryname,
--     orderyear,
--     totalrevenue,
--     previousrevenue,
--     CASE
--         WHEN totalrevenue < previousrevenue
--         THEN 'Declining'
--         ELSE 'Growing'
--     END AS revenuestatus
-- FROM revenuecompare
-- WHERE orderyear = (
--     SELECT MAX(YEAR(orderdate))
--     FROM salesorder
-- );

-- Q48
-- SELECT
--     CONCAT(e.firstname, ' ', e.lastname) AS employeename,
--     COUNT(DISTINCT so.orderid) AS totalorders,
--     SUM(
--         od.unitprice * od.quantity * (1 - od.discount)
--     ) AS totalrevenue,
--     ROUND(
--         SUM(
--             od.unitprice * od.quantity * (1 - od.discount)
--         )
--         /
--         COUNT(DISTINCT so.orderid),
--         2
--     ) AS averageordervalue,
--     ROUND(
--         (
--             COUNT(
--                 CASE
--                     WHEN so.shippeddate <= so.requireddate
--                     THEN 1
--                 END
--             )
--             /
--             COUNT(DISTINCT so.orderid)
--         ) * 100,
--         2
--     ) AS ontimedeliveryrate,
--     RANK() OVER (
--         ORDER BY
--         SUM(
--             od.unitprice * od.quantity * (1 - od.discount)
--         ) DESC
--     ) AS revenuerank
-- FROM employee e
-- JOIN salesorder so
--     ON e.employeeid = so.employeeid
-- JOIN orderdetail od
--     ON so.orderid = od.orderid
-- GROUP BY
--     e.employeeid,
--     employeename
-- ORDER BY revenuerank;

-- Q49
-- SELECT
--     p1.productname AS productone,
--     p2.productname AS producttwo,
--     COUNT(*) AS togethercount
-- FROM orderdetail od1
-- JOIN orderdetail od2
--     ON od1.orderid = od2.orderid
--     AND od1.productid < od2.productid
-- JOIN product p1
--     ON od1.productid = p1.productid
-- JOIN product p2
--     ON od2.productid = p2.productid
-- GROUP BY
--     p1.productname,
--     p2.productname
-- ORDER BY togethercount DESC;

-- Q50
SELECT
    'Total Revenue' AS metricname,
    SUM(unitprice * quantity * (1 - discount))
    AS metricvalue
FROM orderdetail

UNION ALL

SELECT
    'Total Orders',
    COUNT(orderid)
FROM salesorder

UNION ALL

SELECT
    'Best Selling Product',
    (
        SELECT p.productname
        FROM product p
        JOIN orderdetail od
            ON p.productid = od.productid
        GROUP BY p.productname
        ORDER BY SUM(od.quantity) DESC
        LIMIT 1
    )

UNION ALL

SELECT
    'Top Customer by Revenue',
    (
        SELECT c.companyname
        FROM customer c
        JOIN salesorder so
            ON c.custid = so.custid
        JOIN orderdetail od
            ON so.orderid = od.orderid
        GROUP BY c.companyname
        ORDER BY
        SUM(
            od.unitprice * od.quantity *
            (1 - od.discount)
        ) DESC
        LIMIT 1
    )

UNION ALL

SELECT
    'Top Employee by Revenue',
    (
        SELECT
        CONCAT(e.firstname, ' ', e.lastname)
        FROM employee e
        JOIN salesorder so
            ON e.employeeid = so.employeeid
        JOIN orderdetail od
            ON so.orderid = od.orderid
        GROUP BY e.employeeid
        ORDER BY
        SUM(
            od.unitprice * od.quantity *
            (1 - od.discount)
        ) DESC
        LIMIT 1
    )

UNION ALL

SELECT
    'Average Order Value',
    ROUND(
        (
            SELECT
            SUM(
                unitprice * quantity *
                (1 - discount)
            )
            FROM orderdetail
        )
        /
        COUNT(orderid),
        2
    )
FROM salesorder

UNION ALL

SELECT
    'On Time Delivery Rate',
    ROUND(
        (
            COUNT(
                CASE
                    WHEN shippeddate <= requireddate
                    THEN 1
                END
            )
            /
            COUNT(orderid)
        ) * 100,
        2
    )
FROM salesorder

UNION ALL

SELECT
    'Total Customers',
    COUNT(custid)
FROM customer;