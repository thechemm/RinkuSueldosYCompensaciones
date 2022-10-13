Imports System.Data.SqlClient
Imports System.Data

Public Class TblporcentajevalesDTO

Dim Obj As New ObjData
Private Function GetParametersSql(byval cmd as String, byval tblporcentajevales As Tblporcentajevales) As SqlParameter()
  Dim parameters() As SqlParameter = {
      New SqlParameter("@cmd", SqlDbType.Int) With {.Value = cmd},
      New SqlParameter("@id", SqlDbType.Int) With {.Value = Tblporcentajevales.id },  
      New SqlParameter("@porcentaje", SqlDbType.decimal) With {.Value = tblporcentajevales.porcentaje }, 
   }
   return parameters.ToArray()
End Function

Private Sub Save(ByVal tblporcentajevales As Tblporcentajevales) 
  Dim cmd As String
      If tblporcentajevales.id = 0 Then
          cmd = 1
      Else
          cmd = 4
   End If
   Obj.ExecProcedureOneWay("pTblporcentajevales", 1, GetParametersSql(cmd, tblporcentajevales))
End Sub

Private Function Find(ByVal id As Integer) As Tblporcentajevales
     Dim tblporcentajevales = New Tblporcentajevales
      Dim result As DataSet
      result = Obj.FillDataSet("exec pTblporcentajevales @cmd=3, id = " & id)
      For Each row As DataRow In result.Tables(0).Rows
      tblporcentajevales.id = id      
      Tblporcentajevales.porcentaje = row("porcentaje") 
      Next
      Return tblporcentajevales
End Function

Private Function GetAll() As DataSet
     Dim result As DataSet
      result = Obj.FillDataSet("exec pTblporcentajevales @cmd=2,")
      Return result
End Function

Private Sub Remove(ByVal id As Integer)
      Obj.FillDataSet("exec pTblporcentajevales @cmd=5, id = " & id)
End Sub

End Class

