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
    <title>Admin Home - Student's Site</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Optional Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Legacy CSS and JS -->
    <link rel="stylesheet" href="css/reset.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
    <script src="js/jquery-1.4.2.min.js"></script>
    <script src="js/cufon-yui.js"></script>
    <script src="js/cufon-replace.js"></script>
    <script src="js/Myriad_Pro_300.font.js"></script>
    <script src="js/Myriad_Pro_400.font.js"></script>
    <script src="js/script.js"></script>
    <script src="js/validateLoginid.js"></script>
    <script src="js/clndr/scw.js"></script>

    <!-- Legacy JavaScript Functions -->
    <script type="text/javascript">
        function myPopup2() {
            window.open("./AdminTeacherList.jsp", "myWindow",
                "status=0,height=300,width=340,resizable=1,scrollbars=1,location=no");
        }
        function myPopup3() {
            window.open("./adminCourseList.jsp", "myWindow",
                "status=0,height=300,width=340,resizable=1,scrollbars=1,location=no");
        }
        function myPopup4() {
            window.open("./adminApprvdStuList.jsp", "myWindow",
                "status=0,height=300,width=340,resizable=1,scrollbars=1,location=no");
        }
        function myPopup5() {
            window.open("./adminNtApprvdStuList.jsp", "myWindow",
                "status=0,height=300,width=340,resizable=1,scrollbars=1,location=no");
        }

        function tcherfrmvalidate() {
            if (document.frm.tname.value == "") {
                alert("Please enter Name");
                document.frm.tname.focus();
                return false;
            }
            if (document.frm.d_o_j.value == "") {
                alert("Please enter Date of Joining");
                document.frm.d_o_j.focus();
                return false;
            }
            if (document.frm.address.value == "") {
                alert("Please enter Address");
                document.frm.address.focus();
                return false;
            }
            if (document.frm.qualifctn.value == "") {
                alert("Please enter Qualification");
                document.frm.qualifctn.focus();
                return false;
            }
            if (document.frm.university.value == "") {
                alert("Please enter University");
                document.frm.university.focus();
                return false;
            }
            if (document.frm.course.value == "") {
                alert("Please enter Course");
                document.frm.course.focus();
                return false;
            }
            if (document.frm.mob.value == "") {
                alert("Please enter Password");
                document.frm.mob.focus();
                return false;
            }
            if (echeck(document.frm.email.value) == false) {
                document.frm.email.value = "";
                document.frm.email.focus();
                return false;
            }
            if (document.frm.usrlogin.value == "") {
                alert("Please enter User Login");
                document.frm.usrlogin.focus();
                return false;
            }
            if (document.frm.pswd.value == "") {
                alert("Please enter Password");
                document.frm.pswd.focus();
                return false;
            }
            return true;
        }

        function echeck(str) {
            var at = "@"
            var dot = "."
            var lat = str.indexOf(at)
            var lstr = str.length
            var ldot = str.indexOf(dot)

            if (str.indexOf(at) == -1 || str.indexOf(dot) == -1 || str.indexOf(" ") != -1) {
                alert("Invalid E-mail ID")
                return false
            }
            return true
        }
    </script>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Student's Site</a>
            <div class="d-flex">
                <span class="navbar-text text-white me-3">Welcome, <strong><%= name %></strong></span>
                <a class="btn btn-outline-light btn-sm" href="AdminLogOut">Logout</a>
            </div>
        </div>
    </nav>

    <div class="container-fluid mt-4">
        <div class="row">
            <!-- Sidebar -->
            <div class="col-md-3">
                <div class="list-group">
                    <div class="list-group-item active">Teacher</div>
                    <a href="#" onclick="myPopup2()" class="list-group-item list-group-item-action">Teacher List</a>
                    <a href="adminAddTeacher.jsp" class="list-group-item list-group-item-action">Add Teacher</a>
                    <a href="adminUpdateTeacher.jsp" class="list-group-item list-group-item-action">Update Teacher</a>
                    <a href="adminDeletTeacher.jsp" class="list-group-item list-group-item-action">Delete Teacher</a>

                    <div class="list-group-item active mt-3">Course</div>
                    <a href="#" onclick="myPopup3()" class="list-group-item list-group-item-action">Course List</a>
                    <a href="adminAddCourse.jsp" class="list-group-item list-group-item-action">Add Course</a>
                    <a href="adminUpdateCourse.jsp" class="list-group-item list-group-item-action">Update Course</a>
                    <a href="adminDeletCourse.jsp" class="list-group-item list-group-item-action">Delete Course</a>

                    <div class="list-group-item active mt-3">Students</div>
                    <a href="#" onclick="myPopup4()" class="list-group-item list-group-item-action">Approved Students</a>
                    <a href="#" onclick="myPopup5()" class="list-group-item list-group-item-action">Not Approved Students</a>

                    <a href="#" class="list-group-item list-group-item-action">Schedule Test</a>
                </div>
            </div>

            <!-- Main Content -->
            <div class="col-md-9">
                <div class="card">
                    <div class="card-header bg-light">
                        <h5 class="mb-0">Delete Course</h5>
                    </div>
                    <div class="card-body">
                        <form method="post">
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label for="ccode" class="form-label">Enter Course Code</label>
                                    <input name="ccode" type="text" id="ccode" class="form-control" required>
                                </div>
                                <div class="col-md-2 align-self-end">
                                    <button type="submit" class="btn btn-danger">Delete</button>
                                </div>
                            </div>
                        </form>
                        <div class="text-center mt-4">
        <a href="adminHome.jsp" class="btn btn-outline-primary"> Dashboard</a>
    </div>

                        <% 
                            try {
                                String ccode = request.getParameter("ccode");
                                if (ccode != null) {
                                    DbConnection db = new DbConnection();
                                    db.pstmt = db.con.prepareStatement("delete from course_mstr where c_code = '" + ccode + "'");
                                    int j = db.pstmt.executeUpdate();
                                    if (j > 0) {
                        %>
                            <div class="alert alert-success">Record Deleted!</div>
                        <%
                                    } else {
                        %>
                            <div class="alert alert-danger">Invalid Course Code</div>
                        <%
                                    }
                                }
                            } catch (Exception e) {
                                out.println("<div class='alert alert-warning'>" + e + "</div>");
                            }
                        %>
                    </div>
                </div>
            </div>
        </div>
    </div>


   
    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
