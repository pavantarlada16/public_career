<%
    // Invalidate the session
    if (session != null) {
        session.invalidate();
    }
    // Redirect to login page
    response.sendRedirect("login.html");
%>