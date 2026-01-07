
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Admin Dashboard - Add Course</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-gray-100 text-gray-800">
  <div class="min-h-screen flex">
    <!-- Sidebar -->
    <aside class="w-64 bg-white shadow-md hidden md:block">
      <div class="p-6 text-xl font-bold text-blue-600">Admin Panel</div>
      <nav class="p-4 space-y-2 text-sm">
        <a href="#" onclick="AdminTeacherList.jsp" class="block p-2 rounded hover:bg-blue-50">Teacher List</a>
        <a href="adminAddTeacher.jsp" class="block p-2 rounded hover:bg-blue-50">Add Teacher</a>
        <a href="adminUpdateTeacher.jsp" class="block p-2 rounded hover:bg-blue-50">Update Teacher</a>
        <a href="adminDeletTeacher.jsp" class="block p-2 rounded hover:bg-blue-50">Delete Teacher</a>
        <a href="adminCourseList" class="block p-2 rounded hover:bg-blue-50">Course List</a>
        <a href="adminAddCourse.jsp" class="block p-2 rounded hover:bg-blue-50 font-semibold text-blue-700">Add Course</a>
        <a href="adminUpdateCourse.jsp" class="block p-2 rounded hover:bg-blue-50">Update Course</a>
        <a href="adminDeletCourse.jsp" class="block p-2 rounded hover:bg-blue-50">Delete Course</a>
        <a href="AdminLogOut" class="block p-2 rounded hover:bg-blue-50 text-red-600">Log Out</a>
        <hr class="my-4" />
        <div class="text-gray-500 font-semibold">Student Zone</div>
        <a href="#" onclick="myPopup4()" class="block p-2 rounded hover:bg-blue-50">Approved Students</a>
        <a href="#" onclick="myPopup5()" class="block p-2 rounded hover:bg-blue-50">Not Approved Students</a>
        <a href="#" class="block p-2 rounded hover:bg-blue-50">Schedule Test</a>
      </nav>
    </aside>

    <!-- Main Content -->
    <main class="flex-1 p-8">
      <!-- Header -->
      <header class="mb-6">
        <h1 class="text-2xl font-semibold">Welcome</h1><div class="text-center mt-4">
        <a href="adminHome.jsp" class="btn btn-outline-primary"> Dashboard</a>
    </div>
      </header>

      <!-- Add Course Form -->
      <section class="bg-white p-6 rounded-lg shadow-md">
        <h2 class="text-xl font-semibold mb-4">Add Course</h2>
        <form action="" method="post" name="frm" onsubmit="return tcherfrmvalidate();" class="space-y-4">
          <div>
            <label class="block text-sm font-medium">Course Code</label>
            <input name="c_code" type="text" id="ccode" class="mt-1 w-full border border-gray-300 rounded px-3 py-2" />
          </div>

          <div>
            <label class="block text-sm font-medium">Name</label>
            <input name="c_name" type="text" id="cname" class="mt-1 w-full border border-gray-300 rounded px-3 py-2" />
          </div>

          <div>
            <label class="block text-sm font-medium">Duration (in months)</label>
            <input name="c_duration" type="text" id="duration" class="mt-1 w-full border border-gray-300 rounded px-3 py-2" />
          </div>

          <div>
            <label class="block text-sm font-medium">Description</label>
            <textarea name="description" id="descrptn" rows="4" class="mt-1 w-full border border-gray-300 rounded px-3 py-2"></textarea>
          </div>

          <div>
            <label class="block text-sm font-medium">Fee</label>
            <input name="Fee" type="text" id="fee" class="mt-1 w-full border border-gray-300 rounded px-3 py-2" />
          </div>

          <div>
            <label class="block text-sm font-medium">File Path</label>
            <input name="path" type="text" id="path" value="./Course/" class="mt-1 w-full border border-gray-300 rounded px-3 py-2" />
            <p class="text-xs text-gray-500">(Upload File Under Course Folder)</p>
          </div>

          <div class="pt-4">
            <button type="submit" class="bg-blue-600 text-white px-6 py-2 rounded hover:bg-blue-700">Submit</button>
          </div>
        </form>
      </section>
    </main>
  </div>

  <script>
    function myPopup2() {
      window.open("./AdminTeacherList.jsp", "myWindow", "height=300,width=340,resizable=1,scrollbars=1")
    }
    function myPopup3() {
      window.open("./adminCourseList.jsp", "myWindow", "height=300,width=340,resizable=1,scrollbars=1")
    }
    function myPopup4() {
      window.open("./adminApprvdStuList.jsp", "myWindow", "height=300,width=340,resizable=1,scrollbars=1")
    }
    function myPopup5() {
      window.open("./adminNtApprvdStuList.jsp", "myWindow", "height=300,width=340,resizable=1,scrollbars=1")
    }
    function tcherfrmvalidate() {
      const f = document.frm;
      if (f.ccode.value == "") { alert("Please enter Course Code"); f.ccode.focus(); return false; }
      if (f.cname.value == "") { alert("Please enter Course Name"); f.cname.focus(); return false; }
      if (f.duration.value == "") { alert("Please enter Duration"); f.duration.focus(); return false; }
      if (f.descrptn.value == "") { alert("Please enter Description"); f.descrptn.focus(); return false; }
      if (f.fee.value == "") { alert("Please enter Fee"); f.fee.focus(); return false; }
      if (f.path.value == "") { alert("Please enter File Path"); f.path.focus(); return false; }
      return true;
    }
  </script>
</body>

</html>