Public Class AssignConn
    Inherits System.Web.UI.Page
    Dim cc As New connectionClass
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        MobileNo.Value = Session("AssignMobNo")
    End Sub

    Public Sub Assign()
        Dim y As String
        y = "Yes"
        cc.connect()
        cc.cmd.CommandText = "INSERT INTO tblConnectionDetail VALUES (" + MobileNo.Value + ", " + CustNo.Value + ", '" + RRno.Value + "', " + LocCode.Value + ", '" + MtrCode.Value + "', '" + SubDivi.Value + "')"
        cc.cmd.Connection = cc.cnn
        cc.cmd.ExecuteNonQuery()
        cc.cmd.CommandText = "UPDATE tblNewConnection SET Assign = '" + y + "' WHERE Mobile_No = " + MobileNo.Value + " "
        cc.cmd.Connection = cc.cnn
        cc.cmd.ExecuteNonQuery()
        cc.cnn.Close()
        If (MsgBox("Record Inserted Successfully")) Then
            Response.Redirect("AdminHome.aspx")
        End If
    End Sub
End Class