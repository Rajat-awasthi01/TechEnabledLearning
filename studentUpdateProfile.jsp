<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="DB.DbConnection" %>

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
    <meta charset="UTF-8">
    <title>Update Profile</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 text-gray-800">

<!-- Navbar -->
<nav class="bg-white shadow-md">
    <div class="max-w-7xl mx-auto px-4 py-4 flex justify-between items-center">
        <h1 class="text-2xl font-semibold text-blue-600">Student Portal</h1>
        <div>
            <span class="mr-4 font-medium">Welcome, <%= sname %></span>
            <a href="StuLogOut" class="text-red-600 hover:underline">Logout</a>
        </div>
    </div>
</nav>

<!-- Main Content -->
<div class="max-w-4xl mx-auto mt-10 bg-white p-8 rounded-lg shadow">
    <h2 class="text-2xl font-bold mb-6 border-b pb-2 text-blue-700">Update Your Profile</h2>
    <%
        try {
            DbConnection dbcon1 = new DbConnection();
            String sql = "SELECT stu_mstr.enrol_date, stu_mstr.sname, stu_mstr.f_name, stu_mstr.d_o_b, stu_mstr.clas, stu_mstr.College, stu_mstr.city, stu_mstr.state, stu_mstr.country, stu_mstr.mob, stu_mstr.course, stu_mstr.email, stu_login.hint_question, stu_login.hint_answr FROM eclass.stu_login INNER JOIN eclass.stu_mstr ON stu_login.enrol_no = stu_mstr.enrol_no WHERE stu_mstr.enrol_no = '" + enroll + "'";
            dbcon1.rst = dbcon1.stmt.executeQuery(sql);
            if (dbcon1.rst.next()) {
    %>
    <form action="StuUpdateProfileServlet" method="post" enctype="multipart/form-data" class="grid grid-cols-1 md:grid-cols-2 gap-6">
        <div>
            <label class="block font-semibold">Enrollment No.</label>
            <input type="text" name="enrol_no" value="<%= enroll %>" readonly class="mt-1 p-2 w-full border rounded bg-gray-100" />
        </div>

        <div>
            <label class="block font-semibold">Enroll Date</label>
            <input type="text" name="enrol_date" value="<%= dbcon1.rst.getString(1) %>" readonly class="mt-1 p-2 w-full border rounded bg-gray-100" />
        </div>

        <div>
            <label class="block font-semibold">Name</label>
            <input type="text" name="sname" value="<%= dbcon1.rst.getString(2) %>" class="mt-1 p-2 w-full border rounded" />
        </div>

        <div>
            <label class="block font-semibold">Father's Name</label>
            <input type="text" name="f_name" value="<%= dbcon1.rst.getString(3) %>" class="mt-1 p-2 w-full border rounded" />
        </div>

        <div>
            <label class="block font-semibold">Date of Birth</label>
            <input type="text" name="d_o_b" value="<%= dbcon1.rst.getString(4) %>" class="mt-1 p-2 w-full border rounded" />
        </div>

        <div>
            <label class="block font-semibold">Class</label>
            <input type="text" name="clas" value="<%= dbcon1.rst.getString(5) %>" class="mt-1 p-2 w-full border rounded" />
        </div>

        <div>
            <label class="block font-semibold">College</label>
            <input type="text" name="College" value="<%= dbcon1.rst.getString(6) %>" class="mt-1 p-2 w-full border rounded" />
        </div>

        <div>
            <label class="block font-semibold">City</label>
            <input type="text" name="city" value="<%= dbcon1.rst.getString(7) %>" class="mt-1 p-2 w-full border rounded" />
        </div>

        <div>
            <label class="block font-semibold">State</label>
            <input type="text" name="state" value="<%= dbcon1.rst.getString(8) %>" class="mt-1 p-2 w-full border rounded" />
        </div>

        <div>
            <label class="block font-semibold">Country</label>
            <input type="text" name="country" value="<%= dbcon1.rst.getString(9) %>" class="mt-1 p-2 w-full border rounded" />
        </div>

        <div>
            <label class="block font-semibold">Mobile</label>
            <input type="text" name="mob" value="<%= dbcon1.rst.getString(10) %>" class="mt-1 p-2 w-full border rounded" />
        </div>

        <div>
            <label class="block font-semibold">Course</label>
            <input type="text" name="course" value="<%= dbcon1.rst.getString(11) %>" class="mt-1 p-2 w-full border rounded" />
        </div>

        <div>
            <label class="block font-semibold">Email</label>
            <input type="email" name="email" value="<%= dbcon1.rst.getString(12) %>" class="mt-1 p-2 w-full border rounded" />
        </div>

        <div>
            <label class="block font-semibold">Hint Question</label>
            <input type="text" name="hint_question" value="<%= dbcon1.rst.getString(13) %>" class="mt-1 p-2 w-full border rounded" />
        </div>

        <div>
            <label class="block font-semibold">Hint Answer</label>
            <input type="text" name="hint_answr" value="<%= dbcon1.rst.getString(14) %>" class="mt-1 p-2 w-full border rounded" />
        </div>

        <div>
            <label class="block font-semibold">Upload Photo</label>
            <input type="file" name="photo" class="mt-1 p-2 w-full border rounded bg-white" />
        </div>

        <div class="md:col-span-2 text-right">
            <button type="submit" class="bg-blue-600 text-white px-6 py-2 rounded hover:bg-blue-700">Submit</button>
        </div>
    </form>
        <div class="text-center mt-4">
        <a href="studentHome.jsp" class="btn btn-outline-primary"> Dashboard</a>
    </div>
    <% 
            }
        } catch (Exception e) {
            out.println("<p class='text-red-600'>Error: " + e.getMessage() + "</p>");
        }
    %>
</div>



</body>
</html>
