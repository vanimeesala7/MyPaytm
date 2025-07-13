<%@ page import="java.sql.*,java.util.*,java.io.* ,java.lang.* " %>
<html>
<head>
<title>My Home</title>
    <link rel="stylesheet" type="text/css" href="s.css">
</head>
<body>
  <header>
       <a href="home.html">home</a>
        <a href="login.html">Login</a>
    </header>
<div class="account-container">
<div class="ccontainer">
<%
String accno=request.getParameter("accountno");
String usn=request.getParameter("username");
String mobno=request.getParameter("mobileno");
String pwd=request.getParameter("password");
String amou=request.getParameter("amount");
try{
    Class.forName("oracle.jdbc.driver.OracleDriver");
   Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","manager");
 String query=" insert into account values(?,?,?,?,?) ";
PreparedStatement pst=con.prepareStatement(query);
pst.setString(1,accno); 
pst.setString(2,usn);
pst.setDouble(3,Double.parseDouble(mobno));
pst.setString(4,pwd);
pst.setInt(5,Integer.parseInt(amou));
pst.executeUpdate();
out.println("<h1>Account created Successfully</h1>");
out.println("<h2>Now Login into your Account</h2>");
out.println("");
con.close();
}
catch(Exception ex)
{
out.println("<h1>"+ex+"</h1>");
}
%>
<a href="login.html" class="button">Login Now</a>
</div>
</div>
</body>
</html>