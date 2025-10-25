

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*" %>
        <%
            try
            {
        String a="'"+request.getParameter("tiffinname")+"'";
        String b="'"+request.getParameter("description")+"'";
        String c="'"+request.getParameter("price")+"'";
        String d="'"+request.getParameter("qty")+"'";
        String e="'"+request.getParameter("date")+"'";
        String f="'"+request.getParameter("cname")+"'";
        String g="'"+request.getParameter("aname")+"'";
            Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ets","root","");
        Statement st=con.createStatement();
        String q="insert into cart(tiffinname,description,price,qty,cdate,cname,aname)values("+a+","+b+","+c+","+d+","+e+","+f+","+g+")";
         st.executeUpdate(q);
         st.close();
         con.close();
         
        response.sendRedirect("addtocart.jsp");
       
    }  
    
    catch(Exception ee)
    {
        out.println(ee);
    }
   



         %>
