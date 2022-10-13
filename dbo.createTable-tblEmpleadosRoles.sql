--IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblEmpleadosRoles]') AND type in (N'U'))
--DROP TABLE [dbo].[tblEmpleadosRoles]
--GO
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
     [montoBonoPorHora] [decimal](12,2) NULL  ,
     [borradorbit] [bit] NULL,
     [fechaCrea] [datetime] NULL,
     [ultimaModificacion] [datetime] NULL,
CONSTRAINT [PK_tblEmpleadosRoles] PRIMARY KEY CLUSTERED (
[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


