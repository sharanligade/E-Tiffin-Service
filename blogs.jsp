<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Blog Details | E-Tiffin</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    .banner-img {
      width: 100%;
      height: 300px;
      object-fit: cover;
    }
  </style>
</head>
<body>
  <div class="container py-5" id="blogContent">
    <!-- Blog details will appear here -->
  </div>

  <script>
    const blogs = [
      {
        title: "Healthy Eating Habits",
        date: "2025-04-15",
        image: "https://source.unsplash.com/600x400/?healthy,food",
        content: "Eating healthy doesn't mean sacrificing taste. With the right balance..."
      },
      {
        title: "Why Home-Cooked Meals Matter",
        date: "2025-04-10",
        image: "https://source.unsplash.com/600x400/?home,meal",
        content: "Home-cooked meals provide a sense of comfort and security..."
      },
      // Add more entries if needed (should match homepage)
    ];

    const params = new URLSearchParams(window.location.search);
    const id = parseInt(params.get("id"));
    const blog = blogs[id];

    if (blog) {
      document.getElementById("blogContent").innerHTML = `
        <img src="${blog.image}" class="banner-img mb-4" alt="Blog Image">
        <h1>${blog.title}</h1>
        <h6 class="text-muted mb-3">${blog.date}</h6>
        <p>${blog.content}</p>
      `;
    } else {
      document.getElementById("blogContent").innerHTML = `<div class="alert alert-danger">Blog not found.</div>`;
    }
  </script>
</body>
</html>
