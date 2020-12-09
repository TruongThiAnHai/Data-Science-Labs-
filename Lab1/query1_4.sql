SELECT  p.ProductID, pc.ProductCategoryID, pc.ParentProductCategoryID, SUM (d.LineTotal) as Total, 
	SUM (d.OrderQty*d.UnitPrice*d.UnitPriceDiscount) as Discounts
FROM [SalesLT].[ProductCategory] AS pc
RIGHT OUTER JOIN [SalesLT].[Product] AS p 
    ON p.ProductCategoryID = pc.ProductCategoryID
INNER JOIN [SalesLT].[SalesOrderDetail] as d 
    ON d.ProductID = p.ProductID
GROUP BY ROLLUP (pc.ParentProductCategoryID, pc.ProductCategoryID, p.ProductID);

