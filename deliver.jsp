<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
 <% 
     try
                {
                    Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ets","root","");
        Statement st=con.createStatement();
        int id=Integer.parseInt(request.getParameter("id"));
        String q="update payment set flag=1 where pid="+id+"";
        out.println(q);
        st.executeUpdate(q);
        st.close();
        con.close();
        response.sendRedirect("updatestatus.jsp");
        }
        catch(Exception e)
        {
        
        }
     %>