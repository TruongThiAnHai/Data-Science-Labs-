SELECT p.ProductID, c.CustomerID, a.CountryRegion as CountryForShipping,
    a.CountryRegion as ClientResidency, SUM(d.LineTotal) as Total
FROM [SalesLT].[SalesOrderHeader] as h
INNER JOIN [SalesLT].[Customer] as c 
    ON c.CustomerID = h.CustomerID
INNER JOIN [SalesLT].[CustomerAddress] as ca 
    ON ca.CustomerID = c.CustomerID
INNER JOIN [SalesLT].[SalesOrderDetail] as d 
    ON d.SalesOrderID = h.SalesOrderID
INNER JOIN [SalesLT].[Product] as p 
    ON p.ProductID = d.ProductID
INNER JOIN [SalesLT].[Address] as a 
    ON a.AddressID = h.ShipToAddressID AND a.AddressID = ca.AddressID
GROUP BY GROUPING SETS ((ROLLUP (p.ProductID, a.CountryRegion,c.CustomerID)), 
    (a.CountryRegion))
ORDER BY 1,2,3,4;

