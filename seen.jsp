<%@page import="java.sql.*"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="bookbus.Busdo"%>
<%@page import="java.util.*"%>
<% String name=(String)session.getAttribute("name");
String action=request.getParameter("act");
int id=Integer.parseInt(request.getParameter("msgid"));
PreparedStatement pst=null;
ResultSet rs=null;
Connection con=null;

if(name==null){
    response.sendRedirect("error_page.jsp");
} else {
    try{
        if(action.equals("yes")){
            response.sendRedirect("courses.jsp");
        } else {
        out.println(name+" "+action+" "+id);
        con=Busdo.getConnection();
        pst=con.prepareStatement("update messages set seen=? where msgid=?");
        pst.setString(1, "yes");
        pst.setInt(2,id);
        int rows=pst.executeUpdate();
        if(rows>0){
            response.sendRedirect("seemsg_2.jsp");
        } else {
            response.sendRedirect("ERROR!");
        }
    }
    }
    catch(Exception e){
        out.println(e);
    }
} %>