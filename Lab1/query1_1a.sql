SELECT p.ProductID, c.CustomerID, c.SalesPerson, SUM(d.LineTotal) AS Total
FROM [SalesLT].[SalesOrderHeader] as h
INNER JOIN [SalesLT].[Customer] as c 
    ON c.CustomerID = h.CustomerID
INNER JOIN [SalesLT].[SalesOrderDetail] as d 
    ON d.SalesOrderID = h.SalesOrderID
INNER JOIN [SalesLT].[Product] as p 
    ON p.ProductID = d.ProductID
GROUP BY CUBE (p.ProductID, c.CustomerID, c.SalesPerson);
