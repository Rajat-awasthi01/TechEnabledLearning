<%@page import="DB.DbConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Student Registration</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script type="text/javascript" src="js/clndr/scw.js"></script>
    <script type="text/javascript" src="js/validateuserid.js"></script>

    <script>
        // Paste the validate() and echeck() functions here unchanged
        // (from your original script above, for brevity I’ve omitted them here)
    </script>
</head>
<body class="bg-gray-100 min-h-screen flex items-center justify-center">

<div class="w-full max-w-4xl bg-white shadow-lg rounded-lg p-8">
    <h2 class="text-2xl font-bold text-center text-blue-600 mb-6">Student Registration</h2>

    <form action="StuRegistr" method="post" enctype="multipart/form-data" name="frm" onSubmit="return validate();">
        <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
            <div>
                <label class="block text-sm font-medium">Name</label>
                <input type="text" name="sname" class="w-full border p-2 rounded" />
            </div>
            <div>
                <label class="block text-sm font-medium">Father's Name</label>
                <input type="text" name="f_name" class="w-full border p-2 rounded" />
            </div>
            <div>
                <label class="block text-sm font-medium">Date of Birth</label>
                <input type="text" name="d_o_b" id="dob" onclick="scwShow(this,event);" onfocus="scwShow(this,event);" class="w-full border p-2 rounded" />
            </div>
            <div>
                <label class="block text-sm font-medium">Class</label>
                <input type="text" name="clas" class="w-full border p-2 rounded" />
            </div>
            <div>
                <label class="block text-sm font-medium">College</label>
                <input type="text" name="College" class="w-full border p-2 rounded" />
            </div>
            <div>
                <label class="block text-sm font-medium">City</label>
                <input type="text" name="city" class="w-full border p-2 rounded" />
            </div>
            <div>
                <label class="block text-sm font-medium">State</label>
                <input type="text" name="state" class="w-full border p-2 rounded" />
            </div>
            <div>
                <label class="block text-sm font-medium">Country</label>
                <input type="text" name="country" class="w-full border p-2 rounded"/>
            </div>
            <label class="block text-sm font-medium">Contact</label>
            <input type="text" name="mob"
       pattern="^\d{10}$"
       title="Enter exactly 10 digits"
       maxlength="10"
       oninput="this.value = this.value.replace(/[^0-9]/g, '').slice(0, 10);"
       class="w-full border p-2 rounded"
       required>
            <div>
                <label class="block text-sm font-medium">Course</label>
                <select name="course" class="w-full border p-2 rounded">
                    <option value="">Select Course</option>
                    <%
                        try {
                            DbConnection dbcn = new DbConnection();
                            dbcn.rst = dbcn.stmt.executeQuery("SELECT c_code FROM course_mstr");
                            while (dbcn.rst.next()) {
                    %>
                        <option><%= dbcn.rst.getString(1) %></option>
                    <%  }
                        } catch (Exception e) {
                            System.out.println(e);
                        }
                    %>
                </select>
            </div>
            <div>
                <label class="block text-sm font-medium">Photo</label>
                <input type="file" name="photo" class="w-full border p-2 rounded" />
            </div>
            <div>
                <label class="block text-sm font-medium">Email</label>
                <input type="text" name="email" id="email" class="w-full border p-2 rounded" />
            </div>
        </div>

        
        <div class="mt-6 text-right">
            <button type="submit" class="bg-blue-600 text-white px-4 py-2 rounded hover:bg-blue-700">Register</button>
        </div>
    </form>

    <p class="text-center text-sm text-gray-600 mt-6">Already Registered? <a href="student_login.jsp" class="text-blue-500 hover:underline">Click Here</a></p>
</div>

</body>
</html>
