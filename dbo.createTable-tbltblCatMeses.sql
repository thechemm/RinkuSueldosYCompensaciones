--IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbltblCatMeses]') AND type in (N'U'))
--DROP TABLE [dbo].[tbltblCatMeses]
--GO
SET ANSI_NULLS ON 
Go
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbltblCatMeses](
     [id] [int] IDENTITY(1,1) NOT NULL,
     [nombre] [varchar](200) NULL 
CONSTRAINT [PK_tbltblCatMeses] PRIMARY KEY CLUSTERED (
[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT INTO tbltblCatMeses(nombre) VALUES('Enero')
INSERT INTO tbltblCatMeses(nombre) VALUES('Febrero')
INSERT INTO tbltblCatMeses(nombre) VALUES('Marzo')
INSERT INTO tbltblCatMeses(nombre) VALUES('Abril')
INSERT INTO tbltblCatMeses(nombre) VALUES('Mayo')
INSERT INTO tbltblCatMeses(nombre) VALUES('Junio')
INSERT INTO tbltblCatMeses(nombre) VALUES('Julio')
INSERT INTO tbltblCatMeses(nombre) VALUES('Agosto')
INSERT INTO tbltblCatMeses(nombre) VALUES('Septiembre')
INSERT INTO tbltblCatMeses(nombre) VALUES('Octubre')
INSERT INTO tbltblCatMeses(nombre) VALUES('Noviembre')
INSERT INTO tbltblCatMeses(nombre) VALUES('Diciembre')


