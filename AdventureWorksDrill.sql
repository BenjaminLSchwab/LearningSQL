USE AdventureWorks2014
GO

	CREATE PROCEDURE dbo.getSalesByPerson 
		@SalesPersonID int, 
		@MinPrice money = 0
		AS
			SELECT Production.Product.Name as 'Product Sold', Sales.SalesOrderHeader.TotalDue as 'Total Price'
			FROM (((Sales.SalesPerson
				inner join Sales.SalesOrderHeader on Sales.SalesPerson.BusinessEntityID = Sales.SalesOrderHeader.SalesPersonID)
				inner join Sales.SalesOrderDetail on Sales.SalesOrderHeader.SalesOrderID = Sales.SalesOrderDetail.SalesOrderID)
				inner join Production.Product on Production.Product.ProductID = Sales.SalesOrderDetail.ProductID )

			WHERE 
				Sales.SalesPerson.BusinessEntityID = @SalesPersonID and
				Sales.SalesOrderHeader.TotalDue >= @MinPrice
GO

exec getSalesByPerson 277;

select * from Sales.SalesOrderHeader;
select * from Sales.SalesOrderDetail;
select * from Production.Product;
select * from Sales.SalesPerson;

