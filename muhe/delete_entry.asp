<%
'Dimension variables
Dim adoCon  'Holds the database connection object
Dim rsDeleteEntry  'Holds the recordset for the records in the database
Dim strSQL  'Holds the SQL query for the database
Dim IngRecordNo  'Holds the record number to be deleted

'Read in the record number to be deleted
IngRecordNo = CLng(Request.QueryString("ID"))

'Create an ADO connection object
Set adoCon = Server.CreateObject("ADODB.Connection")

'Set an active connection to the connection object using a DSN-less connection
adoCon.Provider = "Microsoft.Jet.OLEDB.4.0"

adoCon.Open "C:\inetpub\wwwroot\ecc005 test area\clothing.mdb"

'Create an ADO recordset object
Set rsDeleteEntry = Server.CreateObject("ADODB.Recordset")

'Initialize the strSQL variable with an SQL statement to query the database
strSQL = "SELECT * FROM tblClothing WHERE ID = " & IngRecordNo

'Set the lock type so that the record is locked by ADO when it is updated
rsDeleteEntry.LockType = 3

'Open the recordset with the SQL query
rsDeleteEntry.Open strSQL, adoCon

'Delete the record from the database
rsDeleteEntry.Delete

'Reset server objects
rsDeleteEntry.Close
Set rsDeleteEntry = Nothing
Set adoCon = Nothing

'Return to the delete select page in case another record needs deleting
Response.Redirect "delete_select.asp"

%>
