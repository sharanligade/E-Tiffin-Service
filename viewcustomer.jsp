<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
}

.table-hover tbody tr:hover {
    background: #f1f1f1;
}
.btn-primary {
    background: #007bff;
    border: none;
    padding: 10px 20px;
    border-radius: 5px;
    font-size: 16px;
}
.btn-primary:hover {
    background: blueviolet;
}

</style>
    </head>
    
    <body>
        
        <table class="table table-hover">
            <tr>
                <th>Customer Id</th>
                <th>Customer Name</th>
                <th>Email</th>
                <th>Phone Number</th>
                <th>Address</th>
                <th>Date Of Birth</th>
                <th>Gender</th>
                    
            </tr>
            <%
                try
                {
                    Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ets","root","");
        Statement st=con.createStatement();
        ResultSet rs=st.executeQuery("select * from customer");
        while(rs.next())
        {
            out.println("<tr>");
            out.println("<td>"+rs.getInt(1));
            out.println("<td>"+rs.getString(2)+" "+rs.getString(3));
            out.println("<td>"+rs.getString(4));
            out.println("<td>"+rs.getString(5));
            out.println("<td>"+rs.getString(6));
            out.println("<td>"+rs.getString(8));
            out.println("<td>"+rs.getString(9));
        }
        
                }
                catch(Exception e)
                {
                    out.println(e);
                }
            %>
        </table>
        <p align="center"><a href="admindashboard.jsp" class="btn btn-primary">Dashboard</a>  &nbsp;  &nbsp; <a href="adminsignout.jsp" class="btn btn-primary" style="background-color: red;">Sign Out</a> &nbsp;  &nbsp; <a href="home.html" class="btn btn-primary">Home</a></p>
        
    </body>
</html>
