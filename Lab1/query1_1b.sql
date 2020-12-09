SELECT p.ProductID, c.CustomerID, c.SalesPerson, SUM(d.LineTotal) as Total
FROM [SalesLT].[SalesOrderHeader] as h
RIGHT OUTER JOIN [SalesLT].[Customer] as c 
    ON c.CustomerID = h.CustomerID
INNER JOIN [SalesLT].[SalesOrderDetail] as d 
    ON d.SalesOrderID = h.SalesOrderID
RIGHT OUTER JOIN [SalesLT].[Product] as p 
    ON p.ProductID = d.ProductID
GROUP BY CUBE (p.ProductID, c.CustomerID, c.SalesPerson)
ORDER BY 1,2,3;


