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
<input type="hidden" id="status" value="<%= request.getAttribute("status") %>">
  <div class="container">
    <header class="head">Welcome to Fast Hostel Management System</header>
    <div class="login-container">
      
      <h2 class="text-center">Login</h2>
      <form id="loginForm" action="login" method="post">
        <div class="form-group">
          <label for="email">Email:</label>
          <input type="email" class="form-control" id="email" name="email" placeholder="Enter email" required>
        </div>
        <div class="form-group">
          <label for="password">Password:</label>
          <input type="password" class="form-control" id="password" name="password" placeholder="Enter password" required>
        </div>
        <button type="submit" class="btn btn-primary btn-block" ">Login</button>
        <div class="text-center mt-3">
          <p>Don't have an account? <a href="signup.jsp">Create Account</a></p>
        </div>
      </form>
    </div>
  </div>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  <link rel="stylesheet" href="alert/dist/sweetalert.css">
  
  <script type="text/javascript">
  var status=document.getElementById("status").value;
  if(status=="failed")
	  {
	  swal("Sorry","Wrong Email or Password entered","error");
	  }
  if(status=="invalidEmail")
  {
  swal("Sorry","Please Enter Email","error");
  }
  if(status=="invalidPassword")
  {
  swal("Sorry","Please Enter Password","error");
  }
  </script>
  
</body>
</html>
