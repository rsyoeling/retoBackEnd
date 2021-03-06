USE [master]
GO
/****** Object:  Database [dbInscripcion]    Script Date: 07/05/2021 11:58:51 ******/
CREATE DATABASE [dbInscripcion]
GO
ALTER DATABASE [dbInscripcion] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbInscripcion].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbInscripcion] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbInscripcion] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbInscripcion] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbInscripcion] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbInscripcion] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbInscripcion] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [dbInscripcion] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbInscripcion] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbInscripcion] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbInscripcion] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbInscripcion] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbInscripcion] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbInscripcion] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbInscripcion] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbInscripcion] SET  ENABLE_BROKER 
GO
ALTER DATABASE [dbInscripcion] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbInscripcion] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbInscripcion] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbInscripcion] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbInscripcion] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbInscripcion] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbInscripcion] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbInscripcion] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [dbInscripcion] SET  MULTI_USER 
GO
ALTER DATABASE [dbInscripcion] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbInscripcion] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbInscripcion] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbInscripcion] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [dbInscripcion] SET DELAYED_DURABILITY = DISABLED 
GO
USE [dbInscripcion]
GO
/****** Object:  Table [dbo].[Actividad]    Script Date: 07/05/2021 11:58:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Actividad](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](25) NULL,
	[Status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 07/05/2021 11:58:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Nombres] [varchar](100) NULL,
	[Dni] [varchar](8) NULL,
	[Celular] [varchar](12) NULL,
	[Correo] [varchar](100) NULL,
	[Curso] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Operador]    Script Date: 07/05/2021 11:58:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Operador](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[CodCliente] [int] NULL,
	[IdActividad] [int] NULL,
	[Status] [bit] NULL,
	[Cod_Generado] [varchar](100) NULL,
	[Fecha] [datetime] NULL,
	[Comentarios] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Actividad] ON 

INSERT [dbo].[Actividad] ([id], [Descripcion], [Status]) VALUES (1, N'Solicitar Inscripción', 1)
INSERT [dbo].[Actividad] ([id], [Descripcion], [Status]) VALUES (2, N'Generar Orden de Visita', 1)
INSERT [dbo].[Actividad] ([id], [Descripcion], [Status]) VALUES (3, N'Confirmar Pago', 1)
INSERT [dbo].[Actividad] ([id], [Descripcion], [Status]) VALUES (4, N'Generar Factura', 1)
INSERT [dbo].[Actividad] ([id], [Descripcion], [Status]) VALUES (5, N'Confirmar Inscripción', 1)
SET IDENTITY_INSERT [dbo].[Actividad] OFF
GO
SET IDENTITY_INSERT [dbo].[Cliente] ON 

INSERT [dbo].[Cliente] ([id], [Nombres], [Dni], [Celular], [Correo], [Curso]) VALUES (1, N'Yoel Rodriguez', N'48130249', N'987828399', N'rodriguezsyoel@gmail.com', N'Amazon aws')
SET IDENTITY_INSERT [dbo].[Cliente] OFF
GO
ALTER TABLE [dbo].[Operador]  WITH CHECK ADD FOREIGN KEY([CodCliente])
REFERENCES [dbo].[Cliente] ([id])
GO
ALTER TABLE [dbo].[Operador]  WITH CHECK ADD FOREIGN KEY([IdActividad])
REFERENCES [dbo].[Actividad] ([id])
GO
/****** Object:  StoredProcedure [dbo].[usp_Insert_Operador]    Script Date: 07/05/2021 11:58:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*
	--Pruebas:
	exec usp_Insert_Operador 1,2,1,'','Ok avanzar actividad 2'
	exec usp_Insert_Operador 1,3,1,'A2-1','Ok avanzar actividad 3'
	exec usp_Insert_Operador 1,4,1,'A3-1','Ok avanzar actividad 4'
	exec usp_Insert_Operador 1,5,1,'A4-1','Ok avanzar actividad 5'

	--Pruebas: Parametros erroneos
	exec usp_Insert_Operador 1,65,1,null,null

	select * from [dbo].[Operador]
	truncate table [dbo].[Operador]
*/


create procedure [dbo].[usp_Insert_Operador]
(@CodCliente int,
 @IdActividad int,
 @Status bit,
 @CodGenerado varchar(100)=null,
 @Comentarios varchar(500)=null
)
as
begin
	
	--Declaraci�n variable: Valida exista Cliente y Actividad
	declare @ValidaCodCliente bit
	declare @ValidaIdActividad bit

	set @ValidaCodCliente=0
	set @ValidaIdActividad=0

	if exists(select 1 from Cliente where id=@CodCliente)
	begin
		set @ValidaCodCliente=1
	end

	if exists(select 1 from Actividad where id=@IdActividad)
	begin
		set @ValidaIdActividad=1
	end
	---****************************************************************
	---Validacion: los parametros sean verdaderos
	if(@ValidaCodCliente=1 and @ValidaIdActividad=1)
	begin
		if not exists(select 1 from [dbo].[Operador] where [CodCliente]=@CodCliente and [IdActividad]=@IdActividad)
		begin
		--declaraci�n variable: generar codigo de actividad
		declare @GenerarCod varchar(100)
		set @GenerarCod='A' + cast(@IdActividad as varchar(10)) + '-' + cast((select count(*)+1 from [dbo].[Operador] where IdActividad=@IdActividad) as varchar(10))

		--Validar primera actividad de OPERADOR
		if(@IdActividad=2)
		begin
			--Insertar actividad (Generar Orden de Visita)
			INSERT INTO [dbo].[Operador]
			   ([CodCliente]
			   ,[IdActividad]
			   ,[Status]
			   ,[Cod_Generado]
			   ,[Fecha]
			   ,[Comentarios])
			 VALUES
				   (@CodCliente
				   ,@IdActividad
				   ,@Status
				   ,@GenerarCod
				   ,GETDATE()
				   ,@Comentarios)
			set @CodGenerado=@GenerarCod
		end
		else
		begin
			 --validar actividad previa
			if exists(select 1 from [dbo].[Operador] where Cod_Generado=@CodGenerado and IdActividad=@IdActividad-1)
			begin
				SET @CodGenerado=@GenerarCod
				--insertar nueva actividad correspondiente
				INSERT INTO [dbo].[Operador]
				   ([CodCliente]
				   ,[IdActividad]
				   ,[Status]
				   ,[Cod_Generado]
				   ,[Fecha]
				   ,[Comentarios])
				 VALUES
					   (@CodCliente
					   ,@IdActividad
					   ,@Status
					   ,@CodGenerado
					   ,GETDATE()
					   ,@Comentarios)
			end
			else
			begin
				SET @CodGenerado=''
			end
		end
		
	end
		else
		begin
		select @CodGenerado=Cod_Generado from [dbo].[Operador] where [CodCliente]=@CodCliente and [IdActividad]=@IdActividad
	end
	end
	else
	begin
		SET @CodGenerado=''
	end


	--select @CodGenerado as 'CodGenerado', iif(len(isnull(@CodGenerado,''))=0,'ERROR','OK') 'Status'

	select iif(len(isnull(@CodGenerado,''))=0,'002','000') 'codigoError',
	       iif(len(isnull(@CodGenerado,''))=0,'Estimado, los datos proporcionados son incorrectos.',@CodGenerado) 'descripcion'

end
GO
USE [master]
GO
ALTER DATABASE [dbInscripcion] SET  READ_WRITE 
GO
