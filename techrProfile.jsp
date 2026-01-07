<%@page import="DB.DbConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String tid = null;
    String name = null;
    try {
        tid = (String) session.getAttribute("t_id");
        name = (String) session.getAttribute("tname");
        if (tid == null || name == null) {
            response.sendRedirect("UserLogin.jsp?error=Please+Login");
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
    <title>Teacher Dashboard</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 text-gray-800">

    <!-- Top Navbar -->
    <header class="bg-blue-700 text-white shadow-md">
        <div class="container mx-auto px-4 py-4 flex justify-between items-center">
            <h1 class="text-xl font-bold">Tech-Enabled Learning Portal</h1>
            <nav>
                <ul class="flex space-x-6">
                    <li><a href="index.jsp" class="hover:underline">Home</a></li>
                    <li><a href="about-us.html" class="hover:underline">About Us</a></li>
                    <li><a href="articles.html" class="hover:underline">Articles</a></li>
                    <li><a href="contact-us.html" class="hover:underline">Contact Us</a></li>
                    
                </ul>
            </nav>
        </div>
    </header>

    <!-- Main Layout -->
    <div class="flex min-h-screen">
        
        <!-- Sidebar -->
        <aside class="w-64 bg-white border-r p-4 space-y-4">
            <h2 class="text-xl font-semibold text-blue-700 mb-4">Navigation</h2>
            <ul class="space-y-2">
                <li><a href="techrProfile.jsp" class="block text-blue-600 hover:underline">View Profile</a></li>
                <li><a href="teahcrUploadTest.jsp" class="block text-blue-600 hover:underline">Upload Test</a></li>
                
                <li><a href="adminAddCourse.jsp" class="block text-blue-600 hover:underline">Add Course</a></li>
                <li><a href="adminUpdateCourse.jsp" class="block text-blue-600 hover:underline">Update Course</a></li>
                <li><a href="TeacherLogOut" class="block text-red-600 hover:underline">Logout</a></li>
            </ul>
        </aside>

        <!-- Content Area -->
        <main class="flex-1 p-8">
            <div class="bg-white rounded shadow-md p-6 mb-6">
                <h2 class="text-2xl font-semibold text-blue-700">Welcome, <%=name%>!</h2>
                <p class="text-gray-600">Here is your profile information:</p>
            </div>

            <%
                try {
                    DbConnection db = new DbConnection();
                    db.rst = db.stmt.executeQuery("SELECT tname, d_o_j, address, tqualification, university, course, mob, email, pswd FROM teacher_mstr WHERE t_id='" + tid + "'");
                    if (db.rst.next()) {
            %>
            <div class="bg-white rounded shadow-md p-6">
                <table class="table-auto w-full text-left">
                    <thead>
                        <tr class="bg-gray-100">
                            <th class="px-4 py-2">Field</th>
                            <th class="px-4 py-2">Value</th>
                        </tr>
                    </thead>
                    <tbody class="divide-y divide-gray-200">
                        <tr><td class="px-4 py-2 font-medium">Teacher ID</td><td class="px-4 py-2"><%=tid%></td></tr>
                        <tr><td class="px-4 py-2 font-medium">Name</td><td class="px-4 py-2"><%=db.rst.getString(1)%></td></tr>
                        <tr><td class="px-4 py-2 font-medium">Date of Joining</td><td class="px-4 py-2"><%=db.rst.getString(2)%></td></tr>
                        <tr><td class="px-4 py-2 font-medium">Address</td><td class="px-4 py-2"><%=db.rst.getString(3)%></td></tr>
                        <tr><td class="px-4 py-2 font-medium">Qualification</td><td class="px-4 py-2"><%=db.rst.getString(4)%></td></tr>
                        <tr><td class="px-4 py-2 font-medium">University</td><td class="px-4 py-2"><%=db.rst.getString(5)%></td></tr>
                        <tr><td class="px-4 py-2 font-medium">Teaching Subject</td><td class="px-4 py-2"><%=db.rst.getString(6)%></td></tr>
                        <tr><td class="px-4 py-2 font-medium">Mobile</td><td class="px-4 py-2"><%=db.rst.getString(7)%></td></tr>
                        <tr><td class="px-4 py-2 font-medium">Email</td><td class="px-4 py-2"><%=db.rst.getString(8)%></td></tr>
                    </tbody>
                </table>
                    <div class="text-center mt-4">
        <a href="techrHome.jsp" class="btn btn-outline-primary"> Dashboard</a>
    </div>
            </div>
            <% } } catch (Exception e) {
                out.println("<p class='text-red-600'>Error fetching profile data.</p>");
                e.printStackTrace();
            } %>
        </main>
    </div>

   
   

</body>
</html>
