Use covid
SELECT * FROM INFORMATION_SCHEMA.TABLES


--1 R//678
SELECT * FROM CovidAntioquia


--2 R// 130
SELECT Ciudad
FROM CovidAntioquia
WHERE Ciudad IN ('Copacabana')


--3 R// 164
SELECT *
FROM CovidAntioquia
WHERE Edad BETWEEN 40 AND 60
ORDER BY Edad ASC


--4 R// 327
SELECT genero
FROM CovidAntioquia
WHERE genero  = ('MALE')


--5 R// 351
SELECT genero
FROM CovidAntioquia
WHERE genero  NOT IN ('MALE')


--6
SELECT DISTINCT Ciudad
FROM CovidAntioquia
ORDER BY Ciudad ASC


--7
SELECT DISTINCT TOP 15 Edad
FROM CovidAntioquia
ORDER BY Edad DESC


--8
SELECT *
FROM CovidAntioquia
WHERE Eps IN ('SURA')


--9
SELECT  TOP 35 PERCENT Edad, genero, Ciudad, Estado
FROM CovidAntioquia
WHERE Estado = ('LEVE')


--10
SELECT *
FROM CovidAntioquia
WHERE Ciudad = ('Medellín') AND Ubicación = ('UCI')
ORDER BY Ubicación ASC


--11
SELECT * 
FROM CovidAntioquia
WHERE Ciudad = ('Itagui') AND Edad BETWEEN 20 AND 40
ORDER BY Edad ASC


--12
SELECT * 
FROM CovidAntioquia
WHERE Eps = ('N/A') AND diasAislamiento >= 20


--13
SELECT Ciudad,Edad,Eps,genero,Estado
FROM CovidAntioquia
WHERE Estado = ('fallecido') AND genero = ('Male')


--14
SELECT Ciudad,Eps,genero,TipoContagio
FROM CovidAntioquia
WHERE Ciudad = ('Bello')


--15
SELECT Eps,diasAislamiento,genero,Ubicación,VlrDia,Estado
FROM CovidAntioquia
WHERE Estado = ('grave')  and eps = ('N/A')


--16
SELECT Ciudad,Eps,genero,Ubicación,Estado
FROM CovidAntioquia
WHERE Eps = ('Coomeva')  OR Eps = ('Sisben')
ORDER BY genero ASC


--17
SELECT *
FROM CovidAntioquia
WHERE Estado NOT IN ('FALLECIDO')
ORDER BY genero ASC


--18
SELECT Ciudad,Eps,TipoContagio,Ubicación,diasAislamiento,genero
FROM CovidAntioquia
WHERE genero  = ('FEMALE') AND diasAislamiento BETWEEN 10 AND 15 AND Ciudad = ('Girardota') or Ciudad = ('Bello') AND genero NOT IN ('MALE') AND diasAislamiento BETWEEN 10 AND 15
ORDER BY genero desc


--19
SELECT Eps,genero,TipoContagio
FROM CovidAntioquia
WHERE Ubicación = ('CASA') AND EPS LIKE ('%A') AND Eps NOT IN ('N/A') AND genero NOT IN ('FEMALE')


--20
SELECT Ciudad,Eps,diasAislamiento
FROM CovidAntioquia
WHERE Estado = ('FALLECIDO') AND Ubicación = ('UCI')


--21
SELECT Ciudad,Eps,VlrDia,Ubicación,diasAislamiento as 'dias aislamiento',
			FORMAT((VlrDia * diasaislamiento), '#') as 'subtotal'
FROM CovidAntioquia
WHERE Ubicación = 'HOSPITAL'

		
--22
SELECT Eps,VlrDia,diasAislamiento as 'dias aislamiento',
			FORMAT((VlrDia * diasAislamiento), '#') as 'subtotal',
			Format((VlrDia * diasAislamiento * 30/100), '#') as 'total'
FROM CovidAntioquia
order by VlrDia desc


--23

SELECT Ciudad,VlrDia,Edad,diasAislamiento 'dias aislamiento',
			FORMAT((VlrDia * diasAislamiento), '#') as 'subtotal',
			Format((VlrDia * diasAislamiento * 50/100), '#') as 'total'
FROM CovidAntioquia
WHERE Edad >= 60
order by VlrDia desc
