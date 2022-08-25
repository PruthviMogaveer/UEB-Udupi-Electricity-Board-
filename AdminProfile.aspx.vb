Public Class AdminProfile
    Inherits System.Web.UI.Page
    Dim cc As New connectionClass

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            If (Session("AdminName").Equals("")) Then
                If (MsgBox("Your session has expired please re-login")) Then
                    Response.Redirect("AdminLogin.aspx")
                End If
            End If
        Catch ex As Exception
            If (MsgBox("Your session has expired please re-login")) Then
                Response.Redirect("AdminLogin.aspx")
            End If
        End Try

        If Not IsPostBack Then
            cc.connect()
            cc.cmd.CommandText = "SELECT * FROM tblAdmin WHERE Username='" + Session("AdminName") + "' COLLATE Latin1_General_CS_AS"
            cc.cmd.Connection = cc.cnn
            cc.dr = cc.cmd.ExecuteReader()

            If cc.dr.HasRows Then
                cc.dr.Read()
                Name.Value = cc.dr.Item(0)
                Mobile.Value = cc.dr.Item(1)
                Email.Value = cc.dr.Item(2)
                Address.Value = cc.dr.Item(3)
                Username.Value = cc.dr.Item(4)
                Password.Value = cc.dr.Item(5)
                Aadhar.Value = cc.dr.Item(6)
            End If
            cc.cmd.CommandText = "SELECT AdminImage FROM tblAdmin WHERE Aadhar = '" + Aadhar.Value + "'"
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

    Public Sub EditP()
        cc.connect()
        cc.cmd.CommandText = "SELECT Password FROM tblAdmin WHERE Username='" + Session("AdminName") + "' COLLATE Latin1_General_CS_AS"
        cc.cmd.Connection = cc.cnn
        cc.dr = cc.cmd.ExecuteReader()

        If cc.dr.HasRows Then
            cc.dr.Read()
            Password.Value = cc.dr.Item(0)
        End If
        cc.dr.Close()
        cc.cnn.Close()
    End Sub

    Public Sub Update()
        Dim filename As String
        Dim filepath As String
        cc.connect()
        cc.cmd.CommandText = "SELECT AdminImage FROM tblAdmin WHERE Username = '" + Session("AdminName") + "' COLLATE Latin1_General_CS_AS"
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
        cc.cmd.CommandText = "UPDATE tblAdmin SET Name = '" + Name.Value.ToUpper() + "', Mobile_No = '" + Mobile.Value + "', Email = '" + Email.Value + "', Address = '" + Address.Value.ToUpper() + "', Username = '" + Username.Value + "', Password = '" + Password.Value + "', AdminImage='" + filepath + "' WHERE Username = '" + Session("AdminName") + "' COLLATE Latin1_General_CS_AS"
        cc.cmd.Connection = cc.cnn
        cc.cmd.ExecuteNonQuery()
        cc.cnn.Close()
        Session("AdminName") = Username.Value
        MsgBox("Updated")
    End Sub
End Class