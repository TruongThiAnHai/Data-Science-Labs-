WITH New AS (
    SELECT  DISTINCT a.StateProvince, a.CountryRegion,  
    NumberOfCustomer = COUNT(ca.CustomerID) OVER (PARTITION BY a.StateProvince)
    FROM [SalesLT].[CustomerAddress] as ca
    JOIN [SalesLT].[Address] as a 
     ON a.AddressID = ca.AddressID
    WHERE ca.AddressType = 'Main Office'
    )
SELECT New.StateProvince, New.CountryRegion, New.NumberOfCustomer,
PERCENT_RANK() OVER (PARTITION BY New.CountryRegion ORDER BY New.NumberOfCustomer DESC) AS Rank
FROM New;
