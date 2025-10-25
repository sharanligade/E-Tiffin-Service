<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html>
<head>
    <title>Add Blog - Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">
    <script src="https://cdn.quilljs.com/1.3.6/quill.min.js"></script>
</head>
<body class="bg-light">

<div class="container mt-5">
    <h2 class="mb-4">Add New Blog</h2>
    <form method="post">
        <div class="mb-3">
            <label class="form-label">Blog Title</label>
            <input type="text" name="title" class="form-control" required />
        </div>

        <div class="mb-3">
            <label class="form-label">Content</label>
            <div id="editor" style="height: 200px; background: #fff;"></div>
            <input type="hidden" name="content" id="contentInput" />
        </div>

        <div class="mb-3">
            <label class="form-label">Image URL (optional)</label>
            <input type="text" name="image" class="form-control" />
        </div>

        <button type="submit" class="btn btn-primary">Add Blog</button>
    </form>
</div>
<%
    // Simulated Admin Session Check (replace with real login/session)
    String admin = (String) session.getAttribute("admin");
    if (admin == null) {
        response.sendRedirect("adminlogin.jsp");
        return;
    }

    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String image = request.getParameter("image");

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String currentDate = sdf.format(new java.util.Date());

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/your_database_name", "root", "");
            PreparedStatement ps = con.prepareStatement("INSERT INTO blogs(title, content, image, date) VALUES (?, ?, ?, ?)");
            ps.setString(1, title);
            ps.setString(2, content);
            ps.setString(3, image);
            ps.setString(4, currentDate);
            ps.executeUpdate();
            out.println("<div class='alert alert-success'>Blog added successfully!</div>");
        } catch (Exception e) {
            out.println("<div class='alert alert-danger'>Error: " + e.getMessage() + "</div>");
        }
    }
%>

<script>
  const quill = new Quill('#editor', { theme: 'snow' });

  document.querySelector('form').addEventListener('submit', function () {
    document.getElementById('contentInput').value = quill.root.innerHTML;
  });
</script>

</body>
</html>
