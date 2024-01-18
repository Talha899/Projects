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
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@page import="jclass.model.room"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Hostel Management System</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/templatemo.css">
    <link rel="stylesheet" href="assets/css/custom.css">

    <!-- Load fonts style after rendering the layout styles -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
    <link rel="stylesheet" href="assets/css/fontawesome.min.css">

    <!-- Slick -->
    <link rel="stylesheet" type="text/css" href="assets/css/slick.min.css">
    <link rel="stylesheet" type="text/css" href="assets/css/slick-theme.css">

    <!-- Bootstrap JavaScript library -->
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.8.0/dist/js/bootstrap.min.js"></script>
</head>

<body>
    <!-- Open Content -->
    <section class="bg-light">
        <div class="container pb-5">
           <% List<room> rooms = (List<room>)request.getAttribute("rooms");
                    if (rooms != null && !rooms.isEmpty()) {
                        for (room r : rooms) {
                    %>
            <div class="row">
                <div class="col-lg-5 mt-5">
                    <div class="card mb-3">
                        <img class="card-img img-fluid" src="<%=r.getImgLink()%>"  alt="Card image cap" id="product-detail">
                    </div>
                </div>

                <div class="col-lg-7 mt-5">
                
                  
                    <div class="card">
                    
                        <div class="card-body">
                            <h1 class="h2">Room Name: <%=r.getRoomName() %></h1>
                            
                            <p class="h3 py-2">Price: <%=r.getPrice() %></p>
                            <p class="py-2">
                                <span class="list-inline-item text-dark">Number of Occupants: <%=r.getNoOfOccupants() %></span>
                            </p>

                            <ul class="list-inline">
                                <li class="list-inline-item">
                                    <h6>Features:</h6>
                                </li>
                                <li class="list-inline-item">
                                    <p class="text-muted"><strong><%=r.getFeatures() %></strong></p>
                                </li>
                            </ul>

                            <h6>Description:</h6>
                            <p><%=r.getDescription() %></p>

                            <ul class="list-inline">
                                <li class="list-inline-item">
                                    <h6>Capacity:</h6>
                                </li>
                                <li class="list-inline-item">
                                    <p class="text-muted"><strong><%=r.getTotalOccupants() %></strong></p>
                                </li>
                            </ul>

                            <h6>Status:</h6>
                            <ul class="list-unstyled pb-3">
                                <li><%=r.getStatus() %></li>                              
                            </ul>
    		
                            <!-- Buttons -->
                            <div class="row pb-3">
                <%
  					  if (r.getNoOfOccupants() < r.getTotalOccupants()) {
				%>
   
                                <div class="col d-grid">
                                    <a href="rent_leave?tag=1&senderID=<%=session.getAttribute("userID") %>&roomid=<%=r.getRoomId() %>" class="btn btn-success btn-lg" role="button">Rent</a>
                                </div>
                                <div class="col d-grid">
                                    <a href="rent_leave?tag=2&senderID=<%=session.getAttribute("userID") %>&roomid=<%=r.getRoomId() %>" class="btn btn-success btn-lg" role="button">Leave</a>
                                </div>
                     <%
                 }
                    %>
                                <div class="col d-grid">
                                    <a href="namegetter?senderID=<%=session.getAttribute("userID") %>&receiverID=<%=r.getManagerID() %>" class="btn btn-info btn-lg" role="button">Chat</a>
                                </div>
                            </div>
                            <!-- End Buttons -->
				 <% }
                    } else {
                    	  out.println("There are no room.");
                    }
                    %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Close Content -->

    <!-- Start Slider Script -->
    <script src="assets/js/slick.min.js"></script>
</body>

</html>
