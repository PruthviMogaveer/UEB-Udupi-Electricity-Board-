Public Class GenerateBill

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

        Dim n As String
        n = "No"
        Dim lt As New List(Of String)()
        Dim dt As Date

        'Dim addn As Integer
        'addn = 1
        If (Not IsPostBack) Then
            cc.connect()
            cc.cmd.CommandText = "SELECT Due_Date, Customer_No FROM tblBill"
            cc.cmd.Connection = cc.cnn
            cc.dr = cc.cmd.ExecuteReader()
            If cc.dr.HasRows Then
                While (cc.dr.Read())
                    dt = cc.dr.Item(0)
                    If (dt.CompareTo(Now) < 0) Then
                        lt.Add(cc.dr.Item(1))
                    End If
                End While
                cc.dr.Close()
                For Each i In lt

                    cc.cmd.CommandText = "Update tblCustomer SET Bill = '" + n + "' WHERE( Customer_No = '" + i + "')"
                    cc.cmd.Connection = cc.cnn
                    cc.cmd.ExecuteNonQuery()
                    cc.cmd.CommandText = "Update tblBill SET Bill = '" + n + "' WHERE( Customer_No = '" + i + "')"
                    cc.cmd.Connection = cc.cnn
                    cc.cmd.ExecuteNonQuery()
                Next
                cc.cnn.Close()

            End If
        End If
        cc.cnn.Close()

    End Sub

    Public Sub GenBill()
        Dim p As String = "Yes"
        cc.connect()
        cc.cmd.CommandText = "INSERT INTO tblPastBill SELECT Name, Customer_No, RR_No, Location_Code, Meter_No, Sub_Division, Prev_Reading, Cur_Reading, Issued_Date, Bill_No, Penalty, Amount, Due_Date FROM tblBill WHERE (Customer_No = '" + CustNo.Value + "')"
        cc.cmd.Connection = cc.cnn
        cc.cmd.ExecuteNonQuery()

        cc.cmd.CommandText = "SELECT Due_Date, Customer_No FROM tblBill WHERE Customer_No = '" + CustNo.Value + "'"
        cc.cmd.Connection = cc.cnn
        cc.dr = cc.cmd.ExecuteReader()
        If cc.dr.HasRows Then
            cc.dr.Read()
            Dim dt As Date
            dt = cc.dr.Item(0)
            If (dt.CompareTo(Now) > 0) Then
                If (MsgBox("Bill already generated")) Then
                    Response.Redirect("GenerateBill.aspx")
                End If
            End If
        End If
        cc.dr.Close()
            cc.cmd.CommandText = "SELECT Customer_No FROM tblBill WHERE Customer_No='" + CustNo.Value + "'"
        cc.cmd.Connection = cc.cnn
        cc.dr = cc.cmd.ExecuteReader()
        If cc.dr.HasRows Then
            cc.dr.Close()
            Session("GenBill") = CustNo.Value
            cc.dr.Close()
            cc.cnn.Close()
            Response.Redirect("GenerateBill1.aspx")
        Else
            cc.dr.Close()
            Dim pr As String = "0"
            Dim cr As String = "0"
            cc.cmd.CommandText = "INSERT INTO tblBill (Name, Customer_No, RR_No, Location_Code, Meter_No, Sub_Division) SELECT Name, Customer_No, RR_No, Location_Code, Meter_Code, Sub_Division FROM tblCustomer WHERE (Customer_No = '" + CustNo.Value + "')"
            cc.cmd.Connection = cc.cnn
            cc.cmd.ExecuteNonQuery()
            cc.cmd.CommandText = "UPDATE tblBill SET Paid = '" + p + "' WHERE (Customer_No = '" + CustNo.Value + "')"
            cc.cmd.Connection = cc.cnn
            cc.cmd.ExecuteNonQuery()
            cc.cmd.CommandText = "UPDATE tblBill SET Prev_Reading = '" + pr + "', Cur_Reading = '" + cr + "' WHERE Customer_No = '" + CustNo.Value + "'"
            cc.cmd.Connection = cc.cnn
            cc.cmd.ExecuteNonQuery()
            cc.cnn.Close()

            Session("GenBill") = CustNo.Value
            Response.Redirect("GenerateBill1.aspx")
        End If


    End Sub

End Class