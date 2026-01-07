<%@page import="DB.DbConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String name = (String) session.getAttribute("name");
    if (name == null) {
        response.sendRedirect("UserLogin.jsp?error=Please Login");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Not Approved Student List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-center text-primary mb-4">Not Approved Student List</h2>
        <table class="table table-bordered table-hover">
            <thead class="table-warning text-center">
                <tr>
                    <th>Enroll No</th>
                    <th>Enroll Date</th>
                    <th>Name</th>
                    <th>Father's Name</th>
                    <th>DOB</th>
                    <th>Class</th>
                    <th>College</th>
                    <th>City</th>
                    <th>Country</th>
                    <th>Mobile</th>
                    <th>Course</th>
                    <th>Photo</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody class="text-center">
                <%
                    try {
                        DbConnection db = new DbConnection();
                        String query = "SELECT stu_mstr.enrol_no, stu_mstr.enrol_date, stu_mstr.sname, stu_mstr.f_name, " +
                                       "stu_mstr.d_o_b, stu_mstr.clas, stu_mstr.College, stu_mstr.city, stu_mstr.country, " +
                                       "stu_mstr.mob, stu_mstr.course " +
                                       "FROM eclass.stu_login INNER JOIN eclass.stu_mstr " +
                                       "ON (stu_login.enrol_no = stu_mstr.enrol_no) WHERE stu_login.approval = 0";
                        db.rst = db.stmt.executeQuery(query);

                        while (db.rst.next()) {
                            String enroll = db.rst.getString("enrol_no");
                %>
                <tr>
                    <td><%= enroll %></td>
                    <td><%= db.rst.getString("enrol_date") %></td>
                    <td><%= db.rst.getString("sname") %></td>
                    <td><%= db.rst.getString("f_name") %></td>
                    <td><%= db.rst.getString("d_o_b") %></td>
                    <td><%= db.rst.getString("clas") %></td>
                    <td><%= db.rst.getString("College") %></td>
                    <td><%= db.rst.getString("city") %></td>
                    <td><%= db.rst.getString("country") %></td>
                    <td><%= db.rst.getString("mob") %></td>
                    <td><%= db.rst.getString("course") %></td>
                    <td><a href="adminStuImg.jsp?enroll=<%= enroll %>" class="btn btn-sm btn-info">View</a></td>
                    <td>
                        <form action="ApprovStuListServlt" method="post" class="d-inline">
                            <input type="hidden" name="enroll" value="<%= enroll %>">
                            <input type="hidden" name="type" value="Apprvd">
                            <button type="submit" class="btn btn-success btn-sm">Approve</button>
                        </form>
                    </td>
                </tr>
                <%
                        }
                    } catch (Exception e) {
                        out.println("<tr><td colspan='13' class='text-danger'>Error: " + e.getMessage() + "</td></tr>");
                    }
                %>
            </tbody>
        </table>
             <div class="text-center mt-4">
        <a href="adminHome.jsp" class="btn btn-outline-primary"> Dashboard</a>
    </div>
    </div>
</body>
</html>
