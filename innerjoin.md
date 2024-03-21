### Usar la base de datos "tdasjoins"
use tdasjoins

### Consulta 1: Mostrar todos los registros de la tabla "categoria"
select * from categoria;

### Consulta 2: Mostrar todos los registros de la tabla "productos"
select * from productos;

### Consulta 3: Obtener información detallada de categorías y productos
select c.idcategoria as 'Clave Categoria', c.nombre as 'Nombre categoria ',
    p.nombreproducto as 'descripcion del producto', p.preciounitario as 'precio', p.existencia as 'existencia',
    (preciounitario * existencia) as total
from categoria as c join productos as p
on c.idcategoria = p.categoria;

### Consulta 4: Obtener información de categorías y productos con condicional
select *, (preciounitario * existencia) as total,
    case
    when preciounitario = 0 then 'Precio no existente'
    when preciounitario >= 1 and preciounitario <= 100 then 'Precio Medio'
    else 'Precio Mayor'
    end as 'Datos Precio'
from categoria as c
inner join
    (select nombreproducto, preciounitario, existencia, categoria 
    from productos) as p
on c.idcategoria = p.categoria;

### Cambiar a la base de datos "Northwind"
use Northwind

### Consulta 5: Mostrar todos los registros de la tabla "Products" de la base de datos "Northwind"
select * from Products;

### Consulta 6: Obtener información de categorías y productos de la base de datos "Northwind"
select c.CategoryName as 'Nombre',
    p.ProductName as 'Nombre Producto'
from Categories as c join products as p
on c.CategoryID = p.CategoryID;

### Consulta 7: Contar productos por categoría en la base de datos "Northwind"
select * from Products;
select CategoryId, Count(*) as 'Numero de productos'
from Products
group by categoryID;

### Consulta 8: Contar productos por categoría y mostrar el nombre de la categoría
select * from Products;
select CategoryName as 'Categoria', count(*) as 'Numero de productos' from 
    (select categoryID, CategoryName from categories) as c
inner join 
    (select ProductName, CategoryID from Products) as p
on c.CategoryID = p.CategoryID
group by CategoryName;


