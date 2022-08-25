Imports System.Net.Mail
Imports System.Net
Public Class ForgotPass
    Inherits System.Web.UI.Page
    Dim cc As New connectionClass

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Public Sub SendMail()
        cc.connect()
        cc.cmd.CommandText = "SELECT Email, Password FROM tblCustomer WHERE Email = '" + mail.Value + "'"
        cc.cmd.Connection = cc.cnn
        cc.dr = cc.cmd.ExecuteReader()

        If cc.dr.HasRows Then
            cc.dr.Read()
            Dim mm As New MailMessage()
            mm.From = New MailAddress("udupieb@gmail.com")
            mm.To.Add(cc.dr.Item(0))
            mm.Subject = "Your password"
            mm.Body = "This is your password " & cc.dr.Item(1)

            Dim smtp As New SmtpClient("smtp.gmail.com")
            smtp.Port = 587
            smtp.EnableSsl = True
            smtp.UseDefaultCredentials = False
            smtp.Credentials = New System.Net.NetworkCredential("udupieb@gmail.com", "iapiktlufgoykpzi")
            smtp.Send(mm)
            MsgBox("mail sent")
            cc.dr.Close()
            cc.cnn.Close()
        Else
            cc.dr.Close()
            cc.cnn.Close()
            cc.connect()
            cc.cmd.CommandText = "SELECT Email, Password FROM tblAdmin WHERE Email = '" + mail.Value + "'"
            cc.cmd.Connection = cc.cnn
            cc.dr = cc.cmd.ExecuteReader()

            If cc.dr.HasRows Then
                cc.dr.Read()
                Dim mm As New MailMessage()
                mm.From = New MailAddress("varunffl@gmail.com")
                mm.To.Add(cc.dr.Item(0))
                mm.Subject = "Your password"
                mm.Body = "This is your password " & cc.dr.Item(1)

                Dim smtp As New SmtpClient("smtp.gmail.com")
                smtp.Port = 587
                smtp.EnableSsl = True
                smtp.UseDefaultCredentials = False
                smtp.Credentials = New System.Net.NetworkCredential("udupieb@gmail.com", "iapiktlufgoykpzi")
                smtp.Send(mm)
                MsgBox("mail sent")
                cc.dr.Close()
                cc.cnn.Close()
            Else
                MsgBox("No such email id has been registed yet.")
            End If
        End If
    End Sub

End Class