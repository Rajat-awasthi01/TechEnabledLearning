<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login | E-Classroom</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .login-box {
            margin-top: 80px;
            padding: 30px;
            background-color: #fff;
            border-radius: 12px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
        }
        .quote {
            font-style: italic;
            color: #555;
        }
        .login-img {
            width: 100%;
            max-width: 300px;
        }
    </style>
    <script>
        function validate() {
            if (document.frm.user.value.trim() === "") {
                alert("Please enter User Name");
                document.frm.user.focus();
                return false;
            }
            if (document.frm.pswd.value.trim() === "") {
                alert("Please enter Password");
                document.frm.pswd.focus();
                return false;
            }
            return true;
        }
    </script>
</head>
<body>

<div class="container d-flex justify-content-center align-items-center min-vh-100">
    <div class="row w-100 justify-content-center">
        <div class="col-md-8 col-lg-6">
            <div class="login-box text-center">
            
                <h2 class="mb-3">Welcome to Tech-Enabled Classroom</h2>
                <p class="quote">"Education is the passport to the future, for tomorrow belongs to those who prepare for it today."</p>

                <!-- Error Message -->
                <%
                    String error = request.getParameter("error");
                    if (error != null) {
                %>
                    <div class="alert alert-danger mt-3"><%= error %></div>
                <%
                    }
                %>

                <!-- Login Form -->
                <form name="frm" action="UserLoginServlet" method="post" onsubmit="return validate();">
                    <div class="mb-3 text-start">
                        <label class="form-label">Role</label><br>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="role" value="stu" checked>
                            <label class="form-check-label">Student</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="role" value="techr">
                            <label class="form-check-label">Teacher</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="role" value="admin">
                            <label class="form-check-label">Admin</label>
                        </div>
                    </div>

                    <div class="mb-3 text-start">
                        <label for="user" class="form-label">User Name</label>
                        <input type="text" class="form-control" name="user" id="user">
                    </div>

                    <div class="mb-3 text-start">
                        <label for="pswd" class="form-label">Password</label>
                        <input type="password" class="form-control" name="pswd" id="pswd">
                    </div>

                    <div class="d-grid">
                        <button type="submit" class="btn btn-primary">Login</button>
                    </div>
                </form>

                <div class="mt-3">
                    <a href="#">Forgot Password?</a><br>
                    Not yet registered? <a href="studentRegister.jsp">Register here</a>
                </div>
                <div class="text-center mt-4">
        <a href="index.jsp" class="btn btn-outline-primary"> Dashboard</a>
    </div>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap Bundle JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
