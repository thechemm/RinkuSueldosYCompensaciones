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
     @montoBonoPorHora decimal(12,2) = NULL,
     @borradorbit bit= null,
     @fechaCrea datetime= null,
     @ultimaModificacion datetime= null
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
          ,[montoBonoPorHora]
          ,[fechaCrea])
      VALUES
          (@nombre
          ,@sueldoBase
          ,@horasJornada
          ,@diasPorSemana
          ,@montoAdicionalPorEntrega
          ,@montoBonoPorHora
          ,GETDATE())
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
          ,isnull(ultimaModificacion,0) as ultimaModificacion
      FROM [dbo].[tblEmpleadosRoles]
      where borradorbit is null
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
          ,isnull(ultimaModificacion,0) as ultimaModificacion
      FROM [dbo].[tblEmpleadosRoles]
      where id = @id
     END
     /*:::::::::::::::: UPDATE ONE [tblEmpleadosRoles]:::::::::::::::::::::::::*/
     IF @cmd=4
     BEGIN 
      UPDATE [dbo].[tblEmpleadosRoles] SET
           [ultimaModificacion] = getdate()
          ,[nombre] = @nombre
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
      UPDATE [dbo].[tblEmpleadosRoles] SET
           [ultimaModificacion] = getdate()
          ,[borradorbit] = 1
      FROM [dbo].[tblEmpleadosRoles]
      where id = @id
     END
/*:::::::::::::::: END CRUD [tblEmpleadosRoles]:::::::::::::::::::::::::*/
END



