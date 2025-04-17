<%
Option Explicit
Dim adoCon, rsGuestbook, strSQL, IngRecordNo

' Read the record ID
IngRecordNo = CLng(Request.QueryString("ID"))

' Create ADO connection object
Set adoCon = Server.CreateObject("ADODB.Connection")

' Open the database connection
adoCon.Open "DRIVER={Microsoft Access Driver (*.mdb)}; DBQ=" & Server.MapPath("clothing.mdb")

' Create recordset object
Set rsGuestbook = Server.CreateObject("ADODB.Recordset")

' SQL query to fetch the record
strSQL = "SELECT * FROM tblOrders WHERE ID_no=" & IngRecordNo

' Open the recordset
rsGuestbook.Open strSQL, adoCon
%>

<html>
<head>
    <title>Update Customer Order</title>
</head>
<body bgcolor="white" text="black">
    <form name="form" method="post" action="update_entry.asp">
        Name: <input type="text" name="CustomerName" maxlength="50" value="<%= rsGuestbook("CustomerName") %>"><br>
        Phone Number: <input type="text" name="PhoneNumber" maxlength="15" value="<%= rsGuestbook("PhoneNumber") %>"><br>
        Clothing Item: <input type="text" name="ClothingItem" maxlength="50" value="<%= rsGuestbook("ClothingItem") %>"><br>
        Payment Plan: <input type="text" name="PaymentPlan" maxlength="20" value="<%= rsGuestbook("PaymentPlan") %>"><br>
        <input type="hidden" name="ID_no" value="<%= rsGuestbook("ID_no") %>">
        <input type="submit" name="Submit" value="Submit">
    </form>
</body>
</html>

<%
' Clean up
rsGuestbook.Close
Set rsGuestbook = Nothing
adoCon.Close
Set adoCon = Nothing
%>
