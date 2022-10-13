SET ANSI_NULLS ON 
Go
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ptblPorcentajeVales]
-- Add the parameters for the stored procedure here
     @cmd int = 0,
     @id int = 0,
     @porcentaje decimal(12,2) = NULL
AS
BEGIN
     SET NOCOUNT ON;
     /*:::::::::::::::: START CRUD [tbltblPorcentajeVales]:::::::::::::::::::::::::*/
     /*:::::::::::::::: CREATE ONE [tbltblPorcentajeVales]:::::::::::::::::::::::::*/
     IF @cmd=1
     BEGIN
      INSERT INTO [dbo].[tbltblPorcentajeVales]
          ([porcentaje])
      VALUES
          (@porcentaje)
      select @@identity
     END
     /*:::::::::::::::: READ ALL [tbltblPorcentajeVales]:::::::::::::::::::::::::*/
     IF @cmd=2
      BEGIN 
      SELECT [id]
          ,isnull(porcentaje,'') as porcentaje
      FROM [dbo].[tbltblPorcentajeVales]
     END
     /*:::::::::::::::: READ ONE [tbltblPorcentajeVales]:::::::::::::::::::::::::*/
     IF @cmd=3
     BEGIN 
      SELECT [id]
          ,isnull(porcentaje,'') as porcentaje
      FROM [dbo].[tbltblPorcentajeVales]
      where id = @id
     END
     /*:::::::::::::::: UPDATE ONE [tbltblPorcentajeVales]:::::::::::::::::::::::::*/
     IF @cmd=4
     BEGIN 
      UPDATE [dbo].[tbltblPorcentajeVales] SET
           [porcentaje] = @porcentaje
      FROM [dbo].[tbltblPorcentajeVales]
      where id = @id
     END     /*:::::::::::::::: DELETE ONE [tbltblPorcentajeVales]:::::::::::::::::::::::::*/
     IF @cmd=5
     BEGIN 
      delete [dbo].[tbltblPorcentajeVales]
      where id = @id
     END
/*:::::::::::::::: END CRUD [tbltblPorcentajeVales]:::::::::::::::::::::::::*/
END



