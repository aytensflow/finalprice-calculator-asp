<!DOCTYPE html>
<html lang="en">
<head>
    <title>Delete Entry Select</title>
</head>
<body bgcolor="white" text="black">
<%
'Dimension variables
Dim adoCon  'Holds the database connection object
Dim rsClothing  'Holds the recordset for the records in the database
Dim strSQL  'Holds the SQL query for the database

'Create an ADO connection object
Set adoCon = Server.CreateObject("ADODB.Connection")

'Set an active connection to the connection object using a DSN-less connection
adoCon.Open "DRIVER={Microsoft Access Driver (*.mdb)}; DBQ=" & Server.MapPath("clothing.mdb")

'Create an ADO recordset object
Set rsClothing = Server.CreateObject("ADODB.Recordset")

'Initialize the strSQL variable with an SQL statement to query the database
strSQL = "SELECT * FROM tblClothing;"

'Open the recordset with the SQL query
rsClothing.Open strSQL, adoCon

'Loop through the recordset
Do While Not rsClothing.EOF

    'Write the HTML to display the current record in the recordset
    Response.Write("<br>")
    Response.Write("<a href=""delete_entry.asp?ID=" & rsClothing("ID") & """>")
    Response.Write(rsClothing("CustomerName"))
    Response.Write("</a>")
    Response.Write("<br>")
    Response.Write(rsClothing("PhoneNumber"))
    Response.Write("<br>")

    'Move to the next record in the recordset
    rsClothing.MoveNext

Loop

'Reset server objects
rsClothing.Close
Set rsClothing = Nothing
Set adoCon = Nothing
%>
    <a href="http://localhost/ecc005%20test%20area/">Go back to previous page</a>
</body>
</html>
