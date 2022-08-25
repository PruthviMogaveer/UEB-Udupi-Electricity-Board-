Public Class AdminViewBill
    Inherits System.Web.UI.Page
    Dim cc As connectionClass
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Public Sub ShowBill()
        Session("showBill") = CustNo.Value

    End Sub
End Class