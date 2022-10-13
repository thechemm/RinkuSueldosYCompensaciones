use db_Rinku
--IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblEmpleados]') AND type in (N'U'))
--DROP TABLE [dbo].[tblEmpleados]
--GO
SET ANSI_NULLS ON 
Go
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmpleados](
     [id] [int] IDENTITY(1,1) NOT NULL,
     [rolId] [int] NULL  ,
     [numero] [varchar](200) NULL  ,
     [nombre] [varchar](200) NULL 
CONSTRAINT [PK_tblEmpleados] PRIMARY KEY CLUSTERED (
[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


