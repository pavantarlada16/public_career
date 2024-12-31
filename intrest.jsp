<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% String id=request.getParameter("cid"); %>
<% String branch=request.getParameter("branch"); %>
<% String uid=(String)session.getAttribute("id");
String name=(String)session.getAttribute("name");
if(name==null){
    response.sendRedirect("error_page.jsp");
} else { %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="navbar">
        <div class="leftitem">
            <ul class="list1">
                <li><a href="user_page.jsp?id=<%= name %>">Home</a></li>
                <li><a href="seemsg_2.jsp">See Messages</a></li>
                <li><a href="courses.jsp">Courses</a></li>
                <li><a href="">Help</a></li>
            </ul>
        </div>
        <div class="rightitem">
            <ul class="list2">
                <li><a href="logout.jsp">Logout</a></li>
            </ul>
        </div>
    </div>
    <br><br>
    <div class="box">
        <a href="department.jsp?id=engineering">Engineering Courses</a>
        <a href="department.jsp?id=arts">Arts and Humanities Courses</a>
        <a href="department.jsp?id=commerce">Commerce Courses</a>
        <a href="department.jsp?id=management">Management Courses</a>
        <a href="department.jsp?id=medical">Medical Courses</a>
        <a href="department.jsp?id=science">Science Courses</a>
        <a href="department.jsp?id=others">Other Courses</a>
    </div>
    <h2 align="center">College ID: <%= id %></h2>
    <div class="form1">
    <form method="post" action="request.jsp">
        <h1>Request Form</h1>
        <input type="text" name="cid" value="<%= id %>" readonly hidden>
        Full Name<br>
        <input type="text" name="sname" required><br><br>
        Date of Birth<br>
        <input type="date" name="date" required><br><br>
        Email ID<br>
        <input type="mail" name="umail" value="<%= uid %>" required><br><br>
        City<br>
        <input type="text" name="city" required><br><br>
        10th CGPA<br>
        <input type="text" name="ten" required><br><br>
        12th CGPA<br>
        <input type="text" name="inter" required><br><br>
        Requested Acedemic year<br>
        <input type="text" name="acedimic" required><br><br>
        Requested Branch<br>
        <input type="text" name="branch" value="<%= branch %>" required><br><br>
        <input type="submit" value="Send"><br><br>
    </form>
    </div>
</body>
</html>
<% } %>