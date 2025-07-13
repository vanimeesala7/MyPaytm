<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment</title>
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link rel="stylesheet" type="text/css" href="s.css">
</head>
<body>
   <header>
            <a href="myaccount.jsp">Back</a>
              <%
       String name=(String)session.getAttribute("user");
out.print(" <nav>"+name+" ");
%> <div  class="fas fa-user"></div></nav>
</header> 
    <div class="account-container">
        <form action="accpay.jsp" method="post">
               <div class="ccontainer">
<h1>Payment to Account Number</h1>
            Account No:  <input type="text" name="accountno" placeholder="Enter Account Number" required><br>
            Password:   <input type="password" name="password" placeholder="Enter Password" required><br>
            Amount:     <input type="number" name="amount" placeholder="Amount to Pay" required><br>
            <input type="submit" value="Pay">
              <a href="myaccount.jsp" class="button">Back</a> 
           </div>
        </form>
    </div>
</body>
</html>
