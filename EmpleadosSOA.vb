Imports System.Data.SqlClient
Imports System.Data

Public Class EmpleadosDTO

Dim Obj As New ObjData
Private Function GetParametersSql(byval cmd as String, byval empleados As Empleados) As SqlParameter()
  Dim parameters() As SqlParameter = {
      New SqlParameter("@cmd", SqlDbType.Int) With {.Value = cmd},
      New SqlParameter("@id", SqlDbType.Int) With {.Value = Empleados.id },  
      New SqlParameter("@rolId", SqlDbType.int) With {.Value = empleados.rolId }, 

      New SqlParameter("@numero", SqlDbType.varchar) With {.Value = empleados.numero }, 

      New SqlParameter("@nombre", SqlDbType.varchar) With {.Value = empleados.nombre }, 
   }
   return parameters.ToArray()
End Function

Private Sub Save(ByVal empleados As Empleados) 
  Dim cmd As String
      If empleados.id = 0 Then
          cmd = 1
      Else
          cmd = 4
   End If
   Obj.ExecProcedureOneWay("pEmpleados", 1, GetParametersSql(cmd, empleados))
End Sub

Private Function Find(ByVal id As Integer) As Empleados
     Dim empleados = New Empleados
      Dim result As DataSet
      result = Obj.FillDataSet("exec pEmpleados @cmd=3, id = " & id)
      For Each row As DataRow In result.Tables(0).Rows
      empleados.id = id      
      Empleados.rolId = row("rolId") 

      Empleados.numero = row("numero") 

      Empleados.nombre = row("nombre") 
      Next
      Return empleados
End Function

Private Function GetAll() As DataSet
     Dim result As DataSet
      result = Obj.FillDataSet("exec pEmpleados @cmd=2,")
      Return result
End Function

Private Sub Remove(ByVal id As Integer)
      Obj.FillDataSet("exec pEmpleados @cmd=5, id = " & id)
End Sub

End Class

