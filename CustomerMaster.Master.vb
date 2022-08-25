Public Class CustomerMaster
    Inherits System.Web.UI.MasterPage
    Dim cc As New connectionClass
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load



    End Sub

    Public Sub DeleteAcc()
        Select Case MsgBox("Are you sure to delete you account", MsgBoxStyle.YesNo, "Delete Account")
            Case MsgBoxResult.Yes
                cc.connect()
                Dim y As String = "Yes"
                cc.cmd.CommandText = "DELETE FROM tblComplaint WHERE Cust_Name = '" + Session("CustName") + "' COLLATE Latin1_General_CS_AS"
                cc.cmd.Connection = cc.cnn
                cc.cmd.ExecuteNonQuery()

                cc.cmd.CommandText = "DELETE FROM tblFeedback WHERE Name = '" + Session("CustName") + "' COLLATE Latin1_General_CS_AS"
                cc.cmd.Connection = cc.cnn
                cc.cmd.ExecuteNonQuery()

                cc.cmd.CommandText = "DELETE FROM tblCustLogin WHERE Username = '" + Session("CustName") + "' COLLATE Latin1_General_CS_AS"
                cc.cmd.Connection = cc.cnn
                cc.cmd.ExecuteNonQuery()

                cc.cmd.CommandText = "UPDATE tblCustomer SET Username = NULL, Password = NULL WHERE Customer_No = " + Session("CustNo") + " AND Deleted = 'No'"
                cc.cmd.Connection = cc.cnn
                cc.cmd.ExecuteNonQuery()
                cc.cnn.Close()
                If (MsgBox("Your account has been deleted")) Then
                    Response.Redirect("Home.aspx")
                End If
            Case MsgBoxResult.No

        End Select
    End Sub

    Public Sub DeleteConn()
        cc.connect()
        Dim n As String = "No"
        cc.cmd.CommandText = "SELECT Customer_No FROM tblBill WHERE Customer_No = '" + Session("CustNo") + "' AND Paid ='" + n + "'"
        cc.cmd.Connection = cc.cnn
        cc.dr = cc.cmd.ExecuteReader()
        If (cc.dr.HasRows) Then
            cc.dr.Read()
            If (MsgBox("You have not yet paid your bills so, your connection cannot be removed")) Then
                cc.dr.Close()
                cc.cnn.Close()
                Response.Redirect("CustomerHome.aspx")
            End If
        End If
        cc.dr.Close()

        Select Case MsgBox("Are you sure to cut your electricity  connection", MsgBoxStyle.YesNo, "Cut Electricity Connection")
            Case MsgBoxResult.Yes
                Dim y As String = "Yes"
                cc.cmd.CommandText = "UPDATE tblCustomer SET RemoveConn = '" + y + "' WHERE (Customer_No = '" + Session("CustNo") + "') "
                cc.cmd.Connection = cc.cnn
                cc.cmd.ExecuteNonQuery()
                cc.cnn.Close()
                If (MsgBox("Your request has been sent and will be delth with ASAP")) Then
                    Response.Redirect("Home.aspx")
                Else
                    Response.Redirect("Home.aspx")
                End If
            Case MsgBoxResult.No
                cc.cnn.Close()
        End Select
    End Sub

End Class