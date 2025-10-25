<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>Manage Blogs</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
  <h2>Manage Blogs</h2>
  <table class="table table-bordered">
    <thead>
      <tr>
        <th>Title</th>
        <th>Date</th>
        <th>Actions</th>
      </tr>
    </thead>
    <tbody>
<%
  try {
      Class.forName("com.mysql.cj.jdbc.Driver");
      Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/your_database_name", "root", "");
      Statement stmt = con.createStatement();
      ResultSet rs = stmt.executeQuery("SELECT * FROM blogs ORDER BY id DESC");
      while (rs.next()) {
%>
  <tr>
    <td><%= rs.getString("title") %></td>
    <td><%= rs.getString("date") %></td>
    <td>
      <a href="edit_blog.jsp?id=<%= rs.getInt("id") %>" class="btn btn-sm btn-warning">Edit</a>
      <a href="delete_blog.jsp?id=<%= rs.getInt("id") %>" class="btn btn-sm btn-danger" onclick="return confirm('Delete this blog?');">Delete</a>
    </td>
  </tr>
<%
      }
  } catch (Exception e) {
      out.println("<tr><td colspan='3'>Error: " + e.getMessage() + "</td></tr>");
  }
%>
    </tbody>
  </table>
</div>

</body>
</html>
