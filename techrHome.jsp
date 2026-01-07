<%@page import="DB.DbConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String tid = null;
    String name = null;
    try {
        tid = (String) session.getAttribute("t_id");
        name = (String) session.getAttribute("tname");
        if (tid == null) {
            response.sendRedirect("UserLogin.jsp?error=Please Login");
        }
    } catch (Exception e) {
        System.out.println(e);
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Teacher Dashboard | E-Learning Portal</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Bootstrap CDN -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

  <style>
    body {
      font-family: 'Segoe UI', sans-serif;
    }
    .welcome {
      padding: 40px;
      background-color: #e9f2ff;
      text-align: center;
    }
  </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <div class="container">
    <a class="navbar-brand" href="index.jsp">Tech-Enabled Learning</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item"><a class="nav-link active" href="index.jsp">Home</a></li>
        <li class="nav-item"><a class="nav-link" href="about-us.jsp">About Us</a></li>
        <li class="nav-item"><a class="nav-link" href="articles.jsp">Articles</a></li>
        <li class="nav-item"><a class="nav-link" href="contact-us.jsp">Contact</a></li>
      </ul>
        
        
      <span class="navbar-text text-white">
        Welcome, <%= name %> | <a href="TeacherLogOut" class="text-light text-decoration-underline">Logout</a>
      </span>
    </div>
  </div>
</nav>

<!-- Welcome Section -->
<div class="welcome">
  <h2>Welcome, <%= name %>!</h2>
  <p class="text-muted">You are now logged in as a Teacher.</p>
</div>

<!-- Main Content -->
<div class="container py-4">
  <div class="row">
    <div class="col-md-3">
      <!-- Sidebar -->
      <div class="list-group">
        <a href="techrProfile.jsp" class="list-group-item list-group-item-action">View Profile</a>
        <a href="teahcrUploadTest.jsp" class="list-group-item list-group-item-action">Upload Test</a>
        <a href="adminAddCourse.jsp" class="list-group-item list-group-item-action">Add Course</a>
        
        <a href="adminDeletCourse.jsp" class="list-group-item list-group-item-action">Delete Course</a>
 
                
                <a href="adminApprvdStuList.jsp" class="list-group-item list-group-item-action">Approved Students</a>
                <a href="adminNtApprvdStuList.jsp" class="list-group-item list-group-item-action">Not Approved Students</a>
                <a href="TeacherLogOut" class="list-group-item list-group-item-action">Logout</a>
    
      
      </div>
    </div>
    <div class="col-md-9">
      <!-- Dynamic Content Area -->
      <%
        String msg = request.getParameter("msg");
        if ("1".equals(msg)) {
      %>
        <div class="alert alert-success">Successfully Updated!</div>
      <%
        } else if ("0".equals(msg)) {
      %>
        <div class="alert alert-danger">Failed!</div>
      <%
        } else {
      %>
        <p class="text-secondary">Hey! How are you doing?</p>
      <%
        }
      %>
    </div>
  </div>
</div>

<!-- Footer -->
<footer class="bg-light text-center py-3 mt-4">
  <small class="text-muted">© 2025 Student Portal. All rights reserved.</small>
</footer>

</body>
</html>
