Use master

go

If not exists (Select * from sys.databases where name = 'GestionCalzados')
Begin

Create database GestionCalzados

End

go

Use GestionCalzados

go

Set Dateformat 'DMY'

go

Create Table Marcas(
	ID smallint identity(1, 1),
	Descripcion varchar(100) not null
)

go

Create Table TiposCalzado(
	ID smallint identity(1, 1),
	Nombre varchar(50) not null
)

go

Create Table Colores(
	ID smallint identity(1, 1),
	Color varchar(100) not null
)

go

Create Table Talles(
	ID smallint identity(1, 1),
	Numero tinyint not null
)

go

Create Table Paises(
	ID smallint identity(1, 1),
	Nombre varchar(50) not null
)

go



Create Table Usuarios(
ID bigint identity(1, 1),
	NombreUsuario varchar(50) not null,
	Contraseña varchar(100) not null,
	Nombre varchar(50) not null,
	Apellido varchar(50) not null,
	Nacimiento date not null,
	Dni int not null,
	Genero char null,
	Telefono int not null,
	Email varchar(50) not null,
	IDPais smallint not null
)

go

Create Table Calzados(
	ID bigint identity(1, 1),
	Modelo varchar(150) not null,
	Precio money not null,
	ImagenUrl varchar(200) null,
	IDMarca smallint not null,
	IDTipoCalzado smallint not null
)

go

Create Table Stock(
	IDCalzado bigint not null,
	IDTalle smallint not null,
	IDColorBase smallint not null,
	IDColor smallint not null,
	StockDisponible bigint not null

)

go

Create Table DatosClientes(
	ID bigint identity(1, 1),
	Nombre varchar(50) not null,
	Apellido varchar(50) not null,
	Nacimiento date not null,
	Dni Int not null,
	Genero char null,
	Telefono int not null,
	Email varchar(50) not null,
	Domicilio varchar(200) not null,
	CodPostal smallint not null,
	IDPais smallint not null,
	Estado bit not null default(1)
)

go

Create Table Ventas(
	ID bigint identity(1, 1),
	IDCliente bigint not null,
	Fecha datetime not null default(getdate()),
	Total money not null default(0)
)

go

Create Table Calzados_x_Ventas(
	IDVenta bigint not null ,
	IDCalzado bigint not null,
	IDTalle smallint not null,
	IDColorBase smallint not null,
	IDColor smallint not null,
	Cantidad smallint not null
)

go

Alter Table Marcas
	Add Constraint PK_Marcas primary key(ID)

go

Alter Table Marcas
	Add Constraint UQ_Descripcion_Marcas unique(Descripcion)

go

Alter Table TiposCalzado
	Add Constraint PK_TiposCalzado primary key(ID)

go

Alter Table TiposCalzado
	Add Constraint UQ_Nombre_TiposCalzado unique(Nombre)

go

Alter Table Calzados
	Add Constraint PK_Calzados primary key(ID)

go

Alter Table Calzados
	Add Constraint CHK_Precio_Calzados check(Precio > 0)

go

Alter Table Calzados
	Add Constraint FK_IDMarca_Calzados foreign key(IDMarca) references Marcas(ID)

go

Alter Table Calzados
	Add Constraint FK_IDTipoCalzado_Calzados foreign key(IDTipoCalzado) references TiposCalzado(ID)

go

Alter Table Colores
	Add Constraint PK_Colores primary key(ID)

go

Alter Table Talles
	Add Constraint PK_Talles primary key(ID)

go

Alter Table Talles
	Add Constraint CHK_Numero_Talles check(Numero > 0)

go

Alter Table Talles
	Add Constraint UQ_Numero_Talles unique(Numero)

go

Alter Table Stock
	Add Constraint PK_Stock primary key(IDCalzado, IDTalle, IDColorBase, IDColor)

go

Alter Table Stock
	Add Constraint FK_IDCalzado_Stock foreign key(IDCalzado) references Calzados(ID)

go

Alter Table Stock
	Add Constraint FK_IDTalle_Stock foreign key(IDTalle) references Talles(ID)

go

Alter Table Stock
	Add Constraint FK_IDColorBase_Stock foreign key(IDColorBase) references Colores(ID)

go

Alter Table Stock	
	Add Constraint FK_IDColor_Stock foreign key(IDColor) references Colores(ID)

go

Alter Table Stock
	Add Constraint CHK_StockDisponible_Stock check(StockDisponible >= 0)

go

Alter Table Paises
	Add Constraint PK_Paises primary key(ID)

go

Alter Table Paises
	Add Constraint UQ_Nombre_Paises unique(Nombre)

go

Alter Table Usuarios
	Add Constraint PK_Usuarios primary key(ID)

go

Alter Table Usuarios
	Add Constraint UQ_NombreUsuario_Usuarios unique(NombreUsuario)


go


Alter Table Usuarios
	Add Constraint FK_IDPais_DatosUsuarios foreign key(IDPais) references Paises(ID)

go

Alter Table Usuarios 
	Add Constraint CHK_Nacimiento_DatosUsuarios check(Nacimiento < getdate())

go

Alter Table Usuarios
	Add Constraint UQ_Dni_DatosUsuarios unique(Dni)

go

Alter Table Usuarios
	Add Constraint CHK_Genero_DatosUsuarios check(upper(Genero) in ('F', 'M', 'O'))

go

Alter Table Usuarios
	Add Constraint UQ_Email_DatosUsuarios unique(Email)

go

Alter Table DatosClientes
	Add Constraint PK_DatosClientes primary key(ID)

go

Alter Table DatosClientes
	Add Constraint CHK_Nacimiento_DatosClientes check(Nacimiento < getdate())

go

Alter Table DatosClientes
	Add Constraint UQ_Dni_DatosClientes unique(Dni)

go

Alter Table DatosClientes
	Add Constraint CHK_Genero_DatosClientes check(upper(Genero) in ('F', 'M', 'O'))

go

Alter Table DatosClientes
	Add Constraint UQ_Email_DatosClientes unique(Email)

go

Alter Table DatosClientes
	Add Constraint FK_IDPais_DatosClientes foreign key(IDPais) references Paises(ID)

go

Alter Table Ventas
	Add Constraint PK_Ventas primary key(ID)

go

Alter Table Ventas
	Add Constraint FK_IDCliente_Ventas foreign key(IDCliente) references DatosClientes(ID)

go

Alter Table Ventas
	Add Constraint CHK_Total_Ventas check(Total > 0)

go

Alter Table Calzados_x_Ventas
	Add Constraint PK_Calzados_x_Ventas primary key(IDVenta, IDCalzado, IDTalle, IDColorbase, IDColor)

go

Alter Table Calzados_x_Ventas
	Add Constraint FK_IDVenta_Calzados_x_Ventas foreign key(IDVenta) references Ventas(ID)

go

Alter Table Calzados_x_Ventas
	Add Constraint FK_IDCalzado_Calzados_x_Ventas foreign key(IDCalzado, IDTalle, IDColorBase, IDColor) references Stock(IDCalzado, IDTalle, IDColorBase, IDColor)

go

Alter Table Calzados_x_Ventas
	Add Constraint CHK_Cantidad_Calzados_x_Ventas check(Cantidad > 0)
--Views
go

Create View VW_Stock as
Select C.ID as IDCalzado, C.Modelo as Modelo, T.ID as IDTalle, T.Numero as Talle, Co.ID as IDColor, Co.Color as Color, 
CB.ID as IDColorBase, CB.Color as ColorBase, S.StockDisponible as Cantidad From Stock as S
inner join Calzados as C ON C.ID = S.IDCalzado
inner join Talles as T ON T.ID = S.IDTalle
inner join Colores as Co ON Co.ID = S.IDColor 
inner join Colores as CB ON CB.ID = S.IDColorBase

go

Create view VW_Ventas as
Select V.ID as IDventa,V.IDCliente, DC.Apellido,DC.Dni  ,Cal.ID as IDCalzado, Cal.Modelo as Modelo, Cal.Precio as Precio,M.ID as IdMarca,M.Descripcion as Marca, TC.ID as IdTipo, TC.Nombre as Tipo, T.ID as IDTalle, T.Numero as Talle,
Co.ID as IDColor, Co.Color as Color, CB.ID as IDColorBase, CB.Color as ColorBase, CxV.Cantidad as Cantidad, V.Total as Total from Ventas as V
inner join DatosClientes as DC ON DC.ID = V.IDCliente
inner join Calzados_x_Ventas as CxV ON CxV.IDVenta = V.ID 
inner join Calzados as Cal ON Cal.ID = CxV.IDCalzado
inner join Talles as T ON T.ID = CxV.IDTalle
inner join Colores as Co ON Co.ID = CxV.IDColor
inner join Colores as CB ON CB.ID = CxV.IDColorBase
inner join Marcas as M ON M.ID = Cal.IDMarca
inner join TiposCalzado as TC ON TC.ID = Cal.IDTipoCalzado

create view VW_MasVendidos as
Select V.ID,C.ID as idCalzado, C.Modelo as Modelo,T.ID as IdTalle, T.Numero as Talle, CB.id as idColorBase ,CB.Color as ColorBase, 
Co.ID as IDColor, CO.Color as Color , Cxv.Cantidad as Cantidad 
from ventas as V
inner join Calzados_x_Ventas as CxV on CxV.IDVenta = V.ID
inner join Calzados as C ON C.ID = CxV.IDCalzado 
inner join Colores as CO ON CO.ID = CxV.IDColor
inner join Colores as CB ON CB.ID = CxV.IDColorBase
inner join Talles as T ON T.ID = CxV.IDTalle
group by V.ID,C.ID,C.Modelo,T.ID,T.Numero,CO.ID,CO.Color,CB.ID, CB.Color,CxV.Cantidad
order by cxv.Cantidad desc

drop View VW_MasVendidos
---SP
go
Create Procedure sp_IngresarCalzado( --(SP de Acción)
@Modelo varchar(150),
@Precio money,
@ImagenUrl varchar(200),
@IDMarca smallint,
@IDTipoCalzado smallint
)
As
Begin

Begin Try
if @Precio <= 0 or @Precio is null
Begin
Raiserror('El precio no puede ser menor o igual a cero, ni tampoco nulo', 16, 1)
End

if @IDMarca not in(Select ID From Marcas) or @IDMarca is null 
Begin
Raiserror('No se pudo cargar el calzado, el ID de Marca no existe en la base de datos', 16, 1)
End

if @IDTipoCalzado not in(Select ID From TiposCalzado) or @IDTipoCalzado is null
Begin
Raiserror('No se pudo cargar el calzado, el ID de Tipo no existe en la base de datos', 16, 1)
End

Insert into Calzados(Modelo, Precio, ImagenUrl, IDMarca, IDTipoCalzado)
Values(@Modelo, @Precio, isnull(@ImagenUrl, 'Imagen no disponible'), @IDMarca, @IDTipoCalzado)
End Try

Begin Catch
Print ERROR_MESSAGE()
End Catch
End

go



Create Procedure sp_ContarCalzados( --(SP Selección)
@IDCalzado bigint
)
As
Begin

Begin Try
if @IDCalzado not in(Select ID From Calzados) or @IDCalzado is null
Begin
Raiserror('El ID de calzado ingresado no se encuentra registrado en la base de datos.', 16, 1)
End

Select count(*) as 'Cantidad Vendidos' From Calzados_x_Ventas Where IDCalzado = @IDCalzado
End Try

Begin Catch
Print ERROR_MESSAGE()
End Catch
End

go
Create Procedure sp_ListarPorMarca( --(SP Selección)
@IDMarca smallint 
)
As
Begin

Begin Try
if @IDMarca not in(Select ID From Marcas) or @IDMarca is null
Begin
Raiserror('El ID de Marca ingresado no existe en la base de datos', 16, 1)
End

Select C.ID as IDCalzado,C.Modelo as Modelo, C.Precio as Precio, M.ID as IdMarca, M.Descripcion as Marca,
TC.ID as IdTipo, TC.Nombre as Tipo From Calzados as C 
inner join Marcas as M ON M.ID = C.IDMarca
inner join TiposCalzado as TC on TC.ID = C.IDTipoCalzado
Where C.IDMarca = @IDMarca

End Try

Begin Catch
Print ERROR_MESSAGE()
End Catch
End

go

Create Procedure sp_AltaLogicaCliente( --(SP de Acción)
@IDCliente bigint
)
As
Begin

Begin Try
If @IDCliente not in(Select ID From DatosClientes) or @IDCliente is null
Begin
Raiserror('El ID de cliente a dar de alta no existe en la base de datos.', 16, 1)
End

Update DatosClientes set Estado = 1 Where ID = @IDCliente
End Try

Begin Catch
Print ERROR_MESSAGE()
End Catch
End

go

Create Procedure sp_EliminarCalzados( --(SP de Acción)
@IDCalzado bigint
)
As
Begin

Begin Try
if @IDCalzado not in(Select ID From Calzados) or @IDCalzado is null
Begin
Raiserror('El ID de calzado a eliminar no se encuentra registrado en la base de datos.', 16, 1)
End

Delete From Calzados Where ID = @IDCalzado 
End Try

Begin Catch
Print ERROR_MESSAGE()
End Catch
End

go


Create Procedure sp_BajaLogicaCliente( --(SP de Acción)
@IDCliente bigint
)
As
Begin

Begin Try
If @IDCliente not in(Select ID From DatosClientes) or @IDCliente is null
Begin
Raiserror('El ID de cliente a dar de baja no se encuentra registrado en la base de datos.', 16, 1)
End

Update DatosClientes set Estado = 0 Where ID = @IDCliente
End Try

Begin Catch
Print ERROR_MESSAGE()
End Catch
End



go

Create Procedure sp_CalcularTotalPorVenta( --(SP de Acción)
	@IDVenta bigInt,
	@IDCalzado bigint,
	@IDTalle smallint,
	@IDColor smallint,
	@IDColorBase smallint,
	@Cantidad smallint
)
As
Begin

Begin Try
if @IDVenta not in(Select IDVenta From Calzados_x_Ventas) or @IDVenta is null
Begin
Raiserror('El ID de venta ingresado no existe en la base de datos', 16, 1)
End

if @IDCalzado not in(Select ID From Calzados) or @IDCalzado is null
Begin
Raiserror('El ID de calzado ingresado no existe en la base de datos', 16, 1)
End

if @IDTalle not in(Select ID From Talles) or @IDTalle is null
Begin
Raiserror('El ID de talle ingresado no existe en la base de datos', 16, 1)
End

if @IDColor not in(Select ID From Colores) or @IDColor is null
Begin
Raiserror('El ID de color ingresado no existe en la base de datos', 16, 1)
End

if @IDColorBase not in(Select ID From Colores) or @IDColorBase is null
Begin
Raiserror('El ID de color base ingresado no existe en la base de datos', 16, 1)
End

if @Cantidad < 1 or @Cantidad is null
Begin
Raiserror('La cantidad no puede ser menor a 1 ni nula', 16, 1)
End

if (Select StockDisponible From Stock where @IDCalzado = IDCalzado and @IDTalle = IDTalle and @IDColor = IDColor and @IDColorBase = IDColorBase) < @Cantidad
Begin
Raiserror('No hay stock disponible para ese modelo de calzado', 16, 1)
End

Update Ventas Set Total = Total + @Cantidad * Cal.Precio
From Ventas V, Calzados_x_Ventas CxV, Calzados Cal
Where V.ID = CxV.IDVenta and CxV.IDCalzado = Cal.ID

Update Stock Set StockDisponible = StockDisponible - @Cantidad
Where IDCalzado = @IDCalzado and IDTalle = @IDTalle and IDColorBase = @IDColorBase and IDColor = @IDColor
End Try

Begin Catch
Print ERROR_MESSAGE()
End Catch
End

go
---DATOS

USE GESTIONCALZADOS
GO
SET IDENTITY_INSERT [dbo].[Colores] ON 
GO
INSERT [dbo].[Colores] ([ID], [Color]) VALUES (1, N'Negro')
GO
INSERT [dbo].[Colores] ([ID], [Color]) VALUES (2, N'Blanco')
GO
INSERT [dbo].[Colores] ([ID], [Color]) VALUES (3, N'Azul')
GO
INSERT [dbo].[Colores] ([ID], [Color]) VALUES (4, N'Amarillo')
GO
INSERT [dbo].[Colores] ([ID], [Color]) VALUES (5, N'Verde')
GO
INSERT [dbo].[Colores] ([ID], [Color]) VALUES (6, N'Rojo')
GO
INSERT [dbo].[Colores] ([ID], [Color]) VALUES (7, N'Rosa')
GO
INSERT [dbo].[Colores] ([ID], [Color]) VALUES (8, N'Naranja')
GO
INSERT [dbo].[Colores] ([ID], [Color]) VALUES (9, N'Fluor')
GO
INSERT [dbo].[Colores] ([ID], [Color]) VALUES (10, N'Dorado')
GO
INSERT [dbo].[Colores] ([ID], [Color]) VALUES (11, N'Plateado')
GO
SET IDENTITY_INSERT [dbo].[Colores] OFF
GO
SET IDENTITY_INSERT [dbo].[Talles] ON 
GO
INSERT [dbo].[Talles] ([ID], [Numero]) VALUES (1, 35)
GO
INSERT [dbo].[Talles] ([ID], [Numero]) VALUES (2, 36)
GO
INSERT [dbo].[Talles] ([ID], [Numero]) VALUES (3, 37)
GO
INSERT [dbo].[Talles] ([ID], [Numero]) VALUES (4, 38)
GO
INSERT [dbo].[Talles] ([ID], [Numero]) VALUES (5, 39)
GO
INSERT [dbo].[Talles] ([ID], [Numero]) VALUES (6, 40)
GO
INSERT [dbo].[Talles] ([ID], [Numero]) VALUES (7, 41)
GO
INSERT [dbo].[Talles] ([ID], [Numero]) VALUES (8, 42)
GO
INSERT [dbo].[Talles] ([ID], [Numero]) VALUES (9, 43)
GO
INSERT [dbo].[Talles] ([ID], [Numero]) VALUES (10, 44)
GO
INSERT [dbo].[Talles] ([ID], [Numero]) VALUES (11, 45)
GO
INSERT [dbo].[Talles] ([ID], [Numero]) VALUES (12, 46)
GO
SET IDENTITY_INSERT [dbo].[Talles] OFF
GO
SET IDENTITY_INSERT [dbo].[Marcas] ON 
GO
INSERT [dbo].[Marcas] ([ID], [Descripcion]) VALUES (1, N'Adidas')
GO
INSERT [dbo].[Marcas] ([ID], [Descripcion]) VALUES (4, N'Jordan')
GO
INSERT [dbo].[Marcas] ([ID], [Descripcion]) VALUES (2, N'Nike')
GO
INSERT [dbo].[Marcas] ([ID], [Descripcion]) VALUES (3, N'Rebook')
GO
INSERT [dbo].[Marcas] ([ID], [Descripcion]) VALUES (5, N'Topper')
GO
SET IDENTITY_INSERT [dbo].[Marcas] OFF
GO
SET IDENTITY_INSERT [dbo].[Paises] ON 
GO
INSERT [dbo].[Paises] ([ID], [Nombre]) VALUES (1, N'Argentina')
GO
INSERT [dbo].[Paises] ([ID], [Nombre]) VALUES (4, N'Bolivia')
GO
INSERT [dbo].[Paises] ([ID], [Nombre]) VALUES (2, N'Chile')
GO
INSERT [dbo].[Paises] ([ID], [Nombre]) VALUES (3, N'Peru')
GO
SET IDENTITY_INSERT [dbo].[Paises] OFF
GO
SET IDENTITY_INSERT [dbo].[TiposCalzado] ON 
GO
INSERT [dbo].[TiposCalzado] ([ID], [Nombre]) VALUES (1, N'Deporte')
GO
INSERT [dbo].[TiposCalzado] ([ID], [Nombre]) VALUES (3, N'Niños')
GO
INSERT [dbo].[TiposCalzado] ([ID], [Nombre]) VALUES (2, N'Urban')
GO
SET IDENTITY_INSERT [dbo].[TiposCalzado] OFF
GO

--no se usa
Create Procedure sp_ClientesPorPais( --(SP de Selección)
@IDPais smallint
)
As
Begin

Begin Try
if @IDPais not in(Select ID From Paises) or @IDPais is null
Begin
Raiserror('El ID de país ingresado no se encuentra en la base de datos.', 16, 1) 
End

Select * From DatosClientes where IDPais = @IDPais
End Try

Begin Catch
Print ERROR_MESSAGE()
End Catch
End

go