<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% String id=(String)session.getAttribute("id");
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
<%@page import="java.sql.*"%>
<%@page import="bookbus.Busdo,bus.Buses,java.util.*" %>
<% 
String mail,branch,description,cname;
Connection con=null;
PreparedStatement pst=null;
ResultSet rs=null;
try{
    mail=request.getParameter("mail");
    branch=request.getParameter("branch");
    description=request.getParameter("description");
    cname=request.getParameter("cid");

    out.println(cid+" , "+mail+" , "+branch+" ,  "+description+" , "+cname);

    con=Busdo.getConnection();
    pst=con.prepareStatement("insert into messages values(?,?,?,?,?)");
    pst.setInt(1,cid);
    pst.setString(2,mail);
    pst.setString(3,branch);
    pst.setString(4,description);
    pst.setString(5,cname);
    int rows=pst.executeUpdate();
    if(rows>0){
        out.println("Message Sent Succcessfully");
    }
    else{
        out.println("Message not sent try again");
    }

} catch(Exception e){
    out.println(e);
} %>
</body>
</html>
<% } %>