<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Tiffin</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <h2 class="text-center">Edit Tiffin Details</h2>
        <%
            int tiffin_id = Integer.parseInt(request.getParameter("tiffin_id"));
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ets", "root", "");
            PreparedStatement ps = con.prepareStatement("SELECT * FROM tiffindetails WHERE tiffin_id=?");
            ps.setInt(1, tiffin_id);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
        %>
        <form action="updateTiffin.jsp" method="post" >
            <input type="hidden" name="tiffin_id" value="<%= rs.getInt(1) %>">
            <div class="form-group">
                <label>Tiffin Name:</label>
                <input type="text" class="form-control" name="tiffinName" value="<%= rs.getString(2) %>" required>
            </div>
            <div class="form-group">
                <label>Price:</label>
                <input type="text" class="form-control" name="price" value="<%= rs.getString(3) %>" required>
            </div>
            <div class="form-group">
                <label>Category:</label>
                <input type="text" class="form-control" name="category" value="<%= rs.getString(4) %>" required>
            </div>
            <div class="form-group">
                <label>Type:</label>
                <input type="text" class="form-control" name="type" value="<%= rs.getString(5) %>" required>
            </div>
            <div class="form-group">
                <label>Description:</label>
                <textarea class="form-control" name="description" required><%= rs.getString(6) %></textarea>
            </div>
            <div class="form-group">
                <label>Current Image:</label><br>
                <img src="<%= rs.getString(7) %>" width="150" height="100"><br><br>
                <label>Upload New Image:</label>
                <input type="file" class="form-control" name="newImage">
            </div>
            <button type="submit" class="btn btn-success">Update</button>
            <a href="viewtiffindetails.jsp" class="btn btn-secondary">Cancel</a>
        </form>
        <% } else { %>
            <p class="text-danger">Tiffin not found.</p>
        <% } %>
        
    </div>
</body>
</html>
