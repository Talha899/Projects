<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="order_confirmed.aspx.cs" Inherits="project_website.order_confirmed" %>

<!DOCTYPE html>
<html>
<head>
	    <script src="popper.min.js"></script>
<script src="jquery.min.js"></script>
	<title>Order Confirmed</title>
	<style>
		body {
			background-color: #f2f2f2;
			font-family: Arial, sans-serif;
			font-size: 16px;
			line-height: 1.6;
			color: #333;
			margin: 0;
			padding: 0;
		}
		
		.container {
			max-width: 800px;
			margin: 0 auto;
			padding: 50px;
			background-color: #fff;
			border-radius: 5px;
			box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.3);
		}
		
		h1 {
			font-size: 28px;
			font-weight: bold;
			margin-bottom: 20px;
		}
		
		p {
			margin-bottom: 20px;
		}
		
		button {
			background-color: #4CAF50;
			border: none;
			color: white;
			padding: 10px 20px;
			text-align: center;
			text-decoration: none;
			display: inline-block;
			font-size: 16px;
			margin-top: 20px;
			cursor: pointer;
			border-radius: 5px;
		}
		
		button:hover {
			background-color: #3e8e41;
		}
	</style>
	
    	<script>
            $(document).ready(function ()
            {
                $("#btn-con").click(function ()
            {
                    var issession = $("#sessionAvailable").val();

                    if (issession=="true")
				{
                    $.ajax({
                        url: "order_confirmed.aspx/check_order",
                        type: "POST",
                        data: JSON.stringify({
               
						}),
                        dataType: "json",
                        contentType: "application/json",
                        cache: false,
                        async: false,
						success: function (response)
						{
							if (response.d != "0")
							{


                            }
                           
                        },
                        error: function (xhr, textStatus, error) {
                            alert("not  responded");
                        }
                    })

				}
			

                    window.location.href = "home.aspx";
            });



        });
        </script>
</head>
<body>
	<div class="container">
		<h1>Order Confirmed</h1>
		<p>Thank you for your order. Your items will be shipped within the next 2 business days.</p>
		<button id="btn-con">Return to Home</button>
	</div>

	<form name="frm" runat="server">
    <asp:HiddenField id="sessionAvailable" runat="server" value="false"/>
 </form>

</body>
</html>

