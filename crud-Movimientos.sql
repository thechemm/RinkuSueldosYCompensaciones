SET ANSI_NULLS ON 
Go
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pMovimientos]
-- Add the parameters for the stored procedure here
     @cmd int = 0,
     @id int = 0,
     @idEmpleado long = NULL,
     @numEntregas int = NULL,
     @idMes int = NULL,
     @anio int = NULL,
     @borradorbit bit= null,
     @fechaCrea datetime= null,
     @ultimaModificacion datetime= null
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
          ,[anio]
          ,[fechaCrea])
      VALUES
          (@idEmpleado
          ,@numEntregas
          ,@idMes
          ,@anio
          ,GETDATE())
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
          ,isnull(ultimaModificacion,0) as ultimaModificacion
      FROM [dbo].[tblMovimientos]
      where borradorbit is null
     END
     /*:::::::::::::::: READ ONE [tblMovimientos]:::::::::::::::::::::::::*/
     IF @cmd=3
     BEGIN 
      SELECT [id]
          ,isnull(idEmpleado,'') as idEmpleado
          ,isnull(numEntregas,0) as numEntregas
          ,isnull(idMes,0) as idMes
          ,isnull(anio,0) as anio
          ,isnull(ultimaModificacion,0) as ultimaModificacion
      FROM [dbo].[tblMovimientos]
      where id = @id
     END
     /*:::::::::::::::: UPDATE ONE [tblMovimientos]:::::::::::::::::::::::::*/
     IF @cmd=4
     BEGIN 
      UPDATE [dbo].[tblMovimientos] SET
           [ultimaModificacion] = getdate()
          ,[idEmpleado] = @idEmpleado
          ,[numEntregas] = @numEntregas
          ,[idMes] = @idMes
          ,[anio] = @anio
      FROM [dbo].[tblMovimientos]
      where id = @id
     END     /*:::::::::::::::: DELETE ONE [tblMovimientos]:::::::::::::::::::::::::*/
     IF @cmd=5
     BEGIN 
      UPDATE [dbo].[tblMovimientos] SET
           [ultimaModificacion] = getdate()
          ,[borradorbit] = 1
      FROM [dbo].[tblMovimientos]
      where id = @id
     END
/*:::::::::::::::: END CRUD [tblMovimientos]:::::::::::::::::::::::::*/
END



