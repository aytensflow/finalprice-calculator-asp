<%@ LANGUAGE="VBScript" %>
<%
Option Explicit

' If adSchemaColumns isn’t defined, define it:
Const adSchemaColumns = 4

Dim con, rs

' 1) Open the database connection
Set con = Server.CreateObject("ADODB.Connection")
con.Provider = "Microsoft.Jet.OLEDB.4.0"
con.Open "C:\inetpub\wwwroot\muhe\clothing.mdb"

' 2) Retrieve the schema for tblClothing
Set rs = con.OpenSchema(adSchemaColumns, Array(Empty, Empty, "tblClothing", Empty))

' 3) Output the column names and types
Response.Write "<h2>Fields in tblClothing</h2><ul>"
Do Until rs.EOF
    Response.Write "<li>" & rs("COLUMN_NAME") & " (" & rs("TYPE_NAME") & ")" & "</li>"
    rs.MoveNext
Loop
Response.Write "</ul>"

' 4) Clean up
rs.Close
Set rs = Nothing
con.Close
Set con = Nothing
%>
