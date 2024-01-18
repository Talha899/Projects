<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login_page.aspx.cs" Inherits="project_website.login_page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<script src="jquery-3.6.4.min.js"></script>
<script src="bootstrap.bundle.min.js"></script>
<link href="bootstrap.min.css" rel="stylesheet" />
<script src="popper.min.js"></script>
<script src="jquery.min.js"></script>
    <title></title>

	<script>
        $(document).ready(function () {
          

			$("#btn-sign").click(function ()
			{
                var email = $("#eemail").val();
				var password = $("#ppassword").val();


				if (email != "" && password != "")
				{
                    $.ajax({
                        url: "login_page.aspx/checklogin",
                        type: "POST",
						data: JSON.stringify({
                            "email": email,
                            "password": password
						}),
                        dataType: "json",
                        contentType: "application/json",
                        cache: false,
                        async: false,
						success: function (response)
						{
							if (response.d != "")
							{
								alert("hello");
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
<link rel="stylesheet" href="login.css">
<link rel="stylesheet" href="login.js">
<div class="container" id="container">
	<div class="form-container sign-up-container">
		<form action="#">
			<h1>Create Account</h1>
			<div class="social-container">
				<a href="https://accounts.google.com/v3/signin/identifier?dsh=S-1559287636%3A1681570627537987&ifkv=AQMjQ7T131MHarg81uC51u4Y8_RvN5ZdW6haK4h1-hakK994IHNdo-EtHAziw6CQIIzwsYG41SQN0A&flowName=GlifWebSignIn&flowEntry=ServiceLogin" class="social"><i class="fab fa-facebook-f"></i></a>
				<a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
				<a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
			</div>
			<span>or use your email for registration</span>
				<input type="text" placeholder="Name" />
                <input type="email" placeholder="Email" />
                <input type="password" placeholder="Password" />
                 <input type="address" placeholder="address" />
			<button>Sign Up</button>
		</form>
	</div>
	<div class="form-container sign-in-container">
		<form action="#">
			<h1>Sign in</h1>
			<div class="social-container">
				<a href="#" class="social"><i class="https://www.facebook.com/login.php"></i></a>
				<a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
				<a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
			</div>
			<span>or use your account</span>
			<input id="eemail" type="email" placeholder="Email" />
			<input id="ppassword"  type="password" placeholder="Password" />
			<a href="#">Forgot your password?</a>
			<button id="btn-sign">Sign In</button>
		</form>
	</div>
	<div class="overlay-container">
		<div class="overlay">
			<div class="overlay-panel overlay-left">
				<h1>Welcome Back!</h1>
				<p>To keep connected with us please login with your personal info</p>
				<button class="ghost" id="signIn">Sign In</button>
			</div>
			<div class="overlay-panel overlay-right">
				<h1>Hello, Happy Customer!</h1>
				<p>Enter your personal details and start journey with us</p>
				<button class="ghost" id="signUp">Sign Up</button>
			</div>
		</div>
	</div>
</div>

</body>
</html>
