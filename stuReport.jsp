<%@page import="java.sql.*"%>
<%@page import="DB.DbConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    // Check session attributes
    String enroll = (String) session.getAttribute("enrol_no");
    String sname = (String) session.getAttribute("sname");

    if (enroll == null || sname == null) {
        response.sendRedirect("UserLogin.jsp?error=Please Login");
        return; // stop processing
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Student Report Card</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
<div class="container mt-5">
    <h1 class="text-center mb-4">Student Report Card</h1>

<%
    DbConnection db = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        db = new DbConnection();

        String sql = "SELECT test.test_date, test.totalquestno, stu_mstr.College, stu_mstr.sname, " +
                     "stu_mstr.f_name, stu_mstr.course FROM eclass.test " +
                     "INNER JOIN eclass.stu_mstr ON test.enrol_no = stu_mstr.enrol_no " +
                     "WHERE stu_mstr.enrol_no = ?";

        ps = db.con.prepareStatement(sql);
        ps.setString(1, enroll);
        rs = ps.executeQuery();

        if (rs.next()) {
            int totalQuestions = rs.getInt("totalquestno");
            int marks = totalQuestions * 2;
            double percent = (marks * 100.0) / 20;

%>

    <table class="table table-bordered w-75 mx-auto">
        <tr>
            <td colspan="3" class="text-end">Exam Date: <%= rs.getString("test_date") %></td>
        </tr>
        <tr>
            <td>Enrollment No:</td>
            <td><%= enroll %></td>
          
        </tr>
        <tr>
            <td>College:</td>
            <td><%= rs.getString("College") %></td>
        </tr>
        <tr>
            <td>Student Name:</td>
            <td><%= rs.getString("sname") %></td>
        </tr>
        <tr>
            <td>Father Name:</td>
            <td><%= rs.getString("f_name") %></td>
        </tr>
        <tr>
            <td>Course Name:</td>
            <td><%= rs.getString("course") %></td>
        </tr>
        <tr>
            <td>Marks:</td>
            <td><%= marks %></td>
            <td></td>
        </tr>
        <tr>
            <td>Total Marks:</td>
            <td>20</td>
            <td></td>
        </tr>
        <tr>
            <td>Percentage:</td>
            <td><%= String.format("%.2f", percent) %> %</td>
            <td class="text-center fs-4 fw-bold text-<%= (marks > 10) ? "success" : "danger" %>">
                <%= (marks > 10) ? "Pass!" : "Fail!" %>
            </td>
        </tr>
    </table>
            <div class="text-center mt-4">
        <a href="studentHome.jsp" class="btn btn-outline-primary"> Dashboard</a>
    </div>

<%
        } else {
%>
    <div class="alert alert-warning text-center">
        No report found for enrollment number: <%= enroll %>
    </div>
<%
        }
    } catch (Exception e) {
%>
    <div class="alert alert-danger text-center">
        Error: <%= e.getMessage() %>
    </div>
<%
    } finally {
        try { if (rs != null) rs.close(); } catch(Exception e) {}
        try { if (ps != null) ps.close(); } catch(Exception e) {}
        try { if (db != null && db.con != null) db.con.close(); } catch(Exception e) {}
    }
%>

</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
