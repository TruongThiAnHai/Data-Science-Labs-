WITH New AS (
    SELECT  DISTINCT a.City, a.StateProvince, a.CountryRegion,  
    NumberOfCustomer = COUNT(ca.CustomerID) OVER (PARTITION BY a.City)
    FROM [SalesLT].[CustomerAddress] as ca
    JOIN [SalesLT].[Address] as a 
     ON a.AddressID = ca.AddressID
    WHERE ca.AddressType = 'Main Office'
    )
SELECT New.City, New.StateProvince, New.CountryRegion, New.NumberOfCustomer,
RANK() OVER (PARTITION BY New.CountryRegion ORDER BY New.NumberOfCustomer DESC) AS Rank,
New.NumberOfCustomer - LAG(New.NumberOfCustomer,1) OVER (PARTITION BY New.CountryRegion ORDER BY New.NumberOfCustomer DESC) AS Diferent
FROM New;
