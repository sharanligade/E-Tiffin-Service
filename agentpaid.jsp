<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
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
               
                <th>Agent Name</th>
                 <th>Customer Name</th>
                
                
                <th>Amount</th>
                <th>Commssion %</th>
                <th>Final Amount</th>
                <th>Mobile Number</th>
                
                <th>Address</th>
                <th>Transaction Id</th>
                
                
            </tr>
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
            out.println("<td>"+rs.getString(15));
            
        }


        
                }
                catch(Exception e)
                {
                    out.println(e);
                }
            %>
        </table>
        <p align="center"><a href="admindashboard.jsp" class="btn btn-primary">Dashboard</a>  &nbsp;  &nbsp; <a href="adminsignout.jsp" class="btn btn-primary" style="background-color: red;">Sign Out</a> &nbsp;  </p></p>
    </body>
</html>
