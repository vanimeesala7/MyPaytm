<%@ page import="java.util.* ,java.sql.* " %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Account</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="s.css">
</head>
<body>
    <header>
            <a href="logout.html">Logout</a>
              <%
       String name=(String)session.getAttribute("user");
out.print("<nav>"+name+" ");
%> <div  class="fas fa-user"></div></nav>
 
</header>  
<div class="account-container">
     <div class="ccontainer">
   <form>
<%
out.print("<h1>Hi !! "+name+"   Welcome Back</h1>");
%>  
<p>Do you want to perform any tasks !! Here they are....</p>
       <table>
<tr>
       <th> <a href="tomobile.jsp" class="button"><i class="fas fa-mobile-alt"></i>To Mobile Number</a>
  </th><td><a href="toaccount.jsp"  class="button"><i class="fas fa-user"></i>To Account Number</a></td>
</tr><tr>
       <th> <a href="checkbal.jsp" class="button"><i class="fas fa-wallet"></i>Check Balance</a>
  </th>   <td><a href="history.jsp"  class="button"><i class="fas fa-history"></i>Transaction History</a></td>

</tr>
    </div>
</body>
</html>