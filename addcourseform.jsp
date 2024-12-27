<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% String id=(String)session.getAttribute("id");
String cname=(String)session.getAttribute("name");
int cid=(Integer)session.getAttribute("cid");
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
        <form action="addcourse.jsp" method="post">
            <h1>Add Course</h1>
            <label>College ID</label><br>
            <input type="text" name="cid" id="cid" required value="<%= cid %>" readonly>
            <input type="text" name="clgname" id="clgname" required value="<%= cname %>" readonly hidden>
            <br><br>
            <label>Course Name</label><br>
            <input type="text" name="course" id="course" required>
            <br><br>
            <label>Department</label><br>
            <input type="text" name="dept" id="dept" required>
            <br><br>
            <label>Course Duration(in months)</label><br>
            <input type="number" name="duration" id="duration" required>
            <br><br>
            <label>Fees</label><br>
            <input type="text" name="fee" id="fee" required>
            <br><br>
            <label>Affiliated From</label><br>
            <input type="text" name="affiliate" id="affiliate" required>
            <br><br>
            <label>Placements</label><br>
            <input type="text" name="place" id="place" required>
            <br><br>
            <input type="submit" name="submit">
            </form>
    
            
        </div>
</body>
</html>
<% } %>