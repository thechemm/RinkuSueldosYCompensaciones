use db_Rinku
SET ANSI_NULLS ON 
Go
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pPorcentajeVales]
-- Add the parameters for the stored procedure here
     @cmd int = 0,
     @id int = 0,
     @porcentaje decimal(12,2) = NULL
AS
BEGIN
     SET NOCOUNT ON;
     /*:::::::::::::::: START CRUD [tblPorcentajeVales]:::::::::::::::::::::::::*/
     /*:::::::::::::::: CREATE ONE [tblPorcentajeVales]:::::::::::::::::::::::::*/
     IF @cmd=1
     BEGIN
      INSERT INTO [dbo].[tblPorcentajeVales]
          ([porcentaje])
      VALUES
          (@porcentaje)
      select @@identity
     END
     /*:::::::::::::::: READ ALL [tblPorcentajeVales]:::::::::::::::::::::::::*/
     IF @cmd=2
      BEGIN 
      SELECT [id]
          ,isnull(porcentaje,'') as porcentaje
      FROM [dbo].[tblPorcentajeVales]
     END
     /*:::::::::::::::: READ ONE [tblPorcentajeVales]:::::::::::::::::::::::::*/
     IF @cmd=3
     BEGIN 
      SELECT [id]
          ,isnull(porcentaje,'') as porcentaje
      FROM [dbo].[tblPorcentajeVales]
      where id = @id
     END
     /*:::::::::::::::: UPDATE ONE [tblPorcentajeVales]:::::::::::::::::::::::::*/
     IF @cmd=4
     BEGIN 
      UPDATE [dbo].[tblPorcentajeVales] SET
           [porcentaje] = @porcentaje
      FROM [dbo].[tblPorcentajeVales]
      where id = @id
     END     /*:::::::::::::::: DELETE ONE [tblPorcentajeVales]:::::::::::::::::::::::::*/
     IF @cmd=5
     BEGIN 
      delete [dbo].[tblPorcentajeVales]
      where id = @id
     END
/*:::::::::::::::: END CRUD [tblPorcentajeVales]:::::::::::::::::::::::::*/
END



