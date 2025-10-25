<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<%
    try {
        int pid = Integer.parseInt(request.getParameter("pid"));
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ets", "root", "");

        // Mark order as cancelled by updating the flag
        PreparedStatement ps = con.prepareStatement("UPDATE payment SET flag = 3 WHERE pid = ?");
        ps.setInt(1, pid);
        int result = ps.executeUpdate();

        if (result > 0) {
            response.sendRedirect("pendingcust.jsp?msg=cancelled");
        } else {
            response.sendRedirect("pendingcust.jsp?msg=error");
        }
    } catch (Exception e) {
        out.println("Error: " + e);
    }
%>
