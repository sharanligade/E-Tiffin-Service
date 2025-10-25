<%-- 
    Document   : removec
    Created on : Mar 26, 2025, 7:30:55 PM
    Author     : shara
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
 <%
                try
                {
                    Class.forName("com.mysql.jdbc.Driver");
                  Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ets","root","");
                Statement st=con.createStatement();
                int id=Integer.parseInt(request.getParameter("id"));
                String q="delete from cart where cid="+id+"";
                st.executeUpdate(q);
                st.close();
                con.close();
                response.sendRedirect("addtocart.jsp");
                
                }
                catch(Exception e)
                {
                    out.println(e);
                }
                
%>