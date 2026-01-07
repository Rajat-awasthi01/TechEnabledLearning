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
            return;
        }
    } catch (Exception e) {
        System.out.println(e);
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin - Delete Teacher</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-50 text-gray-800">

<!-- Header -->
<header class="bg-blue-600 text-white py-4 shadow">
    <div class="max-w-7xl mx-auto px-4 flex justify-between items-center">
        <h1 class="text-xl font-semibold">Admin Panel</h1>
        <div>
            <span class="mr-4">Welcome, <%= name %></span>
            <a href="AdminLogOut" class="bg-red-500 hover:bg-red-600 text-white px-4 py-2 rounded">Logout</a>
        </div>
    </div>
</header>

<!-- Main Layout -->
<div class="max-w-7xl mx-auto px-4 py-8 grid grid-cols-1 md:grid-cols-3 gap-6">

    <!-- Sidebar -->
    <aside class="bg-white shadow rounded-lg p-4 space-y-4">
        <div>
            <h2 class="text-lg font-semibold mb-2">Teacher Management</h2>
            <ul class="space-y-1">
                <li><a href="AdminTeacherList.jsp" class="block text-blue-600 hover:underline">Teacher List</a></li>
                <li><a href="adminAddTeacher.jsp" class="block text-blue-600 hover:underline">Add Teacher</a></li>
                <li><a href="adminUpdateTeacher.jsp" class="block text-blue-600 hover:underline">Update Teacher</a></li>
                <li><a href="adminDeletTeacher.jsp" class="block text-blue-600 font-bold underline">Delete Teacher</a></li>
            </ul>
        </div>
        <div>
            <h2 class="text-lg font-semibold mb-2">Course Management</h2>
            <ul class="space-y-1">
                <li><a href="adminCourseList.jsp" class="block text-blue-600 hover:underline">Course List</a></li>
                <li><a href="adminAddCourse.jsp" class="block text-blue-600 hover:underline">Add Course</a></li>
                <li><a href="adminUpdateCourse.jsp" class="block text-blue-600 hover:underline">Update Course</a></li>
                <li><a href="adminDeletCourse.jsp" class="block text-blue-600 hover:underline">Delete Course</a></li>
            </ul>
        </div>
        <div>
            <h2 class="text-lg font-semibold mb-2">Student Zone</h2>
            <ul class="space-y-1">
                <li><a href="adminApprvdStuList.jsp" class="block text-blue-600 hover:underline">Approved Students</a></li>
                <li><a href="adminNtApprvdStuList.jsp" class="block text-blue-600 hover:underline">Not Approved Students</a></li>
            </ul>
        </div>
    </aside>

    <!-- Main Content -->
    <main class="md:col-span-2 bg-white shadow rounded-lg p-6">
        <h2 class="text-2xl font-semibold text-blue-600 mb-4">Delete Teacher</h2>
        <form method="post" class="space-y-4">
            <div class="flex items-center space-x-4">
                <label for="t_id" class="w-1/3 font-medium">Enter Teacher ID:</label>
                <input type="text" name="t_id" id="t_id" class="w-full border border-gray-300 rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-400" required>
                <button type="submit" class="bg-red-500 text-white px-4 py-2 rounded hover:bg-red-600">Delete</button>
            </div>
        </form>

        <div class="mt-6">
            <a href="adminHome.jsp" class="inline-block text-blue-600 hover:underline">← Back to Dashboard</a>
        </div>

        <% 
            try {
                String tid = request.getParameter("t_id");
                if (tid != null && !tid.trim().equals("")) {
                    DbConnection db = new DbConnection();
                    db.pstmt = db.con.prepareStatement("DELETE FROM teacher_mstr WHERE t_id = ?");
                    db.pstmt.setString(1, tid);
                    int j = db.pstmt.executeUpdate();
                    if (j > 0) {
        %>
            <div class="mt-4 p-4 bg-green-100 text-green-800 rounded">Record Deleted!</div>
        <%
                    } else {
        %>
            <div class="mt-4 p-4 bg-yellow-100 text-yellow-800 rounded">Invalid ID or Record Not Found</div>
        <%
                    }
                }
            } catch (Exception e) {
        %>
            <div class="mt-4 p-4 bg-red-100 text-red-800 rounded">Error: <%= e.getMessage() %></div>
        <%
            }
        %>
    </main>
</div>

<!-- Footer -->
<footer class="text-center text-gray-500 text-sm py-4 border-t mt-8">
    24/7 Customer Service: 8.800.146.56.7
</footer>

</body>
</html>
