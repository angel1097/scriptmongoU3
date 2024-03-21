### Usar la base de datos "Northwind"
Use Northwind;

### Consulta 1: Ventas totales para cada categoría de producto en el año 1997
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

### Consulta 2: Los 5 productos más vendidos con cantidad total vendida
select * from Products;
select * from [Order Details];

SELECT top 5 p.ProductName as 'Producto', SUM(od.Quantity ) as TotalVendidos
FROM [Order Details] od
INNER JOIN Products p ON od.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY TotalVendidos DESC
go

### Consulta 3: Clientes junto con la fecha de su último pedido
select * from Customers;
select * from Orders;

SELECT c.CustomerID as 'Cliente', MAX(o.OrderDate) as FechaUltPedido
FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID
ORDER BY FechaUltPedido ASC
go

### Consulta 4: Ventas totales hechas por cada empleado por año
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

### Consulta 5: Detalles de pedidos para productos descontinuados
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

### Consulta 6: Ingresos totales de pedidos basados en el país de destino para un año específico
SELECT YEAR(OrderDate) AS 'Año', ShipCountry as 'País', SUM(UnitPrice * Quantity) AS 'Ingresos Totales'
FROM Orders o
INNER JOIN [Order Details] od ON o.OrderID = od.OrderID
WHERE YEAR(OrderDate) = '1997'
GROUP BY YEAR(OrderDate) , ShipCountry
ORDER BY YEAR(OrderDate) ASC
go

### Consulta 7: Precio promedio de productos por categoría, considerando solo aquellas con precio promedio superior a $20
select * from Categories;
select * from Products;

SELECT c.CategoryName, AVG(p.UnitPrice) AS 'PromedioPrecio'
FROM Products p
INNER JOIN Categories c ON p.CategoryID = c.CategoryID
GROUP BY c.CategoryName
HAVING AVG(p.UnitPrice) > 20
go

### Consulta 8: Cantidad de productos por proveedor con unidades en stock menor a 10 y más de 2 productos en esa situación
select * from Suppliers;
select * from Products;

SELECT p.SupplierID as 'Proveedor', COUNT(p.ProductID) AS 'Numeros de Productos'
FROM Products p
WHERE p.UnitsInStock < 10
GROUP BY p.SupplierID
HAVING COUNT(p.ProductID) > 2
go

### Consulta 9: Ventas totales realizadas por cada empleado en 1997 con ventas superiores a $50,000
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

### Consulta 10: Clientes que han realizado más de 15 pedidos en total
select * from Customers;
select * from Orders;

SELECT c.CustomerID as 'Cliente', c.CompanyName as 'Nombre', COUNT(o.OrderID) as 'Pedidos Tptales'
FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.CompanyName
HAVING COUNT(o.OrderID) > 15
go
### Consulta 11 (continuación): Muestra los productos que se han vendido en una cantidad total superior a 1000 unidades.
select * from Products;
select * from [Order Details];

SELECT p.ProductID as 'Id Producto', p.ProductName as 'Nombre Producto', SUM(od.Quantity) as 'Cantidad Total'
FROM Products p
INNER JOIN [Order Details] od ON p.ProductID = od.ProductID
GROUP BY p.ProductID, p.ProductName
HAVING SUM(od.Quantity) > 1000
order by p.ProductID ASC
go

### Consulta 12: Ventas totales para cada categoría de producto, considerando solo las ventas del año 1997.
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
