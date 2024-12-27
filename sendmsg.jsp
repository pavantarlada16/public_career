<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% String id=(String)session.getAttribute("id");
String mail=request.getParameter("mail");
String branch=request.getParameter("branch");
String cname=(String)session.getAttribute("name");
if(id==null){
    response.sendRedirect("error_page.jsp");
} else {
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
                <li><a href="addcourseform.jsp">Add Course</a></li>
                <li><a href="Students_list.jsp">View Students</a></li>
                <li><a href="seemsg_1.jsp">See Sent Message</a></li>
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
    <div class="form4">
        <form action="addmsg.jsp" method="post">
            <h1>Message</h1>
            <label>College ID</label><br>
            <input type="text" name="cid" id="cid" required value="<%= cname %>" readonly>
            <br><br>
            <label>Student ID</label><br>
            <input type="text" name="mail" id="mail" required value="<%= mail %>" readonly>
            <br><br>
            <label>Branch</label><br>
            <input type="text" name="branch" id="branch" required value="<%= branch %>" readonly>
            <br><br>
            <label>Description</label><br>
            <textarea name="description" required></textarea>
            <br><br>
            <input type="submit" name="submit" value="Send">
            <br><br>
            </form>
        </div>
</body>
</html>
<% } %>