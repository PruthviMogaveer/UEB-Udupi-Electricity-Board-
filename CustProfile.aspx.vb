Public Class CustProfile
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

        If Not IsPostBack Then
            cc.connect()
            cc.cmd.CommandText = "SELECT Name, Address, Email, Mobile_No, Aadhar_No, Username, Password FROM tblCustomer WHERE Username = '" + Session("CustName") + "' COLLATE Latin1_General_CS_AS"
            cc.cmd.Connection = cc.cnn
            cc.dr = cc.cmd.ExecuteReader()

            If cc.dr.HasRows Then
                cc.dr.Read()
                Name.Value = cc.dr.Item(0)
                Mobile.Value = cc.dr.Item(3)
                Email.Value = cc.dr.Item(2)
                Address.Value = cc.dr.Item(1)
                Username.Value = cc.dr.Item(5)
                Password.Value = cc.dr.Item(6)
                Aadhar.Value = cc.dr.Item(4)
            End If

            cc.cmd.CommandText = "SELECT CustImage FROM tblCustomer WHERE Aadhar_No = '" + Aadhar.Value + "'"
            cc.cmd.Connection = cc.cnn
            cc.dr.Close()
            cc.dr = cc.cmd.ExecuteReader()
            If cc.dr.HasRows() Then
                cc.dr.Read()
                CustImage.Src = cc.dr.Item(0)
            End If
            cc.dr.Close()
            cc.cnn.Close()
        End If
    End Sub

    Public Sub Update()
        Dim filename As String
        Dim filepath As String
        cc.connect()
        cc.cmd.CommandText = "SELECT CustImage FROM tblCustomer WHERE Username = '" + Session("CustName") + "' COLLATE Latin1_General_CS_AS"
        cc.cmd.Connection = cc.cnn
        cc.dr = cc.cmd.ExecuteReader()
        cc.dr.Read()
        filepath = cc.dr.Item(0)
        cc.dr.Close()
        Dim l As Integer = ImageUpload.PostedFile.FileName.Length
        If (l > 0) Then
            filename = ImageUpload.PostedFile.FileName
            filepath = "~/assets/images/" + ImageUpload.PostedFile.FileName
            ImageUpload.PostedFile.SaveAs(Server.MapPath("~/assets/images/") + filename)
        End If
        cc.cmd.CommandText = "UPDATE tblCustomer SET Name = '" + Name.Value.ToUpper() + "', Mobile_No = '" + Mobile.Value + "', Email = '" + Email.Value + "', Password = '" + Password.Value + "', CustImage = '" + filepath + "' WHERE Username = '" + Session("CustName") + "' COLLATE Latin1_General_CS_AS"
        cc.cmd.Connection = cc.cnn
        cc.cmd.ExecuteNonQuery()
        cc.cnn.Close()
        MsgBox("Updated")
    End Sub

    'Public Sub UpdateImage()
    '    Dim filename As String
    '    filename = ImageUpload.PostedFile.FileName
    '    Dim filepath As String
    '    filepath = "~/assets/images/" + ImageUpload.PostedFile.FileName
    '    ImageUpload.PostedFile.SaveAs(Server.MapPath("~/assets/images/") + filename)
    '    cc.connect()
    '    cc.cmd.CommandText = "UPDATE tblCustomer SET CustImage = '" + filepath + "'"
    '    cc.cmd.Connection = cc.cnn
    '    cc.cmd.ExecuteNonQuery()
    '    cc.cnn.Close()
    '    MsgBox("Image updated")
    'End Sub

End Class