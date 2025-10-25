<%-- 
    Document   : addtocartdone
    Created on : Mar 25, 2025, 6:34:47 PM
    Author     : shara
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>

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
    background: #f4f8fb;
    font-family: 'Arial', sans-serif;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 195vh;
    padding: 20px;
}

form {
    background: white;
    padding: 30px;
    border-radius: 12px;
    box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.2);
    max-width: 600px;
    width: 100%;
}

h2 {
    text-align: center;
    font-size: 22px;
    font-weight: bold;
    color: #333;
    margin-bottom: 20px;
}

.form-group {
    margin-bottom: 15px;
}

label {
    font-weight: bold;
    color: #444;
}

input[type="text"] {
    width: 100%;
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 8px;
    transition: all 0.3s ease;
}

input[type="text"]:focus {
    border-color: #007bff;
    box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
    outline: none;
}

button {
    width: 100%;
    padding: 12px;
    border: none;
    border-radius: 8px;
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
}

.btn-danger:hover {
    background: #a71d2a;
}

.btn-success {
    background: #28a745;
    color: white;
}

.btn-success:hover {
    background: #1c7a33;
}

img {
    display: block;
    margin: 10px auto;
    border-radius: 10px;
}

@media (max-width: 768px) {
    form {
        max-width: 100%;
        padding: 20px;
    }
}
</style>
       <%! ResultSet rs;%>
  <%
                try {
                    int id=Integer.parseInt(request.getParameter("id"));
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ets", "root", "");
                    Statement st = con.createStatement();
                   rs = st.executeQuery("SELECT * FROM payment WHERE pid="+id+"");
                   rs.next();
                   //out.println(rs.getInt(1));
                  
                } catch (Exception e) {
                    out.println("<tr><td colspan='8'>Error: " + e + "</td></tr>");
                }
            %>
            <script type="text/javascript">
                function compute()
                {
                    var a=document.forms[0].amt.value;
                    var b=document.forms[0].comi.value;
                    var c=parseInt(a)-parseInt(a*b/100);
                    document.forms[0].famt.value=c;
                }
            </script>
    </head>
    <body>
        
        <form action="viewmerpay.jsp" method="POST">
           <h2 class="text-center" >Merchant Payment </h2> </p>
             <div class="form-group">
                    <label for="tiffinname">Payment ID</label>
                    <input type="text" class="form-control" name="paymentid" value="<%=rs.getInt(1)%>" readonly>
                </div>
                <div class="form-group">
                    <label for="Description">Cart ID</label>
                    <input type="text" class="form-control" name="cartid" value="<%=rs.getInt(2)%>"  readonly>
                </div>
           <div class="form-group">
                    <label for="price">Tiffin Name</label>
                    <input type="text" class="form-control" name="tiffinname" value="<%=rs.getString(3)%>" readonly>
                </div>
           <div class="form-group">
                    <label for="price">Description</label>
                    <input type="text" class="form-control" name="description" value="<%=rs.getString(4)%>" readonly>
                </div>
           <div class="form-group">
                    <label for="price">price</label>
                    <input type="text" class="form-control" name="price" value="<%=rs.getString(5)%>" readonly>
                </div>
           <div class="form-group">
                    <label for="price">Quantity</label>
                    <input type="text" class="form-control" name="qty" value="<%=rs.getString(6)%>" readonly>
                </div>
           <div class="form-group">
                    <label for="price">Current Date</label>
                    <input type="text" name="date" class="form-control" value="<%=rs.getString(7)%>"  readonly>
                </div>
           <div class="form-group">
                    <label for="price">Customer Name</label>
                    <input type="text" class="form-control" name="cname" value="<%=rs.getString(8)%>" readonly >
                </div>
           <div class="form-group">
                    <label for="price">Agent Name</label>
                    <input type="text" class="form-control" name="aname" value="<%=rs.getString(9)%>" readonly >
                </div>
           <div class="form-group">
                    <label for="price">Total Amount</label>
                    <input type="text" class="form-control" name="amt" value="<%=rs.getString(12)%>" readonly >
                </div>
           <div class="form-group">
                    <label for="price">Commission</label>
                    <input type="text" class="form-control" name="comi" onblur="compute()">
                </div>
           <div class="form-group">
                    <label for="price">Final Amount</label>
                    <input type="text" class="form-control" name="famt" readonly >
                </div>
           <div class="form-group">
               <label for="price">Merchant Scanner</label><br>
                    <img src="qr.jpg" alt="QR Code" height="150px" width="150px">
                </div>
          <div class="form-group">
                <label for="address" class="control-label">Delivery Address:</label>
                <input id="address" name="address" class="form-control" value="<%=rs.getString(13)%>"  readonly></input>
            </div>
           <div class="form-group">
                    <label for="price">Mobile Number</label>
                    <input type="text" class="form-control" name="mno" value="<%=rs.getString(14)%>" readonly >
                </div>
           <div class="form-group">
                    <label for="price">Transaction ID</label>
                    <input type="text" class="form-control" name="transactionid"  required >
                </div>
                </div>
                <button type="submit" class="btn btn-primary btn-login">Proceed To Payment</button> 
                
            </form>

            
  
   
        
    </body>
</html>
