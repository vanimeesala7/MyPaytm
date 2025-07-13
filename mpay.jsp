<%@ page import="java.util.* ,java.sql.* ,java.lang.*,java.io.* ,java.text.SimpleDateFormat" %>
<html>
<head>
<title>To Mobile</title>
</head>
<body>
<%
String un=(String)session.getAttribute("user");
String toMobile=request.getParameter("mobileno");
String pw=request.getParameter("password");
String am=request.getParameter("amount");
String state;
try{
    Class.forName("oracle.jdbc.driver.OracleDriver");
   Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","manager");
String query="select * from account where username=? and password=? ";
PreparedStatement pst=con.prepareStatement(query);
pst.setString(1,un);
pst.setString(2,pw);
ResultSet rs=pst.executeQuery();
if(rs.next())
{
String sql = "SELECT mobileno,amount FROM account WHERE mobileno = ? OR username = ?";
    pst = con.prepareStatement(sql);
    pst.setDouble(1,Double.parseDouble(toMobile));
    pst.setString(2,un);
   ResultSet resultSet = pst.executeQuery();

    int userBalance = 0;
    int toAccBalance = 0;
    while (resultSet.next()) {
        Double MobileNum = resultSet.getDouble("mobileno");
        int balance = resultSet.getInt("amount");

        if (MobileNum==Double.parseDouble(toMobile)) {
            toAccBalance = balance;
        }
        else
           {
            userBalance = balance;
             }
        }
    int amou=Integer.parseInt(am);
   if (userBalance < amou)
   { 
  state = "Failed";
     }
 else {
       int newUserBalance = userBalance - amou;
       int newToAccBalance = toAccBalance + amou;
         String updateQuery = "UPDATE account SET amount = ? WHERE  username=?";
        pst = con.prepareStatement(updateQuery);
        pst.setInt(1, newUserBalance);
        pst.setString(2, un);
        pst.executeUpdate();
   updateQuery = "UPDATE account SET amount = ? WHERE mobileno= ?";
       pst = con.prepareStatement(updateQuery);
        pst.setInt(1, newToAccBalance);
        pst.setDouble(2, Double.parseDouble(toMobile));
        pst.executeUpdate();
        state = "Success"; 
 }
      java.util.Date currentDate = new java.util.Date();
     SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
    String formattedDate = dateFormat.format(currentDate);
    String insertQuery = "insert into history values(?,?,?,?,?)";
       pst = con.prepareStatement(insertQuery);
        pst.setString(1,un);
        pst.setString(2,toMobile);
        pst.setInt(3,amou);
        pst.setString(4,state);
         pst.setString(5,formattedDate);
        pst.executeUpdate();
       if(state.equals("Success"))
         {
              response.sendRedirect("success.html");
         }
       else
       {
            response.sendRedirect("failure.html");
       }
}
else
{
   response.sendRedirect("tomobile.html");
}
con.close();
}
 catch (Exception ex) { 
    out.println("<h1>"+ex+"</h1>");
} 

%>
</body>
</html>
