Imports System.Data.SqlClient
Imports System.Data

Public Class TblcatmesesDTO

Dim Obj As New ObjData
Private Function GetParametersSql(byval cmd as String, byval tblcatmeses As Tblcatmeses) As SqlParameter()
  Dim parameters() As SqlParameter = {
      New SqlParameter("@cmd", SqlDbType.Int) With {.Value = cmd},
      New SqlParameter("@id", SqlDbType.Int) With {.Value = Tblcatmeses.id },  
      New SqlParameter("@nombre", SqlDbType.varchar) With {.Value = tblcatmeses.nombre }, 
   }
   return parameters.ToArray()
End Function

Private Sub Save(ByVal tblcatmeses As Tblcatmeses) 
  Dim cmd As String
      If tblcatmeses.id = 0 Then
          cmd = 1
      Else
          cmd = 4
   End If
   Obj.ExecProcedureOneWay("pTblcatmeses", 1, GetParametersSql(cmd, tblcatmeses))
End Sub

Private Function Find(ByVal id As Integer) As Tblcatmeses
     Dim tblcatmeses = New Tblcatmeses
      Dim result As DataSet
      result = Obj.FillDataSet("exec pTblcatmeses @cmd=3, id = " & id)
      For Each row As DataRow In result.Tables(0).Rows
      tblcatmeses.id = id      
      Tblcatmeses.nombre = row("nombre") 
      Next
      Return tblcatmeses
End Function

Private Function GetAll() As DataSet
     Dim result As DataSet
      result = Obj.FillDataSet("exec pTblcatmeses @cmd=2,")
      Return result
End Function

Private Sub Remove(ByVal id As Integer)
      Obj.FillDataSet("exec pTblcatmeses @cmd=5, id = " & id)
End Sub

End Class

