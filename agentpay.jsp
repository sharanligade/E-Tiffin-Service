<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Place Order</title>
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
            margin-bottom: 20px;
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
        <h2 class="text-center">Pay To Agent</h2>
        <form action="agentdashboard.jsp" method="post" class="form-horizontal">
            <!-- QR Code Display -->
            <div class="qr-container">
                <p><strong>Scan QR Code to Pay</strong></p>
                <img src="qr.jpg" alt="PhonePe QR"> <!-- Replace with actual PhonePe QR code -->
               
            </div>
            
            <!-- Payment Mode -->
            <div class="form-group">
                <label for="paymentMode" class="control-label">Mode of Payment:</label>
                <select id="paymentMode" name="paymentMode" class="form-control" required>
                    <option>Select Mode Of Payment</option>
                    <option value="PhonePe">PhonePe</option>
                    <option value="Gpay">Google Pay (GPay)</option>
                </select>
            </div>
            
            <!-- Transaction ID -->
            <div class="form-group">
                <label for="transactionId" class="control-label">Transaction ID:</label>
                <input type="text"  name="transactionId" class="form-control" placeholder="Enter Transaction ID" required>
            </div>
            <div class="form-group">
                <label for="transactionId" class="control-label">Agent Id:</label>
                <input type="text"  name="aname" class="form-control" value="<%=session.getAttribute("aname")%>"  readonly>
            </div>
            
            <!-- Total Amount -->
            <div class="form-group">
                <label for="totalAmount" class="control-label">Final Amount:</label>
                <input type="text" name="tamt" class="form-control"  readonly>
            </div>
            
            <!-- Submit Button -->
            <button type="submit" class="btn btn-primary">  Submit  </button>
        </form>
    </div>
</body>
</html>
