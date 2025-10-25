

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*" %>
        <%
            try
            {
        int a=Integer.parseInt(request.getParameter("paymentid"));
        String b="'"+request.getParameter("cartid")+"'";
        String c="'"+request.getParameter("tiffinname")+"'";
        String d="'"+request.getParameter("description")+"'";
        String e="'"+request.getParameter("price")+"'";
        String f="'"+request.getParameter("qty")+"'";
        String g="'"+request.getParameter("date")+"'";
        String h="'"+request.getParameter("cname")+"'";
        String i="'"+request.getParameter("aname")+"'";
        String j="'"+request.getParameter("amt")+"'";
        String k="'"+request.getParameter("comi")+"'";
        String l="'"+request.getParameter("famt")+"'";
        String m="'"+request.getParameter("address")+"'";
        String n="'"+request.getParameter("mno")+"'";
  
        String o="'"+request.getParameter("transactionid")+"'";
        session.setAttribute("famt",l);
        session.setAttribute("aname",i);
            Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ets","root","");
        Statement st=con.createStatement();
        String q="insert into paymentm(cartid,tiffinname,description,price,qty,cdate,cname,aname,tamt,commission,famt,daddress,mno,transid)values("+b+","+c+","+d+","+e+","+f+","+g+","+h+","+i+","+j+","+k+","+l+","+m+","+n+","+o+")";
         st.executeUpdate(q);
         st.close();
        Statement st1=con.createStatement();
        st1.executeUpdate("update payment set pflag=1 where pid="+a+"");
        st1.close();
         con.close();
         
        response.sendRedirect("confirm.jsp");
       
    }  
    
    catch(Exception ee)
    {
        out.println(ee);
    }
   



         %>
