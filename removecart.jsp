<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<%
    try {
        int cid = Integer.parseInt(request.getParameter("cid"));

        // Database Connection
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ets", "root", "");

        // Delete Query
        PreparedStatement ps = con.prepareStatement("DELETE FROM cart WHERE cid=?");
        ps.setInt(1, cid);
        
        int deleted = ps.executeUpdate();

        if (deleted > 0) {
            response.sendRedirect("viewtiffincust.jsp?msg=deleted");
        } else {
            out.println("<p class='text-danger'>Failed to delete tiffin.</p>");
        }
    } catch (Exception e) {
        out.println("<p class='text-danger'>Error: " + e.getMessage() + "</p>");
    }
%>
