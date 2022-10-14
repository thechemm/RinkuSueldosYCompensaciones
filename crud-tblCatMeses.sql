use db_Rinku
SET ANSI_NULLS ON 
Go
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pCatMeses]
-- Add the parameters for the stored procedure here
     @cmd int = 0,
     @id int = 0,
     @nombre varchar(200) = NULL
AS
BEGIN
     SET NOCOUNT ON;
     /*:::::::::::::::: START CRUD [pCatMeses]:::::::::::::::::::::::::*/
     /*:::::::::::::::: CREATE ONE [pCatMeses]:::::::::::::::::::::::::*/
     IF @cmd=1
     BEGIN
      INSERT INTO [dbo].[pCatMeses]
          ([nombre])
      VALUES
          (@nombre)
      select @@identity
     END
     /*:::::::::::::::: READ ALL [pCatMeses]:::::::::::::::::::::::::*/
     IF @cmd=2
      BEGIN 
      SELECT [id]
          ,isnull(nombre,'') as nombre
      FROM [dbo].[pCatMeses]
     END
     /*:::::::::::::::: READ ONE [pCatMeses]:::::::::::::::::::::::::*/
     IF @cmd=3
     BEGIN 
      SELECT [id]
          ,isnull(nombre,'') as nombre
      FROM [dbo].[pCatMeses]
      where id = @id
     END
     /*:::::::::::::::: UPDATE ONE [pCatMeses]:::::::::::::::::::::::::*/
     IF @cmd=4
     BEGIN 
      UPDATE [dbo].[pCatMeses] SET
          [nombre] = @nombre
      FROM [dbo].[pCatMeses]
      where id = @id
     END     /*:::::::::::::::: DELETE ONE [pCatMeses]:::::::::::::::::::::::::*/
     IF @cmd=5
     BEGIN 
     delete [dbo].[pCatMeses]
      where id = @id
     END
/*:::::::::::::::: END CRUD [pCatMeses]:::::::::::::::::::::::::*/
END



