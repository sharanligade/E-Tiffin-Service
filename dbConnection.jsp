<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="java.sql.*"%>
<%
    String url = "jdbc:mysql://localhost:3306/ets";
    String user = "root";
    String pass = "";

    
    


    try {
       Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ets", "root", "");
    } catch (Exception e) {
        out.println("Database Connection Failed: " + e.getMessage());
    }
%>
