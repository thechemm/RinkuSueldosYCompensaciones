use db_Rinku
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblCatMeses]') AND type in (N'U'))
DROP TABLE [dbo].[tblCatMeses]
GO
SET ANSI_NULLS ON 
Go
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCatMeses](
     [id] [int] IDENTITY(1,1) NOT NULL,
     [nombre] [varchar](200) NULL 
CONSTRAINT [PK_tblCatMeses] PRIMARY KEY CLUSTERED (
[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT INTO tblCatMeses(nombre) VALUES('Enero')
INSERT INTO tblCatMeses(nombre) VALUES('Febrero')
INSERT INTO tblCatMeses(nombre) VALUES('Marzo')
INSERT INTO tblCatMeses(nombre) VALUES('Abril')
INSERT INTO tblCatMeses(nombre) VALUES('Mayo')
INSERT INTO tblCatMeses(nombre) VALUES('Junio')
INSERT INTO tblCatMeses(nombre) VALUES('Julio')
INSERT INTO tblCatMeses(nombre) VALUES('Agosto')
INSERT INTO tblCatMeses(nombre) VALUES('Septiembre')
INSERT INTO tblCatMeses(nombre) VALUES('Octubre')
INSERT INTO tblCatMeses(nombre) VALUES('Noviembre')
INSERT INTO tblCatMeses(nombre) VALUES('Diciembre')


