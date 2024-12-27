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
                <li><a href="addcourse.html">Add Course</a></li>
                <li><a href="Students_list.jsp">View Students</a></li>
                <li><a href="seemsg_1.jsp">See Sent Message</a></li>
                <li><a href="">Help</a></li>
            </ul>
        </div>
        <div class="rightitem">
            <ul class="list2">
                <li><a href="index.html">Logout</a></li>
            </ul>
        </div>
    </div>
    <br><br>
<%@page import="java.sql.*"%>
<%@page import="bookbus.Busdo,bus.Buses,java.util.*" %>
<%!
String cname,dept,affiliate,place,clgname;
int cid,cdur,cfees;
%>
<%
try{
    cid=Integer.parseInt(request.getParameter("cid"));
    cname=request.getParameter("course");
    dept=request.getParameter("dept");
    affiliate=request.getParameter("affiliate");
    place=request.getParameter("place");
    cdur=Integer.parseInt(request.getParameter("duration"));
    cfees=Integer.parseInt(request.getParameter("fee"));
    clgname=request.getParameter("clgname");

    Connection conn = Busdo.getConnection();
PreparedStatement pst = conn.prepareStatement("insert into courses values(?,?,?,?,?,?,?,?)");
pst.setInt(1,cid);
pst.setString(2,cname);
pst.setString(3,dept);
pst.setString(4,affiliate);
pst.setString(5,place);
pst.setInt(6,cdur);
pst.setInt(7,cfees);
pst.setString(8,clgname);
int rows=pst.executeUpdate();
if(rows>0){
    out.println("Course added Succcessfully  <a href='addcourse.html'>Add another course</a>");
}
else {
    out.println("Registration UnSucccessful");
}
}
catch(Exception e)
    {
        out.println("Error:"+e);
    }

%>
</body>
</html>