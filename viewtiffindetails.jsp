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
                <th>Tiffin_Id</th>
                <th>Tiffin Name</th>
                <th>Price</th>
                <th>Category</th>
                <th>Type</th>
                <th>Description</th>
                <th>Image</th>
                <th>Actions</th>
            </tr>
            <%
                try {
                    String aname = "'" + (String)session.getAttribute("aname") + "'";
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ets", "root", "");
                    Statement st = con.createStatement();
                    ResultSet rs = st.executeQuery("SELECT * FROM tiffindetails WHERE aname=" + aname);

                    while (rs.next()) { // Ensure buttons are inside this loop
                        out.println("<tr>");
                        out.println("<td>" + rs.getInt(1) + "</td>");
                        out.println("<td>" + rs.getString(2) + "</td>");
                        out.println("<td>" + rs.getString(3) + "</td>");
                        out.println("<td>" + rs.getString(4) + "</td>");
                        out.println("<td>" + rs.getString(5) + "</td>");
                        out.println("<td>" + rs.getString(6) + "</td>");
                        out.println("<td><img src='" + rs.getString(7) + "' height='100' width='150'></td>");
                        out.println("<td>");
                        out.println("<a href='editTiffin.jsp?tiffin_id=" + rs.getInt(1) + "' class='btn btn-primary'>Edit</a> ");
                        out.println("<a href='deleteTiffin.jsp?tiffin_id=" + rs.getInt(1) + "' class='btn btn-danger' onclick=\"return confirm('Are you sure you want to delete this tiffin?');\">Delete</a>");
                        out.println("</td>");
                        out.println("</tr>");
                    }
                } catch (Exception e) {
                    out.println("<tr><td colspan='8'>Error: " + e + "</td></tr>");
                }
            %>
        </table>
        <div class="text-center">
            <a href="addtiffin.jsp" class="btn btn-primary">Add Tiffins</a>
            <a href="agentsignout.jsp" class="btn btn-danger">Sign Out</a>
            <a href="agentdashboard.jsp" class="btn btn-primary">Dashboard</a>
        </div>
    </div>
</body>
</html>
