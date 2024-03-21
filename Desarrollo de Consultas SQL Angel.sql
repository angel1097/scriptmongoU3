Use Northwind;

--ventas totales para cada categoría de producto, considerando solo las ventas del año 1997.
select * from Categories;
select * from Products;
select * from [Order Details];

SELECT cat.CategoryName as 'Categoria', SUM(od.Quantity * od.UnitPrice) AS 'Ventas Totales'
FROM Orders o
INNER JOIN [Order Details] od ON o.OrderID = od.OrderID
INNER JOIN Products p ON od.ProductID = p.ProductID
INNER JOIN Categories cat ON p.CategoryID = cat.CategoryID
WHERE YEAR(o.OrderDate) = 1997
GROUP BY cat.CategoryName
go

--Muestra los 5 productos más vendidos, incluyendo la cantidad total vendida de cada uno.
select * from Products;
select * from [Order Details];

SELECT top 5 p.ProductName as 'Producto', SUM(od.Quantity ) as TotalVendidos
FROM [Order Details] od
INNER JOIN Products p ON od.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY TotalVendidos DESC
go


--Obtiene cada cliente junto con la fecha de su último pedido.
select * from Customers;
select * from Orders;

SELECT c.CustomerID as 'Cliente', MAX(o.OrderDate) as FechaUltPedido
FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID
ORDER BY FechaUltPedido ASC
go


--Calcula las ventas totales hechas por cada empleado por año.
select * from [Order Details];
select * from Employees;

SELECT YEAR(o.OrderDate) as 'Año', e.EmployeeID as 'Empleado',  e.FirstName as 'Nombre',
SUM(od.Quantity * od.UnitPrice) AS 'VentasTotales'
FROM Orders o
INNER JOIN [Order Details] od ON o.OrderID = od.OrderID
INNER JOIN Employees e ON o.EmployeeID = e.EmployeeID
GROUP BY YEAR(o.OrderDate), e.EmployeeID, e.LastName, e.FirstName
ORDER BY YEAR(OrderDate) ,e.EmployeeID ASC
go


--Muestra detalles de los pedidos para productos que han sido descontinuados.
select * from [Order Details] 
select * from Products;

SELECT  p.Discontinued as 'Descontinuado', o.OrderID as 'Numero de Orden', 
o.OrderDate as 'Fecha', p.ProductName as 'Producto',
od.Quantity as 'Cantidad', od.UnitPrice as 'Precio Unitario'
FROM Orders o
INNER JOIN [Order Details] od ON o.OrderID = od.OrderID
INNER JOIN Products p ON od.ProductID = p.ProductID
WHERE p.Discontinued = 1;
go

--Calcula los ingresos totales de los pedidos basados 
--en el país de destino de los pedidos, para un año específico (por ejemplo, 1997).
SELECT YEAR(OrderDate) AS 'Año', ShipCountry as 'Pais', SUM(UnitPrice * Quantity) AS 'Ingresos Totales'
FROM Orders o
INNER JOIN [Order Details] od ON o.OrderID = od.OrderID
where YEAR(OrderDate) = '1997'
GROUP BY YEAR(OrderDate) , ShipCountry
ORDER BY YEAR(OrderDate) ASC
go


--Concultas con Having

/*Muestra el precio promedio de los productos dentro de cada categoría, 
incluyendo solo aquellas categorías cuyo precio promedio de producto supera los $20.*/
select * from Categories;
select * from Products;

SELECT c.CategoryName, AVG(p.UnitPrice) AS 'PromedioPrecio'
FROM Products p
INNER JOIN Categories c ON p.CategoryID = c.CategoryID
GROUP BY c.CategoryName
HAVING AVG(p.UnitPrice) > 20
go


--Con 20 estan todos pero intente con 30 y quita a seafood:
SELECT c.CategoryName, AVG(p.UnitPrice) AS 'PromedioPrecio'
FROM Products p
INNER JOIN Categories c ON p.CategoryID = c.CategoryID
GROUP BY c.CategoryName
HAVING AVG(p.UnitPrice) > 30
go

/*Muestra la cantidad de productos por proveedor que tienen un nivel de 
unidades en stock menor a 10, incluyendo solo los proveedores con más de 2 productos en esta situación.*/
select * from Suppliers;
select * from Products;

SELECT p.SupplierID as 'Proveedor', COUNT(p.ProductID) AS 'Numeros de Productos'
FROM Products p
WHERE p.UnitsInStock < 10
GROUP BY p.SupplierID
HAVING COUNT(p.ProductID) > 2
go
--Menor en stock a 10 no hay ninguno pero mayor a 10 si hay 9 :
SELECT p.SupplierID as 'Proveedor', COUNT(p.ProductID) AS 'Numeros de Productos'
FROM Products p
WHERE p.UnitsInStock > 10
GROUP BY p.SupplierID
HAVING COUNT(p.ProductID) > 2
go

/*Calcula las ventas totales realizadas por cada empleado en el año 1997,
incluyendo solo aquellos empleados con ventas totales superiores a $50,000.*/
select * from Employees;
select * from Orders;
select * from [Order Details];

SELECT YEAR(o.OrderDate) AS 'Año', o.EmployeeID as 'Empleado',  e.FirstName as 'Nombre',
SUM(od.Quantity * od.UnitPrice) as 'Ventas Totales'
FROM Orders o
INNER JOIN [Order Details] od ON o.OrderID = od.OrderID
INNER JOIN Employees e ON o.EmployeeID = e.EmployeeID
WHERE YEAR(o.OrderDate) = 1997
GROUP BY YEAR(o.OrderDate), o.EmployeeID, e.LastName, e.FirstName
HAVING SUM(od.Quantity * od.UnitPrice) > 50000
order by o.EmployeeID asc
go

/*Lista los clientes que han realizado más de 15 pedidos en total.*/
select * from Customers;
select * from Orders;

SELECT c.CustomerID as 'Cliente', c.CompanyName as 'Nombre', COUNT(o.OrderID) as 'Pedidos Tptales'
FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.CompanyName
HAVING COUNT(o.OrderID) > 15
go

/*Muestra los productos que se han vendido en una cantidad total superior a 1000 unidades.*/
select * from Products;
select * from [Order Details];

SELECT p.ProductID as 'Id Producto', p.ProductName as 'Nombre Producto', SUM(od.Quantity) as 'Cantidad Total'
FROM Products p
INNER JOIN [Order Details] od ON p.ProductID = od.ProductID
GROUP BY p.ProductID, p.ProductName
HAVING SUM(od.Quantity) > 1000
order by p.ProductID ASC
go

