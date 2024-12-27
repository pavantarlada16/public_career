<%@page import="java.sql.*"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="bookbus.Busdo"%>
<%@page import="java.util.*"%>

<%!
    String gname, gpassword, gatype;
%>

<%
    try {
        // Retrieve form parameters
        gname = request.getParameter("uname");
        gpassword = request.getParameter("upassword");
        gatype = request.getParameter("atype");

        // Initialize resources
        PreparedStatement pst = null;
        ResultSet rs = null;
        Connection con = null;

        // Debug output (can be removed in production)
        // out.println("Username: " + gname + " Password: " + gpassword + " Account Type: " + gatype);

        // Establish database connection
        try {
            
            con = Busdo.getConnection();
              // Initialize session

            // Check account type and handle login accordingly
            if ("Admin".equals(gatype)) {
                // Check Admin credentials
                if ("Admin".equals(gname) && "Admin@123".equals(gpassword)) {
                    session.setAttribute("userRole", "Admin");
                    response.sendRedirect("adminpage.html");
                } else {
                    request.setAttribute("errorMessage", "Invalid Username or Password");
                    request.getRequestDispatcher("login.html").forward(request, response);
                }
            } else if ("Institute".equals(gatype)) {
                // Handle Institute login
                pst = con.prepareStatement("SELECT email, cpassword, cname, cid FROM institute_register WHERE email=? AND cpassword=?");
                pst.setString(1, gname);
                pst.setString(2, gpassword);
                rs = pst.executeQuery();

                if (rs.next()) {
                    String name=rs.getString(3);
                    int id=rs.getInt(4);
                    session.setAttribute("cid", id);
                    session.setAttribute("name", name);
                    session.setAttribute("id", gname);
                    response.sendRedirect("institute_page.jsp");
                } else {
                    request.setAttribute("errorMessage", "Invalid Username or Password");
                    request.getRequestDispatcher("login.html").forward(request, response);
                }
            } else if ("Student".equals(gatype)) {
                // Handle Student login
                pst = con.prepareStatement("SELECT mail, password, fullname FROM user_register WHERE mail = ? AND password = ?");
                pst.setString(1, gname);
                pst.setString(2, gpassword);
                rs = pst.executeQuery();

                if (rs.next()) {
                    String name=rs.getString(3);
                    session.setAttribute("name", name);
                    session.setAttribute("id", gname);
                    response.sendRedirect("user_page.jsp");
                } else {
                    request.setAttribute("errorMessage", "Invalid Username or Password");
                    request.getRequestDispatcher("login.html").forward(request, response);
                }
            } else {
                // Invalid account type
                request.setAttribute("errorMessage", "Invalid Account Type");
                request.getRequestDispatcher("login.html").forward(request, response);
            }
        } finally {
            // Close resources in finally block to avoid resource leak
            if (rs != null) rs.close();
            if (pst != null) pst.close();
            if (con != null) con.close();
        }
    } catch (Exception e) {
        // Handle exceptions, log the error, and send a user-friendly error message
        e.printStackTrace();
        response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An internal error occurred.");
    }
%>
