<%@page import="DB.DbConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String name = null;
    try {
        name = (String) session.getAttribute("name");
        if (name != null) {
            session.setAttribute("name", name);
        } else {
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
    <title>Teacher List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

    <div class="container my-5">
        <h2 class="text-center mb-4">Course Details</h2>
        <div class="table-responsive">
            <table class="table table-bordered table-striped align-middle shadow">
                <thead class="table-warning text-center">
                    <tr>
                        <th>Course Code</th>
                        <th>Name</th>
                        <th>Duration</th>
                        <th>Description</th>
                        <th>Fee</th>
                        <th>Uploaded File Path</th>
                    </tr>
                </thead>
                <tbody>
                <%
                    try {
                        DbConnection db = new DbConnection();
                        db.rst = db.stmt.executeQuery("SELECT * FROM course_mstr");
                        while (db.rst.next()) {
                %>
                    <tr>
                        <td class="text-center"><%= db.rst.getString(1) %></td>
                        <td><%= db.rst.getString(2) %></td>
                        <td class="text-center"><%= db.rst.getString(3) %></td>
                        <td><%= db.rst.getString(4) %></td>
                        <td class="text-center">₹<%= db.rst.getString(5) %></td>
                        <td><%= db.rst.getString(6) %></td>
                    </tr>
                <%
                        }
                        db.rst.close();
                        db.stmt.close();
                        db.con.close();
                    } catch (Exception e) {
                        out.println("<tr><td colspan='6' class='text-center text-danger'>Error loading course data</td></tr>");
                        e.printStackTrace();
                    }
                %>
                </tbody>
            </table>
                <div class="text-center mt-4">
        <a href="adminHome.jsp" class="btn btn-outline-primary"> Dashboard</a>
    </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
