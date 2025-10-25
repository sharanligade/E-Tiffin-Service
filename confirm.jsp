<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*" %>
<html>
<head>
    <title>Payment Confirmation</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        .confirm-container {
            max-width: 500px;
            margin: auto;
            padding: 20px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            margin-top: 50px;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="container confirm-container">
        <h2 class="text-success">Payment Successful ✅</h2>
        <p>Thank you, <%= session.getAttribute("aname") %>!</p>
        <p>Your payment of ₹<%= session.getAttribute("famt") %> has been processed successfully.</p>
        <a href="agentdashboard.jsp" class="btn btn-primary">Return to Home</a>
    </div>
</body>
</html>
