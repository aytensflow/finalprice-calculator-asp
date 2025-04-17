<%
Option Explicit
Dim adoCon, rsUpdateEntry, strSQL, IngRecordNo

' Read the record ID to update
IngRecordNo = CLng(Request.QueryString("ID"))

' Create ADO connection object
Set adoCon = Server.CreateObject("ADODB.Connection")

' Open the database connection
adoCon.Open "DRIVER={Microsoft Access Driver (*.mdb)}; DBQ=" & Server.MapPath("clothing.mdb")

' Create recordset object
Set rsUpdateEntry = Server.CreateObject("ADODB.Recordset")

' SQL query to fetch the record to update
strSQL = "SELECT * FROM tblOrders WHERE ID_no=" & IngRecordNo

' Set the cursor type and lock type
rsUpdateEntry.CursorType = 2
rsUpdateEntry.LockType = 3

' Open the recordset
rsUpdateEntry.Open strSQL, adoCon

' Update the fields
rsUpdateEntry("CustomerName") = Request.Form("CustomerName")
rsUpdateEntry("PhoneNumber") = Request.Form("PhoneNumber")
rsUpdateEntry("ClothingItem") = Request.Form("ClothingItem")
rsUpdateEntry("PaymentPlan") = Request.Form("PaymentPlan")

' Recalculate and update the total price
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
    totalPrice = price + (price * 0.02)  ' 2% interest
ElseIf paymentPlan = "12 Months" Then
    totalPrice = price + (price * 0.04)  ' 4% interest
Else
    totalPrice = price
End If

rsUpdateEntry("Price") = price
rsUpdateEntry("TotalPrice") = totalPrice

' Save changes to the database
rsUpdateEntry.Update

' Close and clean up
rsUpdateEntry.Close
Set rsUpdateEntry = Nothing
adoCon.Close
Set adoCon = Nothing

Response.Redirect "update_select.asp"
%>
