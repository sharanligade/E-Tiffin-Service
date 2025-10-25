

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*" %>
        <%
            try
            {
        String a="'"+request.getParameter("firstname")+"'";
        String b="'"+request.getParameter("lastname")+"'";
        String c="'"+request.getParameter("email")+"'";
        String d="'"+request.getParameter("phoneno")+"'";
        String e="'"+request.getParameter("message")+"'";
       
       
         
    Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ets","root","");
        Statement st=con.createStatement();
        String q="insert into contactus(firstname,lastname,email,phoneno,message)values("+a+","+b+","+c+","+d+","+e+")";
        out.println(q); 
        st.executeUpdate(q);
        st.close();
        con.close();
        response.sendRedirect("contactus.html");
        
       
    }  
    
    catch(Exception ee)
    {
        out.println(ee);
    }
   



         %>
