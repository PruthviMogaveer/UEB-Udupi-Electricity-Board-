Imports System.Net.Mail
Imports System.Net
Public Class AdminReg
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
    End Sub

    Public Sub Register()
        cc.connect()
        Dim t As String = "Sub"
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

        'Try
        cc.connect()
        Dim c As Integer
        c = 0
        cc.cmd.CommandText = "SELECT Username FROM tblAdmin WHERE Deleted = '" + n + "'"
        cc.cmd.Connection = cc.cnn
        cc.dr = cc.cmd.ExecuteReader()
        If (cc.dr.HasRows()) Then
            While (cc.dr.Read())
                c += 1
            End While
            If (c >= 3) Then
                If (MsgBox("You cannot add more than 3 admins")) Then
                    Response.Redirect("AdminHome.aspx")
                End If
            End If
        End If
        cc.dr.Close()

        cc.cmd.CommandText = "SELECT Username FROM tblAdmin WHERE Username = '" + Username.Value + "' COLLATE Latin1_General_CS_AS AND Deleted = '" + n + "'"
        cc.cmd.Connection = cc.cnn
        cc.dr = cc.cmd.ExecuteReader()
        If (cc.dr.HasRows()) Then
            If (MsgBox("Username already exists")) Then
                Response.Redirect("AdminReg.aspx")
            End If
        End If
        cc.dr.Close()
        cc.cmd.CommandText = "SELECT * FROM tblAdmin WHERE Mobile_No = '" + Phone.Value + "' OR Email = '" + Email.Value + "' OR Aadhar = '" + Aadhar.Value + "' AND Deleted='" + n + "' "
        cc.cmd.Connection = cc.cnn
        cc.dr = cc.cmd.ExecuteReader()
        If (cc.dr.HasRows) Then
            If (MsgBox("Credentials already registered")) Then
                cc.dr.Close()
                Response.Redirect("AdminReg.aspx")
            End If
        End If
        cc.dr.Close()

        Dim filename As String
        filename = ImageUpload.PostedFile.FileName
        Dim filepath As String
        filepath = "~/assets/images/" + ImageUpload.PostedFile.FileName
        ImageUpload.PostedFile.SaveAs(Server.MapPath("~/assets/images/") + filename)

        cc.cmd.CommandText = "INSERT INTO tblAdmin (Name, Mobile_No, Email, Address, Username, Password, Aadhar, AdminImage) VALUES ('" + Name.Value.ToUpper() + "', " + Phone.Value + ", '" + Email.Value + "', '" + Address.Value.ToUpper() + "', '" + Username.Value + "', '" + Password.Value + "', " + Aadhar.Value + ", '" + filepath + "')"
        cc.cmd.Connection = cc.cnn
        cc.cmd.ExecuteNonQuery()
        cc.cnn.Close()
        Dim mm As New MailMessage()
        mm.From = New MailAddress("udupieb@gmail.com")
        mm.To.Add(Email.Value)
        mm.Subject = "Appointed as the new admin"
        mm.Body = "Hello " & Name.Value & vbLf & " Congratulations on becoming the new admin of the Udupi Electricity Board." & vbLf & "Username: " & Username.Value & vbLf & "Password: " & Password.Value
        Dim smtp As New SmtpClient("smtp.gmail.com")
        smtp.Port = 587
        smtp.EnableSsl = True
        smtp.UseDefaultCredentials = False
        smtp.Credentials = New System.Net.NetworkCredential("udupieb@gmail.com", "iapiktlufgoykpzi")
        smtp.Send(mm)
        MsgBox("mail sent")
        'Catch ex As Exception
        '    MsgBox("New admin could not be registered.")
        'End Try
        If (MsgBox("Record Inserted Successfully")) Then
            Response.Redirect("AdminHome.aspx")
        End If


    End Sub
End Class