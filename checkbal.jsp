<%@ page import="java.util.* ,java.sql.* ,java.lang.*,java.io.* " %>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>To Account</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link rel="stylesheet" type="text/css" href="s.css">
</head>
<body>
 <header>
            <a href="myaccount.jsp">Back</a>
              <%
       String un=(String)session.getAttribute("user");
out.print("<nav>"+un+" ");
%> <div  class="fas fa-user"></div></nav>
 </header>
    <div class="account-container">
        <div class="hcontainer">
<%
try{
    Class.forName("oracle.jdbc.driver.OracleDriver");
   Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","manager");
String query="select amount from account where username=?";
PreparedStatement pst=con.prepareStatement(query);
pst.setString(1,un);
ResultSet rs=pst.executeQuery();
if(rs.next())
{
    out.println("<h1>Hey ! "+un+",    your Account balance is  </h1>");
    out.println("<h2>Amount:  "+rs.getInt(1)+"/-      </h2>");
}
con.close();
}
 catch (Exception ex) { 
    out.println("<h1>"+ex+"</h1>");
} 

%>
</div>
</div>
</body>
</html>