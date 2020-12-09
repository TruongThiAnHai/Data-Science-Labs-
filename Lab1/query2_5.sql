WITH New AS (
    SELECT  DISTINCT a.StateProvince, a.CountryRegion,  
    NumberOfCustomer = COUNT(ca.CustomerID) OVER (PARTITION BY a.StateProvince)
    FROM [SalesLT].[CustomerAddress] as ca
    JOIN [SalesLT].[Address] as a 
     ON a.AddressID = ca.AddressID
    WHERE ca.AddressType = 'Main Office'
    )
SELECT New.StateProvince, New.CountryRegion, New.NumberOfCustomer,
DENSE_RANK() OVER (PARTITION BY New.CountryRegion ORDER BY New.NumberOfCustomer DESC) AS Rank
FROM New
UNION
SELECT null, null, count(c.CustomerID)- count(ca.CustomerID) ,null
FROM [SalesLT].[Customer] as c 
LEFT JOIN [SalesLT].[CustomerAddress] as ca 
ON c.CustomerID = ca.CustomerID
ORDER BY 2, RANK, 1;
