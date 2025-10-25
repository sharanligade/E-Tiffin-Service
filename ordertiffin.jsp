<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Confirmation</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            max-width: 600px;
            background: #ffffff;
            padding: 20px;
            margin-top: 50px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        h2 {
            color: #28a745;
        }
        .order-details {
            text-align: left;
            margin-top: 20px;
        }
        .btn-primary {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Order Placed Successfully! ✅</h2>
        <p>Thank you for your order. Below are your order details:</p>
        
        <div class="order-details">
            <p><strong>Payment Mode:</strong> <%= request.getParameter("paymentMode") %></p>
            <p><strong>Transaction ID:</strong> <%= request.getParameter("transactionId") %></p>
            <p><strong>Total Amount:</strong> ₹<%= request.getParameter("totalamount") %></p>
            <p><strong>Delivery Address:</strong> <%= request.getParameter("address") %></p>
            <p><strong>Mobile Number:</strong> <%= request.getParameter("mobile") %></p>
        </div>

        <a href="viewtiffincust.jsp" class="btn btn-primary">Back to Home</a>
    </div>
        <%
            try
            {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ets", "root", "");
                    Statement st = con.createStatement();
                    String cname="'"+(String)session.getAttribute("cname")+"'";
                    st.executeUpdate("insert into payment(cid,tiffinname,description,price,qty,cdate,cname,aname) select * from cart where cname="+cname+"");
                    Statement st1 = con.createStatement();
                    st1.executeUpdate("delete from cart where cname="+cname+"");
                    st1.close();
                    st.close();
                    String a="'"+request.getParameter("paymentMode") +"'";
                     String b="'"+request.getParameter("transactionId") +"'";
                     int c=Integer.parseInt(request.getParameter("totalamount"));
                    String d="'"+request.getParameter("address") +"'";
                    String e="'"+request.getParameter("mobile") +"'";
                     Statement st2=con.createStatement();
                    st2.executeUpdate("update payment set mop="+a+",tid="+b+",amt="+c+",address="+d+",mno="+e+" where cname="+cname+"");
                    st2.close();
                    con.close();
            }
            catch(Exception e)
            {
                out.println(e);
            }
        
        
        %>
</body>
</html>
