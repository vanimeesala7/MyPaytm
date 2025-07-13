<%@ page import="java.util.*,java.sql.*,java.lang.*,javax.servlet.*,javax.servlet.http.*" %>
<html>
<head>
<title>Logout Form</title>
</head>
<body>
<%
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("user")) {
                cookie.setMaxAge(0);
                response.addCookie(cookie);
                break;
            }
        }
    response.sendRedirect("logout.html");
}
%>
</body>
</html>