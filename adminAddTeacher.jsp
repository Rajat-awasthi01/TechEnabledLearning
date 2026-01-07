<%@ page import="DB.DbConnection" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String name = (String) session.getAttribute("name");
    if (name == null) {
        response.sendRedirect("UserLogin.jsp?error=Please Login");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Panel - Add Teacher</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Admin Panel</a>
            <span class="navbar-text text-white ms-auto">Welcome, <%= name %></span>
            <a class="btn btn-outline-light ms-3" href="AdminLogOut">Logout</a>
            
        </div>
    </nav>

    <div class="container my-4">
        <h3 class="mb-4">Add New Teacher</h3>
        <form action="AdminAddTeahcer" method="post" class="needs-validation" novalidate>
            <div class="row mb-3">
                <div class="col-md-6">
                    <label for="tname" class="form-label">Name</label>
                    <input type="text" class="form-control" id="tname" name="tname" required>
                </div>
                <div class="col-md-6">
                    <label for="d_o_j" class="form-label">Date of Joining</label>
                    <input type="date" class="form-control" id="d_o_j" name="d_o_j" required>
                </div>
            </div>
            <div class="mb-3">
                <label for="address" class="form-label">Address</label>
                <input type="text" class="form-control" id="address" name="address" required>
            </div>
            <div class="row mb-3">
                <div class="col-md-6">
                    <label for="qualifctn" class="form-label">Qualification</label>
                    <input type="text" class="form-control" id="qualifctn" name="qualifctn" required>
                </div>
                <div class="col-md-6">
                    <label for="university" class="form-label">University</label>
                    <input type="text" class="form-control" id="university" name="university" required>
                </div>
            </div>
            <div class="mb-3">
                <label for="course" class="form-label">Teaching Subject</label>
                <input type="text" class="form-control" id="course" name="course" required>
            </div>
            <div class="row mb-3">
                <div class="col-md-6">
                    <label for="mob" class="form-label">Mobile</label>
<input type="text" name="mob"
       pattern="^\d{10}$"
       title="Enter exactly 10 digits"
       maxlength="10"
       oninput="this.value = this.value.replace(/[^0-9]/g, '').slice(0, 10);"
       class="mt-1 block w-full border rounded px-3 py-2"
       required>

                </div>
                <div class="col-md-6">
                    <label for="email" class="form-label">Email</label>
                    <input type="email" class="form-control" id="email" name="email" required>
                </div>
            </div>
            <input type="hidden" name="usrlogin" value="Not Used">
            <div class="mb-3">
                <label for="pswd" class="form-label">Password</label>
                <input type="password" class="form-control" id="pswd" name="pswd" required>
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
            <div class="text-center mt-4">
        <a href="adminHome.jsp" class="btn btn-outline-primary"> Dashboard</a>
    </div>
        </form>
    </div>

    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Optional: Form Validation -->
    <script>
        (() => {
            'use strict';
            const forms = document.querySelectorAll('.needs-validation');
            Array.from(forms).forEach(form => {
                form.addEventListener('submit', event => {
                    if (!form.checkValidity()) {
                        event.preventDefault();
                        event.stopPropagation();
                    }
                    form.classList.add('was-validated');
                }, false);
            });
        })();
    </script>
</body>
</html>
