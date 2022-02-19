Use master

go
If not exists (Select * from sys.databases where name = 'GestionCalzados')
Begin

Create Database GestionCalzados

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
Alter Table Marcas
	Add Constraint PK_Marcas primary key(ID)

go
Alter Table Marcas
	Add Constraint UQ_Descripcion_Marcas unique(Descripcion)
go

Create Table TiposCalzado(
	ID smallint primary key identity(1, 1),
	Nombre varchar(50) not null unique
)

go

Create Table Colores(
	ID smallint identity(1, 1),
	Color varchar(100) not null
)

go
Alter Table Colores
	Add Constraint PK_Colores primary key(ID)

go
Alter Table Colores
	Add Constraint UQ_Colores unique(Color)

go

Create Table Talles(
	ID smallint identity(1, 1),
	Numero tinyint not null
)

go
Alter Table Talles
	Add Constraint PK_Talles primary key(ID)

go
Alter Table Talles
	Add Constraint CHK_Numero_Talles check(Numero > 0)
go
Alter Table Talles
	Add Constraint UQ_Numero_Talles unique(Numero)

Create Table Paises(
	ID smallint identity(1, 1),
	Nombre varchar(50) not null
)

go
Alter Table Paises
	Add Constraint PK_Paises primary key(ID)

go
Alter Table Paises
	Add Constraint UQ_Nombre_Paises unique(Nombre)

go

Create Table Usuarios(
	ID bigint primary key,
	NombreUsuario varchar(50) not null unique,
	Contraseña varchar(100) not null,
)
go

Create Table DatosUsuarios(
	IDUsuario bigint primary key identity(1,1) ,
	Nombre varchar(50) not null,
	Apellido varchar(50) not null,
	Nacimiento date not null check(Nacimiento < getdate()),
	Dni varchar(50) not null unique,
	Genero char null check(upper(Genero) in('F','M','O')),
	Telefono varchar(20) not null,
	Email varchar(50) not null unique,
	Domicilio varchar(200) not null,
	CodPostal smallint not null,
	IDPais smallint not null foreign key references Paises(ID)
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

Create Table Stock(
	IDCalzado bigint not null,
	IDTalle smallint not null,
	IDColor smallint not null,
	IDColorBase smallint not null,
	StockDisponible int not null

	Constraint PK_Stock primary key(IDCalzado, IDTalle, IDColor,IDColorbase)
)
go
Alter Table Stock
	Add Constraint FK_IDCalzado_Stock foreign key(IDCalzado) references Calzados(ID)

go
Alter Table Stock
	Add Constraint FK_IDTalle_Stock foreign key(IDTalle) references Talles(ID)

go
Alter Table Stock	
	Add Constraint FK_IDColor_Stock foreign key(IDColor) references Colores(ID)

go
Alter Table Stock	
	Add Constraint FK_IDColorBase_Stock foreign key(IDColorBase) references Colores(ID)

go
Alter Table Stock
	Add Constraint CHK_StockDisponible_Stock check(StockDisponible >= 0)

go

Create Table DatosClientes(
	ID bigint identity(1, 1),
	Nombre varchar(50) not null,
	Apellido varchar(50) not null,
	Nacimiento date not null check(Nacimiento < getdate()),
	Dni varchar (50) not null unique,
	Genero char null check(upper(Genero) in('F','M','O')),
	Telefono varchar(20) not null,
	Email varchar(50) not null unique,
	Domicilio varchar(200) not null,
	CodPostal smallint not null,
	Estado bit not null default(1),
	IDPais smallint not null foreign key references Paises(ID),
	Constraint PK_Clientes primary key(ID)

)
go
Create Table Ventas(
	ID bigint not null,
	IDCliente bigint not null foreign key references DatosClientes(ID),
	Fecha datetime not null default(getdate()),
	Total money not null check(Total > 0)
)
go
Create Table Calzados_x_Ventas(
	IDVenta bigint not null identity(1,1),
	IDCalzado bigint not null,
	IDTalle smallint not null,
	IDColor smallint not null,
	IDColorBase smallint not null,
	Cantidad smallint not null,
	PrecioUnitario money not null

	Constraint PK_Calzados_x_Ventas primary key(IDVenta, IDCalzado, IDTalle, IDColor, IDColorBase),
	Constraint FK_Calzados_x_Ventas foreign key(IDCalzado, IDTalle, IDColor,IDColorBase) references Stock(IDCalzado, IDTalle, IDColor,IDColorBase),
	Constraint CHK_Cantidad_Calzados_x_Ventas check(Cantidad > 0)
)
GO

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





