SET ANSI_NULLS ON 
Go
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ptblPorcentajeVales]
-- Add the parameters for the stored procedure here
     @cmd int = 0,
     @id int = 0,
     @porcentaje decimal(12,2) = NULL,
     @borradorbit bit= null,
     @fechaCrea datetime= null,
     @ultimaModificacion datetime= null
AS
BEGIN
     SET NOCOUNT ON;
     /*:::::::::::::::: START CRUD [tbltblPorcentajeVales]:::::::::::::::::::::::::*/
     /*:::::::::::::::: CREATE ONE [tbltblPorcentajeVales]:::::::::::::::::::::::::*/
     IF @cmd=1
     BEGIN
      INSERT INTO [dbo].[tbltblPorcentajeVales]
          ([porcentaje]
          ,[fechaCrea])
      VALUES
          (@porcentaje
          ,GETDATE())
      select @@identity
     END
     /*:::::::::::::::: READ ALL [tbltblPorcentajeVales]:::::::::::::::::::::::::*/
     IF @cmd=2
      BEGIN 
      SELECT [id]
          ,isnull(porcentaje,'') as porcentaje
          ,isnull(ultimaModificacion,0) as ultimaModificacion
      FROM [dbo].[tbltblPorcentajeVales]
      where borradorbit is null
     END
     /*:::::::::::::::: READ ONE [tbltblPorcentajeVales]:::::::::::::::::::::::::*/
     IF @cmd=3
     BEGIN 
      SELECT [id]
          ,isnull(porcentaje,'') as porcentaje
          ,isnull(ultimaModificacion,0) as ultimaModificacion
      FROM [dbo].[tbltblPorcentajeVales]
      where id = @id
     END
     /*:::::::::::::::: UPDATE ONE [tbltblPorcentajeVales]:::::::::::::::::::::::::*/
     IF @cmd=4
     BEGIN 
      UPDATE [dbo].[tbltblPorcentajeVales] SET
           [ultimaModificacion] = getdate()
          ,[porcentaje] = @porcentaje
      FROM [dbo].[tbltblPorcentajeVales]
      where id = @id
     END     /*:::::::::::::::: DELETE ONE [tbltblPorcentajeVales]:::::::::::::::::::::::::*/
     IF @cmd=5
     BEGIN 
      UPDATE [dbo].[tbltblPorcentajeVales] SET
           [ultimaModificacion] = getdate()
          ,[borradorbit] = 1
      FROM [dbo].[tbltblPorcentajeVales]
      where id = @id
     END
/*:::::::::::::::: END CRUD [tbltblPorcentajeVales]:::::::::::::::::::::::::*/
END



