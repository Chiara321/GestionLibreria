USE [Libreria]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 22/11/2023 18:14:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[ClienteID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Direccion] [varchar](100) NOT NULL,
	[CorreoElectronico] [varchar](50) NOT NULL,
 CONSTRAINT [PK__Clientes__71ABD0A75E3386E0] PRIMARY KEY CLUSTERED 
(
	[ClienteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleVentas]    Script Date: 22/11/2023 18:14:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleVentas](
	[DetalleVentaID] [int] IDENTITY(1,1) NOT NULL,
	[LibroISBN] [varchar](20) NOT NULL,
	[VentaID] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[PrecioUnitario] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK__DetalleV__340EED4456065572] PRIMARY KEY CLUSTERED 
(
	[DetalleVentaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Libros]    Script Date: 22/11/2023 18:14:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Libros](
	[ISBN] [varchar](20) NOT NULL,
	[Titulo] [varchar](100) NOT NULL,
	[Autor] [varchar](50) NOT NULL,
	[AnioPublicacion] [int] NOT NULL,
	[Genero] [varchar](30) NOT NULL,
	[CantidadStock] [int] NOT NULL,
	[Precio] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK__Libros__447D36EB98932F4D] PRIMARY KEY CLUSTERED 
(
	[ISBN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ventas]    Script Date: 22/11/2023 18:14:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ventas](
	[VentaID] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [date] NOT NULL,
	[Total] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK__Ventas__5B41514C30086DDD] PRIMARY KEY CLUSTERED 
(
	[VentaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Clientes] ON 
GO
INSERT [dbo].[Clientes] ([ClienteID], [Nombre], [Direccion], [CorreoElectronico]) VALUES (1, N'Juan Pérez', N'Calle Principal 123', N'juan@example.com')
GO
INSERT [dbo].[Clientes] ([ClienteID], [Nombre], [Direccion], [CorreoElectronico]) VALUES (2, N'Ana Gómez', N'Avenida Central 456', N'ana@example.com')
GO
INSERT [dbo].[Clientes] ([ClienteID], [Nombre], [Direccion], [CorreoElectronico]) VALUES (3, N'Carlos Rodríguez', N'Plaza Mayor 789', N'carlos@example.com')
GO
SET IDENTITY_INSERT [dbo].[Clientes] OFF
GO
SET IDENTITY_INSERT [dbo].[DetalleVentas] ON 
GO
INSERT [dbo].[DetalleVentas] ([DetalleVentaID], [LibroISBN], [VentaID], [Cantidad], [PrecioUnitario]) VALUES (2, N'978-0-306-40615-7', 1, 2, CAST(2500.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[DetalleVentas] ([DetalleVentaID], [LibroISBN], [VentaID], [Cantidad], [PrecioUnitario]) VALUES (3, N'978-84-376-0494-7', 2, 1, CAST(3000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[DetalleVentas] ([DetalleVentaID], [LibroISBN], [VentaID], [Cantidad], [PrecioUnitario]) VALUES (4, N'978-0-525-42965-5', 3, 1, CAST(3500.00 AS Decimal(10, 2)))
GO
SET IDENTITY_INSERT [dbo].[DetalleVentas] OFF
GO
INSERT [dbo].[Libros] ([ISBN], [Titulo], [Autor], [AnioPublicacion], [Genero], [CantidadStock], [Precio]) VALUES (N'978-0-306-40615-7', N'Inteligencia Artificial: Un Enfoque Moderno', N'Stuart Russell, Peter Norvig', 2009, N'Informática', 50, CAST(2500.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Libros] ([ISBN], [Titulo], [Autor], [AnioPublicacion], [Genero], [CantidadStock], [Precio]) VALUES (N'978-0-525-42965-5', N'1984', N'George Orwell', 1949, N'Ciencia ficción', 25, CAST(3500.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Libros] ([ISBN], [Titulo], [Autor], [AnioPublicacion], [Genero], [CantidadStock], [Precio]) VALUES (N'978-84-376-0494-7', N'Cien años de soledad', N'Gabriel García Márquez', 1967, N'Ficción', 30, CAST(3000.00 AS Decimal(10, 2)))
GO
SET IDENTITY_INSERT [dbo].[Ventas] ON 
GO
INSERT [dbo].[Ventas] ([VentaID], [Fecha], [Total]) VALUES (1, CAST(N'2023-01-15' AS Date), CAST(5000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Ventas] ([VentaID], [Fecha], [Total]) VALUES (2, CAST(N'2023-02-20' AS Date), CAST(3000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Ventas] ([VentaID], [Fecha], [Total]) VALUES (3, CAST(N'2023-03-25' AS Date), CAST(3500.00 AS Decimal(10, 2)))
GO
SET IDENTITY_INSERT [dbo].[Ventas] OFF
GO
ALTER TABLE [dbo].[DetalleVentas]  WITH CHECK ADD  CONSTRAINT [FK__DetalleVe__Libro__403A8C7D] FOREIGN KEY([LibroISBN])
REFERENCES [dbo].[Libros] ([ISBN])
GO
ALTER TABLE [dbo].[DetalleVentas] CHECK CONSTRAINT [FK__DetalleVe__Libro__403A8C7D]
GO
ALTER TABLE [dbo].[DetalleVentas]  WITH CHECK ADD  CONSTRAINT [FK__DetalleVe__Venta__412EB0B6] FOREIGN KEY([VentaID])
REFERENCES [dbo].[Ventas] ([VentaID])
GO
ALTER TABLE [dbo].[DetalleVentas] CHECK CONSTRAINT [FK__DetalleVe__Venta__412EB0B6]
GO
USE [master]
GO
ALTER DATABASE [Libreria] SET  READ_WRITE 
GO
