<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="create_account.aspx.cs" Inherits="project_website.create_account" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <script src="popper.min.js"></script>
<script src="jquery.min.js"></script>
    <title></title>

	<script>
        $(document).ready(function () {

            var issession = $("#sessionAvailable").val();
            if (issession == "true") {
                window.location.href ="confirm_cart.aspx";

            }
            $("#btn-sign").click(function ()
			{

                var email = $("#eemail").val();
				var password = $("#ppassword").val();


				if (email != "" && password != "")
				{
                    $.ajax({
                        url: "create_account.aspx/checklogin",
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
                            if (response.d == "1") {

                                window.location.reload();
                                window.location.reload();

                            }
                            else {
                                alert("Try forgot password ");

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


            $("#btn-signup").click(function () {

                var name2 = $("#name1").val();
                var phone2 = $("#phone1").val();
                var email2 = $("#email1").val();
                var password2 = $("#password1").val();
                var address2 = $("#address1").val();


                if (email2 != "" && password2 != "") {
                    $.ajax({
                        url: "create_account.aspx/checkcreateaccount",
                        type: "POST",
                        data: JSON.stringify({
                            "name1": name2,
                            "phone1": phone2,
                            "email1": email2,
                            "password1": password2,
                            "address1": address2
                        }),
                        dataType: "json",
                        contentType: "application/json",
                        cache: false,
                        async: false,
                        success: function (response) {
                            if (response.d == "1") {

                                alert("Account created successfull");
                                window.location.reload()

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
                else {

                    alert("Log in credentials cannot be empty. ");
                }

            });

        });
    </script>
</head>
<body>
    <link rel="stylesheet" href="login.css">
    <h2>Sign in or sign up to continue shopping</h2>
    <div class="container" id="container">
        <div class="form-container sign-up-container">
            <form>
                <h1>Create Account</h1>
                <div class="social-container">
                    <a href="https://www.facebook.com/" class="social"><i class="fab fa-facebook-f"></i></a>
                    <a href="https://accounts.google.com/v3/signin/identifier?dsh=S-972394839%3A1684161422510717&continue=https%3A%2F%2Fmail.google.com%2Fmail%2Fu%2F0%2F&emr=1&followup=https%3A%2F%2Fmail.google.com%2Fmail%2Fu%2F0%2F&ifkv=Af_xneEBYHFZSgGWM7XklIIaORrfy-Rj3dAtpoqiajxxov0ajKuSsbwZf2A4dvffAWGmL117_FE8mw&osid=1&passive=1209600&service=mail&flowName=GlifWebSignIn&flowEntry=ServiceLogin#inbox" class="social"><i class="fab fa-google-plus-g"></i></a>
                    <a href="https://www.linkedin.com/uas/login?session_redirect=https%3A%2F%2Fwww.linkedin.com%2Fm%2Ffeed%2Fupdate%2Factivity%3A6325686410032480257" class="social"><i class="fab fa-linkedin-in"></i></a>
                </div>
                <span>or use your email for registration</span>
                <input id="name1" type="text" placeholder="Name" />
                <input id="phone1" type="phone" placeholder="phone" />
                <input id="email1" type="email" placeholder="Email" />
                <input id="password1" type="password" placeholder="Password" />
                 <input id="address1" type="address" placeholder="address" />
                <button id="btn-signup" >Sign Up</button>
            </form>
        </div>
        <div class="form-container sign-in-container">
            <form>
                <h1>Sign in</h1>
                <div class="social-container">
                    <a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
                    <a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
                    <a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
                </div>
                <span>or use your account</span>
                <input id="eemail" type="email" placeholder="Email" />
                <input id="ppassword" type="password" placeholder="Password" />
                <a href="forgotp.aspx">Forgot your password?</a>
                <button id="btn-sign">Sign In</button>
            </form>
        </div>
        <div class="overlay-container">
            <div class="overlay">
                <div class="overlay-panel overlay-left">
                    <h1>Welcome Back!</h1>
                    <p>To keep connected with us please login with your personal info</p>
                    <button type="button" class="ghost" id="signIn">Sign In</button>
                </div>
                <div class="overlay-panel overlay-right">
                    <h1>Hello, New Buyer!</h1>
                    <p>Enter your personal details and start shopping with us</p>
                    <button class="ghost" id="signUp">Sign Up</button>
                </div>
            </div>
        </div>
    </div>
    <script src="login.js"></script>
    <form name="frm" runat="server">


    <asp:HiddenField id="sessionAvailable" runat="server" value="false"/>

 </form>

</body>
</html>
