<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="DB.DbConnection" %>
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
    <title>Teacher List</title>
    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <div class="container">
    <a class="navbar-brand" href="#">Tech-Enabled Learning Admin</a>
    <span class="navbar-text ms-auto text-white">
      Welcome, <%= name %>
    </span>
  </div>
</nav>

<!-- Main Content -->
<div class="container mt-5">
    <h2 class="mb-4 text-center">Teacher List</h2>
    
    <div class="table-responsive">
        <table class="table table-bordered table-striped align-middle text-center">
            <thead class="table-warning">
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>DOJ</th>
                    <th>Address</th>
                    <th>Qualification</th>
                    <th>University</th>
                    <th>Subject</th>
                    <th>Mobile</th>
                    <th>Email</th>
                    <th>Password</th> <!-- Optional: Consider hiding passwords -->
                </tr>
            </thead>
            <tbody>
                <%
                    try {
                        DbConnection db = new DbConnection();
                        db.rst = db.stmt.executeQuery("SELECT * FROM teacher_mstr");
                        while (db.rst.next()) {
                %>
                <tr>
                    <td><%= db.rst.getString(1) %></td>
                    <td><%= db.rst.getString(2) %></td>
                    <td><%= db.rst.getString(3) %></td>
                    <td><%= db.rst.getString(4) %></td>
                    <td><%= db.rst.getString(5) %></td>
                    <td><%= db.rst.getString(6) %></td>
                    <td><%= db.rst.getString(7) %></td>
                    <td><%= db.rst.getString(8) %></td>
                    <td><%= db.rst.getString(9) %></td>
                    <td><%= db.rst.getString(11) %></td> <!-- Warning: Don't show passwords in production -->
                </tr>
                <%
                        }
                    } catch (Exception e) {
                        out.println("<tr><td colspan='10'>Error: " + e.getMessage() + "</td></tr>");
                    }
                %>
            </tbody>
        </table>
    </div>

    <!-- Back Button -->
    <div class="text-center mt-4">
        <a href="adminHome.jsp" class="btn btn-outline-primary"> Dashboard</a>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
