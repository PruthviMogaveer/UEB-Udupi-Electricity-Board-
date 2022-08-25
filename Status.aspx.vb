Public Class Status
    Inherits System.Web.UI.Page
    Dim cc As New connectionClass
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Public Sub Show()
        cc.connect()
        cc.cmd.CommandText = "SELECT Mobile_No FROM tblCustomer WHERE Mobile_No = '" + MobileNo.Value + "'"
        cc.cmd.Connection = cc.cnn
        cc.dr = cc.cmd.ExecuteReader()
        If (cc.dr.HasRows) Then
            Session("MobNo") = MobileNo.Value
            Response.Redirect("Status.aspx")
        Else
            If (MsgBox("The entered mobile number does not exist")) Then
                Response.Redirect("Status.aspx")
            End If
        End If
    End Sub

End Class