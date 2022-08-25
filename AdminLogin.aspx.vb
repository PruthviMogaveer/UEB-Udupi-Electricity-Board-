Public Class AdminLogin
    Inherits System.Web.UI.Page
    Dim cc As New connectionClass

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Public Sub Login()
        Dim d As Date
        d = Now()
        cc.connect()
        cc.cmd.CommandText = "SELECT Username FROM tblAdmin WHERE Username='" + Username.Value + "' COLLATE Latin1_General_CS_AS AND Deleted = 'No'"
        cc.cmd.Connection = cc.cnn
        cc.dr = cc.cmd.ExecuteReader()

        If cc.dr.HasRows Then
            cc.cmd.CommandText = "SELECT Password FROM tblAdmin WHERE Password='" + Password.Value + "' COLLATE Latin1_General_CS_AS AND Username = '" + Username.Value + "' COLLATE Latin1_General_CS_AS AND Deleted = 'No'"
            cc.dr.Close()
            cc.cmd.Connection = cc.cnn
            cc.dr = cc.cmd.ExecuteReader()
            If cc.dr.HasRows Then
                Session("AdminName") = Username.Value
                cc.cmd.CommandText = "INSERT INTO tblAdminLogin VALUES ('" + Username.Value + "', '" + d + "')"
                cc.dr.Close()
                cc.cmd.Connection = cc.cnn
                cc.cmd.ExecuteNonQuery()
                cc.cnn.Close()
                Session("show") = "True"
                Session("showD") = "True"
                Response.Redirect("AdminHome.aspx")
            Else
                MsgBox("Incorrect Password")
            End If
        Else
            MsgBox("Username does not exist")
        End If

        cc.dr.Close()
        cc.cnn.Close()
    End Sub

End Class