<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
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
            width: 255px;
            background: #2C3E50;
            color: white;
            height: 100vh;
            padding: 20px;
        }
        .sidebar h2 {
            padding-left: 10px;
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
            padding: 25px;
            background: #ECF0F1;
        }
        header {
            background: white;
            padding: 20px;
            margin-bottom: 20px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
       
        .logout {
            margin-top: 35vh;
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
        
        /* General Card Styles */
.cards {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-around;
    gap: 20px;
    padding: 30px;
}

.card {
    background: #fff;
    border-radius: 10px;
    width: 280px;
    padding: 20px;
    text-align: center;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    margin: 10px;
    position: relative;
}

.card:hover {
    transform: translateY(-10px);
    box-shadow: 0 6px 18px rgba(0, 0, 0, 0.15);
}

.card h3 {
    font-size: 20px;
    color: #333;
    margin-bottom: 15px;
    font-weight: bold;
}

.card p {
    font-size: 24px;
    font-weight: bold;
    color: #222;
    margin: 0;
}

.card .counter {
    font-size: 30px;
    font-weight: 600;
    color: #27AE60;  /* Green color for counters */
}

.card .card-footer {
    background: #f5f5f5;
    padding: 10px;
    margin-top: 15px;
    font-size: 14px;
    color: #7F8C8D;
}

.card1 {
    background: #fff;
    border-radius: 10px;
    width: 280px;
    padding: 20px;
    text-align: center;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    margin: 75px;
}

.card1:hover {
    transform: translateY(-10px);
    box-shadow: 0 6px 18px rgba(0, 0, 0, 0.15);
}

.card1 h3 {
    font-size: 20px;
    color: #333;
    margin-bottom: 15px;
    font-weight: bold;
}

.card1 p {
    font-size: 24px;
    font-weight: bold;
    color: #222;
    margin: 0;
}

/* Responsive Design for Mobile */
@media (max-width: 768px) {
    .cards {
        flex-direction: column;
        align-items: center;
    }

    .card {
        width: 90%;
        margin: 10px 0;
    }

    .card1 {
        width: 90%;
        margin: 10px 0;
    }
}
 
    </style>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
    <div class="dashboard-container">
        <nav class="sidebar">
            <div>
            <h2>Admin Panel</h2>
            <ul>
                  <li><a href="viewcustomer.jsp">View Customer</a></li>
                  <li><a href="viewagent.jsp">View Agent</a></li>
                  <li><a href="selectedagent.jsp">Approved Agent List</a></li>
                  <li><a href="rejectedagent.jsp">Rejected Agent List</a></li>
                  <li><a href="viewpaymenta.jsp"> Pay Agent Commission</a></li>
                  <li><a href="agentpaid.jsp"> Paid Agent Commission</a></li>
                  <li><a href="viewtiffincust.jsp"> View Tiffins All</a></li>
                  <li><a href="blogs.html">Blogs</a></li>
                  <li><a href="viewcontactus.jsp">Contact US</a></li>
                  
                  
            </ul>
            </div>
             <div class="logout">
                <ul>
                    <li><a href="adminsignout.jsp"><b>Logout  &nbsp; <span class="glyphicon glyphicon-log-out"> </span></b></a></li>
                </ul>
            </div>
        </nav>
        <main class="content">
            <header>
                <h1>Welcome, Admin</h1>
            </header>
            <section class="cards">
                <div class="card">
                    <h3>Total Orders</h3>
                    <p>
                        <%
                        try
                        {
                            
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ets", "root", "");
                            Statement stmt = con.createStatement();
                            String cname="'"+(String)session.getAttribute("cname")+"'";
                            ResultSet rs1 = stmt.executeQuery("SELECT count(cname) FROM payment ");
                           
                            rs1.next();
                            int cnt=rs1.getInt(1);
                            out.println("<font color=black size=5>"+cnt+"</font>");
                            rs1.close();
                            stmt.close();
                            con.close();
                        }
                        catch(Exception e)
                        {
                            out.println(e);
                        }
                        
                        %>
                    </p>
                </div>
                <div class="card">
                    <h3>Earnings</h3>
                    <p>
                <%
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ets", "root", "");
                Statement stmt = con.createStatement();

                ResultSet rs = stmt.executeQuery("SELECT tamt, commission FROM paymentm");
                double totalAdminEarnings = 0;

                while (rs.next()) {
                    double tamt = rs.getDouble("tamt");
                    double commissionPercent = rs.getDouble("commission");
                    double adminShare = (tamt * commissionPercent) / 100.0;
                    totalAdminEarnings += adminShare;
                }

                out.println("₹" + String.format("%.2f", totalAdminEarnings));

                rs.close();
                stmt.close();
                con.close();
            } catch(Exception e) {
                out.println("<span style='color:blue;'>Error: " + e.getMessage() + "</span>");
            }
            %>

                    </p>
                </div>
                <div class="card">
                    <h3>Total Customers</h3>
                    <p>
                        <%
                        try
                        {
                            
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ets", "root", "");
                            Statement stmt = con.createStatement();
                            String email="'"+(String)session.getAttribute("email")+"'";
                            ResultSet rs1 = stmt.executeQuery("SELECT count(email) FROM customer ");
                           
                            rs1.next();
                            int cnt=rs1.getInt(1);
                            out.println(""+cnt+"");
                            rs1.close();
                            stmt.close();
                            con.close();
                        }
                        catch(Exception e)
                        {
                            out.println(e);
                        }
                        
                        %>
                    </p>
                </div>
            </section>
                <div class="card1">
                    <h3>Total Agents</h3>
                    <p>
                        <%
                        try
                        {
                            
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ets", "root", "");
                            Statement stmt = con.createStatement();
                            String email="'"+(String)session.getAttribute("email")+"'";
                            ResultSet rs1 = stmt.executeQuery("SELECT count(email) FROM agent ");
                           
                            rs1.next();
                            int cnt=rs1.getInt(1);
                            out.println(""+cnt+"");
                            rs1.close();
                            stmt.close();
                            con.close();
                        }
                        catch(Exception e)
                        {
                            out.println(e);
                        }
                        
                        %>
                    </p>
                </div>
            </section>
        </main>
    </div>
</body>
</html>
