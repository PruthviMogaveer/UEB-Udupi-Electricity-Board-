Imports System.ComponentModel
Imports System.Net.Mail
Public Class CustReg
    Inherits System.Web.UI.Page

    ReadOnly cc As New connectionClass

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Public Sub Register()
        'cc.connect()
        'cc.cmd.CommandText = "SELECT Email, Name FROM tblCustConnection WHERE Customer_No = '" + CustomerNo.Value + "'"
        'cc.cmd.Connection = cc.cnn
        'cc.dr = cc.cmd.ExecuteReader()
        'cc.dr.Read()
        Dim v
        Randomize()
        v = CInt((999999 * Rnd()) + 100000)
        Dim mm As New MailMessage()
        mm.From = New MailAddress("udupieb@gmail.com")
        mm.To.Add(Email.Value)
        mm.Subject = "Verification code"
        mm.Body = "The verification code is " & v
        Dim smtp As New SmtpClient("smtp.gmail.com")
        smtp.Port = 587
        smtp.EnableSsl = True
        smtp.UseDefaultCredentials = False
        smtp.Credentials = New System.Net.NetworkCredential("udupieb@gmail.com", "iapiktlufgoykpzi")
        Try
            smtp.Send(mm)
        Catch ex As Exception
            If (MsgBox("Mail not able to be sent")) Then
                Response.Redirect("CustReg.aspx")
            End If
        End Try
        MsgBox("mail sent")

        If (MsgBox("A verification code has been send to your mail")) Then
            Dim res = 0
            While (v <> res)
                Try
                    res = InputBox("Enter the verification code sent", "Verification")
                    If (v <> res) Then
                        MsgBox("Incorrect verification code")
                    End If
                Catch ex As Exception
                    MsgBox("Incorrect verification code")
                End Try
        End While
        End If


        Dim n As String
        n = "No"

        Dim filename As String
        filename = ImageUpload.PostedFile.FileName
        Dim filepath As String
        filepath = "~/assets/images/" + ImageUpload.PostedFile.FileName
        ImageUpload.PostedFile.SaveAs(Server.MapPath("~/assets/images/") + filename)

        cc.connect()
        cc.cmd.CommandText = "SELECT * FROM tblCustomer WHERE Email = '" + Email.Value + "' OR Mobile_No = '" + Phone.Value + "' OR Aadhar_No = '" + Aadhar.Value + "' AND Deleted='" + n + "' "
        cc.cmd.Connection = cc.cnn
        cc.dr = cc.cmd.ExecuteReader()
        If (cc.dr.HasRows) Then
            If (MsgBox("Entered credentials have already been registered")) Then
                cc.dr.Close()
                Response.Redirect("CustReg.aspx")
            End If
            cc.dr.Close()
        End If
        cc.dr.Close()
        Dim r As String = CLng(Math.Floor((999999999999 - 100000000000 + 1) * Rnd())) + 100000000000
        cc.cmd.CommandText = "INSERT INTO tblCustomer (Name, Address, Pin, Email, Mobile_No, Aadhar_No, CustImage, Customer_No) VALUES ('" + Name.Value.ToUpper() + "', '" + Address.Value.ToUpper() + "'," + Pin.Value + ",'" + Email.Value + "', " + Phone.Value + "," + Aadhar.Value + ", '" + filepath + "', '" + r + "' )"
        cc.cmd.Connection = cc.cnn
        cc.cmd.ExecuteNonQuery()
        cc.cnn.Close()

        If (MsgBox("You have registred successfully")) Then
            Response.Redirect("Home.aspx")
        End If
    End Sub
End Class