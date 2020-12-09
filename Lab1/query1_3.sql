SELECT a.City, a.StateProvince, a.CountryRegion, SUM (d.LineTotal) as Total, 
	SUM (d.OrderQty*d.UnitPrice*d.UnitPriceDiscount) as Discounts
FROM [SalesLT].[Address] as a 
INNER JOIN [SalesLT].[SalesOrderHeader] as h 
    ON h.ShipToAddressID = a.AddressID
INNER JOIN [SalesLT].[SalesOrderDetail] as d 
    ON d.SalesOrderID = h.SalesOrderID
GROUP BY ROLLUP (a.CountryRegion, a.StateProvince, a.City)
ORDER BY 1,2,3;