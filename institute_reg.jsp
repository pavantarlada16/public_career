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
String CNAME,CPASSWORD,CADDRESS,CPERSON,CPHONE,CEMAIL,CDESC;
int CID,CESTB;
%>
<%
try {
    CID=Integer.parseInt(request.getParameter("cid"));
    CNAME=request.getParameter("cname");
    CPASSWORD=request.getParameter("cpwd");
    CADDRESS=request.getParameter("caddress");
    CESTB=Integer.parseInt(request.getParameter("estb"));
    CPERSON=request.getParameter("person");
    CPHONE=request.getParameter("cphone");
    CEMAIL=request.getParameter("cmail");
    CDESC=request.getParameter("description");

    Connection conn = Busdo.getConnection();
    PreparedStatement pst = conn.prepareStatement("insert into institute_register values(?, ?, ?, ?, ?, ?, ?, ?,?)");
    pst.setInt(1,CID);
    pst.setString(2,CNAME);
    pst.setString(3,CPASSWORD);
    pst.setString(4,CADDRESS);
    pst.setInt(5,CESTB);
    pst.setString(6,CPERSON);
    pst.setString(7,CPHONE);
    pst.setString(8,CDESC);
    pst.setString(9,CEMAIL);
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
