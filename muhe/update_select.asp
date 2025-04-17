<!DOCTYPE html>
<html lang="en">
<head>
    <title>Update Entry Select</title>
</head>
<body bgcolor="white" text="black">
<%
' Dimension variables
Dim adoCon  'Holds the database connection object
Dim rsGuestbook  'Holds the recordset for the records in the database
Dim strSQL  'Holds the SQL query for the database

' Create an ADO connection object
Set adoCon = Server.CreateObject("ADODB.Connection")

' Set an active connection to the connection object using a DSN-less connection
adoCon.Open "DRIVER={Microsoft Access Driver (*.mdb)}; DBQ=" & Server.MapPath("clothing.mdb")

' Create an ADO recordset object
Set rsGuestbook = Server.CreateObject("ADODB.Recordset")

' Initialize the strSQL variable with an SQL statement to query the database
strSQL = "SELECT tblOrders.* FROM tblOrders;"

' Open the recordset with the SQL query
rsGuestbook.Open strSQL, adoCon

' Loop through the recordset
Do While Not rsGuestbook.EOF

    ' Write the HTML to display the current record in the recordset
    Response.Write("<br>")
    Response.Write("<a href=""update_form.asp?ID=" & rsGuestbook("ID_no") & """>")
    Response.Write(rsGuestbook("CustomerName"))
    Response.Write("</a>")
    Response.Write("<br>")
    Response.Write(rsGuestbook("PhoneNumber"))
    Response.Write("<br>")

    ' Move to the next record in the recordset
    rsGuestbook.MoveNext

Loop

' Reset server objects
rsGuestbook.Close
Set rsGuestbook = Nothing
Set adoCon = Nothing
%>
<a href="http://localhost/ecc005%20test%20area/">Go back to previous page</a>
</body>
</html>
