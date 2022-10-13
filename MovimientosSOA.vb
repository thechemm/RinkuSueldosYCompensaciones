Imports System.Data.SqlClient
Imports System.Data

Public Class MovimientosDTO

Dim Obj As New ObjData
Private Function GetParametersSql(byval cmd as String, byval movimientos As Movimientos) As SqlParameter()
  Dim parameters() As SqlParameter = {
      New SqlParameter("@cmd", SqlDbType.Int) With {.Value = cmd},
      New SqlParameter("@id", SqlDbType.Int) With {.Value = Movimientos.id },  
      New SqlParameter("@idEmpleado", SqlDbType.long) With {.Value = movimientos.idEmpleado }, 

      New SqlParameter("@numEntregas", SqlDbType.int) With {.Value = movimientos.numEntregas }, 

      New SqlParameter("@idMes", SqlDbType.int) With {.Value = movimientos.idMes }, 

      New SqlParameter("@anio", SqlDbType.int) With {.Value = movimientos.anio }, 
   }
   return parameters.ToArray()
End Function

Private Sub Save(ByVal movimientos As Movimientos) 
  Dim cmd As String
      If movimientos.id = 0 Then
          cmd = 1
      Else
          cmd = 4
   End If
   Obj.ExecProcedureOneWay("pMovimientos", 1, GetParametersSql(cmd, movimientos))
End Sub

Private Function Find(ByVal id As Integer) As Movimientos
     Dim movimientos = New Movimientos
      Dim result As DataSet
      result = Obj.FillDataSet("exec pMovimientos @cmd=3, id = " & id)
      For Each row As DataRow In result.Tables(0).Rows
      movimientos.id = id      
      Movimientos.idEmpleado = row("idEmpleado") 

      Movimientos.numEntregas = row("numEntregas") 

      Movimientos.idMes = row("idMes") 

      Movimientos.anio = row("anio") 
      Next
      Return movimientos
End Function

Private Function GetAll() As DataSet
     Dim result As DataSet
      result = Obj.FillDataSet("exec pMovimientos @cmd=2,")
      Return result
End Function

Private Sub Remove(ByVal id As Integer)
      Obj.FillDataSet("exec pMovimientos @cmd=5, id = " & id)
End Sub

End Class

