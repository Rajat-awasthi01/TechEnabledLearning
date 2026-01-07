<%@page import="DB.DbConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String tid = null;
    String name = null;
    try {
        tid = (String) session.getAttribute("t_id");
        name = (String) session.getAttribute("tname");
        if (tid != null) {
            session.setAttribute("t_id", tid);
            session.setAttribute("tname", name);
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
    <title>Teacher Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            padding-top: 60px;
        }
        .sidebar {
            height: 100vh;
            position: fixed;
            left: 0;
            top: 0;
            width: 220px;
            background-color: #f8f9fa;
            padding-top: 60px;
        }
        .main-content {
            margin-left: 240px;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Teacher Panel</a>
        <div class="d-flex">
            <span class="navbar-text text-white me-3">Welcome, <%=name%></span>
            <a class="btn btn-outline-light btn-sm" href="TeacherLogOut">Logout</a>
        </div>
    </div>
</nav>

<!-- Sidebar -->
<div class="sidebar p-3 border-end">
    <h5>Navigation</h5>
    <ul class="nav flex-column">
        <li class="nav-item"><a href="techrProfile.jsp" class="nav-link">View Profile</a></li>
        <li class="nav-item"><a href="teahcrUploadTest.jsp" class="nav-link">Upload Test</a></li>
        <li class="nav-item"><a href="adminUpdateTeacher.jsp" class="nav-link">Update Teacher</a></li>
        <li class="nav-item"><a href="adminDeletTeacher.jsp" class="nav-link">Delete Teacher</a></li>
        <li class="nav-item"><a href="adminAddCourse.jsp" class="nav-link">Add Course</a></li>
        <li class="nav-item"><a href="adminUpdateCourse.jsp" class="nav-link">Update Course</a></li>
        <li class="nav-item"><a href="adminDeletCourse.jsp" class="nav-link">Delete Course</a></li>
    </ul>
</div>

<!-- Main content -->
<div class="container main-content">
    <div class="mt-4">
        <h2 class="text-primary">Welcome, <%=name%></h2>
        <hr>
        <%
            DbConnection dbcn = null;
            String crs = null;
            try {
                crs = request.getParameter("course");
                dbcn = new DbConnection();
                if (crs == null) {
        %>
        <form action="#" method="post" class="row g-3">
            <div class="col-auto">
                <select name="course" class="form-select">
                    <option>Select Course</option>
                    <%
                        try {
                            dbcn.rst = dbcn.stmt.executeQuery("select c_code from course_mstr");
                            while (dbcn.rst.next()) {
                    %>
                    <option><%=dbcn.rst.getString(1)%></option>
                    <%
                            }
                        } catch (Exception e) {
                            System.out.println(e);
                        }
                    %>
                </select>
            </div>
            <div class="col-auto">
                <input type="submit" value="Submit" class="btn btn-primary">
            </div>
        </form>
        <%
                } else {
                    try {
                        String ccode = request.getParameter("course");
                        String quest = request.getParameter("quest");
                        String opt1 = request.getParameter("opt1");
                        String opt2 = request.getParameter("opt2");
                        String opt3 = request.getParameter("opt3");
                        String opt4 = request.getParameter("opt4");
                        String copt = request.getParameter("copt");
                        dbcn.pstmt = dbcn.con.prepareStatement(
                            "INSERT INTO questset(c_code,quest,opt1,opt2,opt3,opt4,right_ans) VALUES (?,?,?,?,?,?,?)");
                        dbcn.pstmt.setString(1, ccode);
                        dbcn.pstmt.setString(2, quest);
                        dbcn.pstmt.setString(3, opt1);
                        dbcn.pstmt.setString(4, opt2);
                        dbcn.pstmt.setString(5, opt3);
                        dbcn.pstmt.setString(6, opt4);
                        dbcn.pstmt.setString(7, copt);
                        int j = dbcn.pstmt.executeUpdate();
                        if (j > 0) {
                            out.println("<div class='alert alert-success mt-3'>Submitted!</div>");
                        }
                    } catch (Exception e) {
                        System.out.println(e);
                    }
        %>
        <form method="post" action="" class="mt-4">
            <input type="hidden" name="course" value="<%=crs%>" />
            <div class="mb-3">
                <label class="form-label">Enter Question</label>
                <input type="text" name="quest" class="form-control">
            </div>
            <div class="mb-3">
                <label class="form-label">Option 1</label>
                <input type="text" name="opt1" class="form-control">
            </div>
            <div class="mb-3">
                <label class="form-label">Option 2</label>
                <input type="text" name="opt2" class="form-control">
            </div>
            <div class="mb-3">
                <label class="form-label">Option 3</label>
                <input type="text" name="opt3" class="form-control">
            </div>
            <div class="mb-3">
                <label class="form-label">Option 4</label>
                <input type="text" name="opt4" class="form-control">
            </div>
            <div class="mb-3">
                <label class="form-label">Correct Option</label>
                <input type="text" name="copt" class="form-control" placeholder="Example: Option1">
            </div>
            <button type="submit" class="btn btn-success">Submit</button>
        </form>
            <div class="text-center mt-4">
        <a href="techrHome.jsp" class="btn btn-outline-primary"> Dashboard</a>
    </div>
        <%
                }
            } catch (Exception e) {
                System.out.println(e);
            }
        %>
    </div>
</div>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
