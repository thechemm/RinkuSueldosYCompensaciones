use db_Rinku
SET ANSI_NULLS ON 
Go
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[pEmpleados]
-- Add the parameters for the stored procedure here
     @cmd int = 0,
     @id int = 0,
     @rolId int = NULL,
     @numero varchar(200) = NULL,
     @nombre varchar(200) = NULL
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
          ,[nombre])
      VALUES
          (@rolId
          ,@numero
          ,@nombre)
      select @@identity
     END
     /*:::::::::::::::: READ ALL [tblEmpleados]:::::::::::::::::::::::::*/
     IF @cmd=2
      BEGIN 
      SELECT [id]
          ,isnull(rolId,0) as rolId
          ,isnull(numero,'') as numero
          ,isnull(nombre,'') as nombre
      FROM [dbo].[tblEmpleados]
     END
     /*:::::::::::::::: READ ONE [tblEmpleados]:::::::::::::::::::::::::*/
     IF @cmd=3
     BEGIN 
      SELECT [id]
          ,isnull(rolId,0) as rolId
          ,isnull(numero,'') as numero
          ,isnull(nombre,'') as nombre
      FROM [dbo].[tblEmpleados]
      where id = @id
     END
     /*:::::::::::::::: UPDATE ONE [tblEmpleados]:::::::::::::::::::::::::*/
     IF @cmd=4
     BEGIN 
      UPDATE [dbo].[tblEmpleados] SET
           [rolId] = @rolId
          ,[numero] = @numero
          ,[nombre] = @nombre
      FROM [dbo].[tblEmpleados]
      where id = @id
     END     
     /*:::::::::::::::: DELETE ONE [tblEmpleados]:::::::::::::::::::::::::*/
     IF @cmd=5
     BEGIN 
      Delete tblEmpleados 
      where id = @id
     END
    /*:::::::::::::::: END CRUD [tblEmpleados]:::::::::::::::::::::::::*/
END



