<%@ page import="java.util.* ,java.sql.* ,java.lang.* ,java.io.* " %>
<html>
<head>
<title>Admin Form</title>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
      background-image: url('https://img.freepik.com/free-vector/digital-money-erupi-symbol-background-banking-market_1017-49425.jpg?size=626&ext=jpg&ga=GA1.1.1224184972.1711670400&semt=ais');
            background-size: cover;
            margin: 0;
            padding: 0;
        }
        header {
            background-color: #333;
            color: white;
            padding: 10px 0;
        }
header a {
            background-color: #333;
            color: white;
            text-align: left;
        } 
header nav {
         text-align: right;
        }
        .account-container {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
            text-align: left;
        }
        th {
            background-color: #333;
            color: #fff;
        }
        tr:hover {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <header class="header">
        <a href="logout.jsp">Logout</a>
      <nav> 
          <div class="w3-container">
             <div class="w3-padding w3-xlarge w3-teal">
                       <i class="fa fa-person"></i>
                 </div>
               </div>
              <% String un=request.getParameter("username");
String pw=request.getParameter("pwd");
out.print(un); %></nav>
    </header>
    <div class="account-container">
        <div class="hcontainer">
<%
if(un.equals("admin") && pw.equals("admin"))
{
try{
    Class.forName("oracle.jdbc.driver.OracleDriver");
   Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","manager");
String query="select accountno,username from account" ;
PreparedStatement pst=con.prepareStatement(query);
ResultSet rs=pst.executeQuery();
if(rs.next()) {
                        out.println("<h2>All Accounts & its Transactions</h2>");
                        out.print("<table>");
                        out.print("<tr><th>AcountNumber</th><th>UserName</th></tr>");
                        do {
                            out.print("<tr>");
                            out.print("<td>"+rs.getString(1)+"</td>");
                            out.print("<td>"+rs.getString(2)+"</td>");
                       
                            out.print("</tr>");
                        } while(rs.next());
                        out.print("</table>");
String sql="select * from history" ;
PreparedStatement pt=con.prepareStatement(sql);
ResultSet res=pt.executeQuery();
if(res.next()) {

                        out.print("<table>");
                        out.print("<tr><th>From</th><th>To</th><th>Amount</th><th>Status</th><th>Date</th></tr>");
                        do {
                            out.print("<tr>");
                            out.print("<td>"+res.getString(1)+"</td>");
                            out.print("<td>"+res.getString(2)+"</td>");
                            out.print("<td>"+res.getInt(3)+"</td>");
                            out.print("<td>"+res.getString(4)+"</td>");
                            out.print("<td>"+res.getString(5)+"</td>");
                            out.print("</tr>");
                        } while(res.next());
                        out.print("</table>");
       } 
}
else {
                        out.println("<h3>No records</h3>");
                    }
con.close();
}
catch(Exception ex)
{
out.println("<h1>"+ex+"</h1>");
}
}
else
{  
  response.sendRedirect("admin.html");
}
%>
</div>
</body>
</html>
