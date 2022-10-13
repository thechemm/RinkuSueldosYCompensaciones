SET ANSI_NULLS ON 
Go
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ptblCatMeses]
-- Add the parameters for the stored procedure here
     @cmd int = 0,
     @id int = 0,
     @nombre varchar(200) = NULL
AS
BEGIN
     SET NOCOUNT ON;
     /*:::::::::::::::: START CRUD [tbltblCatMeses]:::::::::::::::::::::::::*/
     /*:::::::::::::::: CREATE ONE [tbltblCatMeses]:::::::::::::::::::::::::*/
     IF @cmd=1
     BEGIN
      INSERT INTO [dbo].[tbltblCatMeses]
          ([nombre])
      VALUES
          (@nombre)
      select @@identity
     END
     /*:::::::::::::::: READ ALL [tbltblCatMeses]:::::::::::::::::::::::::*/
     IF @cmd=2
      BEGIN 
      SELECT [id]
          ,isnull(nombre,'') as nombre
      FROM [dbo].[tbltblCatMeses]
     END
     /*:::::::::::::::: READ ONE [tbltblCatMeses]:::::::::::::::::::::::::*/
     IF @cmd=3
     BEGIN 
      SELECT [id]
          ,isnull(nombre,'') as nombre
      FROM [dbo].[tbltblCatMeses]
      where id = @id
     END
     /*:::::::::::::::: UPDATE ONE [tbltblCatMeses]:::::::::::::::::::::::::*/
     IF @cmd=4
     BEGIN 
      UPDATE [dbo].[tbltblCatMeses] SET
          [nombre] = @nombre
      FROM [dbo].[tbltblCatMeses]
      where id = @id
     END     /*:::::::::::::::: DELETE ONE [tbltblCatMeses]:::::::::::::::::::::::::*/
     IF @cmd=5
     BEGIN 
     delete [dbo].[tbltblCatMeses]
      where id = @id
     END
/*:::::::::::::::: END CRUD [tbltblCatMeses]:::::::::::::::::::::::::*/
END



