<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Place Order</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>



    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            max-width: 600px;
            background: #ffffff;
            padding: 20px;
            margin-top: 10px;
            
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        h2 {
            color: #007bff;
            margin-bottom: 1px;
        }
        .btn-primary {
            width: 100%;
            padding: 10px;
            border-radius: 5px;
        }
        .qr-container {
            text-align: center;
            margin-bottom: 2px;
        }
        .qr-container img {
            max-width: 150px;
            border: 1px solid #ddd;
            border-radius: 10px;
            padding: 5px;
            background: #fff;
        }
       
    </style>
    </head>
<body>
    <div class="container">
        <h2 class="text-center">Place Your Order</h2>
        <form action="ordertiffin.jsp" method="post" class="form-horizontal">
    <div class="form-group">
        <label for="paymentMode" class="control-label">Mode of Payment:</label>
        <select id="paymentMode" name="paymentMode" class="form-control" required onchange="toggleQR()">
            <option value="">Select Mode Of Payment</option>
            <option value="PhonePe">PhonePe</option>
            <option value="Gpay">Gpay</option>
            <option value="COD">Cash on Delivery</option>
        </select>
    </div>

    <!-- QR Code Section -->
    <div class="form-group qr-container" id="qrSection" style="display: none;">
        <p><strong>Scan QR Code to Pay</strong></p>
        <img src="qr.jpg" alt="QR Code" style="max-width: 200px;">
    </div>

    <!-- Transaction ID Section -->
    <div class="form-group" id="transIdSection" style="display: none;">
        <label for="transactionId" class="control-label">Transaction ID:</label>
        <input type="text" id="transactionId" name="transactionId" class="form-control" placeholder="Enter Transaction ID">
    </div>

    <div class="form-group">
        <label for="totalAmount" class="control-label">Total Amount:</label>
        <input type="text" id="totalAmount" name="totalamount" class="form-control" value="<%=session.getAttribute("amt")%>" readonly>
    </div>

    <div class="form-group">
        <label for="address" class="control-label">Delivery Address:</label>
        <textarea id="address" name="address" class="form-control" placeholder="Enter your address" required></textarea>
    </div>

    <div class="form-group">
        <label for="mobile" class="control-label">Mobile Number:</label>
        <input type="tel" id="mobile" name="mobile" class="form-control" placeholder="Enter Mobile Number" required>
    </div>

    <button type="submit" class="btn btn-primary">Place Order</button>
</form>

<script>
function toggleQR() {
    var mode = document.getElementById("paymentMode").value;
    var qrSection = document.getElementById("qrSection");
    var transIdSection = document.getElementById("transIdSection");
    var transInput = document.getElementById("transactionId");

    if (mode === "PhonePe" || mode === "Gpay") {
        qrSection.style.display = "block";
        transIdSection.style.display = "block";
        transInput.required = true;
    } else {
        qrSection.style.display = "none";
        transIdSection.style.display = "none";
        transInput.value = "";
        transInput.required = false;
    }
}
</script>

    </div>
    
</body>
</html>
