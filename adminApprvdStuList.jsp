<%@page import="DB.DbConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String name = null;
    try {
        name = (String) session.getAttribute("name");
        if (name == null) {
            response.sendRedirect("UserLogin.jsp?error=Please Login");
        }
    } catch (Exception e) {
        System.out.println(e);
    }
%>
<html lang="en">
<head>
    <title>Teacher List</title>
    <script type="text/javascript">
        function myPopup2(enrl) {
            window.open(
                "http://localhost:8080/Eclass/admin/ImgDsp?enroll=" + enrl,
                "myWindow",
                "status=0,height=300,width=340,resizable=1,scrollbars=1,location=no"
            );
        }
    </script>
    <style>
        .style1 {
            font-family: Verdana, Arial, Helvetica, sans-serif;
            font-size: medium;
            font-weight: bold;
            color: #0066FF;
        }
    </style>
</head>
<body id="page1">
    <div align="center"><span class="style1">Approved Student List</span></div>
    <br>
    <table width="100%" border="1" cellspacing="0" cellpadding="0">
        <tr style="background-color:#FFFF99">
            <th>Enrol No</th>
            <th>Enrol Date</th>
            <th>Name</th>
            <th>F_Name</th>
            <th>DOB</th>
            <th>Class</th>
            <th>College</th>
            <th>City</th>
            <th>Country</th>
            <th>Mob</th>
            <th>Course</th>
            <th>Photo</th>
            <th>Action</th>
        </tr>
        <%
            try {
                DbConnection db = new DbConnection();
                db.rst = db.stmt.executeQuery(
                    "SELECT stu_mstr.enrol_no, stu_mstr.enrol_date, stu_mstr.sname, stu_mstr.f_name, " +
                    "stu_mstr.d_o_b, stu_mstr.clas, stu_mstr.College, stu_mstr.city, stu_mstr.country, " +
                    "stu_mstr.mob, stu_mstr.course " +
                    "FROM eclass.stu_login " +
                    "INNER JOIN eclass.stu_mstr ON (stu_login.enrol_no = stu_mstr.enrol_no) " +
                    "WHERE stu_login.approval = 1"
                );

                while (db.rst.next()) {
                    String enrol = db.rst.getString(1);
        %>
        <tr>
            <td align="center" style="background-color:#FFFF99"><%= enrol %></td>
            <td align="center"><%= db.rst.getString(2) %></td>
            <td align="center"><%= db.rst.getString(3) %></td>
            <td align="center"><%= db.rst.getString(4) %></td>
            <td align="center"><%= db.rst.getString(5) %></td>
            <td align="center"><%= db.rst.getString(6) %></td>
            <td align="center"><%= db.rst.getString(7) %></td>
            <td align="center"><%= db.rst.getString(8) %></td>
            <td align="center"><%= db.rst.getString(9) %></td>
            <td align="center"><%= db.rst.getString(10) %></td>
            <td align="center"><%= db.rst.getString(11) %></td>
            <td align="center">
                <a href="adminStuImg.jsp?enroll=<%= enrol %>" target="_blank">Click</a>
            </td>
            <td align="center">
                <form action="ApprovStuListServlt" method="post" style="display:inline;">
                    <input type="hidden" name="enroll" value="<%= enrol %>">
                    <input type="hidden" name="type" value="Dissp">
                    <input type="submit" value="Disapprove !">
                </form>
           
                    
            </td>
        </tr>
        <%
                }
            } catch (Exception e) {
                System.out.println(e);
            }
        %>
    </table>
    <div class="text-center mt-4" >
        <a href="adminHome.jsp" class="btn btn-outline-primary"> Dashboard</a>
    </div>
</body>
</html>
