use db_Rinku
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
     @montoMaximo decimal(12,2) = NULL
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
          ,[montoMaximo])
      VALUES
          (@porcentaje
          ,@montoMinimo
          ,@montoMaximo)
      select @@identity
     END
     /*:::::::::::::::: READ ALL [tblRetenciones]:::::::::::::::::::::::::*/
     IF @cmd=2
      BEGIN 
      SELECT [id]
          ,isnull(porcentaje,'') as porcentaje
          ,isnull(montoMinimo,'') as montoMinimo
          ,isnull(montoMaximo,'') as montoMaximo
      FROM [dbo].[tblRetenciones]
     END
     /*:::::::::::::::: READ ONE [tblRetenciones]:::::::::::::::::::::::::*/
     IF @cmd=3
     BEGIN 
      SELECT [id]
          ,isnull(porcentaje,'') as porcentaje
          ,isnull(montoMinimo,'') as montoMinimo
          ,isnull(montoMaximo,'') as montoMaximo
      FROM [dbo].[tblRetenciones]
      where id = @id
     END
     /*:::::::::::::::: UPDATE ONE [tblRetenciones]:::::::::::::::::::::::::*/
     IF @cmd=4
     BEGIN 
      UPDATE [dbo].[tblRetenciones] SET
           [porcentaje] = @porcentaje
          ,[montoMinimo] = @montoMinimo
          ,[montoMaximo] = @montoMaximo
      FROM [dbo].[tblRetenciones]
      where id = @id
     END     /*:::::::::::::::: DELETE ONE [tblRetenciones]:::::::::::::::::::::::::*/
     IF @cmd=5
     BEGIN 
     delete [dbo].[tblRetenciones]
      where id = @id
     END
/*:::::::::::::::: END CRUD [tblRetenciones]:::::::::::::::::::::::::*/
END



