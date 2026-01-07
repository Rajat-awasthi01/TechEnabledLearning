<%@ page import="DB.DbConnection" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%
    String enroll = (String) session.getAttribute("enrol_no");
    String sname = (String) session.getAttribute("sname");
    if (enroll == null || sname == null) {
        response.sendRedirect("UserLogin.jsp?error=Please Login");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Student Quiz - Home</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f2f5;
            margin: 0; padding: 20px;
        }
        .container {
            max-width: 700px;
            margin: auto;
            background: #fff;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 0 8px #ccc;
        }
        h1 {
            color: #008cc4;
            text-align: center;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table, th, td {
            border: 1px solid #cccccc;
        }
        th, td {
            padding: 10px;
        }
        tr.question-header {
            background-color: #f7dc6f;
            font-weight: bold;
        }
        tr.options td {
            background-color: #fcf8e3;
        }
        .submit-btn {
            text-align: right;
            margin-top: 20px;
        }
        input[type=submit] {
            background-color: #008cc4;
            color: white;
            padding: 8px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 1rem;
        }
        input[type=submit]:hover {
            background-color: #006799;
        }
    </style>

    <script>
        function validate() {
            const totalQuestions = <%= 10 %>;
            for(let i = 0; i < totalQuestions; i++) {
                let radios = document.getElementsByName('op' + i);
                let checked = false;
                for(let r of radios) {
                    if(r.checked) {
                        checked = true;
                        break;
                    }
                }
                if(!checked) {
                    alert("Please answer question " + (i + 1));
                    return false;
                }
            }
            return true;
        }
    </script>
</head>
<body>
    <div class="container">
        <h1>Welcome, <%= sname %> (Enrollment: <%= enroll %>)</h1>
        <form action="StuSubmitAnswr" method="post" onsubmit="return validate();">
            <%
                int limit = 10;
                String[] quest = new String[limit];
                String[] optn1 = new String[limit];
                String[] optn2 = new String[limit];
                String[] optn3 = new String[limit];
                String[] optn4 = new String[limit];
                // Removed sending right answers as hidden inputs for security

                try {
                    DbConnection db = new DbConnection();
                    db.rst = db.stmt.executeQuery("SELECT quest, opt1, opt2, opt3, opt4 FROM questset WHERE ccode='c' LIMIT " + limit);
                    int i = 0;
                    while (db.rst.next() && i < limit) {
                        quest[i] = db.rst.getString("quest");
                        optn1[i] = db.rst.getString("opt1");
                        optn2[i] = db.rst.getString("opt2");
                        optn3[i] = db.rst.getString("opt3");
                        optn4[i] = db.rst.getString("opt4");
                        i++;
                    }
                } catch (Exception e) {
                    out.println("<p style='color:red;'>Error loading questions. Please try again later.</p>");
                    e.printStackTrace();
                }
            %>

            <table>
                <%
                    for (int i = 0; i < limit; i++) {
                %>
                <tr class="question-header">
                    <td colspan="2">Question <%= i + 1 %>: <%= quest[i] != null ? quest[i] : "No question available" %></td>
                </tr>
                <tr class="options">
    <td>
        <label><input type="radio" name="op<%=i%>" value="<%= optn1[i] %>" /> <%= optn1[i] %></label>
    </td>
    <td>
        <label><input type="radio" name="op<%=i%>" value="<%= optn2[i] %>" /> <%= optn2[i] %></label>
    </td>
</tr>
<tr class="options">
    <td>
        <label><input type="radio" name="op<%=i%>" value="<%= optn3[i] %>" /> <%= optn3[i] %></label>
    </td>
    <td>
        <label><input type="radio" name="op<%=i%>" value="<%= optn4[i] %>" /> <%= optn4[i] %></label>
    </td>
</tr>

                <%
                    }
                %>
            </table>
            <div class="submit-btn">
                <input type="submit" value="Submit Answers" />
            </div>
        </form>
            <div class="text-center mt-4">
        <a href="studentHome.jsp" class="btn btn-outline-primary"> Dashboard</a>
    </div>
    </div>
</body>
</html>
