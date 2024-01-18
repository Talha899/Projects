<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="News.aspx.cs" Inherits="project_website.News" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
    <!-- basic -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- mobile metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1">
    <!-- site metas -->
    <title>Better Buys</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">
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
</head>
<!-- body -->
<body class="main-layout footer_to90 news_page">
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
                        <h2>Latest Trends</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- news section -->
    <div class="news">
        <div class="container">
            <div class="row">
                <div class="col-md-12 margin_top40">
                    <div class="row d_flex">
                        <div class="col-md-5">
                            <div class="news_img">
                                <figure><img src="images/news_img1.jpg"></figure>
                            </div>
                        </div>
                        <div class="col-md-7">
                            <div class="news_text">
                                <h3>6 Men’s Shoe Trends For 2023, Including Pedro Pascal’s Sustainable Sneak</h3>
                                <span>20 feb 2023</span>
                                <div class="date_like">
                                    <span>Like </span><span class="pad_le">Comment</span>
                                </div>
                                <p>Are they sneakers? Are they boots? Yes, in short. From footwear giants like Nike and Converse to styles like Vans hiker sneakers, the idea of throwing two ingredients into a blender and ending up with one stylish final result has never been more prevalent as you shop the best men’s shoe trends of 2023.</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-12 margin_top40">
                    <div class="row d_flex">
                        <div class="col-md-5">
                            <div class="news_img">
                                <figure><img src="images/news_img2.jpg"></figure>
                            </div>
                        </div>
                        <div class="col-md-7">
                            <div class="news_text">
                                <h3>The Skinny Jean Is Dead: The 5 Denim Styles You Need Now</h3>
                                <span>20 feb 2023</span>
                                <div class="date_like">
                                    <span>Like </span><span class="pad_le">Comment</span>
                                </div>
                                <p>Shopping for jeans just got a lot easier. That unforgiving, leg-hugging style has made way for a looser look</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-12 margin_top40">
                    <div class="row d_flex">
                        <div class="col-md-5">
                            <div class="news_img">
                                <figure><img src="images/news_img3.jpg"></figure>
                            </div>
                        </div>
                        <div class="col-md-7">
                            <div class="news_text">
                                <h3>9 Shoe Trends For Men This 2023</h3>
                                <span>20 feb 2023</span>
                                <div class="date_like">
                                    <span>Like </span><span class="pad_le">Comment</span>
                                </div>
                                <p>Shoe trends for men come and go. Keeping up with what’s new can be challenging if you aren’t constantly paying attention. But in 2023, the trends are moving a bit slower and are focused on the comfort and look of the shoes.More shoes this year can boast of increased flexibility and better cushioning with tried designs that make them wearable. Above all, shoe trends in 2023 are stylish enough to complement and complete different looks. So, whether you’re looking to add more style to your wardrobe or freshen up your looks, it’s vital to understand the biggest shoe trends of 2023. To point you in the right direction, below are the trendiest men’s shoes that every man should consider adding to their wardrobe. </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- end news section -->
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
                </div>
            </div>
            <div class="copyright">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <p>Design by us</p>
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
</body>
</html>
