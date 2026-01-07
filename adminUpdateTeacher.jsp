<%@page import="DB.DbConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String name = (String) session.getAttribute("tname");
    if (name == null) {
        response.sendRedirect("UserLogin.jsp?error=Please Login");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Update Teacher - Admin Panel</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript" src="js/clndr/scw.js"></script>
    <style>
        body {
            min-height: 100vh;
            display: flex;
        }
        .sidebar {
            width: 250px;
            background-color: #343a40;
            min-height: 100vh;
            color: #fff;
        }
        .sidebar a {
            color: #fff;
            padding: 10px 20px;
            display: block;
            text-decoration: none;
        }
        .sidebar a:hover {
            background-color: #495057;
        }
        .content {
            flex-grow: 1;
            padding: 30px;
        }
    </style>
    <script>
        function popup(url) {
            window.open(url, "popup", "height=400,width=400,resizable=1,scrollbars=1");
        }
    </script>
</head>
<body>

<div class="sidebar">
    <h4 class="text-center py-3">Admin Panel</h4>
    <a href="AdminTeacherList.jsp">Teacher List</a>
    <a href="adminAddTeacher.jsp">Add Teacher</a>
    <a href="adminUpdateTeacher.jsp" class="bg-primary">Update Teacher</a>
    <a href="adminDeletTeacher.jsp">Delete Teacher</a>
    <a href="adminCourseList.jsp">Course List</a>
    <a href="adminAddCourse.jsp">Add Course</a>
    <a href="adminUpdateCourse.jsp">Update Course</a>
    <a href="adminDeletCourse.jsp">Delete Course</a>
    <a href="adminApprvsStuList.jsp">Approved Students</a>
    <a href="adminNtApprvdStuList.jsp">Not Approved Students</a>
    <a href="AdminLogOut">Log Out</a>
</div>

<div class="content">
    <h2 class="mb-4">Welcome, <%= name %> 👋</h2>

    <form method="post" class="row g-3 mb-4">
        <div class="col-md-6">
            <label for="t_id" class="form-label">Enter Teacher ID</label>
            <input type="text" name="t_id" id="t_id" class="form-control" required>
        </div>
        <div class="col-md-6 d-flex align-items-end">
            <button type="submit" class="btn btn-primary">Show</button>
        </div>
    </form>

    <%
        String tid = request.getParameter("t_id");
        if (tid != null && !tid.trim().equals("")) {
            try {
                DbConnection db = new DbConnection();
                db.rst = db.stmt.executeQuery("SELECT * FROM teacher_mstr WHERE t_id='" + tid + "'");
                if (db.rst.next()) {
    %>
    <form action="UpdateTeacherServlet" method="post" class="row g-3">
        <input type="hidden" name="t_id" value="<%= tid %>">
        <div class="col-md-6">
            <label class="form-label">Name</label>
            <input type="text" name="tname" class="form-control" value="<%= db.rst.getString("tname") %>">
        </div>
        <div class="col-md-6">
            <label class="form-label">Date of Joining</label>
            <input type="text" name="d_o_j" class="form-control" value="<%= db.rst.getString("d_o_j") %>" onclick="scwShow(this,event);">
        </div>
        <div class="col-md-12">
            <label class="form-label">Address</label>
            <textarea name="address" class="form-control" rows="3"><%= db.rst.getString("address") %></textarea>
        </div>
        <div class="col-md-6">
            <label class="form-label">Qualification</label>
            <input type="text" name="tqualification" class="form-control" value="<%= db.rst.getString("tqualification") %>">
        </div>
        <div class="col-md-6">
            <label class="form-label">University</label>
            <input type="text" name="university" class="form-control" value="<%= db.rst.getString("university") %>">
        </div>
        <div class="col-md-6">
            <label class="form-label">Course</label>
            <input type="text" name="course" class="form-control" value="<%= db.rst.getString("course") %>">
        </div>
        <div class="col-md-6">
            <label class="form-label">Mobile</label>
            <input type="text" name="mob" class="form-control" value="<%= db.rst.getString("mob") %>">
        </div>
        <div class="col-md-6">
            <label class="form-label">Email</label>
            <input type="email" name="email" class="form-control" value="<%= db.rst.getString("email") %>">
        </div>
        <div class="col-md-6">
            <label class="form-label">Password</label>
            <input type="text" name="pswd" class="form-control" value="<%= db.rst.getString("pswd") %>">
        </div>
        <div class="col-12">
            <button type="submit" class="btn btn-success">Update Teacher</button>
        </div>
    </form>
          <div class="text-center mt-4" >
        <a href="adminHome.jsp" class="btn btn-outline-primary"> Dashboard</a>
    </div>
    <%
                } else {
    %>
        <div class="alert alert-danger mt-4">No teacher found with ID: <%= tid %></div>
    <%
                }
            } catch (Exception e) {
                out.println("<div class='alert alert-danger'>Error: " + e.getMessage() + "</div>");
            }
        }
    %>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
