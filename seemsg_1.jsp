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
    <div>
        <h2 align="center">Messages Sent</h2>
        <table width="700px" align="center">
            <tr style="color:#f4511e; font-size: 18px;">
                <th>College ID</th>
                <th>College Name</th>
                <th>Student ID</th>
                <th>Branch</th>
                <th>Description</th>
                <th>Action</th>
            </tr>
<%@page import="java.sql.*"%>
<%@page import="bookbus.Busdo,bus.Buses,java.util.*" %>
<% 
Connection con=null;
PreparedStatement pst=null;
ResultSet rs=null;
try{

    //out.println(cid+" , "+mail+" , "+branch+" ,  "+description+" , "+cname);

    con=Busdo.getConnection();
    pst=con.prepareStatement("select * from messages where cid=?");
    pst.setInt(1,cid);
    rs=pst.executeQuery();
    if(rs.next()){
        do{ %>
            <tr>
                <td>&nbsp;<%= rs.getInt(1) %>&nbsp;</td>
                <td>&nbsp;<%= rs.getString(5) %>&nbsp;</td>
                <td>&nbsp;<%= rs.getString(2) %>&nbsp;</td>
                <td>&nbsp;<%= rs.getString(3) %>&nbsp;</td>
                <td>&nbsp;<%= rs.getString(4) %>&nbsp;</td>
                <td>&nbsp;<a href="deletemsg.jsp">Delete Message</a></td>
            </tr>
        <%} while(rs.next());
    } else {
        out.println("No messages sent by "+id);
    }

} catch(Exception e){
    out.println(e);
} %>
</table>
</div>
</body>
</html>
<% } %>