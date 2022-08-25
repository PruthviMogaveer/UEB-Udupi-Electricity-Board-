Public Class CustomerLogin
    Inherits System.Web.UI.Page
    Dim cc As New connectionClass

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Public Sub Submit()
        Dim d As Date
        d = Now()
        cc.connect()
        cc.cmd.CommandText = "SELECT Username FROM tblCustomer WHERE Username='" + Username.Value + "' COLLATE Latin1_General_CS_AS AND Deleted = 'No'"
        cc.cmd.Connection = cc.cnn
        cc.dr = cc.cmd.ExecuteReader()

        If cc.dr.HasRows Then
            cc.cmd.CommandText = "SELECT Password FROM tblCustomer WHERE Password='" + Password.Value + "' COLLATE Latin1_General_CS_AS AND Username='" + Username.Value + "' COLLATE Latin1_General_CS_AS AND Deleted = 'No'"
            cc.dr.Close()
            cc.cmd.Connection = cc.cnn
            cc.dr = cc.cmd.ExecuteReader()
            If cc.dr.HasRows Then
                Session("CustName") = Username.Value
                cc.cmd.CommandText = "INSERT INTO tblCustLogin VALUES ('" + Username.Value + "', '" + d + "')"
                cc.dr.Close()
                cc.cmd.Connection = cc.cnn
                cc.cmd.ExecuteNonQuery()

                cc.cmd.CommandText = "SELECT Customer_No FROM tblCustomer WHERE Username='" + Username.Value + "' COLLATE Latin1_General_CS_AS"
                cc.cmd.Connection = cc.cnn
                cc.dr = cc.cmd.ExecuteReader()
                If cc.dr.HasRows Then
                    cc.dr.Read()
                    Dim c As String
                    c = cc.dr.Item(0)
                    Session("CustNo") = c
                End If
                cc.dr.Close()
                cc.cnn.Close()
                Response.Redirect("CustomerHome.aspx")
            Else
                MsgBox("Incorrect Password")
            End If
        Else
            MsgBox("Username does not exist")
        End If

        cc.dr.Close()
        cc.cnn.Close()





        'Dim d As Date
        'd = Now()
        'cc.connect()
        'cc.cmd.CommandText = "INSERT INTO tblCustLogin VALUES ('" + Username.Value + "', '" + d + "')"
        'cc.cmd.Connection = cc.cnn
        'cc.cmd.ExecuteNonQuery()
        'cc.cnn.Close()
        'MsgBox("Record Inserted Successfully")
    End Sub


End Class