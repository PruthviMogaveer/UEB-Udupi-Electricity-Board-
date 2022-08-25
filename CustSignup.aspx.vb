Public Class CustSignup
    Inherits System.Web.UI.Page

    Dim cc As New connectionClass
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
    Public Sub SignUp()
        Dim b As String
        b = "No"
        cc.connect()
        cc.cmd.CommandText = "SELECT Username FROM tblCustomer WHERE Username = '" + Uname.Value + "' COLLATE Latin1_General_CS_AS AND Deleted = '" + b + "'"
        cc.cmd.Connection = cc.cnn
        cc.dr = cc.cmd.ExecuteReader()
        cc.dr.Read()
        If (cc.dr.HasRows()) Then
            If (MsgBox("Username already exists")) Then
                cc.dr.Close()
                Response.Redirect("CustomerLogin.aspx")
            End If
        End If
        cc.dr.Close()

        'cc.cmd.CommandText = "SELECT n.Email, n.Mobile_No, n.Aadhar_No, c.RR_No, c.Location_Code, c.Meter_Code, c.Sub_Division FROM tblNewConnection n, tblConnectionDetail c WHERE n.Email = '" + Email.Value + "' AND n.Mobile_No = " + Phone.Value + " AND n.Aadhar_No = " + Aadhar.Value + " AND c.RR_No = '" + RR.Value + "' AND c.Location_Code = '" + Lcode.Value + "' AND c.Meter_Code = '" + Mcode.Value + "' AND c.Sub_Division = '" + SubDiv.Value + "'"
        'cc.cmd.Connection = cc.cnn

        cc.cmd.CommandText = "SELECT * FROM tblCustomer WHERE Email = '" + Email.Value + "' AND Mobile_No = " + Phone.Value + " AND Aadhar_No = " + Aadhar.Value + " AND Customer_No = '" + Cno.Value + "' AND RR_No = '" + RR.Value + "' AND Location_Code = '" + Lcode.Value + "' AND Meter_Code = '" + Mcode.Value + "' AND Sub_Division = '" + SubDiv.Value + "' AND Deleted = '" + b + "'"
        cc.dr = cc.cmd.ExecuteReader()
        If (cc.dr.HasRows) Then
            'cc.cmd.CommandText = "INSERT INTO tblSignUp VALUES ('" + Name.Value.ToUpper() + "', '" + Address.Value + "', '" + Email.Value + "', " + Phone.Value + ", '" + RR.Value + "', " + Cno.Value + ", '" + SubDiv.Value + "', '" + Lcode.Value + "', '" + Mcode.Value + "', '" + Uname.Value + "', '" + Password.Value + "', " + Aadhar.Value + ", '" + b + "')"
            cc.cmd.CommandText = "UPDATE tblCustomer SET Username='" + Uname.Value + "', Password='" + Password.Value + "' WHERE Customer_No = '" + Cno.Value + "' AND Deleted = '" + b + "'"
            cc.dr.Close()
            cc.cmd.Connection = cc.cnn
            cc.cmd.ExecuteNonQuery()
            If (MsgBox("You have signed up successfully")) Then
                Response.Redirect("CustomerLogin.aspx")
            End If
        Else
            MsgBox("The entered credentials are not valid")
            '    Response.Redirect("CustomerLogin.aspx")
            'End If
        End If


        cc.cnn.Close()


    End Sub
End Class

