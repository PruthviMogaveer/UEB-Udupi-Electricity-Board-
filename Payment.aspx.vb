Public Class Payment
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

    Public Sub Bill()
        Dim y As String = "Yes"
        cc.connect()
        'cc.cmd.CommandText = "SELECT Paid FROM tblBill WHERE Customer_No = '" + Session("CustNo") + "' AND Paid = '" + y + "'"
        'cc.cmd.Connection = cc.cnn
        'cc.dr = cc.cmd.ExecuteReader()
        'If (cc.dr.HasRows) Then
        '    If (MsgBox("Bill already paid")) Then
        '        cc.dr.Close()
        '        cc.cnn.Close()
        '        Response.Redirect("ViewBill.aspx")
        '    End If
        'End If
        'cc.dr.Close()
        cc.cmd.CommandText = "UPDATE tblBill SET Paid ='" + y + "'  WHERE Customer_No = '" + Session("CustNo") + "'"
        cc.cmd.Connection = cc.cnn
        cc.cmd.ExecuteNonQuery()
        Dim z As Integer = 0
        'cc.cmd.CommandText = "UPDATE tblBill SET Penalty =" + z.ToString + "  WHERE Customer_No = '" + Session("CustNo") + "'"
        'cc.cmd.Connection = cc.cnn
        'cc.cmd.ExecuteNonQuery()
        'cc.cmd.CommandText = "SELECT Name, Customer_No, RR_No, Location_Code, Meter_No, Sub_Division, Prev_Reading, Cur_Reading, Issued_Date, Bill_No, Penalty, Amount, Due_Date FROM tblBill WHERE Customer_No = '" + Session("CustNo") + "'"
        'cc.cmd.Connection = cc.cnn
        'cc.dr = cc.cmd.ExecuteReader()
        'If (cc.dr.HasRows) Then
        '    cc.dr.Read()
        '    Dim Name As String = cc.dr.Item(0)
        '    Dim Customer_No As String = cc.dr.Item(1)
        '    Dim RR_No As String = cc.dr.Item(2)
        '    Dim Location_Code As String = cc.dr.Item(3)
        '    Dim Meter_No As String = cc.dr.Item(4)
        '    Dim Sub_Division As String = cc.dr.Item(5)
        '    Dim Prev_Reading As String = cc.dr.Item(6)
        '    Dim Cur_Reading As String = cc.dr.Item(7)
        '    Dim Issued_Date As String = cc.dr.Item(8)
        '    Dim Bill_No As String = cc.dr.Item(9)
        '    Dim Penalty As String = cc.dr.Item(10)
        '    Dim Amount As String = cc.dr.Item(11)
        '    Dim Due_Date As String = cc.dr.Item(12)
        '    cc.cmd.CommandText = "INSERT INTO tblPastBill VALUES ('" + Name + "', '" + Customer_No + "', '" + RR_No + "', '" + Location_Code + "', '" + Meter_No + "', '" + Sub_Division + "', '" + Prev_Reading + "', '" + Cur_Reading + "', '" + Issued_Date + "', '" + Bill_No + "', '" + Penalty + "', '" + Amount + "', '" + Due_Date + "')"
        '    cc.dr.Close()
        '    cc.cmd.Connection = cc.cnn
        '    cc.cmd.ExecuteNonQuery()
        'cc.cmd.CommandText = "INSERT INTO tblPastBill select Name, Customer_No, RR_No, Location_Code, Meter_No, Sub_Division, Prev_Reading, Cur_Reading, Issued_Date, Bill_No, Penalty, Amount, Due_Date FROM tblBill WHERE Customer_No = '" + Session("CustNo") + "'"
        'cc.cmd.Connection = cc.cnn
        'cc.cmd.ExecuteNonQuery()
        If (MsgBox("Bill payed successfully")) Then
            Response.Redirect("CustomerHome.aspx")
        End If
        'End If

    End Sub

End Class