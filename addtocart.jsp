<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Cart & Checkout</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        .cart-container {
            max-width: 800px;
            margin: auto;
        }
        .cart-item {
            border-bottom: 1px solid #ddd;
            padding: 10px;
        }
        .remove-item {
            color: red;
            cursor: pointer;
        }
          .btn-success{
            background-color: green;
            color: black;
            border: none;
            padding: 10px;
            border-radius: 5px;
            width: 100%;
            cursor: pointer;
            margin-top: 10px;
            font-weight: bold;
        }
        .btn-custom{
            background-color: #ffcc00;
            color: black;
            border: none;
            padding: 10px;
            border-radius: 5px;
            width: 100%;
            cursor: pointer;
            margin-top: 10px;
            font-weight: bold;
        }
      
        
    </style>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
    <form action="payment.jsp" >
    <div class="container mt-4 cart-container">
        <h2 class="text-center">Your Cart 🛒</h2>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>CartId</th>
                    <th>Item</th>
                    <th>Description</th>
                    <th>Price (₹)</th>
                    <th>Quantity</th>
                    <th>Date</th>
                    <th>Remove</th>
                </tr>
            </thead>
        <%! int faamt=0;%>
            <%
                try
                {
                       Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ets","root","");
        Statement st=con.createStatement();
        String cname="'"+(String)session.getAttribute("cname")+"'";
        ResultSet rs=st.executeQuery("select * from cart where cname="+cname+"");
        int famt=0;
        while(rs.next())
        {
            out.println("<tr>");
            int aa=rs.getInt(1);
            out.println("<td>"+aa);
            out.println("<td>"+rs.getString(2));
            out.println("<td>"+rs.getString(3));
            int amt=rs.getInt(4);
            
            out.println("<td>"+amt);
            int qty=rs.getInt(5);
            out.println("<td>"+qty);
                    famt=famt+(amt*qty);;
            out.println("<td>"+rs.getString(6));
            out.println("<td><a href=removec.jsp?id="+aa+">❌</a>");
            
            
        }
        faamt=famt;
        session.setAttribute("amt",faamt);
                }
                catch(Exception e)
                {
                    out.println(e);
                }
            
            
            %>
        </table>
        <h4 class="text-end">Total: ₹<span id="total-price"><%=faamt%></span></h4>
        <button type="submit" class="btn btn-success" onclick="return confirm('Are you sure you want to Order this TIffin?')">Proceed to payment</button>

         <a class="btn btn-custom" href="viewtiffincust.jsp" style="background-color: orchid;">Add More &nbsp;⬅️ </a>
         <a class="btn btn-custom" href="customerdashboard.jsp">Dashboard &nbsp;⬅️ </a>
       
    </div>

    </form>
</body>
</html>
