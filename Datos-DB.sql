USE [GestionCalzados]
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
