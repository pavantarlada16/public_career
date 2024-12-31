<%@page import="java.sql.*"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="bookbus.Busdo"%>
<%@page import="java.util.*"%>
<% int id=Integer.parseInt(request.getParameter("cid")); %>
<% String name=(String)session.getAttribute("name");
String fname,date,mail,city,ten,inter,acedimic,branch;
PreparedStatement pst=null;
ResultSet rs=null;
Connection con=null;
fname=request.getParameter("sname");
date=request.getParameter("date");
mail=request.getParameter("umail");
city=request.getParameter("city");
ten=request.getParameter("ten");
inter=request.getParameter("inter");
acedimic=request.getParameter("acedimic");
branch=request.getParameter("branch");
if(name==null){
    response.sendRedirect("error_page.jsp");
} else {
    try{
        out.println(id+" , "+fname+" , "+date+" , "+mail+" , "+city+" , "+ten+" , "+inter+" , "+acedimic);
        con=Busdo.getConnection();
        pst=con.prepareStatement("INSERT INTO request_user VALUES(?, ?, ?, ?, ?, ? ,?, ?, ?)");
        pst.setInt(1, id);
        pst.setString(2, fname);
        pst.setDate(3, java.sql.Date.valueOf(date));
        pst.setString(4, mail);
        pst.setString(5, city);
        pst.setString(6, ten);
        pst.setString(7, inter);
        pst.setString(8, acedimic);
        pst.setString(9, branch);
        int rows=pst.executeUpdate();
        if(rows>0){
            response.sendRedirect("courses.jsp");
        } else {
            response.sendRedirect("intrest.jsp");
        }
    }
    catch(Exception e){
        out.println(e);
    }
} %>