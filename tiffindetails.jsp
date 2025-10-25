

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*" %>
        <%
            try
            {
        String a="'"+request.getParameter("tiffinname")+"'";
        String b="'"+request.getParameter("price")+"'";
        String c="'"+request.getParameter("category")+"'";
        String d="'"+request.getParameter("type")+"'";
        String e="'"+request.getParameter("description")+"'";
        String f="'"+request.getParameter("imageupload")+"'";
    Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ets","root","");
        Statement st=con.createStatement();
        String aname="'"+(String)session.getAttribute("aname")+"'";
        String q="insert into tiffindetails(tiffinname,price,category,type,description,tiffinimages,aname)values("+a+","+b+","+c+","+d+","+e+","+f+","+aname+")";
         st.executeUpdate(q);
         st.close();
         con.close();
        out.println(q);
       response.sendRedirect("agentdashboard.jsp");
    }  
    
    catch(Exception ee)
    {
        out.println(ee);
    }
   



         %>
