Public Class AdminFeedback
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

    Public Sub Submit()
        'Try
        Dim d As Date
            d = Now()
            cc.connect()
            cc.cmd.CommandText = "INSERT INTO tblFeedback VALUES ('" + Session("AdminName") + "', '" + Feedback.Value + "', '" + d + "')"
            cc.cmd.Connection = cc.cnn
            cc.cmd.ExecuteNonQuery()
            cc.cnn.Close()

            If (MsgBox("Your feedback has been recorded")) Then
                Response.Redirect("AdminHome.aspx")
            End If
        'Catch ex As Exception
        '    MsgBox("Your feedback could not be recorded.")
        'End Try

    End Sub

End Class