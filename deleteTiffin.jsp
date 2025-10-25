<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<%
    try {
        int tiffin_id = Integer.parseInt(request.getParameter("tiffin_id"));

        // Database Connection
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ets", "root", "");

        // Delete Query
        PreparedStatement ps = con.prepareStatement("DELETE FROM tiffindetails WHERE tiffin_id=?");
        ps.setInt(1, tiffin_id);
        
        int deleted = ps.executeUpdate();

        if (deleted > 0) {
            response.sendRedirect("viewtiffindetails.jsp?msg=deleted");
        } else {
            out.println("<p class='text-danger'>Failed to delete tiffin.</p>");
        }
    } catch (Exception e) {
        out.println("<p class='text-danger'>Error: " + e.getMessage() + "</p>");
    }
%>
