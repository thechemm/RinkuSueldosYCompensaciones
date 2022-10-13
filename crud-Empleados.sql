use db_Rinku
SET ANSI_NULLS ON 
Go
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[pEmpleados]
-- Add the parameters for the stored procedure here
     @cmd int = 0,
     @id int = 0,
     @rolId int = NULL,
     @numero varchar(200) = NULL,
     @nombre varchar(200) = NULL,
     @borradorbit bit= null,
     @fechaCrea datetime= null,
     @ultimaModificacion datetime= null
AS
BEGIN
     SET NOCOUNT ON;
     /*:::::::::::::::: START CRUD [tblEmpleados]:::::::::::::::::::::::::*/
     /*:::::::::::::::: CREATE ONE [tblEmpleados]:::::::::::::::::::::::::*/
     IF @cmd=1
     BEGIN
      INSERT INTO [dbo].[tblEmpleados]
          ([rolId]
          ,[numero]
          ,[nombre]
          ,[fechaCrea])
      VALUES
          (@rolId
          ,@numero
          ,@nombre
          ,GETDATE())
      select @@identity
     END
     /*:::::::::::::::: READ ALL [tblEmpleados]:::::::::::::::::::::::::*/
     IF @cmd=2
      BEGIN 
      SELECT [id]
          ,isnull(rolId,0) as rolId
          ,isnull(numero,'') as numero
          ,isnull(nombre,'') as nombre
          ,isnull(borradorbit,0) as borradorbit
          ,isnull(fechaCrea,0) as fechaCrea
          ,isnull(ultimaModificacion,0) as ultimaModificacion
      FROM [dbo].[tblEmpleados]
      where borradorbit is null
     END
     /*:::::::::::::::: READ ONE [tblEmpleados]:::::::::::::::::::::::::*/
     IF @cmd=3
     BEGIN 
      SELECT [id]
          ,isnull(rolId,0) as rolId
          ,isnull(numero,'') as numero
          ,isnull(nombre,'') as nombre
          ,isnull(borradorbit,0) as borradorbit
          ,isnull(fechaCrea,0) as fechaCrea
          ,isnull(ultimaModificacion,0) as ultimaModificacion
      FROM [dbo].[tblEmpleados]
      where id = @id
     END
     /*:::::::::::::::: UPDATE ONE [tblEmpleados]:::::::::::::::::::::::::*/
     IF @cmd=4
     BEGIN 
      UPDATE [dbo].[tblEmpleados] SET
           [ultimaModificacion] = getdate()
          ,[rolId] = @rolId
          ,[numero] = @numero
          ,[nombre] = @nombre
      FROM [dbo].[tblEmpleados]
      where id = @id
     END     
     /*:::::::::::::::: DELETE ONE [tblEmpleados]:::::::::::::::::::::::::*/
     IF @cmd=5
     BEGIN 
      UPDATE [dbo].[tblEmpleados] SET
           [ultimaModificacion] = getdate()
          ,[borradorbit] = 1
      FROM [dbo].[tblEmpleados]
      where id = @id
     END
    /*:::::::::::::::: END CRUD [tblEmpleados]:::::::::::::::::::::::::*/
END



