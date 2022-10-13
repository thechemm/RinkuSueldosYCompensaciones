--IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblMovimientos]') AND type in (N'U'))
--DROP TABLE [dbo].[tblMovimientos]
--GO
SET ANSI_NULLS ON 
Go
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMovimientos](
     [id] [int] IDENTITY(1,1) NOT NULL,
     [idEmpleado] [long] NULL  ,
     [numEntregas] [int] NULL  ,
     [idMes] [int] NULL  ,
     [anio] [int] NULL  ,
     [borradorbit] [bit] NULL,
     [fechaCrea] [datetime] NULL,
     [ultimaModificacion] [datetime] NULL,
CONSTRAINT [PK_tblMovimientos] PRIMARY KEY CLUSTERED (
[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


