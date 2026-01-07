<%@page import="DB.DbConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String enroll = null;
    String sname = null;
    try {
        enroll = (String) session.getAttribute("enrol_no");
        sname = (String) session.getAttribute("sname");
        if (enroll != null || sname != null) {
            session.setAttribute("enrol_no", enroll);
            session.setAttribute("sname", sname);
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
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Student's Site - Home Page</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            padding-top: 70px;
        }
        aside {
            min-width: 220px;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top">
  <div class="container">
    <a class="navbar-brand" href="index.html">Student's Site</a>
    
    <div class="collapse navbar-collapse" id="navbarsExample07">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item"><a class="nav-link active" href="index.jsp">Home Page</a></li>
        <li class="nav-item"><a class="nav-link" href="about-us.html">About Us</a></li>
        <li class="nav-item"><a class="nav-link" href="articles.html">Our Articles</a></li>
        <li class="nav-item"><a class="nav-link" href="contact-us.html">Contact Us</a></li>
        
      </ul>
      
    </div>
  </div>
</nav>

<div class="container">
  <div class="row">
    <!-- Sidebar -->
    <aside class="col-md-3 mb-4">
      <h5>Categories</h5>
      <ul class="list-group mb-3">
        <li class="list-group-item"><a href="studentProfile.jsp">Profile</a></li>
        <li class="list-group-item"><a href="studentUpdateProfile.jsp">Update Profile</a></li>
        <li class="list-group-item"><a href="studentChangePswd.jsp">Change Password</a></li>
        
        <li class="list-group-item"><a href="StuApplyTest">Apply For Test</a></li>
        <li class="list-group-item"><a href="StuLogOut">Log Out</a></li>
      </ul>

    
    </aside>

    <!-- Main Content -->
    <section class="col-md-9">
      <div class="bg-light p-4 rounded mb-4">
        <h2>Professional <span class="text-primary">Online Education</span> <small class="d-block"></small></h2>
      </div>

      <h3 class="mb-3">Welcome, <span class="text-primary"><%= sname %></span>!</h3>

      <hr />

      <%
        String hq = null;
        try {
          DbConnection db = new DbConnection();
          db.rst = db.stmt.executeQuery("select hint_question from stu_login where enrol_no='" + enroll + "' ");
          if (db.rst.next()) {
            hq = db.rst.getString(1);
          }
        } catch (Exception e) {
          System.out.println(e);
        }
      %>

      <form method="post" action="StuChngPswd" class="row g-3 needs-validation" novalidate>
        <div class="card p-3">
          <h4 class="card-title mb-4">Update Password</h4>

          <div class="col-md-12">
            <label class="form-label"><%= hq %> <small class="text-muted">[Hint Question]</small></label>
            <input type="text" name="hint_answr" class="form-control" required />
            <div class="invalid-feedback">Please provide your hint answer.</div>
          </div>

          <div class="col-md-12">
            <label class="form-label">Current Password</label>
            <input type="password" name="cpswd" class="form-control" required />
            <div class="invalid-feedback">Please enter current password.</div>
          </div>

          <div class="col-md-12">
            <label class="form-label">New Password</label>
            <input type="password" name="npswd" class="form-control" required />
            <div class="invalid-feedback">Please enter new password.</div>
          </div>

          <div class="col-md-12">
            <label class="form-label">Retype New Password</label>
            <input type="password" name="rnpswd" class="form-control" required />
            <div class="invalid-feedback">Please retype the new password.</div>
          </div>

          <div class="col-12">
            <button class="btn btn-primary" type="submit">Update Password</button>
          </div>
        </div>
      </form>
    </section>
  </div>
</div>

  <div class="text-center mt-4" >
        <a href="studentHome.jsp" class="btn btn-outline-primary"> Dashboard</a>
    </div>

<!-- Bootstrap JS Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<script>
// Example Bootstrap validation
(() => {
  'use strict'
  const forms = document.querySelectorAll('.needs-validation')
  Array.from(forms).forEach(form => {
    form.addEventListener('submit', event => {
      if (!form.checkValidity()) {
        event.preventDefault()
        event.stopPropagation()
      }
      form.classList.add('was-validated')
    }, false)
  })
})();
</script>
</body>
</html>
