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
                <li><a href="admin_institute.html">Add Institute</a></li>
                <li><a href="view_institute.jsp">View Institutes</a></li>
                <li><a href="view_students.jsp">View Users</a></li>
            </ul>
        </div>
        <div class="rightitem">
            <ul class="list2">
                <li><a href="index.html">Logout</a></li>
            </ul>
        </div>
    </div>
    <br><br>
    <div>-------------------------</div>
    <div>
        <h3>Students Details</h3>
        <table width="700px" align="center">
            <tr style="color:#f4511e; font-size: 18px;">
                <td>Student ID</td>
                <td>Student Name</td>
                <td>Student Contact</td>
                <td>Student Address</td>
                <td>Gender</td>
            </tr>
<%@page import="java.sql.*"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="bookbus.Busdo"%>
<%@page import="java.util.*"%>
<%
try{
    PreparedStatement pst = null;
    Connection con = null;
    ResultSet rs = null;

    con = Busdo.getConnection();
    pst=con.prepareStatement("select * from user_register", ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
    rs=pst.executeQuery();

if(rs.next()){

            do{
                %>
                <tr>
                    <td>&nbsp;<%=rs.getInt(1)%>&nbsp;</td>
                    <td>&nbsp;<%=rs.getString(2)%>&nbsp;</td>
                    <td>&nbsp;<%=rs.getLong(7)%>&nbsp;</td>
                    <td>&nbsp;<%=rs.getString(6)%>&nbsp;</td>
                    <td>&nbsp;<%=rs.getString(5)%>&nbsp;</td>
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
            
            %>
        </table>
    </div>
</body>
</html>