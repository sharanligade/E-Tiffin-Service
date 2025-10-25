<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pending Orders</title>
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
                 <th>Payment Id</th>
                <th>Cart Id</th>
                <th>Tiffin Name</th>
                <th>Description</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Customer Name</th>
                <th>Agent Name</th>
                <th>Mode Of Payment</th>
                <th>Transaction Id</th>
                <th>Amount</th>
                <th>Address</th>
                <th>Mobile Number</th>
                <th>Status</th>
                <th colspan="2">Action</th>
                
                
            </tr>
            <%
                try
                {
                    Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ets","root","");
        Statement st=con.createStatement();
        String cname="'"+(String)session.getAttribute("cname")+"'";
        ResultSet rs=st.executeQuery("select * from payment where cname="+cname+" and flag=0");
        while(rs.next())
        {
            out.println("<tr>");
            int aa=rs.getInt(1);
            out.println("<td>"+aa);
            out.println("<td>"+rs.getString(2));
            out.println("<td>"+rs.getString(3));
            out.println("<td>"+rs.getString(4));
            out.println("<td>"+rs.getString(5));
            out.println("<td>"+rs.getString(6));
            out.println("<td>"+rs.getString(9));
            out.println("<td>"+rs.getString(8));
            out.println("<td>"+rs.getString(10));
            out.println("<td>"+rs.getString(11));
            out.println("<td>"+rs.getString(12));
            out.println("<td>"+rs.getString(13));
            out.println("<td>"+rs.getString(14));
            
            int status=rs.getInt(15);
                        if(status==0)
                        {
                            out.println("<td>Pending");
                        }
            out.println("<td>");
            out.println("<a href='cancelorder.jsp?pid=" + rs.getInt("pid") + "' class='btn btn-danger btn-sm' onclick=\"return confirm('Are you sure you want to cancel this order?');\">Order Cancel</a>");
            out.println("</td>");
           
                        
        }


        
                }
                catch(Exception e)
                {
                    out.println(e);
                }
            %>
        </table>
        <p align="center"><a href="customerdashboard.jsp" class="btn btn-primary">Dashboard</a>  &nbsp;  &nbsp; <a href="custsignout.jsp" class="btn btn-primary" style="background-color: red;">Sign Out</a> &nbsp;  &nbsp; <a href="home.html" class="btn btn-primary">Home</a></p></p>
    </body>
</html>
