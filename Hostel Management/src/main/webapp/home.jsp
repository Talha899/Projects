<% 
if(session.getAttribute("name")==null)
{
	response.sendRedirect("login.jsp");
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Login Page</title>
  
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      background-color: black;
    }
    .login-container {
      max-width: 400px;
      margin: auto;
      padding: 40px;
      margin-top: 100px;
      background-color: lightblue;
      border-radius: 30px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    .form-group {
      margin-bottom: 20px;
    }
    .form-control {
      border-radius: 10px; 
    }
    .head{
      color: aqua;
      font-size: 50px;
      text-align: center;
    }
  </style>
</head>
<body>
  <div class="container">
    <header class="head">Logout</header>
    <div class="login-container">
      
      <h2 class="text-center">Home</h2>
      <form id="logoutForm" action="/login" method="post">
        <button type="submit" class="btn btn-primary btn-block" onclick="logout()">Logout</button>
      </form>
    </div>
  </div>

  <script>
    function logout() {
      document.getElementById("logoutForm").action = "/login.jsp";
    }
  </script>
</body>
</html>
