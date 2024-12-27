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
                <li><a href="index.html">Home</a></li>
                <li><a href="">About Us</a></li>
                <li><a href="">Contact Us</a></li>
                <li><a href="">Help</a></li>
            </ul>
        </div>
        <div class="rightitem">
            <ul class="list2">
                <li><a href="index.html">Registration</a></li>
                <li><a href="login.html">Login</a></li>
            </ul>
        </div>
    </div>
<br><br>
<%@page import="java.sql.*"%>
<%@page import="bookbus.Busdo,bus.Buses,java.util.*" %>
<%!
String GNAME,GPASSWORD,GGENDER,GADDRESS,GEMAIL,GTELEPHONE;
int GAGE,GID;
%>
<%
try {
    GID=Integer.parseInt(request.getParameter("rid"));
    GNAME=request.getParameter("fname");
    GPASSWORD=request.getParameter("pwd");
    GAGE=Integer.parseInt(request.getParameter("age"));
    GGENDER=request.getParameter("gender");
    GADDRESS=request.getParameter("address");
    GTELEPHONE=request.getParameter("phone");
    GEMAIL=request.getParameter("mail");

    Connection conn = Busdo.getConnection();
    PreparedStatement pst = conn.prepareStatement("insert into user_register values(?, ?, ?, ?, ?, ?, ?, ?)");
    pst.setInt(1,GID);
    pst.setString(2,GNAME);
    pst.setString(3,GPASSWORD);
    pst.setInt(4,GAGE);
    pst.setString(5,GGENDER);
    pst.setString(6,GADDRESS);
    pst.setString(7,GTELEPHONE);
    pst.setString(8,GEMAIL);
    int rows=pst.executeUpdate();
    if(rows>0){
        out.println("Registration Succcessful");
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
