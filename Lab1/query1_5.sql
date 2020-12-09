SELECT p.ProductID, c.CustomerID, c.SalesPerson,  
a.City, a.StateProvince, a.CountryRegion, COUNT (d.OrderQty) as Number
FROM [SalesLT].[SalesOrderHeader] AS h
RIGHT OUTER JOIN [SalesLT].[Customer] AS c 
    ON c.CustomerID = h.CustomerID
INNER JOIN [SalesLT].[SalesOrderDetail] AS d 
    ON d.SalesOrderID = h.SalesOrderID
RIGHT OUTER JOIN [SalesLT].[Product] AS p 
    ON p.ProductID = d.ProductID
INNER JOIN [SalesLT].[Address] AS a 
    ON a.AddressID = h.ShipToAddressID
GROUP BY GROUPING SETS ((p.ProductID, c.CustomerID), (p.ProductID), (c.CustomerID),
(c.SalesPerson), (p.ProductID,c.SalesPerson), ROLLUP (a.CountryRegion, a.StateProvince, a.City));



