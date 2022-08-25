Imports System.ComponentModel
Imports System.Net.Mail

Public Class CustDelete
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

        If (Session("DelCustNo") IsNot Nothing) Then
            CustomerNo.Value = Session("DelCustNo")
        Else

        End If

    End Sub

    Public Sub Del()
        cc.connect()
        cc.cmd.CommandText = "SELECT Username FROM tblCustomer WHERE Customer_No = '" + CustomerNo.Value + "' AND Deleted ='No'"
        cc.cmd.Connection = cc.cnn
        cc.dr = cc.cmd.ExecuteReader()
        If (Not cc.dr.HasRows) Then
            If (MsgBox("Invalid customer number")) Then
                cc.dr.Close()
                cc.cnn.Close()
                Response.Redirect("CustDelete.aspx")
            End If
        End If
        cc.dr.Close()
        Dim t As String = "Sub"
        Dim y As String = "Yes"
        Dim n As String = "No"
        cc.cmd.CommandText = "SELECT Name FROM tblAdmin WHERE Username = '" + Session("AdminName") + "' COLLATE Latin1_General_CS_AS AND Type = '" + t + "' AND Deleted = '" + n + "'"
        cc.cmd.Connection = cc.cnn
        cc.dr = cc.cmd.ExecuteReader()
        If (cc.dr.HasRows) Then
            If (MsgBox("You are not authorized to perform this operation.")) Then
                cc.dr.Close()
                cc.cnn.Close()
                Response.Redirect("AdminHome.aspx")
            End If
        End If
        cc.dr.Close()
        cc.cnn.Close()

        Dim mm As New MailMessage()
        Dim smtp As New SmtpClient("smtp.gmail.com")
        cc.connect()
        Select Case MsgBox("Are you sure you want to remove this customer's connection??", MsgBoxStyle.YesNoCancel, "Confirmation")
            Case MsgBoxResult.Yes

            Case MsgBoxResult.No
                cc.cmd.CommandText = "SELECT RemoveConn FROM tblCustomer WHERE RemoveConn = '" + y + "' AND Customer_No = '" + CustomerNo.Value + "'"
                cc.cmd.Connection = cc.cnn
                cc.dr = cc.cmd.ExecuteReader()
                If (cc.dr.HasRows) Then
                    cc.cmd.CommandText = "UPDATE tblCustomer SET RemoveConn = '" + n + "' WHERE Customer_No = '" + CustomerNo.Value + "'"
                    cc.cmd.Connection = cc.cnn
                    cc.dr.Close()
                    cc.cmd.ExecuteNonQuery()
                    cc.cmd.CommandText = "SELECT Email FROM tblCustomer WHERE Customer_No = '" + CustomerNo.Value + "'"
                    cc.cmd.Connection = cc.cnn
                    cc.dr = cc.cmd.ExecuteReader()
                    cc.dr.Read()
                    mm.From = New MailAddress("udupieb@gmail.com")
                    mm.To.Add(cc.dr.Item(0))
                    mm.Subject = "Request declined"
                    mm.Body = "Request to remove your electricity connection has been declined. For further queries mail the same."
                    smtp.Port = 587
                    smtp.EnableSsl = True
                    smtp.UseDefaultCredentials = False
                    smtp.Credentials = New System.Net.NetworkCredential("udupieb@gmail.com", "iapiktlufgoykpzi")
                    smtp.Send(mm)
                    MsgBox("mail sent")
                    cc.dr.Close()
                    cc.cnn.Close()
                End If
                Response.Redirect("CustDelete.aspx")
            Case MsgBoxResult.Cancel
                cc.cnn.Close()
                Response.Redirect("CustDelete.aspx")
        End Select
        cc.cmd.CommandText = "SELECT Customer_No FROM tblBill WHERE Customer_No = '" + CustomerNo.Value + "' AND Paid ='" + n + "'"
        cc.cmd.Connection = cc.cnn
        cc.dr = cc.cmd.ExecuteReader()
        If (cc.dr.HasRows) Then
            cc.dr.Read()
            If (MsgBox(cc.dr.Item(0) & " Has not yet paid his bills, so his/her connection cannot be removed")) Then
                cc.dr.Close()
                cc.cnn.Close()
                Response.Redirect("CustDelete.aspx")
            End If
        End If
        cc.dr.Close()
        cc.cmd.CommandText = "SELECT Email, Name FROM tblCustomer WHERE Customer_No = '" + CustomerNo.Value + "' AND Deleted = '" + n + "'"
        cc.cmd.Connection = cc.cnn
        cc.dr = cc.cmd.ExecuteReader()
        cc.dr.Read()
        mm.From = New MailAddress("udupieb@gmail.com")
        mm.To.Add(cc.dr.Item(0))
        mm.Subject = "Connection removed successfully"
        mm.Body = cc.dr.Item(1) & ", Your electricity connection has been successfully removed."
        smtp.Port = 587
        smtp.EnableSsl = True
        smtp.UseDefaultCredentials = False
        smtp.Credentials = New System.Net.NetworkCredential("udupieb@gmail.com", "iapiktlufgoykpzi")
        smtp.Send(mm)
        MsgBox("mail sent")
        cc.dr.Close()

        cc.cmd.CommandText = "SELECT Username FROM tblCustomer WHERE Customer_No = '" + CustomerNo.Value + "' AND Deleted = '" + n + "'"
        cc.cmd.Connection = cc.cnn
        cc.dr = cc.cmd.ExecuteReader()
        cc.dr.Read()
        Dim u As String

        Try
            u = cc.dr.Item(0)
        Catch ex As Exception
            u = " "
        End Try
        cc.dr.Close()

        cc.cmd.CommandText = "DELETE FROM tblComplaint WHERE Cust_Name = '" + u + "' COLLATE Latin1_General_CS_AS"
        cc.cmd.Connection = cc.cnn
        cc.cmd.ExecuteNonQuery()

        cc.cmd.CommandText = "DELETE FROM tblFeedback WHERE Name = '" + u + "' COLLATE Latin1_General_CS_AS"
        cc.cmd.Connection = cc.cnn
        cc.cmd.ExecuteNonQuery()

        cc.cmd.CommandText = "DELETE FROM tblCustLogin WHERE Username = '" + u + "' COLLATE Latin1_General_CS_AS"
        cc.cmd.Connection = cc.cnn
        cc.cmd.ExecuteNonQuery()

        cc.cmd.CommandText = "INSERT INTO tblPastBill SELECT Name, Customer_No, RR_No, Location_Code, Meter_No, Sub_Division, Prev_Reading, Cur_Reading, Issued_Date, Bill_No, Penalty, Amount, Due_Date FROM tblBill WHERE (Customer_No = '" + CustomerNo.Value + "')"
        cc.cmd.Connection = cc.cnn
        cc.cmd.ExecuteNonQuery()

        cc.cmd.CommandText = "DELETE FROM tblBill WHERE Customer_No = '" + CustomerNo.Value + "'"
        cc.cmd.Connection = cc.cnn
        cc.cmd.ExecuteNonQuery()

        cc.cmd.CommandText = "UPDATE tblCustomer SET RemoveConn = '" + n + "', Deleted ='" + y + "' WHERE Customer_No = '" + CustomerNo.Value + "'"
        cc.cmd.Connection = cc.cnn
        cc.cmd.ExecuteNonQuery()

        cc.cnn.Close()
        Session("DelCustNo") = " "
        MsgBox("Record deleted Successfully")
        Response.Redirect("CustDelete.aspx")

    End Sub

End Class