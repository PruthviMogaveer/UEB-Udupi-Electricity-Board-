Public Class ViewBill
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

    End Sub

    Public Sub Already()
        cc.connect()
        cc.cmd.CommandText = "SELECT Paid FROM tblBill WHERE Customer_No = '" + Session("CustNo").ToString + "'"
        cc.cmd.Connection = cc.cnn
        cc.dr = cc.cmd.ExecuteReader()
        cc.dr.Read()
        If (cc.dr.Item(0).Equals("Yes")) Then
            MsgBox("Bill already Payed")
        Else
            Response.Redirect("Payment.aspx")
        End If

    End Sub

End Class