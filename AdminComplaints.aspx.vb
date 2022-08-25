Public Class AdminComplaints
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

    Public Sub Submit()
        Dim d As Date
        d = Now()
        cc.connect()
        cc.cmd.CommandText = "SELECT Cust_Name FROM tblComplaint WHERE Cust_Name = '" + Cust_Name.Value + "' COLLATE Latin1_General_CS_AS AND Complaint_Date = '" + C_Date.Value + "'"
        cc.cmd.Connection = cc.cnn
        cc.dr = cc.cmd.ExecuteReader()
        If (cc.dr.HasRows()) Then
            cc.dr.Close()
            cc.cmd.CommandText = "UPDATE tblComplaint SET Admin_Name = '" + Session("AdminName") + "', Reply = '" + Complaint_Reply.Value + "', Reply_date = '" + d + "'  WHERE Cust_Name = '" + Cust_Name.Value + "' COLLATE Latin1_General_CS_AS AND Complaint_Date = '" + C_Date.Value + "'"
            cc.cmd.Connection = cc.cnn
            cc.cmd.ExecuteNonQuery()

            cc.cnn.Close()

            If (MsgBox("Your complaint has been recorded")) Then
                Response.Redirect("AdminHome.aspx")
            End If
        Else
            cc.dr.Close()
            cc.cnn.Close()
            If (MsgBox("Please enter a valid customer name and the corresponding date of the complaint")) Then
                Response.Redirect("AdminComplaints.aspx")
            End If
        End If
    End Sub

End Class