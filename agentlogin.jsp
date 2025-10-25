<%-- 
    Document   : agentlogin
    Created on : Mar 11, 2025, 8:03:59 PM
    Author     : shara
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<%
    try
    {
        String a=request.getParameter("email");
        String b=request.getParameter("password");
         Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ets","root","");
        Statement st=con.createStatement();
        ResultSet rs=st.executeQuery("select email,pass,flag from agent");
        int flag=0;
        while(rs.next())
        {
            String u=rs.getString(1);
            String p=rs.getString(2);
            int f=rs.getInt(3);
            if(a.equals(u) && b.equals(p) && f==1)
            {
                flag=1;
                break;
            }
        }
        if(flag==1)
        {
            session.setAttribute("aname",a);
            response.sendRedirect("agentdashboard.jsp");
        }
        else
        {
            response.sendRedirect("agent.html");
        }
    }
    catch(Exception ee)
    {
        out.println(ee);
    }



%>
