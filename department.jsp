<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="java.sql.*"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="bookbus.Busdo"%>
<%@page import="java.util.*"%>
<% String id=request.getParameter("id"); %>
<% String name=(String)session.getAttribute("name"); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Department</title>
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
    <h2 align="center">Department: <%= id %></h2>
    <div class="container">
    <%
    if(name==null){
        response.sendRedirect("error_page.jsp");
    } else {
try{
    Connection con=Busdo.getConnection();
    PreparedStatement pst=null;
    ResultSet rs=null;
    pst=con.prepareStatement("select * from courses where department=?");
    pst.setString(1,id);
    rs=pst.executeQuery();
    
    if(rs.next()){
        do{
            %>
            <div class="card">
                <h3 style="text-align: center;">College Name : &nbsp;<%=rs.getString(8)%></h3>
                <label>Course Name : </label>&nbsp;<%=rs.getString(2)%><br>
                <label>Department : </label>&nbsp;<%=rs.getString(3)%><br>
                <label>Affiliated from : </label>&nbsp;<%=rs.getString(4)%><br>
                <label>Placements : </label>&nbsp;<%=rs.getString(5)%><br>
                <label>Duration : </label>&nbsp;<%=rs.getString(6)%> Months<br>
                <label>Course Fee : </label>&nbsp;<%=rs.getString(7)%><br>
                <label><a style="float: right;" href="intrest.jsp?cid=<%= rs.getInt(1) %>&branch=<%=rs.getString(2)%>">Intrested</a></label>
            </div>
            <%
        } while(rs.next());
    } else{
        out.println("<h2 align='center'>Empty Set</h2>");
    }
} catch(Exception e){
    out.println(e);
}
    }
    %>
</div>
</body>
</html>