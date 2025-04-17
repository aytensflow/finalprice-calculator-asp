<%
' Retrieve form data
Dim customerName, phoneNumber, clothingItem, cost, interestRate, paymentPlan, totalCost

customerName = Request.Form("customerName")
phoneNumber = Request.Form("phoneNumber")
clothingItem = Request.Form("clothingItem")
cost = CDbl(Request.Form("cost"))
interestRate = CDbl(Request.Form("interestRate")) / 100  ' Convert percent to decimal
paymentPlan = CInt(Request.Form("paymentPlan"))

' Calculate total cost using simple interest formula
totalCost = cost + (cost * interestRate * (paymentPlan / 12))
%>

<html>
<head>
  <title>Total Cost Result</title>
  <style>
    body {
      background-color: #fff0f5;
      font-family: Arial, sans-serif;
      color: #800040;
      padding: 30px;
      text-align: center;
    }
    .result-box {
      margin: 0 auto;
      padding: 20px;
      border: 2px dashed #ff66b3;
      border-radius: 10px;
      background-color: #ffffff;
      width: 60%;
    }
    h1 {
      color: #cc0066;
    }
  </style>
</head>
<body>
  <div class="result-box">
    <h1>Total Payment Summary</h1>
    <p><strong>Customer:</strong> <%= customerName %></p>
    <p><strong>Phone:</strong> <%= phoneNumber %></p>
    <p><strong>Item:</strong> <%= clothingItem %></p>
    <p><strong>Original Cost:</strong> $<%= FormatNumber(cost, 2) %></p>
    <p><strong>Interest Rate:</strong> <%= interestRate * 100 %>%</p>
    <p><strong>Payment Plan:</strong> <%= paymentPlan %> months</p>
    <p><strong>Total Cost with Interest:</strong> 
      <span style="color:#cc0066; font-weight: bold;">
        $<%= FormatNumber(totalCost, 2) %>
      </span>
    </p>
  </div>
</body>
</html>
