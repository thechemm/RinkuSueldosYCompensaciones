Imports System.Data.SqlClient
Imports System.Data

Public Class RetencionesDTO

Dim Obj As New ObjData
Private Function GetParametersSql(byval cmd as String, byval retenciones As Retenciones) As SqlParameter()
  Dim parameters() As SqlParameter = {
      New SqlParameter("@cmd", SqlDbType.Int) With {.Value = cmd},
      New SqlParameter("@id", SqlDbType.Int) With {.Value = Retenciones.id },  
      New SqlParameter("@porcentaje", SqlDbType.decimal) With {.Value = retenciones.porcentaje }, 

      New SqlParameter("@montoMinimo", SqlDbType.decimal) With {.Value = retenciones.montoMinimo }, 

      New SqlParameter("@montoMaximo", SqlDbType.decimal) With {.Value = retenciones.montoMaximo }, 
   }
   return parameters.ToArray()
End Function

Private Sub Save(ByVal retenciones As Retenciones) 
  Dim cmd As String
      If retenciones.id = 0 Then
          cmd = 1
      Else
          cmd = 4
   End If
   Obj.ExecProcedureOneWay("pRetenciones", 1, GetParametersSql(cmd, retenciones))
End Sub

Private Function Find(ByVal id As Integer) As Retenciones
     Dim retenciones = New Retenciones
      Dim result As DataSet
      result = Obj.FillDataSet("exec pRetenciones @cmd=3, id = " & id)
      For Each row As DataRow In result.Tables(0).Rows
      retenciones.id = id      
      Retenciones.porcentaje = row("porcentaje") 

      Retenciones.montoMinimo = row("montoMinimo") 

      Retenciones.montoMaximo = row("montoMaximo") 
      Next
      Return retenciones
End Function

Private Function GetAll() As DataSet
     Dim result As DataSet
      result = Obj.FillDataSet("exec pRetenciones @cmd=2,")
      Return result
End Function

Private Sub Remove(ByVal id As Integer)
      Obj.FillDataSet("exec pRetenciones @cmd=5, id = " & id)
End Sub

End Class

