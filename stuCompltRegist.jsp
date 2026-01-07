<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Registration Success | Student Portal</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
        }
        header, footer {
            background-color: #0d6efd;
            color: white;
            padding: 1rem 0;
        }
        nav a {
            color: white;
            margin-right: 1rem;
            text-decoration: none;
        }
        nav a:hover {
            text-decoration: underline;
        }
        .success-msg {
            margin-top: 3rem;
        }
    </style>
</head>
<body>

<header class="mb-4">
    <div class="container d-flex justify-content-between align-items-center">
        <h1 class="h3 mb-0">Student's Portal</h1>
        <nav>
            <a href="index.jsp" class="fw-bold">Home</a>
            <a href="about-us.jsp">About Us</a>
            <a href="articles.jsp">Our Articles</a>
            <a href="contact-us.jsp">Contact Us</a>
            
        </nav>
    </div>
</header>

<div class="container">
    <div class="row">
        <!-- Sidebar -->
       
        <!-- Main Content -->
        <main class="col-md-9">
            <h2>Student Registration</h2>
            <hr />
            <div class="alert alert-success success-msg text-center">
                <h3>Congrats!</h3>
                <p>You are successfully registered.</p>

                <% String lastiInsertId = request.getParameter("lastiInsertId"); %>
                <h4>Your Enrollment No is: <strong><%= lastiInsertId != null ? lastiInsertId : "N/A" %></strong></h4>
                <p class="text-muted fst-italic">Keep your enrollment number safe for future use.</p>
                <a href="UserLogin.jsp" class="btn btn-primary mt-3">Go To Login Page</a>
            </div>
        </main>
    </div>
</div>
                 <div class="text-center mt-4">
        <a href="studentHome.jsp" class="btn btn-outline-primary"> Dashboard</a>
    </div>



</body>
</html>
