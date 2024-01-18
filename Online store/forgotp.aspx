<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="forgotp.aspx.cs" Inherits="project_website.forgotp" %>

<!DOCTYPE html>
<html>
<head>
    <script src="popper.min.js"></script>
<script src="jquery.min.js"></script>
  <title>Forgot Password</title>
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

    .container input[type="text"],
    .container input[type="tel"],
    .container input[type="email"] {
      width: 100%;
      padding: 10px;
      margin-bottom: 15px;
      border: 1px solid #ccc;
      border-radius: 3px;
      box-sizing: border-box;
      font-size: 14px;
    }

    .container button {
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

    	<script>
            $(document).ready(function ()
            {
                $("#btn-fg").click(function ()
            {
                var name = $("#name").val();
                var phone = $("#phone").val();
                var email = $("#email").val();

                if (email != "" && phone != "")
				{
                    $.ajax({
                        url: "forgotp.aspx/checkfpass",
                        type: "POST",
                        data: JSON.stringify({
                            "name": name,
                            "phone": phone,
                             "email": email
						}),
                        dataType: "json",
                        contentType: "application/json",
                        cache: false,
                        async: false,
						success: function (response)
						{
                            if (response.d != "0") {

                                alert("Your password is " + response.d);
                                window.location.href = "create_account.aspx";

                            }
                            else {
                                alert("contact support ");

                            }
                        },
                        error: function (xhr, textStatus, error) {
                            alert("not  responded");
                        }
                    })

				}
				else
				{

					alert("Log in credentials cannot be empty. ");
				}

            });



        });
        </script>

</head>
<body>
  <div class="container">
    <h2>Forgot Password</h2>
    <form>
      <input id="name" type="text" name="name" placeholder="Name" required>
      <input id="phone" type="tel" name="phone" placeholder="Phone" required>
      <input id="email" type="email" name="email" placeholder="Email" required>
      <button id="btn-fg" >Forgot Password</button>
    </form>
  </div>
</body>
</html>

