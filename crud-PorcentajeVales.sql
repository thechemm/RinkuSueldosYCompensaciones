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
     /*:::::::::::::::: START CRUD [pPorcentajeVales]:::::::::::::::::::::::::*/
     /*:::::::::::::::: CREATE ONE [pPorcentajeVales]:::::::::::::::::::::::::*/
     IF @cmd=1
     BEGIN
      INSERT INTO [dbo].[pPorcentajeVales]
          ([porcentaje])
      VALUES
          (@porcentaje)
      select @@identity
     END
     /*:::::::::::::::: READ ALL [pPorcentajeVales]:::::::::::::::::::::::::*/
     IF @cmd=2
      BEGIN 
      SELECT [id]
          ,isnull(porcentaje,'') as porcentaje
      FROM [dbo].[pPorcentajeVales]
     END
     /*:::::::::::::::: READ ONE [pPorcentajeVales]:::::::::::::::::::::::::*/
     IF @cmd=3
     BEGIN 
      SELECT [id]
          ,isnull(porcentaje,'') as porcentaje
      FROM [dbo].[pPorcentajeVales]
      where id = @id
     END
     /*:::::::::::::::: UPDATE ONE [pPorcentajeVales]:::::::::::::::::::::::::*/
     IF @cmd=4
     BEGIN 
      UPDATE [dbo].[pPorcentajeVales] SET
           [porcentaje] = @porcentaje
      FROM [dbo].[pPorcentajeVales]
      where id = @id
     END     /*:::::::::::::::: DELETE ONE [pPorcentajeVales]:::::::::::::::::::::::::*/
     IF @cmd=5
     BEGIN 
      delete [dbo].[pPorcentajeVales]
      where id = @id
     END
/*:::::::::::::::: END CRUD [pPorcentajeVales]:::::::::::::::::::::::::*/
END



