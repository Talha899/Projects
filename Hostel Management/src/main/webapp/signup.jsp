<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Sign Up Page</title>
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
  
  <style>
    body {
      background-color: black;
    }
    .signup-container {
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
  </style>
</head>
<body>
<input type="hidden" id="status" value="<%= request.getAttribute("status") %>">
  <div class="container">
    <div class="signup-container">
      <h2 class="text-center">Sign Up</h2>
      <form  method="post" action="signup" id="loginnForm">
        <div class="form-group">
          <label for="name">Name:</label>
          <input type="text" class="form-control" id="username" name="name" placeholder="Enter name" required>
        </div>
        <div class="form-group">
          <label for="email">Email:</label>
          <input type="email" class="form-control" id="email" name="email" placeholder="Enter email" required>
        </div>
        
        <div class="form-group">
          <label for="age">Age:</label>
          <input type="text" class="form-control" id="age" name="age" placeholder="Enter age" required>
        </div>
        <div class="form-group">
          <label for="cnic">CNIC:</label>
          <input type="text" class="form-control" id="cnic" name="cnic" placeholder="Enter cnic" required>
        </div>
        <div class="form-group">
          <label for="gender">Gender:</label>
          <input type="text" class="form-control" id="gender" name="gender" placeholder="Enter gender" required>
        </div>
        <div class="form-group">
          <label for="userType">User Type:</label>
          <select class="form-control" id="userType" name="userType">
            <option value="student">Student</option>
            <option value="parent">Parent</option>
            <option value="manager">Manager</option>
          </select>
        </div>
        <div class="form-group">
          <label for="password">Password:</label>
          <input type="password" class="form-control" id="password" name="password" placeholder="Enter password" required>
        </div>
        <div class="form-group">
          <label for="confirmpassword">Confirm Password:</label>
          <input type="password" class="form-control" id="confirmpassword" name="confirmpassword" placeholder="Confirm password" required>
        </div>


        
        <button type="submit" class="btn btn-primary btn-block" >Sign Up</button>
        <div class="text-center mt-3">
          <p>Already have an account? <a href="login.jsp">Login</a></p>
        </div>
      </form>
    </div>
  </div>
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  <link rel="stylesheet" href="alert/dist/sweetalert.css">
  
  <script type="text/javascript">
  var status=document.getElementById("status").value;
  if(status=="success")
  {
  swal("Congrats","Account Created Successfully!!","success");
  }
  
  if(status=="invalidEmail")
  {
  swal("Sorry","Please Enter Email","error");
  }
  
  if(status=="invalidPassword")
  {
  swal("Sorry","Please Enter Password","error");
  }
  
  if(status=="invalidName")
  {
  swal("Sorry","Please Enter Name","error");
  }
  
  if(status=="invalidAge")
  {
  swal("Sorry","Please Enter Age","error");
  }
  
  if(status=="invalidCnic")
  {
  swal("Sorry","Please Enter CNIC","error");
  }
  
  if(status=="invalidCnicLength")
  {
  swal("Sorry","CNIC too long","error");
  }
  
  if(status=="invalidGender")
  {
  swal("Sorry","Please Enter Gender","error");
  }
  
  if(status=="invalidType")
  {
  swal("Sorry","Please Enter Type","error");
  }
  
  if(status=="invalidCopass")
  {
  swal("Sorry","Passwords do not match","error");
  }
  
  if(status=="invalidPassLength")
  {
  swal("Sorry","Password too short","error");
  }
  
  
  
  
  </script>
  
</body>
</html>
