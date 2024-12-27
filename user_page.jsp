<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.net.URLEncoder" %>
<% String id=(String)session.getAttribute("id");
String name=(String)session.getAttribute("name"); 
 %>
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
                <li><a href="user_page.jsp?id=<%= id %>">Home</a></li>
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
    <%
    if(id==null){
        response.sendRedirect("error_page.jsp");
    } else {
        %>
        <div align="center">Welcome <%= name %></div>
        <%
    }
    %>
</body>
</html>