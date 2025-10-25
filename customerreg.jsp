

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*" %>
        <%
            try
            {
        String a="'"+request.getParameter("fname")+"'";
        String b="'"+request.getParameter("lname")+"'";
        String c="'"+request.getParameter("email")+"'";
        String d="'"+request.getParameter("pno")+"'";
        String e="'"+request.getParameter("address")+"'";
        String f="'"+request.getParameter("pass")+"'";
        String g="'"+request.getParameter("gender")+"'";
        String h="'"+request.getParameter("dob")+"'";
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ets","root","");
        Statement st=con.createStatement();
        String q="insert into customer(fname,lname,email,pno,address,pass,gender,dob)values("+a+","+b+","+c+","+d+","+e+","+f+","+g+","+h+")";
         st.executeUpdate(q);
         st.close();
         con.close();
         
        
       
    }  
    
    catch(Exception ee)
    {
        out.println(ee);
    }
   



         %>
