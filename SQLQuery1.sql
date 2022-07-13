USE HiperAlmacen

SELECT *
FROM Productos
WHERE Precio >= 2000000 AND Precio <= 4000000 OR  CantidadStock > 3
ORDER BY Precio DESC

SELECT *
FROM Clientes
WHERE Ciudad ='Caldas' AND Ciudad = 'Sabaneta'

SELECT *
FROM Clientes
WHERE Ciudad ='Caldas' OR Ciudad = 'Sabaneta'
ORDER BY Ciudad

SELECT *
FROM Productos
WHERE Precio Between 2000000 AND 4000000
ORDER BY Precio

SELECT *
FROM Clientes
WHERE Ciudad NOT IN ('Caldas','Sabaneta')
ORDER BY Ciudad 
 
SELECT NombrePro as Producto, FORMAT(Precio, '#,###') as 'Valor Unidad',
		FORMAT((Precio * 30/100), '#,###' ) as 'Vlr Ganancia',
		FORMAT((Precio + (precio * 30/100)), '#,###') as 'Precio de Venta'
 FROM Productos
