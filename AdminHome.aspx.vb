Public Class AdminHome
    Inherits System.Web.UI.Page
    Dim cc As New connectionClass
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Heading1.InnerText = "Hello" + " " + Session("AdminName")

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
        'Session("show") = "True"
        If (Session("show").Equals("True")) Then
                Dim n As String
                n = "No"
                cc.connect()
            cc.cmd.CommandText = "SELECT Mobile_No FROM tblCustomer WHERE Assign='" + n + "'"
            cc.cmd.Connection = cc.cnn
                cc.dr = cc.cmd.ExecuteReader()

                If cc.dr.HasRows Then
                    cc.dr.Read()
                    Session("AssignMobNo") = cc.dr.Item(0)
                'Session("Notify") = 0
                cc.dr.Close()
                    cc.cnn.Close()
                    Select Case MsgBox("You have connections to assign, would you like to assign them now??", MsgBoxStyle.YesNo, "Assign Connection")
                    Case MsgBoxResult.Yes
                        Response.Redirect("AdminAssignDetails.aspx")
                    Case MsgBoxResult.No

                        Session("show") = "False"
                End Select
                End If
                cc.dr.Close()
                cc.cnn.Close()
            End If


        If (Session("showD").Equals("True")) Then

            Dim y As String = "Yes"
            cc.connect()
            cc.cmd.CommandText = "SELECT Customer_No FROM tblCustomer WHERE RemoveConn = '" + y + "'"
            cc.cmd.Connection = cc.cnn
            cc.dr = cc.cmd.ExecuteReader()
            If (cc.dr.HasRows()) Then
                Select Case MsgBox("You have some connections to cut, do you want to do it now??", MsgBoxStyle.YesNo, "Delete Account")
                    Case MsgBoxResult.Yes
                        cc.dr.Read()
                        Dim c As String
                        c = cc.dr.Item(0)
                        Session("DelCustNo") = c
                        Response.Redirect("CustDelete.aspx")
                    Case MsgBoxResult.No
                        Session("showD") = "False"
                        Response.Redirect("AdminHome.aspx")
                End Select
            End If
        End If



    End Sub

End Class