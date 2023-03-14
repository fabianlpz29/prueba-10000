create database Crud

use Crud

create table Categoria(
id_categoria int primary key,
categoria varchar(50)
);

create table Producto(
cod_producto int primary key,
producto varchar(25),
precio_compra money ,
fecha_vencimiento date ,
id_categoria int,
foreign key(id_categoria) references Categoria(id_categoria)
);


create table Inventario(
id_inventario int primary key identity (1,1),
cod_producto int,
cantidad int,
precio_venta money,
foreign key(cod_producto) references Producto(cod_producto)
);

alter procedure [dbo].[sp_inventario] 
as
select I.id_inventario,P.producto,I.cantidad,I.precio_venta from Inventario I join Producto P on I.cod_producto=p.cod_producto 

create procedure [dbo].[sp_categoria] as select
id_categoria,categoria from Categoria

create procedure [dbo].[sp_producto] as select
cod_producto, producto, precio_compra, fecha_vencimiento, id_categoria from Producto

create procedure [dbo].[sp_verproducto] as select
 cod_producto,producto from producto

 select * from categoria
 select * from producto
 select * from inventario

 select producto from producto

 exec sp_verproducto

alter procedure sp_insertar_inventario
@cod_producto int,
@cantidad int,
@precio_venta money
as
begin
insert into Inventario(cod_producto,cantidad,precio_venta) values (@cod_producto,@cantidad,@precio_venta)
end

execute sp_insertar_inventario 2345,10,2

select I.id_inventario,P.producto,I.cantidad,I.precio_venta from Inventario I join Producto P on I.cod_producto=p.cod_producto

create procedure sp_editarInventario
@id int
as 
begin
select * from Inventario where
id_inventario = @id 
end

create procedure sp_update_inventario
@producto int,
@cantidad int,
@precio money,
@id int 
as
begin
update Inventario set
cod_producto = @producto,
cantidad = @cantidad,
precio_venta = @precio
where id_inventario=@id
end

execute sp_editarInventario 4

create procedure sp_eliminar

@id int

as 

begin

delete from Inventario where id_inventario=@id

end