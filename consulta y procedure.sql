USE [HiperAlmacen]
GO

CREATE PROCEDURE usp_consultarCliente
@DatoBuscar int
AS
Begin
	SELECT *
	FROM Clientes
	WHERE Identificacion = @DatoBuscar
end


/**Consulta .. donde se ingrese la cc y muestre todos los datos*/

/--ejecutar procedimiento almacenado--/
EXECUTE Usp_consultarcliente 40
exec Usp_consultarcliente 10
exec Usp_consultarcliente 20
exec Usp_consultarcliente 11
exec Usp_consultarcliente 50

CREATE PROCEDURE USP_StockProduct
@DatoBuscar int
AS
Begin 
	Select IdProducto,Cantidad,NivelPedido,Descontinuado
	From Productos
	Where Descontinuado = 0 AND IdProducto = @DatoBuscar
END

execute USP_StockProduct 9


CREATE PROCEDURE usp_AddClientes

@apellido varchar(20),
@NombreCli	varchar(20),
@ciudad varchar(20),
@celular varchar(15),
@comuna varchar(10),
@fechaing date
AS
BEGIN

INSERT INTO Clientes (Apellido,NombreCli,Ciudad,celular,Comuna,FechaIng)
		VALUES (@apellido, @NombreCli, @ciudad, @celular, @comuna, @fechaing)

END



EXECUTE usp_AddClientes'Araque','William','Medellin','3043967721','Comuna 80','1999/08/10'

DROP PROCEDURE USP_IngresarProductos


CREATE PROCEDURE USP_IngresarProductos

@IdCategoria int,
@NombrePro varchar(100),
@Precio int	,
@Cantidad smallint,
@CantidadStock smallint,
@NivelPedido bit,
@Descontinuado bit,
@Iva smallint
AS
BEGIN

INSERT INTO Productos (IdCategoria,NombrePro,Precio,Cantidad,CantidadStock,NivelPedido,Descontinuado,Iva)
		VALUES        (@idCategoria,@NombrePro,@Precio,@Cantidad,@CantidadStock,@NivelPedido,@Descontinuado,@Iva)
END

EXECUTE USP_IngresarProductos 4,'Cuaderno100hojas',4000, 20, 6, 1, 1, 19

select * from Clientes

/*eliminar datos*/

CREATE PROCEDURE  USP_DeleteClientes
@Identificacion int
as
begin
	delete from Clientes
	where Identificacion = @Identificacion
end

exec USP_DeleteClientes 69

UPDATE Clientes











