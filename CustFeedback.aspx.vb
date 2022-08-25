Public Class Feedback
    Inherits System.Web.UI.Page
    Dim cc As New connectionClass

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            If (Session("CustName").Equals(" ")) Then
                If (MsgBox("Your session has expired please re-login")) Then
                    Response.Redirect("CustomerLogin.aspx")
                End If
            End If
        Catch ex As Exception
            If (MsgBox("Your session has expired please re-login")) Then
                Response.Redirect("CustomerLogin.aspx")
            End If
        End Try

        Name.Value = Session("CustName")
    End Sub

    Public Sub Submit()
        Dim d As Date
        d = Now()
        cc.connect()
        cc.cmd.CommandText = "INSERT INTO tblFeedback VALUES ('" + Name.Value + "', '" + Feedback.Value + "', '" + d + "')"
        cc.cmd.Connection = cc.cnn
        cc.cmd.ExecuteNonQuery()
        cc.cnn.Close()

        If (MsgBox("Your feedback has been recorded")) Then
            Response.Redirect("CustomerHome.aspx")
        End If
    End Sub

End Class