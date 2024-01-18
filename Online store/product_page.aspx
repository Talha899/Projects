﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="product_page.aspx.cs" Inherits="project_website.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <style>
    .product {
        background-color: orange;
        padding: 20px;
        display: flex;
        align-items: center;
        justify-content: space-between;
        max-width: auto;
        margin: auto;
    }

        .product img {
            width: 35%;
            height: auto;
        }

    .product-info {
        width: 50%;
        text-align: center;
        padding: 0 20px;
    }

        .product-info h2 {
            font-size: 36px;
            margin: 0;
        }

        .product-info p {
            font-size: 18px;
            margin-top: 20px;
        }

        .product-info button {
            background-color: green;
            color: white;
            padding: 10px 20px;
            font-size: 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 20px;
        }

</style>

<head runat="server">
    <!-- basic -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- mobile metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1">
    <!-- site metas -->
    <title>Better Buys </title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">

     <script src="jquery-3.6.4.min.js"></script>

<script src="bootstrap.bundle.min.js"></script>
<link href="bootstrap.min.css" rel="stylesheet" />
<script src="popper.min.js"></script>
<script src="jquery.min.js"></script>
    <!-- bootstrap css -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- style css -->
    <link rel="stylesheet" href="css/style.css">
    <!-- Responsive-->
    <link rel="stylesheet" href="css/responsive.css">
    <!-- fevicon -->
    <link rel="icon" href="images/fevicon.png" type="image/gif" />
    <!-- Scrollbar Custom CSS -->
    <link rel="stylesheet" href="css/jquery.mCustomScrollbar.min.css">
    <!-- Tweaks for older IEs-->
    <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css" media="screen">
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
    <script >
        $(document).ready(function () {


            
            const queryString = window.location.search;
            const searchParams = new URLSearchParams(queryString);
            var id = searchParams.get('product_id');
            var issession = $("#sessionAvailable").val();
            if (issession == "true") {
                if (id != null) {
                    $.ajax({
                        url: "product_page.aspx/getproduct",
                        type: "POST",
                        data: JSON.stringify({ "product_id": id }),
                        dataType: "json",
                        contentType: "application/json",
                        cache: false,
                        async: false,
                        success: function (response) {
                            if (response.d != "") {

                                var product = JSON.parse(response.d);



                                var HTLM = "";
                                HTLM = HTLM +
                                    '<img src="' + product.imglink + '" alt="Product Image">' +
                                    '<div class="product-info">' +
                                    '<h2>' + product.name + '</h2>' +
                                    '<p>' + product.description + '</p>' +
                                    '<h3> $' + product.price + '</h3>' +
                                    '<input style= "cursor: pointer; width: 140px; margin-left: 40%;" type="number" id= "quantity" class="form-control" value="1" min="1">' +
                                    '<button class="order-button" >  Order Now </button>'

                                '</div>';

                                $('.product').html(HTLM)

                            }
                        },
                        error: function (xhr, textStatus, error) {
                            alert("not  responded");
                        }
                    })
                }
            }

            else {
                window.location.href = "create_account.aspx";
            }

          
            $(".order-button").click(function ()
            {

                var quantity = $('#quantity').val()
                $.ajax({
                    url: "product_page.aspx/orderproduct",
                    type: "POST",
                   
                    data: JSON.stringify({ "customer_id": 1, "product_id": id, "quantity": quantity, "tracking_id": 0}),
                    dataType: "json",
                    contentType: "application/json",
                    cache: false,
                    async: false,
                    success: function (response) {
                        if (response.d != null) {
                            alert("item added to cart");
                           
                        }
                    },
                    error: function (xhr, textStatus, error) {
                        alert("item not added to cart");
                    }
                })
             
            });


        });
       

    </script>

</head>
<body class="main-layout footer_to90 project_page">
    <!-- loader  -->
    <div class="loader_bg">
        <div class="loader"><img src="images/loading.gif" alt="#" /></div>
    </div>
    <!-- end loader -->
    <!-- header -->
    <header>
        <!-- header inner -->
        <div class="header">
            <div class="header_top d_none1">
                <div class="container">
                    <div class="row">
                        <div class="col-md-4">
                            <ul class="conta_icon">
                                <li><a href="#"><img src="images/call.png" alt="#" />Call us:+923100000000</a> </li>
                            </ul>
                        </div>
                        <div class="col-md-4">
                            <ul class="social_icon">
                                <li>
                                    <a href="#">
                                        <i class="fa fa-facebook" aria-hidden="true"></i>
                                    </a>
                                </li>
                                <li> <a href="#"><i class="fa fa-twitter"></i></a></li>
                                <li> <a href="#"> <i class="fa fa-linkedin" aria-hidden="true"></i></a></li>
                                <li>
                                    <a href="#">
                                        <i class="fa fa-instagram" aria-hidden="true"></i>
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <div class="col-md-4">
                            <div class="se_fonr1">
                                <form action="#">
                                    <div class="select-box">
                                        <label for="select-box1" class="label select-box1"><span class="label-desc">English</span> </label>
                                        <select id="select-box1" class="select">
                                            <option value="Choice 1">English</option>
                                            <option value="Choice 1">Falkla</option>
                                            <option value="Choice 2">Germa</option>
                                            <option value="Choice 3">Neverl</option>
                                        </select>
                                    </div>
                                </form>
                                <span class="time_o"> Open hour: 8.00 - 18.00</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="header_midil">
                <div class="container">
                    <div class="row d_flex">
                        <div class="col-md-4">
                            <ul class="conta_icon d_none1">
                                <li><a href="#"><img src="images/email.png" alt="#" />BetterBuys@gmail.com</a> </li>
                            </ul>
                        </div>
                        <div class="col-md-4">
                            <a class="logo" href="#"><img src="images/logo.png" alt="#" /></a>
                        </div>
                        <div class="col-md-4">
                            <ul class="right_icon d_none1">
                                <li><a href="cart.aspx"><img src="images/shopping.png" alt="#" /></a> </li>
                                <a href="create_account.aspx" class="order">profile</a>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="header_bottom">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-8 col-lg-8 col-md-8 col-sm-8">
                            <nav class="navigation navbar navbar-expand-md navbar-dark ">
                                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample04" aria-controls="navbarsExample04" aria-expanded="false" aria-label="Toggle navigation">
                                    <span class="navbar-toggler-icon"></span>
                                </button>
                                <div class="collapse navbar-collapse" id="navbarsExample04">
                                    <ul class="navbar-nav mr-auto">
                                 <li class="nav-item active">
                                    <a class="nav-link" href="Home.aspx">Home</a>
                                 </li>
                                 <li class="nav-item">
                                    <a class="nav-link" href="About.aspx">About</a>
                                 </li>
                                 <li class="nav-item">
                                    <a class="nav-link" href="Product.aspx">Products</a>
                                 </li>
                                 <li class="nav-item">
                                    <a class="nav-link" href="Fashion.aspx">Fashion</a>
                                 </li>
                                 <li class="nav-item">
                                    <a class="nav-link" href="News.aspx">News</a>
                                 </li>
                                 <li class="nav-item">
                                    <a class="nav-link" href="Contact Us.aspx">Contact Us</a>
                                 </li>
                              </ul>
                                </div>
                            </nav>
                        </div>
                        <div class="col-md-4">
                            <div class="search">
                                <form action="/action_page.php">
                                    <input class="form_sea" type="text" placeholder="Search" name="search">
                                    <button type="submit" class="seach_icon"><i class="fa fa-search"></i></button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <!-- end header inner -->
    <!-- end header -->
    <div class="blue_bg">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="titlepage">
                        <h2>At your service </h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- project section -->
    <div class="product">
       
    </div>
    <!-- end project section -->
    <!--  footer -->
    <footer>
        <div class="footer">
            <div class="container">
                <div class="row">
                    <div class="col-md-3">
                        <div class="inror_box">
                            <h3>INFORMATION </h3>
                            <p>Best Buys aspiration is to be the best casual fashion brand with an outstanding price-value proposition. Capturing market trends and newness in colors, quality fabrics and shapes, and expressing them in the effortless, relaxed and comfortable style.</p>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="inror_box">
                            <h3>MY ACCOUNT </h3>
                            <p>Managing Your Profile and Orders on Our Online Store</p>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="inror_box">
                            <h3>ABOUT  </h3>
                            <p>Welcome to our online store, where you can find everything you need to fulfill your shopping desires! Our store offers a wide variety of products ranging from the latest fashion trends to household essentials. We aim to provide you with a seamless shopping experience with our user-friendly website and convenient delivery options.</p>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="inror_box">
                            <h3>CONTACTS  </h3>
                            <p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="copyright">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <p> Design by us</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- end footer -->
    <!-- Javascript files-->
    <script src="js/jquery.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>
    <script src="js/jquery-3.0.0.min.js"></script>
    <!-- sidebar -->
    <script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
    <script src="js/custom.js"></script>
    <form name="frm" runat="server">


    <asp:HiddenField id="sessionAvailable" runat="server" value="false"/>

 </form>


</body>
</html>