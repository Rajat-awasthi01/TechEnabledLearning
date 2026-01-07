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
    <title>Student Profile</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 text-gray-800">

<!-- Navbar -->
<nav class="bg-blue-600 text-white shadow">
    <div class="max-w-7xl mx-auto px-4 py-4 flex justify-between items-center">
        <a href="#" class="text-xl font-bold">Student's Site</a>
        <ul class="flex space-x-4 text-sm font-medium">
            <li><a href="index.jsp" class="hover:underline">Home</a></li>
            <li><a href="about-us.html" class="hover:underline">About Us</a></li>
            <li><a href="articles.html" class="hover:underline">Articles</a></li>
            <li><a href="contact-us.html" class="hover:underline">Contact</a></li>
            
        </ul>
    </div>
</nav>

<!-- Main Content -->
<div class="max-w-7xl mx-auto px-4 py-8 grid grid-cols-1 md:grid-cols-4 gap-8">

    <!-- Sidebar -->
    <aside class="bg-white shadow rounded-lg p-4">
        <h2 class="text-lg font-semibold mb-4 border-b pb-2">Menu</h2>
        <ul class="space-y-2 text-sm">
            <li><a href="studentProfile.jsp" class="block px-3 py-2 bg-blue-100 rounded text-blue-700 font-semibold">Profile</a></li>
            <li><a href="studentUpdateProfile.jsp" class="block px-3 py-2 hover:bg-gray-100 rounded">Update Profile</a></li>
            <li><a href="studentChangePswd.jsp" class="block px-3 py-2 hover:bg-gray-100 rounded">Change Password</a></li>

           

            <li><a href="StuApplyTest" class="block px-3 py-2 hover:bg-gray-100 rounded">Apply For Test</a></li>
            <li><a href="StuLogOut" class="block px-3 py-2 text-red-600 hover:bg-red-100 rounded">Log Out</a></li>
        </ul>
    </aside>

    <!-- Profile Details -->
    <section class="col-span-1 md:col-span-3 bg-white shadow rounded-lg p-6">
        <h2 class="text-2xl font-bold mb-4">Welcome, <%= sname %></h2>
        <hr class="mb-4">

        <h3 class="text-lg font-semibold mb-4">Your Profile Details</h3>

        <%
            try {
                DbConnection dbcon1 = new DbConnection();
                String sql = "SELECT stu_mstr.enrol_date, stu_mstr.sname, stu_mstr.f_name, stu_mstr.d_o_b, stu_mstr.clas, stu_mstr.College, stu_mstr.city, stu_mstr.state, stu_mstr.country, stu_mstr.mob, stu_mstr.course, stu_mstr.email, stu_login.hint_question, stu_login.hint_answr FROM eclass.stu_login INNER JOIN eclass.stu_mstr ON stu_login.enrol_no = stu_mstr.enrol_no WHERE stu_mstr.enrol_no = '" + enroll + "'";
                dbcon1.rst = dbcon1.stmt.executeQuery(sql);
                if (dbcon1.rst.next()) {
        %>

        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
            <table class="w-full text-sm border border-gray-300 rounded">
                <tbody class="divide-y divide-gray-200">
                    <tr><td class="font-semibold p-2">Enrollment No.</td><td class="p-2"><%= enroll %></td></tr>
                    <tr><td class="font-semibold p-2">Enrollment Date</td><td class="p-2"><%= dbcon1.rst.getString("enrol_date") %></td></tr>
                    <tr><td class="font-semibold p-2">Name</td><td class="p-2"><%= dbcon1.rst.getString("sname") %></td></tr>
                    <tr><td class="font-semibold p-2">Father's Name</td><td class="p-2"><%= dbcon1.rst.getString("f_name") %></td></tr>
                    <tr><td class="font-semibold p-2">DOB</td><td class="p-2"><%= dbcon1.rst.getString("d_o_b") %></td></tr>
                    <tr><td class="font-semibold p-2">Class</td><td class="p-2"><%= dbcon1.rst.getString("clas") %></td></tr>
                    <tr><td class="font-semibold p-2">College</td><td class="p-2"><%= dbcon1.rst.getString("College") %></td></tr>
                    <tr><td class="font-semibold p-2">City</td><td class="p-2"><%= dbcon1.rst.getString("city") %></td></tr>
                    <tr><td class="font-semibold p-2">State</td><td class="p-2"><%= dbcon1.rst.getString("state") %></td></tr>
                    <tr><td class="font-semibold p-2">Country</td><td class="p-2"><%= dbcon1.rst.getString("country") %></td></tr>
                    <tr><td class="font-semibold p-2">Mobile</td><td class="p-2"><%= dbcon1.rst.getString("mob") %></td></tr>
                    <tr><td class="font-semibold p-2">Course</td><td class="p-2"><%= dbcon1.rst.getString("course") %></td></tr>
                    <tr><td class="font-semibold p-2">Email</td><td class="p-2"><%= dbcon1.rst.getString("email") %></td></tr>
                    <tr><td class="font-semibold p-2">Hint Question</td><td class="p-2"><%= dbcon1.rst.getString("hint_question") %></td></tr>
                    <tr><td class="font-semibold p-2">Hint Answer</td><td class="p-2"><%= dbcon1.rst.getString("hint_answr") %></td></tr>
                </tbody>
            </table>

          <div class="text-center mt-4">
        <a href="studentHome.jsp" class="btn btn-outline-primary"> Dashboard</a>
    </div>
        </div>

        <%
                }
            } catch (Exception e) {
                out.println("<div class='text-red-600 mt-4'>Failed to load profile data.</div>");
            }
        %>
    </section>
</div>

<!-- Footer -->
<footer class="bg-blue-600 text-white text-center py-4 mt-10">
    <p>24/7 Customer Service: <strong>8.800.146.56.7</strong></p>
    <p>Website template by awasthirajat16@gmail.com</p>
</footer>

</body>
</html>
