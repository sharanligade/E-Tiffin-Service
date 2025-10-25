

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<%
    try
    {
        String a=request.getParameter("email");
        String b=request.getParameter("pass");
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ets","root","");
        Statement st=con.createStatement();
        ResultSet rs=st.executeQuery("select * from admin");
        int flag=0;
        while(rs.next())
        {
            String u=rs.getString(1);
            String p=rs.getString(2);
            if(a.equals(u) && b.equals(p))
            {
                flag=1;
                break;
            }
        }
        if(flag==1)
        {
            session.setAttribute("adname",a);
            response.sendRedirect("admindashboard.jsp");
        }
        else
        {
            response.sendRedirect("adminlogin1.html");
        }
    }
    catch(Exception ee)
    {
        out.println(ee);
    }

%>