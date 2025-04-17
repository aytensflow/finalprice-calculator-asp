<%
Option Explicit
Dim con    'Database connection object
Dim strSQL   'SQL query
Dim rsAddComments  'Recordset for the new record to be added

' Create ADO connection object
Set con = Server.CreateObject("ADODB.Connection")

' Open the database connection
con.Provider = "Microsoft.Jet.OLEDB.4.0"
con.Open "C:\inetpub\wwwroot\ecc005 test area\clothing.mdb"

Set rsAddComments = Server.CreateObject("ADODB.Recordset")

' SQL query to select records from the database
strSQL = "SELECT tblOrders.CustomerName, tblOrders.PhoneNumber, tblOrders.ClothingItem, tblOrders.Price, tblOrders.PaymentPlan, tblOrders.TotalPrice FROM tblOrders;"

' Set the cursor type and lock type
rsAddComments.CursorType = 2
rsAddComments.LockType = 3

' Open the recordset
rsAddComments.Open strSQL, con

' Add a new record
rsAddComments.AddNew
rsAddComments.Fields("CustomerName") = Request.Form("CustomerName")
rsAddComments.Fields("PhoneNumber") = Request.Form("PhoneNumber")
rsAddComments.Fields("ClothingItem") = Request.Form("ClothingItem")
rsAddComments.Fields("PaymentPlan") = Request.Form("PaymentPlan")

' Calculate total price based on the clothing item and payment plan
Dim clothingItem, price, paymentPlan, totalPrice

clothingItem = Request.Form("ClothingItem")
paymentPlan = Request.Form("PaymentPlan")

Select Case clothingItem
    Case "Shirt"
        price = 30
    Case "Jeans"
        price = 50
    Case "Jacket"
        price = 100
    Case "Shoes"
        price = 70
    Case Else
        price = 0
End Select

If paymentPlan = "6 Months" Then
    totalPrice = price + (price * 0.02)  ' 2% interest for 6 months
ElseIf paymentPlan = "12 Months" Then
    totalPrice = price + (price * 0.04)  ' 4% interest for 12 months
Else
    totalPrice = price
End If

rsAddComments.Fields("Price") = price
rsAddComments.Fields("TotalPrice") = totalPrice

' Update the recordset and close connections
rsAddComments.Update

Response.Write("Data inserted successfully!")
rsAddComments.Close
Set rsAddComments = Nothing
con.Close
Set con = Nothing

Response.Redirect "display.asp"
%>
<a href="http://localhost/ecc005%20test%20area/">Go back to previous page</a>
