<%@page import="DB.DbConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String enroll = (String) session.getAttribute("enrol_no");
    String sname = (String) session.getAttribute("sname");
    if (enroll == null || sname == null) {
        response.sendRedirect("UserLogin.jsp?error=Please login first");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Home - Student's Site</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />

    <style>
        body {
            padding-top: 56px;
        }

        aside {
            background: #f8f9fa;
            padding: 20px;
            border-radius: 0.25rem;
            margin-bottom: 20px;
        }

        footer {
            background: #343a40;
            color: white;
            padding: 15px 0;
            margin-top: 40px;
        }
    </style>
</head>

<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top">
        <div class="container">
            <a class="navbar-brand" href="index.html">Student's Site</a>
            
            <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item"><a class="nav-link active" href="index.jsp">Home Page</a></li>
                    <li class="nav-item"><a class="nav-link" href="about-us.html">About Us</a></li>
                    <li class="nav-item"><a class="nav-link" href="articles.html">Our Articles</a></li>
                    <li class="nav-item"><a class="nav-link" href="contact-us.html">Contact Us</a></li>
                    
                </ul>
                
            </div>
        </div>
    </nav>

    <!-- Main container -->
    <div class="container mt-4">
        <div class="row">
            <!-- Sidebar / Aside -->
            <aside class="col-md-3">
                <h5>Categories</h5>
                <ul class="list-group mb-4">
                    <li class="list-group-item"><a href="studentProfile.jsp">Profile</a></li>
                    <li class="list-group-item"><a href="studentUpdateProfile.jsp">Update Profile</a></li>
                    <li class="list-group-item"><a href="studentChangePswd.jsp">Change Password</a></li>
                    <li class="list-group-item"><a href="stuStartTest.jsp">Start Test</a></li>
                  
                    <li class="list-group-item"><a href="StuApplyTest">Apply For Test</a></li>
                    <li class="list-group-item"><a href="StuLogOut">Log Out</a></li>
                </ul>

                
            </aside>

            <!-- Main content -->
            <section class="col-md-9">
                <div class="bg-light p-4 rounded mb-4 text-center">
                    <h2>Professional <span class="text-primary">Online Education</span> </h2>
                </div>

                <div class="mb-4">
                    <h3>Welcome, <span class="text-success"><%= sname %></span>!</h3>
                </div>

                <div class="text-center">
                    <hr class="w-50" />
                    <h4>
                        <%
                            String msg = request.getParameter("msg");
                            if (msg != null) {
                                if (msg.trim().equals("1")) {
                        %>
                        <span class="text-success">Successfully Updated!</span>
                        <%
                                } else if (msg.trim().equals("0")) {
                        %>
                        <span class="text-danger">Failed!</span>
                        <%
                                } else if (msg.trim().equals("2")) {
                        %>
                        <span class="text-danger">Already Applied</span>
                        <%
                                } else if (msg.trim().equals("3")) {
                        %>
                        <span class="text-success">Applied</span>
                        <%
                                }
                            } else {
                        %>
                        Hey! <span class="text-secondary">How are you doing?</span>
                        <%
                            }
                        %>
                    </h4>

                    <%
                        try {
                            DbConnection dbCon = new DbConnection();
                            dbCon.rst = dbCon.stmt.executeQuery("SELECT test_date FROM test WHERE (test_date > CURDATE() AND applied=1 and enrol_no='" + enroll + "');");
                            if (dbCon.rst.next()) {
                    %>
                    <p class="text-warning fs-5 mt-3">
                        Your Test Date is Scheduled on <%= dbCon.rst.getString(1) %>
                    </p>
                    <%
                            }
                        } catch (Exception e) {
                            System.out.println(e);
                        }
                    %>

                    <%
                        try {
                            DbConnection dbCon = new DbConnection();
                            dbCon.rst = dbCon.stmt.executeQuery("SELECT test_date FROM test WHERE (test_date = CURDATE() AND applied=1 and enrol_no='" + enroll + "');");
                            if (dbCon.rst.next()) {
                                dbCon.rst = dbCon.stmt.executeQuery("SELECT course FROM stu_mstr WHERE ( enrol_no='" + enroll + "');");
                                dbCon.rst.next();
                    %>
                    <p class="text-success fs-5 mt-3">
                        Ready for Test!! &nbsp;
                        <a href="stuStartTest.jsp?course=<%= dbCon.rst.getString(1) %>" target="_blank" class="btn btn-success btn-sm">Start Test</a>
                    </p>
                    <%
                            }
                        } catch (Exception e) {
                            System.out.println(e);
                        }
                    %>

                    <hr class="w-50" />
                </div>
            </section>
        </div>
    </div>

    <!-- Footer -->
    

    <!-- Bootstrap JS Bundle (with Popper) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
