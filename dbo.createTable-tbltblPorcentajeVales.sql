--IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbltblPorcentajeVales]') AND type in (N'U'))
--DROP TABLE [dbo].[tbltblPorcentajeVales]
--GO
SET ANSI_NULLS ON 
Go
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbltblPorcentajeVales](
     [id] [int] IDENTITY(1,1) NOT NULL,
     [porcentaje] [decimal](12,2) NULL  ,
     [borradorbit] [bit] NULL,
     [fechaCrea] [datetime] NULL,
     [ultimaModificacion] [datetime] NULL,
CONSTRAINT [PK_tbltblPorcentajeVales] PRIMARY KEY CLUSTERED (
[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


