<%-- 
    Document   : approvea
    Created on : Mar 20, 2025, 9:00:25 PM
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
        String q="update agent set flag=1 where aid="+id+"";
        out.println(q);
        st.executeUpdate(q);
        st.close();
        con.close();
        response.sendRedirect("viewagent.jsp");
        }
        catch(Exception e)
        {
        
        }
     %>