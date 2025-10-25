

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
        String i="'"+request.getParameter("paymentmode")+"'";
        int j=499;
         String k="'"+request.getParameter("transaction_id")+"'";
    Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ets","root","");
        Statement st=con.createStatement();
        String q="insert into agent(fname,lname,email,pno,address,pass,gender,dob,mop,amt,tid)values("+a+","+b+","+c+","+d+","+e+","+f+","+g+","+h+","+i+","+j+","+k+")";
        out.println(q); 
        st.executeUpdate(q);
        st.close();
        con.close();
        response.sendRedirect("agent.html");
        
       
    }  
    
    catch(Exception ee)
    {
        out.println(ee);
    }
   



         %>
