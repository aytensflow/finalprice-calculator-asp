<%
Dim clothing, interest, price, finalPrice
clothing = Request.Form("clothing")
interest = CLng(Request.Form("interest"))

' Split the selected item to get the price
price = CLng(Split(clothing, ",")(1))

' Calculate final price
finalPrice = price + (price * interest / 100)

Response.Write "<h1>Calculation Result</h1>"
Response.Write "<p>Item: " & Split(clothing, ",")(0) & "</p>"
Response.Write "<p>Original Price: $" & price & "</p>"
Response.Write "<p>Interest Rate: " & interest & "%</p>"
Response.Write "<p>Final Price: $" & finalPrice & "</p>"
Response.Write "<a href='index.html'>Go Back</a>"
%>
