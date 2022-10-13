SET ANSI_NULLS ON 
Go
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pRetenciones]
-- Add the parameters for the stored procedure here
     @cmd int = 0,
     @id int = 0,
     @porcentaje decimal(4,2) = NULL,
     @montoMinimo decimal(12,2) = NULL,
     @montoMaximo decimal(12,2) = NULL,
     @borradorbit bit= null,
     @fechaCrea datetime= null,
     @ultimaModificacion datetime= null
AS
BEGIN
     SET NOCOUNT ON;
     /*:::::::::::::::: START CRUD [tblRetenciones]:::::::::::::::::::::::::*/
     /*:::::::::::::::: CREATE ONE [tblRetenciones]:::::::::::::::::::::::::*/
     IF @cmd=1
     BEGIN
      INSERT INTO [dbo].[tblRetenciones]
          ([porcentaje]
          ,[montoMinimo]
          ,[montoMaximo]
          ,[fechaCrea])
      VALUES
          (@porcentaje
          ,@montoMinimo
          ,@montoMaximo
          ,GETDATE())
      select @@identity
     END
     /*:::::::::::::::: READ ALL [tblRetenciones]:::::::::::::::::::::::::*/
     IF @cmd=2
      BEGIN 
      SELECT [id]
          ,isnull(porcentaje,'') as porcentaje
          ,isnull(montoMinimo,'') as montoMinimo
          ,isnull(montoMaximo,'') as montoMaximo
          ,isnull(ultimaModificacion,0) as ultimaModificacion
      FROM [dbo].[tblRetenciones]
      where borradorbit is null
     END
     /*:::::::::::::::: READ ONE [tblRetenciones]:::::::::::::::::::::::::*/
     IF @cmd=3
     BEGIN 
      SELECT [id]
          ,isnull(porcentaje,'') as porcentaje
          ,isnull(montoMinimo,'') as montoMinimo
          ,isnull(montoMaximo,'') as montoMaximo
          ,isnull(ultimaModificacion,0) as ultimaModificacion
      FROM [dbo].[tblRetenciones]
      where id = @id
     END
     /*:::::::::::::::: UPDATE ONE [tblRetenciones]:::::::::::::::::::::::::*/
     IF @cmd=4
     BEGIN 
      UPDATE [dbo].[tblRetenciones] SET
           [ultimaModificacion] = getdate()
          ,[porcentaje] = @porcentaje
          ,[montoMinimo] = @montoMinimo
          ,[montoMaximo] = @montoMaximo
      FROM [dbo].[tblRetenciones]
      where id = @id
     END     /*:::::::::::::::: DELETE ONE [tblRetenciones]:::::::::::::::::::::::::*/
     IF @cmd=5
     BEGIN 
      UPDATE [dbo].[tblRetenciones] SET
           [ultimaModificacion] = getdate()
          ,[borradorbit] = 1
      FROM [dbo].[tblRetenciones]
      where id = @id
     END
/*:::::::::::::::: END CRUD [tblRetenciones]:::::::::::::::::::::::::*/
END



