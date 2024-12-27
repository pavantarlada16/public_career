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
        <h3 align="center">Student(s) Details</h3>
        <table width="700px" align="center">
            <tr style="color:#f4511e; font-size: 18px;">
                <td>Student Name</td>
                <td>Student Email</td>
                <td>City</td>
                <td>Action</td>
            </tr>
<%@page import="java.sql.*"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="bookbus.Busdo"%>
<%@page import="java.util.*"%>
<%
int cid=(Integer)session.getAttribute("cid");
String id=(String)session.getAttribute("id");
if(id==null){
    response.sendRedirect("error_page.jsp");
} else {
try{
    PreparedStatement pst = null;
    Connection con = null;
    ResultSet rs = null;

    con = Busdo.getConnection();
    pst=con.prepareStatement("select * from request_user where collegeid=?", ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
    pst.setInt(1,cid);
    rs=pst.executeQuery();

if(rs.next()){

            do{
                %>
                <tr>
                    <td>&nbsp;<%=rs.getString(2)%>&nbsp;</td>
                    <td>&nbsp;<%=rs.getString(4)%>&nbsp;</td>
                    <td>&nbsp;<%=rs.getString(5)%>&nbsp;</td>
                    <td><a href="sendmsg.jsp?mail=<%=rs.getString(4)%>&branch=<%=rs.getString(9)%>">Send Message</a></td>
                </tr>
                <%
            }while(rs.next());

        }
        else{
            out.println("empty");
        }
    }
    catch(Exception e){
        out.println(e);
    }
            
}%>
        </table>
    </div>
</body>
</html>