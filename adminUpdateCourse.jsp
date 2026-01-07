<%@page import="DB.DbConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    <title>Admin Dashboard |Tech-Enabled Learning</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <style>
        body { padding-top: 4rem; }
        .sidebar { background-color: #f8f9fa; padding: 1rem; height: 100vh; }
        .welcome { font-weight: bold; color: #008cc4; }
    </style>
    <!-- JS -->
    <script>
        function openPopup(url) {
            window.open(url, "PopupWindow", "height=400,width=600,resizable=yes,scrollbars=yes");
        }
    </script>
</head>
<body>
    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top">
        <div class="container-fluid">
            
        </div>
    </nav>

    <div class="container-fluid">
        <div class="row">
            <!-- Sidebar -->
            <div class="col-md-3 sidebar">
                <h5>Admin Menu</h5>
                <ul class="nav flex-column">
                    <li class="nav-item"><a href="AdminTeacherList.jsp" class="nav-link">Teacher List</a></li>
                    <li class="nav-item"><a href="adminAddTeacher.jsp" class="nav-link">Add Teacher</a></li>
                    <li class="nav-item"><a href="adminUpdateTeacher.jsp" class="nav-link">Update Teacher</a></li>
                    <li class="nav-item"><a href="adminDeletTeacher.jsp" class="nav-link">Delete Teacher</a></li>
                    <li class="nav-item"><a href="adminCourseList.jsp" class="nav-link">Course List</a></li>
                    <li class="nav-item"><a href="adminAddCourse.jsp" class="nav-link">Add Course</a></li>
                    <li class="nav-item"><a href="adminUpdateCourse.jsp" class="nav-link">Update Course</a></li>
                    <li class="nav-item"><a href="adminDeletCourse.jsp" class="nav-link">Delete Course</a></li>
                    <li class="nav-item"><a href="adminApprvdStuList.jsp" class="nav-link">Approved Students</a></li>
                    <li class="nav-item"><a href="adminNtApprvdStuList.jsp" class="nav-link">Pending Students</a></li>

                    <li class="nav-item"><a href="AdminLogOut" class="nav-link text-danger">Logout</a></li>
                </ul>
            </div>

            <!-- Main Content -->
            <div class="col-md-9">
                <div class="container">
                    <h3 class="welcome mb-4">Welcome, <%= name %>!</h3>

                    <!-- Course Code Search Form -->
                    <form class="row g-3" method="post">
                        <div class="col-auto">
                            <label for="c_code" class="col-form-label">Enter Course Code:</label>
                        </div>
                        <div class="col-auto">
                            <input type="text" name="c_code" id="ccode" class="form-control" required>
                        </div>
                        <div class="col-auto">
                            <button type="submit" class="btn btn-primary mb-3">Show</button>
                        </div>
                    </form>

                    <!-- Course Edit Form (dynamically shown if course exists) -->
                    <%
                        try {
                            String ccode = request.getParameter("c_code");
                            if (ccode != null && !ccode.trim().equals("")) {
                                DbConnection db = new DbConnection();
                                db.rst = db.stmt.executeQuery("SELECT c_name, c_duration, description, Fee, path FROM course_mstr WHERE c_code='" + ccode + "'");
                                if (db.rst.next()) {
                    %>
                    <form method="post" action="AdminUpdtCursServlet" class="border p-4 rounded bg-light">
                        <h5 class="text-primary mb-3">Update Course Details</h5>
                        <input type="hidden" name="c_code" value="<%=ccode%>">
                        <div class="mb-3">
                            <label class="form-label">Name</label>
                            <input type="text" name="c_name" value="<%=db.rst.getString(1)%>" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Duration</label>
                            <input type="text" name="duration" value="<%=db.rst.getString(2)%>" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Description</label>
                            <input type="text" name="description" value="<%=db.rst.getString(3)%>" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Fee</label>
                            <input type="text" name="Fee" value="<%=db.rst.getString(4)%>" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Uploaded File Path</label>
                            <input type="text" name="path" value="<%=db.rst.getString(5)%>" class="form-control">
                        </div>
                        <button type="submit" class="btn btn-success">Update</button>
                    </form>
                         <div class="text-center mt-4">
        <a href="adminHome.jsp" class="btn btn-outline-primary"> Dashboard</a>
    </div>
                    <%
                                } else {
                    %>
                        <div class="alert alert-danger mt-3">Invalid Course Code. No course found.</div>
                    <%
                                }
                            }
                        } catch (Exception e) {
                            out.println("<div class='alert alert-danger mt-3'>Error: " + e.getMessage() + "</div>");
                            e.printStackTrace();
                        }
                    %>
                </div>
            </div>
        </div>
    </div>

    

    <!-- Bootstrap 5 JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
