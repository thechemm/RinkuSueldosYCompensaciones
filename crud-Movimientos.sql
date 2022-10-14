use db_Rinku
SET ANSI_NULLS ON 
Go
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pMovimientos]
-- Add the parameters for the stored procedure here
     @cmd int = 0,
     @id int = 0,
     @idEmpleado int = NULL,
     @numEntregas int = NULL,
     @idMes int = NULL,
     @anio int = NULL
AS
BEGIN
     SET NOCOUNT ON;
     /*:::::::::::::::: START CRUD [tblMovimientos]:::::::::::::::::::::::::*/
     /*:::::::::::::::: CREATE ONE [tblMovimientos]:::::::::::::::::::::::::*/
     IF @cmd=1
     BEGIN
      INSERT INTO [dbo].[tblMovimientos]
          ([idEmpleado]
          ,[numEntregas]
          ,[idMes]
          ,[anio])
      VALUES
          (@idEmpleado
          ,@numEntregas
          ,@idMes
          ,@anio)
      select @@identity
     END
     /*:::::::::::::::: READ ALL [tblMovimientos]:::::::::::::::::::::::::*/
     IF @cmd=2
      BEGIN 
      SELECT [id]
          ,isnull(idEmpleado,'') as idEmpleado
          ,isnull(numEntregas,0) as numEntregas
          ,isnull(idMes,0) as idMes
          ,isnull(anio,0) as anio
      FROM [dbo].[tblMovimientos]
     END
     /*:::::::::::::::: READ ONE [tblMovimientos]:::::::::::::::::::::::::*/
     IF @cmd=3
     BEGIN 
      SELECT [id]
          ,isnull(idEmpleado,'') as idEmpleado
          ,isnull(numEntregas,0) as numEntregas
          ,isnull(idMes,0) as idMes
          ,isnull(anio,0) as anio
      FROM [dbo].[tblMovimientos]
      where id = @id
     END
     /*:::::::::::::::: UPDATE ONE [tblMovimientos]:::::::::::::::::::::::::*/
     IF @cmd=4
     BEGIN 
      UPDATE [dbo].[tblMovimientos] SET
           [idEmpleado] = @idEmpleado
          ,[numEntregas] = @numEntregas
          ,[idMes] = @idMes
          ,[anio] = @anio
      FROM [dbo].[tblMovimientos]
      where id = @id
     END     /*:::::::::::::::: DELETE ONE [tblMovimientos]:::::::::::::::::::::::::*/
     IF @cmd=5
     BEGIN 
      delete [dbo].[tblMovimientos]
      where id = @id
     END
/*:::::::::::::::: END CRUD [tblMovimientos]:::::::::::::::::::::::::*/
END



