<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Collect Clothing Data</title>

    <link rel="stylesheet" href="stylesheet.css">
</head>
<body>
    <center>
        <form action="insert.asp" method="post">
            <table border="1">
                <tr>
                    <td><label for="customerName">Customer Name:</label></td>
                    <td><input type="text" id="customerName" name="customerName" placeholder="Full Name"></td>
                </tr>
            
                <tr>
                    <td>Phone Number:</td>
                    <td><input type="tel" id="phoneNumber" name="phoneNumber" placeholder="+90-533-876.."></td>
                </tr>   
            </table>

            <div class="row">
                <div class="column">
                    <table>
                        <tr>
                            <th>Clothing Item</th>
                            <th>Price</th>
                            <th>Select Your Choice</th>
                        </tr>
                        <tr>
                            <td>T-Shirt</td>
                            <td id="tshirt">$20</td>
                            <td><input type="checkbox" name="clothingItem" value="T-Shirt" data-price="20"></td>
                        </tr>
                        <tr>
                            <td>Jeans</td>
                            <td id="jeans">$50</td>
                            <td><input type="checkbox" name="clothingItem" value="Jeans" data-price="50"></td>
                        </tr>
                        <tr>
                            <td>Jacket</td>
                            <td id="jacket">$100</td>
                            <td><input type="checkbox" name="clothingItem" value="Jacket" data-price="100"></td>
                        </tr>
                        <tr>
                            <td>Shoes</td>
                            <td id="shoes">$80</td>
                            <td><input type="checkbox" name="clothingItem" value="Shoes" data-price="80"></td>
                        </tr>
                        <tr>
                            <td>Hat</td>
                            <td id="hat">$25</td>
                            <td><input type="checkbox" name="clothingItem" value="Hat" data-price="25"></td>
                        </tr>
                        <tr>
                            <td>Sweater</td>
                            <td id="sweater">$60</td>
                            <td><input type="checkbox" name="clothingItem" value="Sweater" data-price="60"></td>
                        </tr>
                    </table>
                </div>
            </div>

            <table border="1">
                <tr>
                    <td>
                        <label><input type="checkbox" name="paymentPlan" value="6" /> 6 Months Plan (2% Interest Rate)</label>
                        <label><input type="checkbox" name="paymentPlan" value="12" /> 12 Months Plan (4% Interest Rate)</label>
                    </td>
                </tr>
            </table>
            <br/>
            <center>
                <input type="submit" value="Insert Data">
            </center>

            <a href="http://localhost/ecc005%20test%20area/">Go back to previous page</a>
        </form>
    </center>
</body>
</html>
