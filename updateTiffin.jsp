<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*, java.io.*, javax.servlet.*, javax.servlet.http.*"%>
<%
    String tiffinIdStr = request.getParameter("tiffin_id");
    String tiffinName = request.getParameter("tiffinName");
    String price = request.getParameter("price");
    String category = request.getParameter("category");
    String type = request.getParameter("type");
    String description = request.getParameter("description");

    out.println("Debug: Received tiffin_id = " + tiffinIdStr + "<br>");

    if (tiffinIdStr == null || tiffinIdStr.isEmpty()) {
        out.println("<p class='text-danger'>Error: Tiffin ID is missing!</p>");
        return;
    }

    int tiffin_id = Integer.parseInt(tiffinIdStr);
    
    Connection con = null;
    PreparedStatement ps = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ets", "root", "");
        
        String updateQuery = "UPDATE tiffindetails SET tiffinName=?, price=?, category=?, type=?, description=? WHERE tiffin_id=?";
        ps = con.prepareStatement(updateQuery);
        
        ps.setString(1, tiffinName);
        ps.setString(2, price);
        ps.setString(3, category);
        ps.setString(4, type);
        ps.setString(5, description);
        ps.setInt(6, tiffin_id);

        int rowsUpdated = ps.executeUpdate();

        if (rowsUpdated > 0) {
            out.println("<p class='text-success'>Tiffin updated successfully!</p>");
        } else {
            out.println("<p class='text-danger'>Error: No Tiffin found with ID " + tiffin_id + "</p>");
        }
    } catch (Exception e) {
        out.println("<p class='text-danger'>Error: " + e.getMessage() + "</p>");
        e.printStackTrace();
    } finally {
        if (ps != null) ps.close();
        if (con != null) con.close();
    }
%>

<a href="viewtiffindetails.jsp" class="btn btn-primary">Back to Tiffin List</a>
