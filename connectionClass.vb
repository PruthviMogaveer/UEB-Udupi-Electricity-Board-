Imports System.Data.SqlClient
Imports Microsoft.VisualBasic

Public Class connectionClass
    Public cnn As New SqlConnection
    Public cmd As New SqlCommand
    Public dr As SqlDataReader

    Public Sub connect()
        cnn.ConnectionString = "Data Source=DESKTOP-R0U7JJA\SQLEXPRESS;Initial Catalog=UEB1;Integrated Security=True"
        '"Data Source=LAPTOP-KU5OPGFI\SQLEXPRESS;Initial Catalog=UEB;Integrated Security=True"
        cnn.Open()
    End Sub
End Class
