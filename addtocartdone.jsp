<%-- 
    Document   : addtocartdone
    Created on : Mar 25, 2025, 6:34:47 PM
    Author     : shara
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<%! ResultSet rs;%>
<%
    try
    {
        int id=Integer.parseInt(request.getParameter("id"));
         Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ets", "root", "");
                    Statement stmt = con.createStatement();
                     rs = stmt.executeQuery("SELECT * FROM tiffindetails where tiffin_id="+id+"");
                     rs.next();
                    
    }
    catch(Exception e)
    {
        out.println(e);
    }


%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <title></title>
        <style>
            body {
    background: #ccf0d5;
    font-family: 'Arial', sans-serif;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    padding: 20px;
}

form {
    background: #f7edcd;
    padding: 25px;
    border-radius: 10px;
    box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
    max-width: 650px;
    width: 200%;
}

.form-group {
    margin-bottom: 15px;
}

label {
    font-weight: bold;
    color: #333;
}

input[type="text"], input[type="number"] {
    width: 100%;
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 5px;
    transition: all 0.3s ease;
}

input[type="text"]:focus, input[type="number"]:focus {
    border-color: #007bff;
    box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
    outline: none;
}

button {
    width: 100%;
    padding: 10px;
    border: none;
    border-radius: 5px;
    font-size: 16px;
    font-weight: bold;
    cursor: pointer;
    transition: background 0.3s;
}

.btn-primary {
    background: #007bff;
    color: #fff;
}

.btn-primary:hover {
    background: #0056b3;
}

.btn-danger {
    background: #dc3545;
    color: #fff;
    text-align: center;
    display: block;
    margin-top: 5px;
}

    

.btn-success{
     background: darkgoldenrod;
    color: #fff;
    text-align: center;
    display: block;
    margin-top: 5px;
}
.btn-danger:hover {
    background: green;
}

@media (max-width: 480px) {
    form {
        max-width: 100%;
    }
}

        </style>
    </head>
    <body>
        
       <form action="atcd.jsp" method="POST">
           <h2 class="text-center" > Add To Cart 🛒 </h2> </p>
                <div class="form-group">
                    <label for="tiffinname">Tiffin Name</label>
                    <input type="text" class="form-control" name="tiffinname" placeholder="Enter Tiffinname" value="<%=rs.getString(2)%>" readonly>
                </div>
                <div class="form-group">
                    <label for="Description">Description</label>
                    <input type="text" class="form-control" name="description" placeholder="Enter Description" value="<%=rs.getString(6)%>" readonly>
                </div>
           <div class="form-group">
                    <label for="price">Price</label>
                    <input type="text" class="form-control" name="price" placeholder="Enter price" value="<%=rs.getString(3)%>" readonly>
                </div>
           <div class="form-group">
                    <label for="price">Quantity</label>
                    <input type="number" class="form-control" min="1" max="500" name="qty" placeholder="Enter quantity" required>
                </div>
           <div class="form-group">
                    <label for="price">Current Date</label>
                    <input type="text" name="date" class="form-control" value="<%
                           java.util.Date d=new java.util.Date();
                           int dd=d.getDate();
                           String mm=d.getMonth()+1+"";
                           int yy=d.getYear()-100;
                           String y="20"+yy;
                           if(mm.length()<2)
                               mm="0"+mm;
                           out.println(dd+"-"+mm+"-"+y);
                           
%>"  readonly>
                </div>
           <div class="form-group">
                    <label for="price">Customer Name</label>
                    <input type="text" class="form-control" name="cname" value="<%=(String)session.getAttribute("cname")%>" readonly >
                </div>
           <div class="form-group">
                    <label for="price">Agent Name</label>
                    <input type="text" class="form-control" name="aname" value="<%=rs.getString("aname")%>" readonly >
                </div>
                </div>
                <button type="submit" class="btn btn-primary btn-login">Submit</button> 
                 <a href="viewtiffincust.jsp" class="btn btn-danger">Add More</a>
                 <a href="addtocart.jsp" class="btn btn-success" style="background-color: blueviolet;">Your Cart</a>
            </form>

            
  
   
        
    </body>
</html>
