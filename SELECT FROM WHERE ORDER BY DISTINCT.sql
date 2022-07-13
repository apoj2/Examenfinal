Use HiperAlmacen

SELECT TOP  10 percent Apellido, NombreCli, Celular
FROM Clientes

Select DISTINCT ciudad, COMUNA
FROM Clientes

SELECT TOP 5 NombrePro AS 'Nombre del Producto',
			 Precio  AS 'Precio Unidad'
FROM Productos
ORDER BY Precio DESC 


SELECT *
FROM Productos
WHERE Precio   < 5000000
ORDER BY Precio DESC

Select TOP 97 Ciudad
FROM Clientes
ORDER BY Ciudad DESC

SELECT *
FROM Clientes
WHERE Ciudad <> 'medellín' or Ciudad <> 'medellìn'
ORDER BY Ciudad
 
 SELECT *
 FROM Clientes
 WHERE Identificacion = 344

 SELECT DISTINCT NombreCli
 FROM Clientes
 WHERE NombreCli LIKE 'A%'
 