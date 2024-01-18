<% 
if(session.getAttribute("userID")==null )
{
	response.sendRedirect("login.jsp");
}
if(session.getAttribute("type")!="student" || session.getAttribute("type")!="parent" )
{
	response.sendRedirect("Logout");
}

%>
<%@page import="jclass.model.room"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Hostel Management System</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="apple-touch-icon" href="assets/img/apple-icon.png">
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/templatemo.css">
    <link rel="stylesheet" href="assets/css/custom.css">
    <!-- Load fonts style after rendering the layout styles -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
    <link rel="stylesheet" href="assets/css/fontawesome.min.css">
</head>
<body>
    <!-- Start Top Nav -->
    <nav class="navbar navbar-expand-lg bg-dark navbar-light d-none d-lg-block" id="templatemo_nav_top">
        <div class="container text-light">
            <div class="w-100 d-flex justify-content-end">
                <div>
                    <form class="me-2" action="filter" method="get">
                        <input class="form-control" type="search" placeholder="Search" aria-label="Search" name="Searchq" style="width: 300px;">
                        <button class="btn btn-outline-light" type="submit">Search</button>
                    </form>
                </div>
            </div>
        </div>
    </nav>
    <!-- End Top Nav -->

    <!-- Start Content -->
    <div class="container py-5">
        <div class="row">
            <div class="col-lg-9">
                <div class="row">
                    <div class="col-md-6">
                        <ul class="list-inline shop-top-menu pb-3 pt-1">
                            <li class="list-inline-item">
                                <a class="h3 text-dark text-decoration-none mr-3" href="filter?filter-tag=1">All</a>
                            </li>
                            <li class="list-inline-item">
                                <a class="h3 text-dark text-decoration-none mr-3" href="filter?filter-tag=2">Men's</a>
                            </li>
                            <li class="list-inline-item">
                                <a class="h3 text-dark text-decoration-none" href="filter?filter-tag=3">Women's</a>
                            </li>
                            <li class="list-inline-item">
                                <a class="h3 text-dark text-decoration-none" href="filter?filter-tag=4">Price(H)</a>
                            </li>
                            <li class="list-inline-item">
                                <a class="h3 text-dark text-decoration-none" href="filter?filter-tag=5">Price(L)</a>
                            </li>
                        </ul>
                    </div>
                </div>

                <div class="row">
                    <% List<room> rooms = (List<room>)request.getAttribute("rooms");
                    if (rooms != null && !rooms.isEmpty()) {
                        for (room r : rooms) {
                    %>
                    <div class="col-md-4 my-3">
                        <div class="card w-100">
                          <img class="card-img-top" src="<%=r.getImgLink()%>" alt="Card image cap">
                            <div class="card-body">
                                <h5 class="card-title"><%=r.getRoomName() %></h5>
                                <h6 class="price">Price: $<%=r.getPrice() %></h6>
                                <h6 class="capacity">Capacity: <%=r.getTotalOccupants() %></h6>
                                <div class="mt-3 d-flex justify-content-between">
                                    <a class="btn btn-dark" href="view-room?roomId=<%=r.getRoomId()%>">View</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <% }
                    } else {
                    	  out.println("There are no rooms kindly select from filter");
                    }
                    %>
                </div>
            </div>
        </div>
    </div>
    <!-- End Content -->

    <!-- ... (optional: include footer or other sections) ... -->

    <script src="assets/js/jquery-3.5.1.min.js"></script>
    <script src="assets/js/bootstrap.bundle.min.js"></script>
</body>
</html>
