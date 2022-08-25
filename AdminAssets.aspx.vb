Public Class AdminAssets
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

        Username.Value = Session("AdminName")
    End Sub

    Public Sub Add()
        'Try
        cc.connect()
            cc.cmd.CommandText = "SELECT Assets FROM tblAssets WHERE Assets = '" + Assets.Value + "'"
            cc.cmd.Connection = cc.cnn
            cc.dr = cc.cmd.ExecuteReader()
        If (cc.dr.HasRows()) Then
            If (MsgBox("This asset already exists")) Then
                cc.dr.Close()
                Response.Redirect("AdminAssets.aspx")
            End If

        End If
        cc.dr.Close()
        If (CInt(In_Use.Value) > CInt(Total.Value) Or CInt(Active.Value) > CInt(In_Use.Value)) Then
            If (MsgBox("Incorrect values inserted")) Then
                Response.Redirect("AdminAssets.aspx")
            End If
        End If
        Dim a As String = In_Use.Value - Active.Value
        cc.cmd.CommandText = "INSERT INTO tblAssets VALUES ('" + Assets.Value + "', " + Total.Value + ", " + In_Use.Value + ", " + Active.Value + ", '" + a + "', '" + Username.Value + "')"
        cc.cmd.Connection = cc.cnn
            cc.cmd.ExecuteNonQuery()
            cc.cnn.Close()
            Response.Redirect("AdminAssets.aspx")
        'Catch ex As Exception
        '    MsgBox("Assets could not be added.")
        'End Try

    End Sub

End Class