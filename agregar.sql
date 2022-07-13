use HiperAlmacen
go

select * from Productos

CREATE PROCEDURE USP_UpatePrecio
@IdProducto int,
@precio int
AS
BEGIN
		
		UpDate productos
		set 
		precio = @precio
		where IdProducto = @IdProducto
END

EXEC USP_UpatePrecio 18, 40000