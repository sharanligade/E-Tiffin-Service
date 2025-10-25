<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Dashboard</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
        }
        .dashboard-container {
            display: flex;
            width: 100%;
        }
        .sidebar {
            width: 250px;
            background: #2C3E50;
            color: white;
            height: 100vh;
            padding: 20px;
        }
        .sidebar h2 {
            text-align: center;
        }
        .sidebar ul {
            list-style: none;
            padding: 0;
        }
        .sidebar ul li {
            padding: 10px;
        }
        .sidebar ul li a {
            color: white;
            text-decoration: none;
            display: block;
        }
        .sidebar ul li a:hover {
            background: #34495E;
            padding-left: 10px;
            transition: 0.3s;
        }
        .content {
            flex: 1;
            padding: 20px;
            background: #ECF0F1;
        }
        header {
            background: white;
            padding: 20px;
            margin-bottom: 20px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        .cards {
            display: flex;
            gap: 20px;
        }
        .card {
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            flex: 1;
            text-align: center;
        }
        .card h3 {
            margin: 0 0 10px 0;
        }
                 .logout {
            margin-top: 60vh;
            padding-left: 0px;
          }
        .logout a {
            display: block;
            background: #E74C3C;
            color: white;
            text-align: center;
            padding: 10px;
            border-radius: 5px;
            text-decoration: none;
            font-weight: bold;
        }
        .logout a:hover {
            background: #C0392B;
        } 
    </style>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
    <div class="dashboard-container">
        <nav class="sidebar">
            <h3>Customer Panel</h3>
            <ul>
                <li><a href="viewtiffincust.jsp">Order/View Tiffins</a></li>
                <li><a href="deliveredcust.jsp">My Delivered Orders</a></li>
                <li><a href="pendingcust.jsp">My Pending Orders</a></li>
                <li><a href="cancelledordercust.jsp">My Cancelled Orders</a></li>
             </ul>
             <div class="logout">
                <ul>
                   <li><a href="custsignout.jsp"> <b>Logout  &nbsp; <span class="glyphicon glyphicon-log-out"></span></b></a></li>
            </ul>
            </div>
        </nav>
        <main class="content">
            <header>
                <h1>Welcome, <span id="cname"><%= session.getAttribute("cname") != null ? session.getAttribute("cname") : "" %></span></h1>
            </header>
            <section class="cards">
                <div class="card">
                    <h3>Total Orders</h3>
                    <p>
                        <%
                        try
                        {
                            //int id=Integer.parseInt(request.getParameter("id"));
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ets", "root", "");
                            Statement stmt = con.createStatement();
                            String cname="'"+(String)session.getAttribute("cname")+"'";
                            ResultSet rs1 = stmt.executeQuery("SELECT count(cname) FROM payment where cname="+cname+"");
                            //out.println("SELECT count(cname) FROM payment where cname="+cname+"");
                            rs1.next();
                            int cnt=rs1.getInt(1);
                            out.println("<font color=red size=5>"+cnt+"</font>");
                            rs1.close();
                            stmt.close();
                            con.close();
                        }
                        catch(Exception e)
                        {
                            out.println(e);
                        }
                        
                        %></p>
                </div>
               
            </section>
        </main>
    </div>
</body>
</html>
