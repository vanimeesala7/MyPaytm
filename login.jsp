<%@ page import="java.util.*,java.sql.*,java.lang.*,javax.servlet.*,javax.servlet.http.*" %>
<html>
<head>
<title>Login Form</title>
</head>
<body>
<%
String un = request.getParameter("username");
String pw = request.getParameter("pwd");
try {
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "manager");
    String query = "select * from account where username=? and password=?";
    PreparedStatement pst = con.prepareStatement(query);
    pst.setString(1, un);
    pst.setString(2, pw);
    ResultSet rs = pst.executeQuery();
    if (rs.next()) {
        String acc = rs.getString(1);
      String mobn = String.valueOf(rs.getString(3));
        session.setAttribute("user", un);
        session.setAttribute("UsAcc", acc);
      session.setAttribute("UsMob", mobn);
        Cookie loginCookie = new Cookie("user", un);
        loginCookie.setMaxAge(30 * 60);
        response.addCookie(loginCookie);
        response.sendRedirect("myaccount.jsp");
    } else {
        response.sendRedirect("creation.html");
    }
    con.close();
} catch (Exception ex) {
    out.println("<h1>" + ex + "</h1>");
}
%>
</body>
</html>
