Imports System.Net.Mail
Imports System.Net
Public Class AdminAssignDetails
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

        MobileNo.Value = Session("AssignMobNo")
        Dim locC As String
        locC = ""
        cc.connect()
        cc.cmd.CommandText = "SELECT Pin FROM tblCustomer WHERE Mobile_No = '" + MobileNo.Value + "'"
        cc.cmd.Connection = cc.cnn
        cc.dr = cc.cmd.ExecuteReader()
        If (cc.dr.HasRows()) Then
            cc.dr.Read()
            If (cc.dr.Item(0) = 576105) Then
                locC = "UDP0007"
            ElseIf (cc.dr.Item(0) = 576113) Then
                locC = "SAN1034"
            ElseIf (cc.dr.Item(0) = 576114) Then
                locC = "KAL4712"
            ElseIf (cc.dr.Item(0) = 576117) Then
                locC = "AMB9372"
            Else
                locC = "RAN0420"
            End If
            cc.dr.Close()
            'cc.cmd.CommandText = "INSERT INTO tblConnectionDetail VALUES(" + locCode + ") WHERE Mobile_No = '" + MobileNo.Value + "'"
            'cc.cmd.Connection = cc.cnn
            'cc.cmd.ExecuteNonQuery()
            cc.cnn.Close()
            LocCode.Value = locC
        End If

    End Sub

    Public Sub Assign()
        Dim y As String
        y = "Yes"
        Dim n As String = "No"
        cc.connect()

        'cc.cmd.CommandText = "INSERT INTO tblCustConnection(Name, Address, Email, Mobile_No, Aadhar_No) SELECT Name, Address, Email, Mobile_No, Aadhar_No FROM tblNewConnection WHERE Mobile_No = '" + MobileNo.Value + "'"
        'cc.cmd.Connection = cc.cnn
        'cc.cmd.ExecuteNonQuery()
        cc.cmd.CommandText = "SELECT * FROM tblCustomer WHERE RR_No = '" + RRno.Value + "' AND Customer_No = " + CustNo.Value + " AND Sub_Division = '" + SubDivi.Value + "' AND Location_Code = '" + LocCode.Value + "' AND Meter_Code = '" + MtrCode.Value + "' AND Deleted = '" + n + "'"
        cc.cmd.Connection = cc.cnn
        cc.dr = cc.cmd.ExecuteReader()
        If (cc.dr.HasRows) Then
            If (MsgBox("Credentials already registered")) Then
                cc.dr.Close()
                cc.cnn.Close()
                Response.Redirect("AdminAssignDetails.aspx")
            End If
        End If
        cc.dr.Close()

        cc.cmd.CommandText = "UPDATE tblCustomer SET RR_No = '" + RRno.Value + "', Customer_No = " + CustNo.Value + ", Sub_Division = '" + SubDivi.Value + "', Location_Code = '" + LocCode.Value + "', Meter_Code = '" + MtrCode.Value + "' WHERE Mobile_No = '" + MobileNo.Value + "'"
        cc.cmd.Connection = cc.cnn
        cc.cmd.ExecuteNonQuery()

        'cc.cmd.CommandText = "INSERT INTO tblConnectionDetail VALUES (" + MobileNo.Value + ", " + CustNo.Value + ", '" + RRno.Value + "', '" + LocCode.Value + "', '" + MtrCode.Value + "', '" + SubDivi.Value + "')"
        'cc.cmd.Connection = cc.cnn
        'cc.cmd.ExecuteNonQuery()
        cc.cmd.CommandText = "UPDATE tblCustomer SET Assign = '" + y + "' WHERE Mobile_No = '" + MobileNo.Value + "' "
        cc.cmd.Connection = cc.cnn
        cc.cmd.ExecuteNonQuery()

        cc.cmd.CommandText = "SELECT Name, Email FROM tblCustomer WHERE Mobile_No = '" + MobileNo.Value + "'"
        cc.cmd.Connection = cc.cnn
        cc.dr = cc.cmd.ExecuteReader()

        If cc.dr.HasRows Then
            cc.dr.Read()
            Dim mm As New MailMessage()
            mm.From = New MailAddress("udupieb@gmail.com")
            mm.To.Add(cc.dr.Item(1))
            mm.Subject = "Connection Details Assigned"
            mm.Body = "Hello " & cc.dr.Item(0) & vbLf & " We have assigned you your new connection details. Which are as follows" &
                vbLf & "Customer No: " & CustNo.Value &
                vbLf & "RR No: " & RRno.Value &
                vbLf & "Location Code: " & LocCode.Value &
                vbLf & "Meter Code: " & MtrCode.Value &
                vbLf & "Sub Division: " & SubDivi.Value &
                vbLf & "You can check it In the status tab by entering your registered mobile no. , also make sure that you sign up To avail the various online services available."

            Dim smtp As New SmtpClient("smtp.gmail.com")
            smtp.Port = 587
            smtp.EnableSsl = True
            smtp.UseDefaultCredentials = False
            smtp.Credentials = New System.Net.NetworkCredential("udupieb@gmail.com", "iapiktlufgoykpzi")
            smtp.Send(mm)
            MsgBox("mail sent")
            Session("AssisnMobNo") = " "
        End If
        cc.dr.Close()
        cc.cnn.Close()

        If (MsgBox("Record Inserted Successfully")) Then
            Response.Redirect("AdminHome.aspx")
        End If


    End Sub

End Class