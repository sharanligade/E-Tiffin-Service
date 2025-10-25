<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>View Tiffin Details</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <style>
        .table {
            width: 100%;
            background: white;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }
        .table th {
            background: #007bff;
            color: white;
            padding: 10px;
            text-align: center;
        }
        .table-hover tbody tr:hover {
            background: #f1f1f1;
        }
        .btn-primary, .btn-danger {
            padding: 8px 15px;
            border-radius: 5px;
            font-size: 14px;
        }
        .btn-primary:hover {
            background: blueviolet;
        }
        .btn-danger {
            background: red;
            border: none;
        }
        .btn-danger:hover {
            background: darkred;
        }
        img {
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="text-center">Tiffin Details</h2>
        <table class="table table-hover text-center">
            <tr>
                <th>Payment Id</th>
                <th>Cart Id</th>
                <th>Tiffin Name</th>
                <th>Description</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Current Date</th>
                <th>Customer Name</th>
                <th>Agent Name</th>
                <th>Mode Of Payment</th>
                <th>Transaction Id</th>
                <th>Amount</th>
                <th>Address</th>
                <th>Mobile Number</th>
                <th>Status</th>
                <th>Payment</th>
            </tr>
            <%
                try {
                    //String aname = "'" + (String)session.getAttribute("aname") + "'";
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ets", "root", "");
                    Statement st = con.createStatement();
                    ResultSet rs = st.executeQuery("SELECT * FROM payment where flag=1 and pflag=0");

                    while (rs.next()) { // Ensure buttons are inside this loop
                        out.println("<tr>");
                        int a=rs.getInt(1) ;
                        out.println("<td>" +a + "</td>");
                        out.println("<td>" + rs.getString(2) + "</td>");
                        out.println("<td>" + rs.getString(3) + "</td>");
                        out.println("<td>" + rs.getString(4) + "</td>");
                        int qty=rs.getInt(5);
                        int price=rs.getInt(6);
                        out.println("<td>" + qty + "</td>");
                        out.println("<td>" + price + "</td>");
                        out.println("<td>" + rs.getString(7) + "</td>");
                        out.println("<td>" + rs.getString(8) + "</td>");
                        out.println("<td>" + rs.getString(9) + "</td>");
                        out.println("<td>" + rs.getString(10) + "</td>");
                        out.println("<td>" + rs.getString(11) + "</td>");
                        out.println("<td>" + (qty*price) + "</td>");
                        out.println("<td>" + rs.getString(13) + "</td>");
                        out.println("<td>" + rs.getString(14) + "</td>");
                        int status=rs.getInt(15);
                        if(status==0)
                        {
                            out.println("<td>Pending");
                        }
                        else if(status==1)
                        {
                            out.println("<td>Delivered");
                        }
                        else
                        {
                            out.println("<td>Undelivered");
                        }
                        out.println("<td><a href=paymentm.jsp?id="+a+">PaymentToMerchant</a>");
                      
                    }
                } catch (Exception e) {
                    out.println("<tr><td colspan='8'>Error: " + e + "</td></tr>");
                }
            %>
        </table>
        <div class="text-center">
         
            <a href="adminsignout.jsp" class="btn btn-danger">Sign Out</a>
            <a href="admindashboard.jsp" class="btn btn-primary">Dashboard</a>
        </div>
    </div>
</body>
</html>
