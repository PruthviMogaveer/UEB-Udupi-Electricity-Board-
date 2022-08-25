Public Class BillRates
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

        If Not IsPostBack Then
            cc.connect()
            cc.cmd.CommandText = "SELECT Rate FROM tblRate"
            cc.cmd.Connection = cc.cnn
            cc.dr = cc.cmd.ExecuteReader()
            cc.dr.Read()
            Rate.Value = cc.dr.Item(0)
            cc.dr.Close()
            cc.cnn.Close()
        End If

    End Sub

    Public Sub Update()
        Dim d As DateTime
        d = Now
        cc.connect()
        cc.cmd.CommandText = "UPDATE tblRate SET Rate=" + Rate.Value + ", Date='" + d + "', Username ='" + Session("AdminName") + "'"
        cc.cmd.Connection = cc.cnn
        cc.cmd.ExecuteNonQuery()
        cc.cnn.Close()
    End Sub

End Class