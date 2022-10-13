SET ANSI_NULLS ON 
Go
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pEmpleadosRoles]
-- Add the parameters for the stored procedure here
     @cmd int = 0,
     @id int = 0,
     @nombre varchar(200) = NULL,
     @sueldoBase decimal(12,2) = NULL,
     @horasJornada decimal(12,2) = NULL,
     @diasPorSemana int = NULL,
     @montoAdicionalPorEntrega decimal(12,2) = NULL,
     @montoBonoPorHora decimal(12,2) = NULL
AS
BEGIN
     SET NOCOUNT ON;
     /*:::::::::::::::: START CRUD [tblEmpleadosRoles]:::::::::::::::::::::::::*/
     /*:::::::::::::::: CREATE ONE [tblEmpleadosRoles]:::::::::::::::::::::::::*/
     IF @cmd=1
     BEGIN
      INSERT INTO [dbo].[tblEmpleadosRoles]
          ([nombre]
          ,[sueldoBase]
          ,[horasJornada]
          ,[diasPorSemana]
          ,[montoAdicionalPorEntrega]
          ,[montoBonoPorHora])
      VALUES
          (@nombre
          ,@sueldoBase
          ,@horasJornada
          ,@diasPorSemana
          ,@montoAdicionalPorEntrega
          ,@montoBonoPorHora)
      select @@identity
     END
     /*:::::::::::::::: READ ALL [tblEmpleadosRoles]:::::::::::::::::::::::::*/
     IF @cmd=2
      BEGIN 
      SELECT [id]
          ,isnull(nombre,'') as nombre
          ,isnull(sueldoBase,'') as sueldoBase
          ,isnull(horasJornada,'') as horasJornada
          ,isnull(diasPorSemana,0) as diasPorSemana
          ,isnull(montoAdicionalPorEntrega,'') as montoAdicionalPorEntrega
          ,isnull(montoBonoPorHora,'') as montoBonoPorHora
      FROM [dbo].[tblEmpleadosRoles]
     END
     /*:::::::::::::::: READ ONE [tblEmpleadosRoles]:::::::::::::::::::::::::*/
     IF @cmd=3
     BEGIN 
      SELECT [id]
          ,isnull(nombre,'') as nombre
          ,isnull(sueldoBase,'') as sueldoBase
          ,isnull(horasJornada,'') as horasJornada
          ,isnull(diasPorSemana,0) as diasPorSemana
          ,isnull(montoAdicionalPorEntrega,'') as montoAdicionalPorEntrega
          ,isnull(montoBonoPorHora,'') as montoBonoPorHora
      FROM [dbo].[tblEmpleadosRoles]
      where id = @id
     END
     /*:::::::::::::::: UPDATE ONE [tblEmpleadosRoles]:::::::::::::::::::::::::*/
     IF @cmd=4
     BEGIN 
      UPDATE [dbo].[tblEmpleadosRoles] SET
           [nombre] = @nombre
          ,[sueldoBase] = @sueldoBase
          ,[horasJornada] = @horasJornada
          ,[diasPorSemana] = @diasPorSemana
          ,[montoAdicionalPorEntrega] = @montoAdicionalPorEntrega
          ,[montoBonoPorHora] = @montoBonoPorHora
      FROM [dbo].[tblEmpleadosRoles]
      where id = @id
     END     /*:::::::::::::::: DELETE ONE [tblEmpleadosRoles]:::::::::::::::::::::::::*/
     IF @cmd=5
     BEGIN 
      delete[dbo].[tblEmpleadosRoles]
      where id = @id
     END
/*:::::::::::::::: END CRUD [tblEmpleadosRoles]:::::::::::::::::::::::::*/
END



