With Newtab AS (
    SELECT DISTINCT c.SalesPerson,  ClientNumber = COUNT(*) OVER (PARTITION BY c.SalesPerson)
    FROM [SalesLT].[Customer] AS c
    )
SELECT  n.SalesPerson, n.ClientNumber, 
RANK() OVER (ORDER BY n.ClientNumber DESC) AS rank
FROM Newtab AS n;