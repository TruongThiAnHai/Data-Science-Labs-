With Newtab AS (
    SELECT DISTINCT c.SalesPerson,  Total = SUM(h.SubTotal) OVER (PARTITION BY c.SalesPerson)
    FROM [SalesLT].[SalesOrderHeader] as h
    RIGHT OUTER JOIN [SalesLT].[Customer] AS c
            ON h.CustomerID = c.CustomerID
    )
SELECT  n.SalesPerson, n.Total, 
RANK() OVER (ORDER BY n.Total DESC) AS rank
FROM Newtab AS n;