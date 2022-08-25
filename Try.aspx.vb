Public Class _Try
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim d As DateTime
        d = Now
        MsgBox("The time is " & d.ToString("yyyy-MM-dd hh:mm:ss"))
    End Sub

End Class