Public Class GenerateBill1
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
        If (Not IsPostBack) Then
            cc.connect()
            cc.cmd.CommandText = "SELECT Prev_Reading, Cur_Reading FROM tblBill WHERE Customer_No = '" + Session("GenBill") + "'"
            cc.cmd.Connection = cc.cnn
            cc.dr = cc.cmd.ExecuteReader()
            If (cc.dr.HasRows) Then
                cc.dr.Read()
                Dim p As String = cc.dr.Item(1)
                cc.cmd.CommandText = "UPDATE tblBill SET Prev_Reading = '" + p + "' WHERE Customer_No = '" + Session("GenBill") + "'"
                cc.cmd.Connection = cc.cnn
                cc.dr.Close()
                cc.cmd.ExecuteNonQuery()
            End If
            cc.dr.Close()
            cc.cnn.Close()
        End If
    End Sub

    Public Sub Updated()
        Dim y As String
        y = "Yes"
        cc.connect()
        cc.cmd.CommandText = "UPDATE tblBill SET Bill = '" + y + "'  WHERE (Customer_No = '" + Session("GenBill") + "')"
        cc.cmd.Connection = cc.cnn
        cc.cmd.ExecuteNonQuery()
        cc.cmd.CommandText = "UPDATE tblCustomer SET Bill = '" + y + "'  WHERE (Customer_No = '" + Session("GenBill") + "')"
        cc.cmd.Connection = cc.cnn
        cc.cmd.ExecuteNonQuery()
        cc.cnn.Close()
        If IsPostBack Then
            Dim units As Integer
            Dim amt, rate As String
            amt = 0
            cc.connect()
            cc.cmd.CommandText = "SELECT Prev_Reading, Cur_Reading FROM tblBill WHERE (Customer_No = '" + Session("GenBill") + "')"
            cc.cmd.Connection = cc.cnn
            cc.dr = cc.cmd.ExecuteReader()
            cc.dr.Read()
            If (cc.dr.Item(0) > cc.dr.Item(1)) Then
                If (MsgBox("Previous reading cannot be greater than current reading")) Then
                    Response.Redirect("GenerateBill1.aspx")
                End If
            End If
            units = cc.dr.Item(1) - cc.dr.Item(0)
            cc.dr.Close()
            cc.cmd.CommandText = "SELECT Rate FROM tblRate"
            cc.cmd.Connection = cc.cnn
            cc.dr = cc.cmd.ExecuteReader()
            cc.dr.Read()
            rate = cc.dr.Item(0)
            cc.dr.Close()
            If (units <= 150) Then
                amt = 200
            ElseIf (units <= 200) Then
                amt = 200 + (units - 150) * rate
            ElseIf (units <= 300) Then
                amt = 200 + 50 * rate + (units - 200) * (rate * 2)
            ElseIf (units > 300) Then
                amt = 200 + (50 * rate) + 100 * (rate * 2) + (units - 300) * (rate * 3)
            End If

            If (units > 300 And amt < 500) Then
                amt = 500
            End If
            Dim p As String = "No"
            Dim a As Integer = 50
            cc.cmd.CommandText = "SELECT Amount FROM tblBill WHERE (Customer_No = '" + Session("GenBill") + "' AND Paid = '" + p + "')"
            cc.cmd.Connection = cc.cnn
            cc.dr = cc.cmd.ExecuteReader()
            If (cc.dr.HasRows()) Then
                cc.dr.Read()
                amt += cc.dr.Item(0)
            End If
            cc.dr.Close()
            cc.cmd.CommandText = "SELECT Penalty FROM tblBill WHERE (Customer_No = '" + Session("GenBill") + "' AND Paid = '" + p + "' )"
            cc.cmd.Connection = cc.cnn
            cc.dr = cc.cmd.ExecuteReader()
            If (cc.dr.HasRows) Then
                cc.dr.Read()
                Dim t As Integer
                t = cc.dr.Item(0) + a
                cc.cmd.CommandText = "UPDATE tblBill SET Penalty = " + t.ToString + " WHERE (Customer_No = '" + Session("GenBill") + "')"
                cc.dr.Close()
                cc.cmd.Connection = cc.cnn
                cc.cmd.ExecuteNonQuery()

                amt += a
            Else
                cc.dr.Close()
                Dim z As Integer = 0
                cc.cmd.CommandText = "UPDATE tblBill SET Penalty = " + z.ToString + " WHERE (Customer_No = '" + Session("GenBill") + "' )"
                cc.cmd.Connection = cc.cnn
                cc.cmd.ExecuteNonQuery()
            End If



            cc.cmd.CommandText = "UPDATE tblBill SET Amount = '" + amt + "', Paid='" + p + "' WHERE(Customer_No = '" + Session("GenBill") + "')"
            cc.cmd.Connection = cc.cnn
            cc.cmd.ExecuteNonQuery()

            Dim IssuedDate, DueDate As String
            IssuedDate = Left(Now, 10)
            DueDate = Left(Now.AddDays(10), 10)

            cc.cmd.CommandText = "UPDATE tblBill SET Issued_Date = '" + IssuedDate + "', Due_Date = '" + DueDate + "' WHERE(Customer_No = '" + Session("GenBill") + "') "
            cc.cmd.Connection = cc.cnn
            cc.cmd.ExecuteNonQuery()
            cc.cnn.Close()


            Response.Redirect("GenerateBill.aspx")


        End If
    End Sub
End Class