<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="passwordp.aspx.cs" Inherits="project_website.passwordp" %>

<!DOCTYPE html>
<html>
<head>
  <title>Your Password</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f2f2f2;
      margin: 0;
      padding: 0;
    }

    .container {
      width: 400px;
      margin: 100px auto;
      background-color: #fff;
      padding: 30px;
      border-radius: 5px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
    }

    .container h2 {
      text-align: center;
      margin-bottom: 30px;
      color: #555;
    }

    .container p {
      font-size: 16px;
      line-height: 1.5;
      text-align: center;
      margin-bottom: 30px;
    }

    .container button {
      display: block;
      width: 100%;
      padding: 12px;
      background-color: #4CAF50;
      border: none;
      color: #fff;
      font-weight: bold;
      cursor: pointer;
      border-radius: 3px;
      font-size: 14px;
      transition: background-color 0.3s ease;
    }

    .container button:hover {
      background-color: #45a049;
    }
  </style>
</head>
<body>
  <div class="container">
    <h2>Your Password</h2>
    <p>Your password is: <strong>********</strong></p>
    <button onclick="goToHome()">Return Home</button>
  </div>

  <script>
    function goToHome() {
      window.location.href = "home.aspx"; // Replace with the actual home page URL
    }
  </script>
</body>
</html>
