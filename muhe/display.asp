<% Option Explicit %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Orders</title>
    <style>
        body {
            background-color: #ffe6f2;
            color: #99004d;
            font-family: Arial, sans-serif;
            text-align: center;
        }

        table {
            margin: 50px auto;
            border-collapse: collapse;
            width: 80%;
        }

        table, th, td {
            padding: 10px;
            border: 2px solid #cc6699;
        }

        th {
            font: bolder 20px cambria;
            background-color: #ff66b3;
            color: white;
        }

        td {
            font: 14px sans-serif;
            background-color: #fff0f5;
        }

        a {
            display: inline-block;
            margin-top: 20px;
            text-decoration: none;
            background-color: #ff66b3;
            color: white;
            padding: 10px 20px;
            border-radius: 8px;
            font-weight: bold;
        }

        a:hover {
            background-color: #ff3385;
        }

        @keyframes popIn {
            0% { transform: scale(0.8); opacity: 0; }
            100% { transform: scale(1); opacity: 1; }
        }
    </style>
</head>
<body>
    <div style="margin-top: 20px;">
        <img src="logo.png" alt="Final Price Calculator Logo" width="180" style="border-radius: 50%; box-shadow: 0 4px 10px rgba(255, 105, 180, 0.3); animation: popIn 0.8s ease-out;">
    </div>

    <%
        If Request.ServerVariables("REQUEST_METHOD") = "POST" Then

            Dim con, rsOrders, strSQL
            Dim customerName, phoneNumber, paymentPlan, clothingItem, price, totalPrice

            ' Create connection and recordset objects
            Set con = Server.CreateObject("Adodb.Connection")
            Set rsOrders = Server.CreateObject("Adodb.Recordset")

            ' Open the database connection
            con.Provider = "Microsoft.Jet.OLEDB.4.0"
            con.Open "C:\inetpub\wwwroot\ecc005 test area\clothing.mdb"

            ' Query to retrieve data from tblOrders
            strSQL = "SELECT CustomerName, PhoneNumber, PaymentPlan, ClothingItem, Price, TotalPrice FROM tblOrders;"
            rsOrders.Open strSQL, con

            ' Display the data
            Response.Write("<h3 style='margin-top: 40px;'>Order Details:</h3>")
            Response.Write("<table>")
            Response.Write("<tr><th>Customer Name</th><th>Phone Number</th><th>Clothing Item</th><th>Price</th><th>Payment Plan</th><th>Total Price</th></tr>")

            Do Until rsOrders.EOF
                customerName = rsOrders("CustomerName")
                phoneNumber = rsOrders("PhoneNumber")
                clothingItem = rsOrders("ClothingItem")
                price = rsOrders("Price")
                paymentPlan = rsOrders("PaymentPlan")
                totalPrice = rsOrders("TotalPrice")

                Response.Write("<tr>")
                Response.Write("<td>" & customerName & "</td>")
                Response.Write("<td>" & phoneNumber & "</td>")
                Response.Write("<td>" & clothingItem & "</td>")
                Response.Write("<td>$" & price & "</td>")
                Response.Write("<td>" & paymentPlan & "</td>")
                Response.Write("<td>$" & totalPrice & "</td>")
                Response.Write("</tr>")

                rsOrders.MoveNext
            Loop

            Response.Write("</table>")

            ' Clean up
            rsOrders.Close
            Set rsOrders = Nothing
            con.Close
            Set con = Nothing

        End If
    %>

    <a href="http://localhost/ecc005%20test%20area/">Go back to previous page</a>
</body>
</html>
