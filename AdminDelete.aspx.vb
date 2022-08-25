Imports System.Net.Mail
Imports System.Net
Public Class AdminDelete
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

    Public Sub Del()

        cc.connect()
        cc.cmd.CommandText = "SELECT Username FROM tblAdmin WHERE Username = '" + Username.Value + "' AND Deleted ='No'"
        cc.cmd.Connection = cc.cnn
        cc.dr = cc.cmd.ExecuteReader()
        If (Not cc.dr.HasRows) Then
            If (MsgBox("Invalid user name")) Then
                cc.cnn.Close()
                cc.dr.Close()
                Response.Redirect("AdminDelete.aspx")
            End If
        End If
        cc.dr.Close()
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

        Select Case MsgBox("Are you sure you want to delete this admin??", MsgBoxStyle.YesNo, "Confirmation")
            Case MsgBoxResult.Yes

            Case MsgBoxResult.No
                Response.Redirect("AdminHome.aspx")
        End Select
        cc.connect()
        cc.cmd.CommandText = "SELECT Name, Email FROM tblAdmin WHERE Username = '" + Username.Value + "' COLLATE Latin1_General_CS_AS AND Deleted = '" + n + "' "
        cc.cmd.Connection = cc.cnn
            cc.dr = cc.cmd.ExecuteReader()
            If (cc.dr.HasRows()) Then
                cc.dr.Read()
                Dim mm As New MailMessage()
                mm.From = New MailAddress("udupieb@gmail.com")
                mm.To.Add(cc.dr.Item(1))
                mm.Subject = "Removed from your post"
                mm.Body = "Dear " & cc.dr.Item(0) & vbLf & " We are sorry to inform you that you have been removed from the admin post in Udupi Electricity Board."
                Dim smtp As New SmtpClient("smtp.gmail.com")
                smtp.Port = 587
                smtp.EnableSsl = True
                smtp.UseDefaultCredentials = False
                smtp.Credentials = New System.Net.NetworkCredential("udupieb@gmail.com", "iapiktlufgoykpzi")
                smtp.Send(mm)
                MsgBox("mail sent")
            Else
                If (MsgBox("No such username exists")) Then
                    Response.Redirect("AdminHome.aspx")
                End If
            End If
        cc.dr.Close()

        cc.cmd.CommandText = "DELETE FROM tblFeedback WHERE Name = '" + Username.Value + "' COLLATE Latin1_General_CS_AS"
        cc.cmd.Connection = cc.cnn
        cc.cmd.ExecuteNonQuery()

        cc.cmd.CommandText = "DELETE FROM tblAdminLogin WHERE Username = '" + Username.Value + "' COLLATE Latin1_General_CS_AS"
        cc.cmd.Connection = cc.cnn
        cc.cmd.ExecuteNonQuery()

        Dim y As String = "Yes"
        cc.cmd.CommandText = "UPDATE tblAdmin SET Deleted = '" + y + "' WHERE Username = '" + Username.Value + "' COLLATE Latin1_General_CS_AS"
        cc.cmd.Connection = cc.cnn
            cc.cmd.ExecuteNonQuery()
            cc.cnn.Close()

            MsgBox("Record deleted Successfully")
            Response.Redirect("AdminDelete.aspx")


    End Sub

End Class