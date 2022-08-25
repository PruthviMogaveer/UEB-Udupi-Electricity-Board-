Public Class DeletedAdmin
    Inherits System.Web.UI.Page
    Dim cc As New connectionClass
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            If (Session("AdminName").Equals(" ")) Then
                If (MsgBox("Your session has expired please re-login")) Then
                    Response.Redirect("AdminLogin.aspx")
                End If
            End If
        Catch ex As Exception
            If (MsgBox("Your session has expired please re-login")) Then
                Response.Redirect("AdminLogin.aspx")
            End If
        End Try
    End Sub

    'Public Sub RestoreAdmin()
    '    cc.connect()
    '    Dim n As String = "No"
    '    cc.cmd.CommandText = "UPDATE tblAdmin SET Deleted = '" + n + "' WHERE Mobile_No = '" + MobNo.Value + "'"
    '    cc.cmd.Connection = cc.cnn
    '    cc.cmd.ExecuteNonQuery()
    '    cc.cnn.Close()
    '    If (MsgBox("Admin restored Successfully")) Then
    '        Response.Redirect("AdminHome.aspx")
    '    End If
    'End Sub

End Class