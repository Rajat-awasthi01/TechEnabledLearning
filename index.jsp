<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Student Portal | Home</title>
  <meta name="viewport" content="width=device-width, initial-scale=1" />

  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

  <style>
    body {
      font-family: 'Segoe UI', sans-serif;
    }
    .hero {
      background-color: #0d6efd;
      color: white;
      padding: 80px 0;
      text-align: center;
    }
    .hero .btn {
      margin-top: 20px;
    }
    .features {
      padding: 60px 0;
    }
    .features .feature-icon {
      font-size: 3rem;
      color: #0d6efd;
    }
    footer {
      background-color: #f1f1f1;
      padding: 20px 0;
      margin-top: 60px;
    }
  </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <div class="container">
    <a class="navbar-brand" href="index.jsp">Student Portal</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
        <li class="nav-item">
        <a class="nav-link active"  href="index.jsp">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="about-us.html">About Us</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="contact.jsp">Contact</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="articles.jsp">Articles</a>
        </li>
        <li class="nav-item">
          <a class="btn btn-light text-primary ms-3" href="UserLogin.jsp">Login</a>
        </li>
      </ul>
    </div>
  </div>
</nav>

<!-- Hero Section -->
<section class="hero">
  <div class="container">
    <h1 class="display-4">Welcome to Tech-Enabled Learning Platform</h1>
    <p class="lead">Learn Anytime, Anywhere</p>
    <a href="UserLogin.jsp" class="btn btn-outline-light btn-lg">Login to Continue</a>
  </div>
</section>

<!-- Features Section -->
<section class="features">
  <div class="container">
    <div class="row text-center g-4">
      <div class="col-md-4">
        <div class="feature-icon mb-3">📚</div>
        <h3>Structured Courses</h3>
        <p>Access a wide range of courses tailored to your learning goals.</p>
      </div>
      <div class="col-md-4">
        <div class="feature-icon mb-3">👨‍🏫</div>
        <h3>Expert Guidance</h3>
        <p>Learn from experienced instructors and get personalized support.</p>
      </div>
      <div class="col-md-4">
        <div class="feature-icon mb-3">📝</div>
        <h3>Online Tests</h3>
        <p>Test your knowledge with interactive quizzes and mock exams.</p>
      </div>
    </div>
  </div>
</section>

<!-- About Section -->
<section class="container py-5">
  <div class="row align-items-center">
    
    <div class="col-md-6">
      <h2>Why Choose Us?</h2>
      <p>
        Our online platform offers structured courses, expert guidance, and interactive online tests to provide a complete learning experience.
        After login, students can register for courses, download study materials, and track their progress easily.
      </p>
      <blockquote class="blockquote text-muted fst-italic">
        “Education is the most powerful weapon which you can use to change the world.” – Nelson Mandela
      </blockquote>
    </div>
  </div>
</section>

<!-- Footer -->
<footer>
  <div class="container text-center">
    <small class="text-muted">© 2025 Student Portal. All rights reserved.</small>
  </div>
</footer>

</body>
</html>
