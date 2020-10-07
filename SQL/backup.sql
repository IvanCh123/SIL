USE [BD_Calidad]
GO
/****** Object:  Table [dbo].[Art_Topico]    Script Date: 30/6/2020 19:33:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Art_Topico](
	[topicoIdFK] [int] NOT NULL,
	[artIdFK] [int] NOT NULL,
 CONSTRAINT [PK_ArticuloTopico] PRIMARY KEY CLUSTERED 
(
	[topicoIdFK] ASC,
	[artIdFK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Articulo]    Script Date: 30/6/2020 19:33:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Articulo](
	[artIdPK] [int] IDENTITY(1,1) NOT NULL,
	[titulo] [varchar](450) NULL,
	[resumen] [varchar](max) NULL,
	[contenido] [varbinary](max) NOT NULL,
	[puntuacionInicial] [int] NULL,
	[visitas] [int] NULL,
	[estado] [varchar](20) NULL,
	[tipoArt] [varchar](10) NOT NULL,
	[nombreArchivo] [varchar](50) NULL,
	[fecha] [date] NULL,
	[noMeGusta] [int] NULL,
	[meGusta] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[artIdPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Miembro]    Script Date: 30/6/2020 19:33:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Miembro](
	[nombreUsuarioPK] [varchar](50) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellido] [varchar](50) NULL,
	[pesoMiembro] [int] NULL,
	[telefono] [varchar](20) NULL,
	[informacionBiografica] [varchar](max) NULL,
	[pais] [varchar](50) NULL,
	[habilidades] [varchar](max) NULL,
	[idiomas] [varchar](max) NULL,
	[hobbies] [varchar](max) NULL,
	[informacionLaboral] [varchar](max) NULL,
	[correo] [varchar](50) NULL,
	[merito] [float] NULL,
	[tipo] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[nombreUsuarioPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Miembro_Articulo]    Script Date: 30/6/2020 19:33:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Miembro_Articulo](
	[nombreUsuarioFK] [varchar](50) NOT NULL,
	[artIdFK] [int] NOT NULL,
 CONSTRAINT [PK_ArticuloMiembro] PRIMARY KEY CLUSTERED 
(
	[nombreUsuarioFK] ASC,
	[artIdFK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nucleo_Revisa_Articulo]    Script Date: 30/6/2020 19:33:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nucleo_Revisa_Articulo](
	[nombreUsuarioFK] [varchar](50) NOT NULL,
	[artIdFK] [int] NOT NULL,
	[estadoRevision] [varchar](20) NULL,
	[puntuacion] [float] NULL,
	[comentarios] [varchar](max) NULL,
	[opinion] [int] NULL,
	[contribucion] [int] NULL,
	[forma] [int] NULL,
 CONSTRAINT [PK_Nucleo_Revisa_Articulo] PRIMARY KEY CLUSTERED 
(
	[nombreUsuarioFK] ASC,
	[artIdFK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nucleo_Solicita_Articulo]    Script Date: 30/6/2020 19:33:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nucleo_Solicita_Articulo](
	[nombreUsuarioFK] [varchar](50) NOT NULL,
	[artIdFK] [int] NOT NULL,
	[estadoSolicitud] [varchar](20) NULL,
 CONSTRAINT [PK_Nucleo_Solicita_Articulo] PRIMARY KEY CLUSTERED 
(
	[nombreUsuarioFK] ASC,
	[artIdFK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pregunta_Frecuente]    Script Date: 30/6/2020 19:33:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pregunta_Frecuente](
	[pregIdPK] [int] IDENTITY(1,1) NOT NULL,
	[nombreUsuarioFK] [varchar](50) NULL,
	[pregunta] [varchar](max) NOT NULL,
	[respuesta] [varchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[pregIdPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Topico]    Script Date: 30/6/2020 19:33:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Topico](
	[topicoIdPK] [int] IDENTITY(1,1) NOT NULL,
	[categoria] [varchar](150) NOT NULL,
	[nombre] [varchar](150) NULL
) ON [PRIMARY]
GO
INSERT [dbo].[Art_Topico] ([topicoIdFK], [artIdFK]) VALUES (1, 7)
INSERT [dbo].[Art_Topico] ([topicoIdFK], [artIdFK]) VALUES (1, 9)
INSERT [dbo].[Art_Topico] ([topicoIdFK], [artIdFK]) VALUES (1, 10)
INSERT [dbo].[Art_Topico] ([topicoIdFK], [artIdFK]) VALUES (1, 11)
INSERT [dbo].[Art_Topico] ([topicoIdFK], [artIdFK]) VALUES (1, 12)
INSERT [dbo].[Art_Topico] ([topicoIdFK], [artIdFK]) VALUES (2, 3)
INSERT [dbo].[Art_Topico] ([topicoIdFK], [artIdFK]) VALUES (2, 6)
INSERT [dbo].[Art_Topico] ([topicoIdFK], [artIdFK]) VALUES (2, 17)
INSERT [dbo].[Art_Topico] ([topicoIdFK], [artIdFK]) VALUES (2, 18)
INSERT [dbo].[Art_Topico] ([topicoIdFK], [artIdFK]) VALUES (3, 1)
INSERT [dbo].[Art_Topico] ([topicoIdFK], [artIdFK]) VALUES (3, 2)
INSERT [dbo].[Art_Topico] ([topicoIdFK], [artIdFK]) VALUES (4, 4)
INSERT [dbo].[Art_Topico] ([topicoIdFK], [artIdFK]) VALUES (4, 5)
INSERT [dbo].[Art_Topico] ([topicoIdFK], [artIdFK]) VALUES (4, 8)
INSERT [dbo].[Art_Topico] ([topicoIdFK], [artIdFK]) VALUES (5, 13)
INSERT [dbo].[Art_Topico] ([topicoIdFK], [artIdFK]) VALUES (6, 14)
INSERT [dbo].[Art_Topico] ([topicoIdFK], [artIdFK]) VALUES (6, 15)
INSERT [dbo].[Art_Topico] ([topicoIdFK], [artIdFK]) VALUES (6, 16)
SET IDENTITY_INSERT [dbo].[Articulo] ON 

INSERT [dbo].[Articulo] ([artIdPK], [titulo], [resumen], [contenido], [puntuacionInicial], [visitas], [estado], [tipoArt], [nombreArchivo], [fecha], [noMeGusta], [meGusta]) VALUES (1, N'La travesía', N'El artículo de la travesia', 0x456C20636F6E74656E69646F206465206C61207472617665736961, 5, 2, N'cambios', N'corto', NULL, CAST(N'2020-06-18' AS Date), 2, 123)
INSERT [dbo].[Articulo] ([artIdPK], [titulo], [resumen], [contenido], [puntuacionInicial], [visitas], [estado], [tipoArt], [nombreArchivo], [fecha], [noMeGusta], [meGusta]) VALUES (2, N'Harry Potter', N'El artículo de la harry potter', 0x456C20636F6E74656E69646F20646520686172727920706F74746572, 5, 2, N'revision', N'corto', NULL, CAST(N'2020-06-18' AS Date), 5, 13)
INSERT [dbo].[Articulo] ([artIdPK], [titulo], [resumen], [contenido], [puntuacionInicial], [visitas], [estado], [tipoArt], [nombreArchivo], [fecha], [noMeGusta], [meGusta]) VALUES (3, N'La liga campeón', N'La liga campeón 2020', 0x4C61206C6967612063616D7065F36E2032303230, 5, 8, N'cambios', N'corto', NULL, CAST(N'2020-06-24' AS Date), 8, 12)
INSERT [dbo].[Articulo] ([artIdPK], [titulo], [resumen], [contenido], [puntuacionInicial], [visitas], [estado], [tipoArt], [nombreArchivo], [fecha], [noMeGusta], [meGusta]) VALUES (4, N'El inspirador video de Soli', N'Me inspiro demasiado', 0x4D6F746976616E7465, 5, 5, N'cambios', N'corto', NULL, CAST(N'2020-06-24' AS Date), 1, 40000)
INSERT [dbo].[Articulo] ([artIdPK], [titulo], [resumen], [contenido], [puntuacionInicial], [visitas], [estado], [tipoArt], [nombreArchivo], [fecha], [noMeGusta], [meGusta]) VALUES (5, N'El final de semestre', N'Que miedo', 0x517565206D6965646F20636F6E20746F646F, 5, 5, N'revision', N'corto', NULL, CAST(N'2020-06-24' AS Date), 8, 15)
INSERT [dbo].[Articulo] ([artIdPK], [titulo], [resumen], [contenido], [puntuacionInicial], [visitas], [estado], [tipoArt], [nombreArchivo], [fecha], [noMeGusta], [meGusta]) VALUES (6, N'Viva la Sele', N'La liga campeón 2020', 0x4C61206C6967612063616D7065F36E2032303230, 5, 15, N'aceptado', N'corto', NULL, CAST(N'2020-06-24' AS Date), 10, 55)
INSERT [dbo].[Articulo] ([artIdPK], [titulo], [resumen], [contenido], [puntuacionInicial], [visitas], [estado], [tipoArt], [nombreArchivo], [fecha], [noMeGusta], [meGusta]) VALUES (7, N'Principios de informatica', N'La liga campeón 2020', 0x4C61206C6967612063616D7065F36E2032303230, 0, 20, N'rechazado', N'corto', NULL, CAST(N'2020-06-24' AS Date), 56, 91)
INSERT [dbo].[Articulo] ([artIdPK], [titulo], [resumen], [contenido], [puntuacionInicial], [visitas], [estado], [tipoArt], [nombreArchivo], [fecha], [noMeGusta], [meGusta]) VALUES (8, N'La nueva generacion', N'La liga campeón 2020', 0x4C61206C6967612063616D7065F36E2032303230, 5, 20, N'revision', N'corto', NULL, CAST(N'2020-06-24' AS Date), 63, 78)
INSERT [dbo].[Articulo] ([artIdPK], [titulo], [resumen], [contenido], [puntuacionInicial], [visitas], [estado], [tipoArt], [nombreArchivo], [fecha], [noMeGusta], [meGusta]) VALUES (9, N'Codigo autogenerado', N'La liga campeón 2020', 0x4C61206C6967612063616D7065F36E2032303230, 5, 5, N'cambios', N'corto', NULL, CAST(N'2020-06-24' AS Date), 6, 789)
INSERT [dbo].[Articulo] ([artIdPK], [titulo], [resumen], [contenido], [puntuacionInicial], [visitas], [estado], [tipoArt], [nombreArchivo], [fecha], [noMeGusta], [meGusta]) VALUES (10, N'Los scripts: un recurso infravalorado', N'La liga campeón 2020', 0x4C61206C6967612063616D7065F36E2032303230, 5, 5, N'pendiente', N'corto', NULL, CAST(N'2020-06-24' AS Date), 33, 7)
INSERT [dbo].[Articulo] ([artIdPK], [titulo], [resumen], [contenido], [puntuacionInicial], [visitas], [estado], [tipoArt], [nombreArchivo], [fecha], [noMeGusta], [meGusta]) VALUES (11, N'Los 7 consejos para ser un buen programador', N'La liga campeón 2020', 0x4C61206C6967612063616D7065F36E2032303230, 5, 17, N'pendiente', N'corto', NULL, CAST(N'2020-06-24' AS Date), 120, 14)
INSERT [dbo].[Articulo] ([artIdPK], [titulo], [resumen], [contenido], [puntuacionInicial], [visitas], [estado], [tipoArt], [nombreArchivo], [fecha], [noMeGusta], [meGusta]) VALUES (12, N'Control de concurrencia', N'La liga campeón 2020', 0x4C61206C6967612063616D7065F36E2032303230, 5, 5, N'pendiente', N'corto', NULL, CAST(N'2020-06-24' AS Date), 10, 89)
INSERT [dbo].[Articulo] ([artIdPK], [titulo], [resumen], [contenido], [puntuacionInicial], [visitas], [estado], [tipoArt], [nombreArchivo], [fecha], [noMeGusta], [meGusta]) VALUES (13, N'Covid 2019', N'Que pereza', 0x5961206E6F2071756965726F20657374617220656E206C612063617361, 5, 2, N'pendiente', N'corto', NULL, CAST(N'2020-06-24' AS Date), 56, 125)
INSERT [dbo].[Articulo] ([artIdPK], [titulo], [resumen], [contenido], [puntuacionInicial], [visitas], [estado], [tipoArt], [nombreArchivo], [fecha], [noMeGusta], [meGusta]) VALUES (14, N'Anova 2way', N'Que lindo', 0x5961206E6F2071756965726F20657374617220656E206C612063617361, 0, 50, N'revision', N'corto', NULL, CAST(N'2020-06-30' AS Date), 3, 7)
INSERT [dbo].[Articulo] ([artIdPK], [titulo], [resumen], [contenido], [puntuacionInicial], [visitas], [estado], [tipoArt], [nombreArchivo], [fecha], [noMeGusta], [meGusta]) VALUES (15, N'Regresión Lineal', N'Que lindo', 0x5961206E6F2071756965726F20657374617220656E206C612063617361, 0, 26, N'pendiente', N'corto', NULL, CAST(N'2020-06-30' AS Date), 45, 3)
INSERT [dbo].[Articulo] ([artIdPK], [titulo], [resumen], [contenido], [puntuacionInicial], [visitas], [estado], [tipoArt], [nombreArchivo], [fecha], [noMeGusta], [meGusta]) VALUES (16, N'Regresión Múltiple', N'No entiendo', 0x5961206E6F2071756965726F20657374617220656E206C612063617361, 0, 21, N'pendiente', N'corto', NULL, CAST(N'2020-06-30' AS Date), 50, 175)
INSERT [dbo].[Articulo] ([artIdPK], [titulo], [resumen], [contenido], [puntuacionInicial], [visitas], [estado], [tipoArt], [nombreArchivo], [fecha], [noMeGusta], [meGusta]) VALUES (17, N'El tenis', N'El deporte blanco', 0x5961206E6F2071756965726F20657374617220656E206C612063617361, 0, 31, N'rechazado', N'corto', NULL, CAST(N'2020-06-30' AS Date), 2, 10)
INSERT [dbo].[Articulo] ([artIdPK], [titulo], [resumen], [contenido], [puntuacionInicial], [visitas], [estado], [tipoArt], [nombreArchivo], [fecha], [noMeGusta], [meGusta]) VALUES (18, N'El mejor boxeador del mundo', N'Muhammad Ali', 0x5961206E6F2071756965726F20657374617220656E206C612063617361, 0, 38, N'revision', N'corto', NULL, CAST(N'2020-06-30' AS Date), 6, 50)
SET IDENTITY_INSERT [dbo].[Articulo] OFF
INSERT [dbo].[Miembro] ([nombreUsuarioPK], [nombre], [apellido], [pesoMiembro], [telefono], [informacionBiografica], [pais], [habilidades], [idiomas], [hobbies], [informacionLaboral], [correo], [merito], [tipo]) VALUES (N'buendia', N'Edgar', N'Silva', 0, N'12345678', N'Vivo en un pais frio', N'Alaska', N'otro, ajedrez, matematicas', N'Mandarin', N'leer, escribir', N'telenoticias', N'edgar@silva.com', 0, N'periferico')
INSERT [dbo].[Miembro] ([nombreUsuarioPK], [nombre], [apellido], [pesoMiembro], [telefono], [informacionBiografica], [pais], [habilidades], [idiomas], [hobbies], [informacionLaboral], [correo], [merito], [tipo]) VALUES (N'Coordinador', N'Peter', N'Parker', 5, N'89562310', N'Tengo varias identidades', N'Costa Rica', N'deporte, cocina, otro', N'Español, Inglés', N'leer', N'No breteo', N'comunidadshieldship@gmail.com', 55, N'coordinador')
INSERT [dbo].[Miembro] ([nombreUsuarioPK], [nombre], [apellido], [pesoMiembro], [telefono], [informacionBiografica], [pais], [habilidades], [idiomas], [hobbies], [informacionLaboral], [correo], [merito], [tipo]) VALUES (N'Dasc12', N'David', N'Solorzano', 5, N'84773444', N'Soy de Heredia', N'Costa Rica', N'deporte, cocina, ajedrez, matematicas, otro', N'Español, Ingles', N'ejercicio, videojuegos, leer', N'Tengo experiencia en servicio al cliente', N'elpelucon@sabe.com', 55, N'nucleo')
INSERT [dbo].[Miembro] ([nombreUsuarioPK], [nombre], [apellido], [pesoMiembro], [telefono], [informacionBiografica], [pais], [habilidades], [idiomas], [hobbies], [informacionLaboral], [correo], [merito], [tipo]) VALUES (N'dlwlrma', N'Lee ', N'Ji-eun', 3, N'88996677', N'Soy ermitano en Corea a los 30', N'Corea', N'matematicas, otro', N'Coreano', N'videojuegos, escribir', N'desempleado', N'iu@korea.com', 0, N'periferico')
INSERT [dbo].[Miembro] ([nombreUsuarioPK], [nombre], [apellido], [pesoMiembro], [telefono], [informacionBiografica], [pais], [habilidades], [idiomas], [hobbies], [informacionLaboral], [correo], [merito], [tipo]) VALUES (N'ElChunche', N'Chunche', N'Montero', 3, N'506778237', N'Exseleccionado naciona de Costa Rica', N'China', N'deporte, cocina', N'Mandarin', N'ejercicio, escribir', N'Asistente tecnico de San Carlos', N'chunche@miedo.com', 0, N'nucleo')
INSERT [dbo].[Miembro] ([nombreUsuarioPK], [nombre], [apellido], [pesoMiembro], [telefono], [informacionBiografica], [pais], [habilidades], [idiomas], [hobbies], [informacionLaboral], [correo], [merito], [tipo]) VALUES (N'Gerald1804', N'Gerald', N'Bermudez', 0, N'454343283', N'Soy tico', N'Costa Rica', N'cocina, matematicas', N'Español, Ingles', N'ejercicio, videojuegos', N'No trabajo
', N'gbr1804@gmail.com', 0, N'periferico')
INSERT [dbo].[Miembro] ([nombreUsuarioPK], [nombre], [apellido], [pesoMiembro], [telefono], [informacionBiografica], [pais], [habilidades], [idiomas], [hobbies], [informacionLaboral], [correo], [merito], [tipo]) VALUES (N'IvanCh123', N'Ivan ', N'Chavarria', 5, N'88478237', N'San Carlos, Alajuela', N'Canada', N'otro', N'Frances', N'videojuegos, otro', N'No trabajo, me mantienen', N'ivanucr2017@gmail.com', 0, N'nucleo')
INSERT [dbo].[Miembro] ([nombreUsuarioPK], [nombre], [apellido], [pesoMiembro], [telefono], [informacionBiografica], [pais], [habilidades], [idiomas], [hobbies], [informacionLaboral], [correo], [merito], [tipo]) VALUES (N'JgViquez', N'Ignacio', N'Viquez', 5, N'432432343', N'Herediano', N'Costa Rica', N'otro', N'Español', N'otro', N'Nada', N'jgViquezR@meme.com', 0, N'periferico')
INSERT [dbo].[Miembro] ([nombreUsuarioPK], [nombre], [apellido], [pesoMiembro], [telefono], [informacionBiografica], [pais], [habilidades], [idiomas], [hobbies], [informacionLaboral], [correo], [merito], [tipo]) VALUES (N'otarola506', N'Sebastián', N'Otárola', 5, N'12345896', N'Estudio Computación', N'Costa Rica', N'cocina, deporte', N'Español, Inglés', N'otro', N'No breteo', N'otarolasebas506@gmail.com', 55, N'nucleo')
INSERT [dbo].[Miembro] ([nombreUsuarioPK], [nombre], [apellido], [pesoMiembro], [telefono], [informacionBiografica], [pais], [habilidades], [idiomas], [hobbies], [informacionLaboral], [correo], [merito], [tipo]) VALUES (N'pepitin', N'Pepito ', N'Grillo', 5, N'9238842332', N'naci en Alemania pero mis papas son de suecia', N'España', N'matematicas, ajedrez, deporte', N'Italiano', N'leer, ejercicio, videojuegos, escribir, otro', N'Trabajo como profesor de lengua en Barcelona', N'pepitin@miedo.com', 0, N'nucleo')
INSERT [dbo].[Miembro] ([nombreUsuarioPK], [nombre], [apellido], [pesoMiembro], [telefono], [informacionBiografica], [pais], [habilidades], [idiomas], [hobbies], [informacionLaboral], [correo], [merito], [tipo]) VALUES (N'RobRodRob', N'Roberto', N'Jimenez', 0, N'656546876', N'Tengo 33 ', N'Taiwan', N'cocina, otro', N'Mandarin', N'ejercicio, otro', N'Trabajo en Google', N'heroe@meme.com', 0, N'periferico')
INSERT [dbo].[Miembro] ([nombreUsuarioPK], [nombre], [apellido], [pesoMiembro], [telefono], [informacionBiografica], [pais], [habilidades], [idiomas], [hobbies], [informacionLaboral], [correo], [merito], [tipo]) VALUES (N'skuukzky', N'Su-ji', N'Bae', 3, N'823439323', N'No vivo en Taiwan, soy de Corea, no confundan', N'Taiwan', N'cocina, matematicas, ajedrez, deporte, otro', N'Taiwanes', N'leer', N'Soy de actriz de doblaje de anime', N'suzy@mail.com', 0, N'periferico')
INSERT [dbo].[Miembro_Articulo] ([nombreUsuarioFK], [artIdFK]) VALUES (N'buendia', 4)
INSERT [dbo].[Miembro_Articulo] ([nombreUsuarioFK], [artIdFK]) VALUES (N'buendia', 6)
INSERT [dbo].[Miembro_Articulo] ([nombreUsuarioFK], [artIdFK]) VALUES (N'buendia', 12)
INSERT [dbo].[Miembro_Articulo] ([nombreUsuarioFK], [artIdFK]) VALUES (N'buendia', 14)
INSERT [dbo].[Miembro_Articulo] ([nombreUsuarioFK], [artIdFK]) VALUES (N'buendia', 17)
INSERT [dbo].[Miembro_Articulo] ([nombreUsuarioFK], [artIdFK]) VALUES (N'Coordinador', 4)
INSERT [dbo].[Miembro_Articulo] ([nombreUsuarioFK], [artIdFK]) VALUES (N'Coordinador', 7)
INSERT [dbo].[Miembro_Articulo] ([nombreUsuarioFK], [artIdFK]) VALUES (N'Coordinador', 13)
INSERT [dbo].[Miembro_Articulo] ([nombreUsuarioFK], [artIdFK]) VALUES (N'Dasc12', 1)
INSERT [dbo].[Miembro_Articulo] ([nombreUsuarioFK], [artIdFK]) VALUES (N'Dasc12', 3)
INSERT [dbo].[Miembro_Articulo] ([nombreUsuarioFK], [artIdFK]) VALUES (N'Dasc12', 4)
INSERT [dbo].[Miembro_Articulo] ([nombreUsuarioFK], [artIdFK]) VALUES (N'Dasc12', 5)
INSERT [dbo].[Miembro_Articulo] ([nombreUsuarioFK], [artIdFK]) VALUES (N'Dasc12', 10)
INSERT [dbo].[Miembro_Articulo] ([nombreUsuarioFK], [artIdFK]) VALUES (N'Dasc12', 11)
INSERT [dbo].[Miembro_Articulo] ([nombreUsuarioFK], [artIdFK]) VALUES (N'ElChunche', 3)
INSERT [dbo].[Miembro_Articulo] ([nombreUsuarioFK], [artIdFK]) VALUES (N'ElChunche', 4)
INSERT [dbo].[Miembro_Articulo] ([nombreUsuarioFK], [artIdFK]) VALUES (N'ElChunche', 6)
INSERT [dbo].[Miembro_Articulo] ([nombreUsuarioFK], [artIdFK]) VALUES (N'ElChunche', 10)
INSERT [dbo].[Miembro_Articulo] ([nombreUsuarioFK], [artIdFK]) VALUES (N'ElChunche', 12)
INSERT [dbo].[Miembro_Articulo] ([nombreUsuarioFK], [artIdFK]) VALUES (N'IvanCh123', 3)
INSERT [dbo].[Miembro_Articulo] ([nombreUsuarioFK], [artIdFK]) VALUES (N'IvanCh123', 4)
INSERT [dbo].[Miembro_Articulo] ([nombreUsuarioFK], [artIdFK]) VALUES (N'IvanCh123', 5)
INSERT [dbo].[Miembro_Articulo] ([nombreUsuarioFK], [artIdFK]) VALUES (N'IvanCh123', 8)
INSERT [dbo].[Miembro_Articulo] ([nombreUsuarioFK], [artIdFK]) VALUES (N'IvanCh123', 11)
INSERT [dbo].[Miembro_Articulo] ([nombreUsuarioFK], [artIdFK]) VALUES (N'IvanCh123', 13)
INSERT [dbo].[Miembro_Articulo] ([nombreUsuarioFK], [artIdFK]) VALUES (N'otarola506', 1)
INSERT [dbo].[Miembro_Articulo] ([nombreUsuarioFK], [artIdFK]) VALUES (N'otarola506', 2)
INSERT [dbo].[Miembro_Articulo] ([nombreUsuarioFK], [artIdFK]) VALUES (N'otarola506', 3)
INSERT [dbo].[Miembro_Articulo] ([nombreUsuarioFK], [artIdFK]) VALUES (N'otarola506', 4)
INSERT [dbo].[Miembro_Articulo] ([nombreUsuarioFK], [artIdFK]) VALUES (N'otarola506', 5)
INSERT [dbo].[Miembro_Articulo] ([nombreUsuarioFK], [artIdFK]) VALUES (N'otarola506', 9)
INSERT [dbo].[Miembro_Articulo] ([nombreUsuarioFK], [artIdFK]) VALUES (N'otarola506', 11)
INSERT [dbo].[Miembro_Articulo] ([nombreUsuarioFK], [artIdFK]) VALUES (N'otarola506', 15)
INSERT [dbo].[Miembro_Articulo] ([nombreUsuarioFK], [artIdFK]) VALUES (N'otarola506', 16)
INSERT [dbo].[Miembro_Articulo] ([nombreUsuarioFK], [artIdFK]) VALUES (N'otarola506', 17)
INSERT [dbo].[Miembro_Articulo] ([nombreUsuarioFK], [artIdFK]) VALUES (N'otarola506', 18)
INSERT [dbo].[Miembro_Articulo] ([nombreUsuarioFK], [artIdFK]) VALUES (N'pepitin', 4)
INSERT [dbo].[Miembro_Articulo] ([nombreUsuarioFK], [artIdFK]) VALUES (N'pepitin', 9)
INSERT [dbo].[Miembro_Articulo] ([nombreUsuarioFK], [artIdFK]) VALUES (N'pepitin', 16)
INSERT [dbo].[Nucleo_Revisa_Articulo] ([nombreUsuarioFK], [artIdFK], [estadoRevision], [puntuacion], [comentarios], [opinion], [contribucion], [forma]) VALUES (N'Coordinador', 1, N'cambios', 45, N'Muy bueno.', NULL, NULL, NULL)
INSERT [dbo].[Nucleo_Revisa_Articulo] ([nombreUsuarioFK], [artIdFK], [estadoRevision], [puntuacion], [comentarios], [opinion], [contribucion], [forma]) VALUES (N'Coordinador', 2, N'revisado', 25, N'Funcione porfa', NULL, NULL, NULL)
INSERT [dbo].[Nucleo_Revisa_Articulo] ([nombreUsuarioFK], [artIdFK], [estadoRevision], [puntuacion], [comentarios], [opinion], [contribucion], [forma]) VALUES (N'Coordinador', 4, N'cambios', 25, N'Inspirador', NULL, NULL, NULL)
INSERT [dbo].[Nucleo_Revisa_Articulo] ([nombreUsuarioFK], [artIdFK], [estadoRevision], [puntuacion], [comentarios], [opinion], [contribucion], [forma]) VALUES (N'Coordinador', 5, N'revisado', 30, N'Muy bien.', NULL, NULL, NULL)
INSERT [dbo].[Nucleo_Revisa_Articulo] ([nombreUsuarioFK], [artIdFK], [estadoRevision], [puntuacion], [comentarios], [opinion], [contribucion], [forma]) VALUES (N'Coordinador', 9, N'cambios', 40, N'...', NULL, NULL, NULL)
INSERT [dbo].[Nucleo_Revisa_Articulo] ([nombreUsuarioFK], [artIdFK], [estadoRevision], [puntuacion], [comentarios], [opinion], [contribucion], [forma]) VALUES (N'Dasc12', 3, N'cambios', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Nucleo_Revisa_Articulo] ([nombreUsuarioFK], [artIdFK], [estadoRevision], [puntuacion], [comentarios], [opinion], [contribucion], [forma]) VALUES (N'Dasc12', 8, N'asignado', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Nucleo_Revisa_Articulo] ([nombreUsuarioFK], [artIdFK], [estadoRevision], [puntuacion], [comentarios], [opinion], [contribucion], [forma]) VALUES (N'Dasc12', 18, N'asignado', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Nucleo_Revisa_Articulo] ([nombreUsuarioFK], [artIdFK], [estadoRevision], [puntuacion], [comentarios], [opinion], [contribucion], [forma]) VALUES (N'ElChunche', 8, N'asignado', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Nucleo_Revisa_Articulo] ([nombreUsuarioFK], [artIdFK], [estadoRevision], [puntuacion], [comentarios], [opinion], [contribucion], [forma]) VALUES (N'ElChunche', 14, N'asignado', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Nucleo_Revisa_Articulo] ([nombreUsuarioFK], [artIdFK], [estadoRevision], [puntuacion], [comentarios], [opinion], [contribucion], [forma]) VALUES (N'IvanCh123', 3, N'cambios', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Nucleo_Revisa_Articulo] ([nombreUsuarioFK], [artIdFK], [estadoRevision], [puntuacion], [comentarios], [opinion], [contribucion], [forma]) VALUES (N'IvanCh123', 8, N'asignado', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Nucleo_Revisa_Articulo] ([nombreUsuarioFK], [artIdFK], [estadoRevision], [puntuacion], [comentarios], [opinion], [contribucion], [forma]) VALUES (N'IvanCh123', 14, N'asignado', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Nucleo_Revisa_Articulo] ([nombreUsuarioFK], [artIdFK], [estadoRevision], [puntuacion], [comentarios], [opinion], [contribucion], [forma]) VALUES (N'IvanCh123', 18, N'asignado', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Nucleo_Revisa_Articulo] ([nombreUsuarioFK], [artIdFK], [estadoRevision], [puntuacion], [comentarios], [opinion], [contribucion], [forma]) VALUES (N'otarola506', 3, N'cambios', 10, N'Muy mal.', NULL, NULL, NULL)
INSERT [dbo].[Nucleo_Revisa_Articulo] ([nombreUsuarioFK], [artIdFK], [estadoRevision], [puntuacion], [comentarios], [opinion], [contribucion], [forma]) VALUES (N'otarola506', 14, N'asignado', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Nucleo_Revisa_Articulo] ([nombreUsuarioFK], [artIdFK], [estadoRevision], [puntuacion], [comentarios], [opinion], [contribucion], [forma]) VALUES (N'pepitin', 18, N'asignado', NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Topico] ON 

INSERT [dbo].[Topico] ([topicoIdPK], [categoria], [nombre]) VALUES (2, N'Deportes', N'Fútbol')
INSERT [dbo].[Topico] ([topicoIdPK], [categoria], [nombre]) VALUES (6, N'Estadística', N'Inferencial')
INSERT [dbo].[Topico] ([topicoIdPK], [categoria], [nombre]) VALUES (1, N'Ingeniería de Software', N'Programación')
INSERT [dbo].[Topico] ([topicoIdPK], [categoria], [nombre]) VALUES (3, N'Literatura', N'Ficción')
INSERT [dbo].[Topico] ([topicoIdPK], [categoria], [nombre]) VALUES (5, N'Medicina', N'Epidemiología')
INSERT [dbo].[Topico] ([topicoIdPK], [categoria], [nombre]) VALUES (4, N'Psicología', N'Motivación')
SET IDENTITY_INSERT [dbo].[Topico] OFF
/****** Object:  Index [PK_TopicoIdPk]    Script Date: 30/6/2020 19:33:27 ******/
ALTER TABLE [dbo].[Topico] ADD  CONSTRAINT [PK_TopicoIdPk] PRIMARY KEY NONCLUSTERED 
(
	[topicoIdPK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Pregunta_Frecuente] ADD  DEFAULT ((-1)) FOR [nombreUsuarioFK]
GO
ALTER TABLE [dbo].[Art_Topico]  WITH CHECK ADD  CONSTRAINT [FK_Art_Topico_Articulo] FOREIGN KEY([artIdFK])
REFERENCES [dbo].[Articulo] ([artIdPK])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Art_Topico] CHECK CONSTRAINT [FK_Art_Topico_Articulo]
GO
ALTER TABLE [dbo].[Art_Topico]  WITH CHECK ADD  CONSTRAINT [FK_Art_Topico_Topico] FOREIGN KEY([topicoIdFK])
REFERENCES [dbo].[Topico] ([topicoIdPK])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Art_Topico] CHECK CONSTRAINT [FK_Art_Topico_Topico]
GO
ALTER TABLE [dbo].[Miembro_Articulo]  WITH CHECK ADD  CONSTRAINT [FK_Escribe_Articulo] FOREIGN KEY([artIdFK])
REFERENCES [dbo].[Articulo] ([artIdPK])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Miembro_Articulo] CHECK CONSTRAINT [FK_Escribe_Articulo]
GO
ALTER TABLE [dbo].[Miembro_Articulo]  WITH CHECK ADD  CONSTRAINT [FK_Escribe_Miembro] FOREIGN KEY([nombreUsuarioFK])
REFERENCES [dbo].[Miembro] ([nombreUsuarioPK])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Miembro_Articulo] CHECK CONSTRAINT [FK_Escribe_Miembro]
GO
ALTER TABLE [dbo].[Nucleo_Revisa_Articulo]  WITH CHECK ADD  CONSTRAINT [FK_Nucleo_Revisa_Articulo_Articulo] FOREIGN KEY([artIdFK])
REFERENCES [dbo].[Articulo] ([artIdPK])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Nucleo_Revisa_Articulo] CHECK CONSTRAINT [FK_Nucleo_Revisa_Articulo_Articulo]
GO
ALTER TABLE [dbo].[Nucleo_Revisa_Articulo]  WITH CHECK ADD  CONSTRAINT [FK_Nucleo_Revisa_Articulo_Miembro] FOREIGN KEY([nombreUsuarioFK])
REFERENCES [dbo].[Miembro] ([nombreUsuarioPK])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Nucleo_Revisa_Articulo] CHECK CONSTRAINT [FK_Nucleo_Revisa_Articulo_Miembro]
GO
ALTER TABLE [dbo].[Nucleo_Solicita_Articulo]  WITH CHECK ADD  CONSTRAINT [FK_Nucleo_Solicita_Articulo_Articulo] FOREIGN KEY([artIdFK])
REFERENCES [dbo].[Articulo] ([artIdPK])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Nucleo_Solicita_Articulo] CHECK CONSTRAINT [FK_Nucleo_Solicita_Articulo_Articulo]
GO
ALTER TABLE [dbo].[Nucleo_Solicita_Articulo]  WITH CHECK ADD  CONSTRAINT [FK_Nucleo_Solicita_Articulo_Miembro] FOREIGN KEY([nombreUsuarioFK])
REFERENCES [dbo].[Miembro] ([nombreUsuarioPK])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Nucleo_Solicita_Articulo] CHECK CONSTRAINT [FK_Nucleo_Solicita_Articulo_Miembro]
GO
ALTER TABLE [dbo].[Pregunta_Frecuente]  WITH CHECK ADD  CONSTRAINT [FK_Pregunta_Miembro] FOREIGN KEY([nombreUsuarioFK])
REFERENCES [dbo].[Miembro] ([nombreUsuarioPK])
ON DELETE SET DEFAULT
GO
ALTER TABLE [dbo].[Pregunta_Frecuente] CHECK CONSTRAINT [FK_Pregunta_Miembro]
GO
/****** Object:  StoredProcedure [dbo].[Borrar_Articulo]    Script Date: 30/6/2020 19:33:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Borrar_Articulo] 
(
	@ID int
)
AS
BEGIN 
DELETE FROM dbo.Articulo
WHERE artIdPK = @ID 
END
GO
/****** Object:  StoredProcedure [dbo].[BorrarPreguntaFrecuente]    Script Date: 30/6/2020 19:33:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BorrarPreguntaFrecuente]
(
	@PregID INT
)
AS
BEGIN
	DELETE FROM dbo.Pregunta_Frecuente 
	WHERE pregIdPK = @PregID
END
GO
/****** Object:  StoredProcedure [dbo].[CambiarEstadoArticulo]    Script Date: 30/6/2020 19:33:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CambiarEstadoArticulo]
(
	@ArtID INT,
	@ESTADO VARCHAR(20)
)
AS
BEGIN 
	UPDATE dbo.Articulo 
	SET estado = @ESTADO
	WHERE artIdPK = @ArtID
END
GO
/****** Object:  StoredProcedure [dbo].[CrearCuenta]    Script Date: 30/6/2020 19:33:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CrearCuenta]
(@nombreUsuario VARCHAR(50), @nombre VARCHAR(50), @apellido  VARCHAR(50), @correo VARCHAR(50),@pais VARCHAR(50), @idioma VARCHAR(50), @habilidades VARCHAR(MAX), @hobbies VARCHAR(MAX))
AS
	INSERT INTO dbo.Miembro 
	VALUES(@nombreUsuario, @nombre, @apellido,0,'','',@pais,@habilidades,@idioma,@hobbies,'',@correo,0,'periferico')
GO
/****** Object:  StoredProcedure [dbo].[DisminuirPuntuacion]    Script Date: 30/6/2020 19:33:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DisminuirPuntuacion]
	@artID int,
	@valor int
AS
	Update Articulo
	SET puntuacionInicial = puntuacionInicial - @valor
	WHERE Articulo.artIdPK = @artID
GO
/****** Object:  StoredProcedure [dbo].[EditarPreguntaFrecuente]    Script Date: 30/6/2020 19:33:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EditarPreguntaFrecuente]
(
	@Pregunta VARCHAR (MAX),
	@Respuesta VARCHAR (MAX),
	@PregID INT
)
AS
BEGIN 
	UPDATE dbo.Pregunta_Frecuente 
	SET pregunta = @Pregunta, respuesta = @Respuesta
	WHERE pregIdPK = @PregID
END
GO
/****** Object:  StoredProcedure [dbo].[Guardar_Miembro_Articulo]    Script Date: 30/6/2020 19:33:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Guardar_Miembro_Articulo](@artID int, @miembroId varchar(50) )

AS
	INSERT INTO Miembro_Articulo VALUES (@miembroId,@artID)
GO
/****** Object:  StoredProcedure [dbo].[GuardarPreguntaFrecuente]    Script Date: 30/6/2020 19:33:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GuardarPreguntaFrecuente]
(
	@Pregunta VARCHAR (MAX),
	@Respuesta VARCHAR (MAX),
	@Username VARCHAR (50)
)
AS
BEGIN 
	INSERT INTO Pregunta_Frecuente (pregunta, respuesta, nombreUsuarioFK) 
	VALUES(@Pregunta, @Respuesta, @Username)
END
GO
/****** Object:  StoredProcedure [dbo].[IncrementarVisitas]    Script Date: 30/6/2020 19:33:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[IncrementarVisitas]
	@artID int
AS
	Update Articulo
	SET visitas = visitas + 1
	Where artIdPK = @artID
GO
/****** Object:  StoredProcedure [dbo].[Modificar_Articulo]    Script Date: 30/6/2020 19:33:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Modificar_Articulo](
	@ID int,
	@tituloNuevo varchar(max),
	@resumenNuevo varbinary(max),
	@contenidoNuevo varBinary(max)
) 
as
BEGIN
UPDATE dbo.Articulo
SET titulo=@tituloNuevo,
resumen=@resumenNuevo,
contenido=@contenidoNuevo
WHERE artIdPK = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[Modificar_Articulo_Largo]    Script Date: 30/6/2020 19:33:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Modificar_Articulo_Largo](
	@ID int,
	@tituloNuevo varchar(max),
	@resumenNuevo varbinary(max),
	@contenidoNuevo   varbinary(max),
	@estadoNuevo      varchar(20),
	@nombreArch       varchar(50)

) 
as
BEGIN
UPDATE dbo.Articulo
SET titulo=@tituloNuevo,
resumen=@resumenNuevo,
contenido=@contenidoNuevo,
estado=@estadoNuevo,
nombreArchivo = @nombreArch
WHERE artIdPK = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[Modificar_Articulo_Y_Revision]    Script Date: 30/6/2020 19:33:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Modificar_Articulo_Y_Revision]
(
	@ID int,
	@tituloNuevo varchar(max),
	@resumenNuevo varbinary(max),
	@contenidoNuevo varBinary(max),
	@estadoNuevo varchar(20)
) 
AS
BEGIN
	UPDATE dbo.Articulo
	SET titulo=@tituloNuevo,
	resumen=@resumenNuevo,
	contenido=@contenidoNuevo,
	estado = @estadoNuevo
	WHERE artIdPK = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[Modificar_Titulo_Resumen]    Script Date: 30/6/2020 19:33:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Modificar_Titulo_Resumen](
	@ID int,
	@tituloNuevo varchar(max),
	@resumenNuevo varbinary(max),
	@estadoNuevo      varchar(20)
) 
as
BEGIN
UPDATE dbo.Articulo
SET titulo=@tituloNuevo,
resumen=@resumenNuevo,
estado=@estadoNuevo
WHERE artIdPK = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[ModificarPeso]    Script Date: 30/6/2020 19:33:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ModificarPeso]
	@nombreUsuario varchar(50),
	@peso int
AS
	Update Miembro
	Set pesoMiembro = @peso
	WHERE nombreUsuarioPK = @nombreUsuario
GO
/****** Object:  StoredProcedure [dbo].[ModificarPuntuacion]    Script Date: 30/6/2020 19:33:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ModificarPuntuacion]
	@artID int,
	@valor int
AS
	Update Articulo
	SET puntuacionInicial = puntuacionInicial + @valor
	WHERE Articulo.artIdPK = @artID
GO
/****** Object:  StoredProcedure [dbo].[Mostrar_Autores_Articulo]    Script Date: 30/6/2020 19:33:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Mostrar_Autores_Articulo](
	@articuloId INT
)
AS 
SELECT M.nombre
FROM dbo.Miembro M JOIN dbo.Miembro_Articulo  MA
ON M.nombreUsuarioPK = MA.nombreUsuarioFK
JOIN dbo.Articulo A 
ON MA.artIdFK = A.artIdPK
WHERE artIdFK = @articuloId
GO
/****** Object:  StoredProcedure [dbo].[Obtener_articuloId]    Script Date: 30/6/2020 19:33:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Obtener_articuloId](@titulo varchar(max))
AS
	SELECT A.artIdPK
	FROM Articulo A
	Where A.titulo = @titulo
GO
/****** Object:  StoredProcedure [dbo].[obtenerMiembroID]    Script Date: 30/6/2020 19:33:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[obtenerMiembroID](@nombre varchar(50))
AS
	SELECT M.nombreUsuarioPK
	FROM Miembro M
	WHERE M.nombre = @nombre
GO
/****** Object:  StoredProcedure [dbo].[RecuperarArticulo]    Script Date: 30/6/2020 19:33:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RecuperarArticulo](
	@ID int
)
AS
SELECT * 
FROM Articulo
WHERE artIdPK = @ID
GO
/****** Object:  StoredProcedure [dbo].[RecuperarAutores]    Script Date: 30/6/2020 19:33:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RecuperarAutores]
	@artID int
AS
	SELECT MA.nombreUsuarioFK
	FROM Miembro_Articulo MA
	WHERE MA.artIdFK = @artID
GO
/****** Object:  StoredProcedure [dbo].[RecuperarEstadoArticulo]    Script Date: 30/6/2020 19:33:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RecuperarEstadoArticulo]
	@artID int
AS
	SELECT A.estado
	FROM Articulo A
	WHERE A.artIdPK = @artID

GO
/****** Object:  StoredProcedure [dbo].[RecuperarPesoMiembro]    Script Date: 30/6/2020 19:33:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RecuperarPesoMiembro]
	@NombreUsuario VarChar(50)
AS
	SELECT M.pesoMiembro,tipo
	FROM Miembro M
	WHERE M.nombreUsuarioPK = @NombreUsuario
GO
/****** Object:  StoredProcedure [dbo].[RecuperarPreguntasFrecuentes]    Script Date: 30/6/2020 19:33:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RecuperarPreguntasFrecuentes]
AS
BEGIN
	SELECT * 
	FROM dbo.Pregunta_Frecuente
END
GO
/****** Object:  StoredProcedure [dbo].[RecuperarPuntuacionArticulo]    Script Date: 30/6/2020 19:33:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RecuperarPuntuacionArticulo]
	@artID int
AS
	SELECT A.puntuacionInicial
	FROM Articulo A
	WHERE A.artIdPK = @artID
GO
/****** Object:  StoredProcedure [dbo].[RetornarDatosPerfil]    Script Date: 30/6/2020 19:33:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RetornarDatosPerfil]
	@userName VARCHAR(50)
AS

SELECT M.nombre, M.pesoMiembro, M.informacionLaboral, M.informacionBiografica, M.telefono, M.correo, M.merito
FROM dbo.Miembro M
WHERE M.nombreUsuarioPK = @userName
GO
/****** Object:  StoredProcedure [dbo].[RetornarNombreUsuario]    Script Date: 30/6/2020 19:33:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RetornarNombreUsuario]
	@nombreM varChar(50)
AS
	SELECT M.nombreUsuarioPK
	From Miembro M
	Where M.nombre = @nombreM
GO
/****** Object:  StoredProcedure [dbo].[USP_GuardarArticulos]    Script Date: 30/6/2020 19:33:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_GuardarArticulos] 
(@titulo VARCHAR(max), @resumen VARCHAR(MAX), @contenido VARBINARY(max),@puntuacion FLOAT,@visitas INT  , @estado VARCHAR(20) , @tipoArt VARCHAR(10),@nombreArchivo VARCHAR(50),@fecha DATE,@like INT,@dislike INT)

AS
	INSERT INTO Articulo
	VALUES(@titulo, @resumen, @contenido, @puntuacion,@visitas, @estado,@tipoArt,@nombreArchivo,@fecha,@like,@dislike)
GO
/****** Object:  StoredProcedure [dbo].[USP_RecuperarArticuloPorTitulo]    Script Date: 30/6/2020 19:33:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_RecuperarArticuloPorTitulo](@titulo VARCHAR(MAX))

AS

SELECT A.artIdPK, A.titulo, A.resumen
FROM Articulo A
WHERE A.titulo LIKE '%'+@titulo+'%'
GO
/****** Object:  StoredProcedure [dbo].[USP_RecuperarArticuloPorTopico]    Script Date: 30/6/2020 19:33:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_RecuperarArticuloPorTopico](@Id int)

AS

SELECT DISTINCT A.artIdPK, A.titulo, A.resumen
FROM Articulo A JOIN dbo.Art_Topico AT
	ON A.artIdPK = AT.artIdFK
JOIN dbo.Topico T
	ON AT.topicoIdFK = T.topicoIdPK
WHERE T.topicoIdPK = @Id
GO
/****** Object:  StoredProcedure [dbo].[USP_RecuperarArticulos]    Script Date: 30/6/2020 19:33:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_RecuperarArticulos]

AS
SELECT DISTINCT A.artIdPK, A.titulo, A.resumen
FROM Articulo A
GO
/****** Object:  StoredProcedure [dbo].[USP_RecuperarArticuloTituloTopico]    Script Date: 30/6/2020 19:33:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_RecuperarArticuloTituloTopico](
	@Id int, 
	@titulo varchar(max)
)

AS

SELECT DISTINCT A.artIdPK, A.titulo, A.resumen
FROM Articulo A JOIN dbo.Art_Topico AT
	ON A.artIdPK = AT.artIdFK
JOIN dbo.Topico T
	ON AT.topicoIdFK = T.topicoIdPK
WHERE (T.topicoIdPK = @Id AND A.titulo LIKE '%'+@titulo+'%')
GO
/****** Object:  StoredProcedure [dbo].[USP_RecuperarDatosPerfil]    Script Date: 30/6/2020 19:33:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_RecuperarDatosPerfil]
	@nombreUsuario varchar(50)
AS
SELECT M.nombre,M.apellido, M.pesoMiembro, M.informacionLaboral, M.informacionBiografica, M.telefono, M.correo, M.merito, M.pais, M.habilidades, M.idiomas, M.hobbies
FROM dbo.Miembro M 
WHERE M.nombreUsuarioPK = @nombreUsuario
GO
/****** Object:  StoredProcedure [dbo].[VerificarNombreUsuario]    Script Date: 30/6/2020 19:33:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[VerificarNombreUsuario]
(@nombreUsuario VARCHAR(50))
AS
	IF(EXISTS(SELECT * FROM Miembro WHERE nombreUsuarioPK = @nombreUsuario))
	BEGIN
		SELECT 1;
	END
	ELSE
	BEGIN
		SELECT 0
	END
GO
