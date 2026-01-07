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
    <title>Admin Home - E-Learning</title>
    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Optional Custom Styles -->
    <style>
        body {
            padding-top: 3rem;
            background-color: #f8f9fa;
        }
        .sidebar {
            min-height: 100vh;
            background-color: #ffffff;
            border-right: 1px solid #dee2e6;
        }
        .sidebar .nav-link.active {
            font-weight: bold;
            color: #0d6efd;
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <!-- Sidebar -->
        <nav class="col-md-3 col-lg-2 d-md-block sidebar px-3">
            <h4 class="my-4">Admin Panel</h4>
            <div class="list-group">
                <div class="fw-bold text-muted mt-3">Teachers</div>
                <a href="AdminTeacherList.jsp" class="list-group-item list-group-item-action">Teacher List</a>
                <a href="adminAddTeacher.jsp" class="list-group-item list-group-item-action">Add Teacher</a>
                <a href="adminUpdateTeacher.jsp" class="list-group-item list-group-item-action">Update Teacher</a>
                <a href="adminDeletTeacher.jsp" class="list-group-item list-group-item-action">Delete Teacher</a>

                <div class="fw-bold text-muted mt-3">Courses</div>
                <a href="adminCourseList.jsp" class="list-group-item list-group-item-action">Course List</a>
                <a href="adminAddCourse.jsp" class="list-group-item list-group-item-action">Add Course</a>
                <a href="adminUpdateCourse.jsp" class="list-group-item list-group-item-action">Update Course</a>
                <a href="adminDeletCourse.jsp" class="list-group-item list-group-item-action">Delete Course</a>

                <div class="fw-bold text-muted mt-3">Students</div>
                <a href="adminApprvdStuList.jsp" class="list-group-item list-group-item-action">Approved Students</a>
                <a href="adminNtApprvdStuList.jsp" class="list-group-item list-group-item-action">Not Approved Students</a>
                

                <a href="AdminLogOut" class="list-group-item list-group-item-action text-danger mt-3">Logout</a>
            </div>
        </nav>

        <!-- Main content -->
        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-5 py-4">
            <h2>Welcome, <span class="text-primary"><%= name %></span></h2>
            <hr>

            <%-- Flash message section --%>
            <%
                String msg = request.getParameter("msg");
                if (msg != null) {
                    if (msg.trim().equals("1")) {
            %>
                <div class="alert alert-success">Successfully Updated!</div>
            <%
                    } else if (msg.trim().equals("0")) {
            %>
                <div class="alert alert-danger">Failed!</div>
            <%
                    }
                } else {
            %>
                <p class="lead text-muted">Hey! How are you doing?</p>
            <%
                }
            %>

            <div class="mt-5">
                <h4>Admin Quick Overview</h4>
                <p class="text-muted">Use the sidebar to manage teachers, courses, and students.</p>
            </div>
        </main>
    </div>
</div>

<!-- JS scripts -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
    function myPopup2() {
        window.open("AdminTeacherList.jsp", "myWindow", "status=0,height=300,width=340,resizable=1,scrollbars=1,location=no");
    }
    function myPopup3() {
        window.open("adminCourseList.jsp", "myWindow", "status=0,height=300,width=340,resizable=1,scrollbars=1,location=no");
    }
    function myPopup4() {
        window.open("adminApprvdStuList.jsp", "myWindow", "status=0,height=300,width=340,resizable=1,scrollbars=1,location=no");
    }
    function myPopup5() {
        window.open("adminNtApprvdStuList.jsp", "myWindow", "status=0,height=300,width=340,resizable=1,scrollbars=1,location=no");
    }
</script>
</body>
</html>
