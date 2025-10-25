<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Cart & Checkout</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
  
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style>
  body {
    font-family: Arial, sans-serif;
    background-color: #f8f9fa;
    margin: 0;
    padding: 0;
}


h2 {
    text-align: center;
    color: #333;
    margin-bottom: 20px;
}

.table {
    background: #fff;
    border-radius: 5px;
    overflow: hidden;
}

.table th {
    background: #007bff;
    color: white;
    text-align: center;
    padding: 10px;
}

.table td {
    text-align: center;
    padding: 10px;
    vertical-align: middle;
}

h4 {
    font-size: 20px;
    font-weight: bold;
    margin-top: 20px;
}

.btn-success {
    display: block;
    width: 100%;
    padding: 12px;
    font-size: 18px;
    font-weight: bold;
    border-radius: 5px;
    transition: 0.3s ease-in-out;
}

.btn-success:hover {
    background: #28a745;
    transform: scale(1.05);
}
</style>
</head>
<body>
    <form action="agentpay.jsp" >
    <div class="container mt-4 cart-container">
        <h2 class="text-center">Payment To Agent</h2>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Agent PayID</th>
                    <th>cartID</th>
                    <th>Tiffin Name</th>
                    <th>Description</th>
                    <th>Price(₹)</th>
                    <th>Quantity</th>
                    <th>Date</th>
                    <th>Customer Name</th>
                    <th>Agent name</th>
                    <th>Total Amount</th>
                    <th>Commission</th>
                    <th>Final Amount</th>
                    <th>Address</th>
                    <th>Mobile No</th>
                </tr>
            </thead>
          <%
                try
                {
                    Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ets","root","");
        Statement st=con.createStatement();
        ResultSet rs=st.executeQuery("select * from paymentm");
        while(rs.next())
        {
            out.println("<tr>");
            out.println("<td>"+rs.getInt(1));
            out.println("<td>"+rs.getString(2));
            out.println("<td>"+rs.getString(3));
            out.println("<td>"+rs.getString(4));
            out.println("<td>"+rs.getString(5));
            out.println("<td>"+rs.getString(6));
            out.println("<td>"+rs.getString(7));
            out.println("<td>"+rs.getString(8));
            out.println("<td>"+rs.getString(9));
            out.println("<td>"+rs.getString(10));
            out.println("<td>"+rs.getString(11));
            out.println("<td>"+rs.getString(12));
            out.println("<td>"+rs.getString(13));
            out.println("<td>"+rs.getString(14));
            
                    }
        
                }
                catch(Exception e)
                {
                    out.println(e);
                }
            %>
        </table>
        
        <button type="submit" class="btn btn-success">Proceed to payment</button>
         
       
    </div>

    </form>
</body>
</html>
