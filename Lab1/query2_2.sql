With Newtab AS (
    SELECT DISTINCT c.SalesPerson,  NumberOfSales = COUNT(h.SalesOrderID) OVER (PARTITION BY c.SalesPerson)
    FROM [SalesLT].[SalesOrderHeader] as h
    RIGHT OUTER JOIN [SalesLT].[Customer] AS c
            ON h.CustomerID = c.CustomerID
    )
SELECT  n.SalesPerson, n.NumberOfSales, 
DENSE_RANK() OVER (ORDER BY n.NumberOfSales DESC) AS rank
FROM Newtab AS n;