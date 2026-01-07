<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Registration Failed | Student Portal</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
        }
        header, footer {
            background-color: #dc3545; /* Bootstrap danger red */
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
        .fail-msg {
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
        <main class="col-md-9 text-center">
            <h2>Student Registration</h2>
            <hr />
            <div class="alert alert-danger fail-msg">
                <h3>Failed!</h3>
                <p>Please try again.</p>
                <a href="studentRegister.jsp" class="btn btn-danger mt-3">Go To Registration Page</a>
            </div>
        </main>
    </div>
</div>
    <div class="text-center mt-4">
        <a href="studentHome.jsp" class="btn btn-outline-primary"> Dashboard</a>
    </div>



</body>
</html>
