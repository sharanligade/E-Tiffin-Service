<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Order Tiffins</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <style>
        .tiffin-card {
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            transition: transform 0.3s;
        }
        .tiffin-card:hover {
            transform: scale(1.05);
        }
        .tiffin-card img {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }
        .add-cart {
            background-color: #ff5722;
            color: white;
            border: none;
        }

        /* View Cart Button Styling */
        .view-cart {
            background-color: #007bff;
            color: white;
            transition: background-color 0.3s ease, transform 0.3s ease;
            font-weight: bold;
        }
        .view-cart:hover {
            background-color: #0056b3;
            transform: scale(1.1);
        }
        
        .cart-icon {
            position: fixed;
            top: 20px;
            right: 20px;
            background: #b4f2ae;
            color: black;
            padding: 15px;
            border-radius: 50%;
            cursor: pointer;
            font-size: 25px;
            text-align: center;
            width: 50px;
            height: 50px;
            display: flex;
            justify-content: center;
            align-items: center;
            transition: transform 0.2s;
        }
        
        .cart-icon:hover {
            transform: scale(1.1);
        }

        .cart-container {
            position: fixed;
            bottom: 80px;
            right: 20px;
            width: 350px;
            background: white;
            padding: 15px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(255, 255, 255, 0.1);
            display: none;
        }

        .cart-item {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 10px 0;
            border-bottom: 1px solid #333;
        }

        .cart-item img {
            width: 40px;
            height: 40px;
            border-radius: 5px;
        }

        .cart-item-details {
            flex-grow: 1;
            margin-left: 10px;
        }

        .cart-item-price {
            font-weight: bold;
            color: #ffcc00;
        }

        .btn-remove {
            background: none;
            border: none;
            color: #ff5555;
            cursor: pointer;
            font-size: 18px;
        }
        .btn-success2{
            background-color: orange;
            color: black;
            border: none;
            padding: 10px;
            border-radius: 5px;
            width: 10%;
            cursor: pointer;
            margin-top: 10px;
            font-weight: bold;
        }
        
        .btn-submit {
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
         .btn-success1{
            background-color: blueviolet;
            color: white;
            border: none;
            padding: 10px;
            border-radius: 5px;
            width: 10%;
            cursor: pointer;
            margin-top: 10px;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="container mt-4">
        <h2 class="text-center">
            Tiffin & Thali Menu
            <a href="addtocart.jsp" class="btn btn-success2">View Cart 🛒</a> 
            
        </h2>
        <div class="row">
            <%
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ets", "root", "");
                    Statement stmt = con.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT * FROM tiffindetails");

                    while (rs.next()) {
            %>
            <div class="col-md-4">
                <div class="card tiffin-card">
                    <img src="<%= rs.getString("tiffinimages") %>" class="card-img-top" alt="Tiffin">
                    <div class="card-body">
                        <h5 class="card-title"><%= rs.getString("tiffinname") %></h5>
                        <p class="card-text"><%= rs.getString("description") %></p>
                        <p class="text-danger">₹<%= rs.getString("price") %></p>
                       <% out.println("<a href=addtocartdone.jsp?id="+rs.getInt(1)+" class='btn btn-danger'>AddToCart</a>");%>
                
                    </div>
                </div>
            </div>
            <% 
                    }
                    con.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
        </div>
    </div>
    
        <%  
            Connection con = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ets", "root", "");
                pstmt = con.prepareStatement("SELECT * FROM cart");
                rs = pstmt.executeQuery();
                
                while (rs.next()) {
                    String tiffinName = rs.getString("tiffinname");
                    double price = rs.getDouble("price");
                    int quantity = rs.getInt("qty");
                     out.println("<a href='removecart.jsp?cid=" + rs.getInt(1) + "' class='btn btn-danger' onclick=\"return confirm('Are you sure you want to delete this ?');\">&#128465;</a>");
        %>
       
        <% 
                }
            } catch (Exception e) {
                out.println("<p class='text-danger'>Error: " + e.getMessage() + "</p>");
            } finally {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (con != null) con.close();
            }
        %>

     
    </div>

    
   
</body>
</html>
