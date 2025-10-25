<%-- 
    Document   : adminsignout
    Created on : Mar 14, 2025, 8:15:20 PM
    Author     : shara
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    session.invalidate();
    response.sendRedirect("adminlogin1.html");

%>