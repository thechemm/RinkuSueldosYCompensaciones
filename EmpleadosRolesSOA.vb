Imports System.Data.SqlClient
Imports System.Data

Public Class EmpleadosrolesDTO

Dim Obj As New ObjData
Private Function GetParametersSql(byval cmd as String, byval empleadosroles As Empleadosroles) As SqlParameter()
  Dim parameters() As SqlParameter = {
      New SqlParameter("@cmd", SqlDbType.Int) With {.Value = cmd},
      New SqlParameter("@id", SqlDbType.Int) With {.Value = Empleadosroles.id },  
      New SqlParameter("@nombre", SqlDbType.varchar) With {.Value = empleadosroles.nombre }, 

      New SqlParameter("@sueldoBase", SqlDbType.decimal) With {.Value = empleadosroles.sueldoBase }, 

      New SqlParameter("@horasJornada", SqlDbType.decimal) With {.Value = empleadosroles.horasJornada }, 

      New SqlParameter("@diasPorSemana", SqlDbType.int) With {.Value = empleadosroles.diasPorSemana }, 

      New SqlParameter("@montoAdicionalPorEntrega", SqlDbType.decimal) With {.Value = empleadosroles.montoAdicionalPorEntrega }, 

      New SqlParameter("@montoBonoPorHora", SqlDbType.decimal) With {.Value = empleadosroles.montoBonoPorHora }, 
   }
   return parameters.ToArray()
End Function

Private Sub Save(ByVal empleadosroles As Empleadosroles) 
  Dim cmd As String
      If empleadosroles.id = 0 Then
          cmd = 1
      Else
          cmd = 4
   End If
   Obj.ExecProcedureOneWay("pEmpleadosroles", 1, GetParametersSql(cmd, empleadosroles))
End Sub

Private Function Find(ByVal id As Integer) As Empleadosroles
     Dim empleadosroles = New Empleadosroles
      Dim result As DataSet
      result = Obj.FillDataSet("exec pEmpleadosroles @cmd=3, id = " & id)
      For Each row As DataRow In result.Tables(0).Rows
      empleadosroles.id = id      
      Empleadosroles.nombre = row("nombre") 

      Empleadosroles.sueldoBase = row("sueldoBase") 

      Empleadosroles.horasJornada = row("horasJornada") 

      Empleadosroles.diasPorSemana = row("diasPorSemana") 

      Empleadosroles.montoAdicionalPorEntrega = row("montoAdicionalPorEntrega") 

      Empleadosroles.montoBonoPorHora = row("montoBonoPorHora") 
      Next
      Return empleadosroles
End Function

Private Function GetAll() As DataSet
     Dim result As DataSet
      result = Obj.FillDataSet("exec pEmpleadosroles @cmd=2,")
      Return result
End Function

Private Sub Remove(ByVal id As Integer)
      Obj.FillDataSet("exec pEmpleadosroles @cmd=5, id = " & id)
End Sub

End Class

