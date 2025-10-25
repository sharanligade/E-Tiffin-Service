<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Tiffin Details</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <style>
        body {
            background-color: #f7f7f7;
            font-family: Arial, sans-serif;
            padding-bottom: 50px;
        }
        .container {
            margin-top: 30px;
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        table {
            width: 100%;
            background-color: #fff;
            border: 1px solid #ccc;
        }
        th, td {
            padding: 8px 4px;
            text-align: center;
            border: 1px solid #ddd;
            font-size: 13px;
        }
        th {
            background-color: #007bff;
            color: white;
        }
        .btn {
            margin: 2px;
        }
        .btn-sm {
            padding: 5px 10px;
        }
        .text-center-buttons {
            margin-top: 20px;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Tiffin Details</h2>
        <table class="table-bordered">
            <tr>
                <th>Payment ID</th>
                <th>Cart ID</th>
                <th>Tiffin</th>
                <th>Description</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Date</th>
                <th>Customer</th>
                <th>Agent</th>
                <th>Payment Mode</th>
                <th>Transaction ID</th>
                <th>Total</th>
                <th>Address</th>
                <th>Mobile</th>
                <th>Status</th>
                <th colspan="2">Action</th>
            </tr>
            <%
                try {
                    String aname = "'" + (String)session.getAttribute("aname") + "'";
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ets", "root", "");
                    Statement st = con.createStatement();
                    ResultSet rs = st.executeQuery("SELECT * FROM payment WHERE aname=" + aname);

                    while (rs.next()) {
                        int id = rs.getInt(1);
                        int qty = rs.getInt(5);
                        int price = rs.getInt(6);
                        int status = rs.getInt(15);
                        String statusText = (status == 0) ? "Pending" : (status == 1) ? "Delivered" : "Undelivered";

                        out.println("<tr>");
                        out.println("<td>" + id + "</td>");
                        out.println("<td>" + rs.getString(2) + "</td>");
                        out.println("<td>" + rs.getString(3) + "</td>");
                        out.println("<td>" + rs.getString(4) + "</td>");
                        out.println("<td>₹" + price + "</td>");
                        out.println("<td>" + qty + "</td>");
                        out.println("<td>" + rs.getString(7) + "</td>");
                        out.println("<td>" + rs.getString(8) + "</td>");
                        out.println("<td>" + rs.getString(9) + "</td>");
                        out.println("<td>" + rs.getString(10) + "</td>");
                        out.println("<td>" + rs.getString(11) + "</td>");
                        out.println("<td>₹" + (qty * price) + "</td>");
                        out.println("<td>" + rs.getString(13) + "</td>");
                        out.println("<td>" + rs.getString(14) + "</td>");
                        out.println("<td>" + statusText + "</td>");
                        out.println("<td><a href='deliver.jsp?id=" + id + "' class='btn btn-success btn-sm'>Deliver</a></td>");
                        out.println("<td><a href='undeliver.jsp?id=" + id + "' class='btn btn-warning btn-sm'>Undeliver</a></td>");
                        out.println("</tr>");
                    }
                } catch (Exception e) {
                    out.println("<tr><td colspan='17'>Error: " + e + "</td></tr>");
                }
            %>
        </table>

        <div class="text-center-buttons">
           
            <a href="agentdashboard.jsp" class="btn btn-info">Dashboard</a>
            <a href="agentsignout.jsp" class="btn btn-danger">Sign Out</a>
        </div>
    </div>
</body>
</html>
