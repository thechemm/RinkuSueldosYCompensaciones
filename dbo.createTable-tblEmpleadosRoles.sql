use db_Rinku
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblEmpleadosRoles]') AND type in (N'U'))
DROP TABLE [dbo].[tblEmpleadosRoles]
GO
SET ANSI_NULLS ON 
Go
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmpleadosRoles](
     [id] [int] IDENTITY(1,1) NOT NULL,
     [nombre] [varchar](200) NULL  ,
     [sueldoBase] [decimal](12,2) NULL  ,
     [horasJornada] [decimal](12,2) NULL  ,
     [diasPorSemana] [int] NULL  ,
     [montoAdicionalPorEntrega] [decimal](12,2) NULL  ,
     [montoBonoPorHora] [decimal](12,2) NULL  
CONSTRAINT [PK_tblEmpleadosRoles] PRIMARY KEY CLUSTERED (
[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT INTO tblEmpleadosRoles(nombre,sueldoBase,horasJornada,diasPorSemana,montoAdicionalPorEntrega,montoBonoPorHora)
VALUES('Chofer',30,8,6,5,10)

INSERT INTO tblEmpleadosRoles(nombre,sueldoBase,horasJornada,diasPorSemana,montoAdicionalPorEntrega,montoBonoPorHora)
VALUES('Cargador',30,8,6,5,5)

INSERT INTO tblEmpleadosRoles(nombre,sueldoBase,horasJornada,diasPorSemana,montoAdicionalPorEntrega,montoBonoPorHora)
VALUES('Auxiliar',30,8,6,5,0)


