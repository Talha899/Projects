<!DOCTYPE html>
<%@page import="jclass.model.user"%>
<%@page import="jclass.model.Hostel"%>
<%@page import="jclass.model.Payments"%>
<%@page import="java.util.List"%>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manager Dashboard Page</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>

<body>
    <div class="container">
        <header
            class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
            <a href="/" class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-dark text-decoration-none">
                <img width="50" height="50" src="https://img.icons8.com/ios-filled/50/f-key.png" alt="f-key" />
            </a>

            <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
                <li><a href="#" class="nav-link px-2 link-secondary">Dashboard</a></li>
                <li><a href="#" class="nav-link px-2 link-dark">Chat</a></li>
            </ul>

            <div class="col-md-3 text-end">
                <a href="home.jsp" class="btn btn-primary">Logout</a>
            </div>
        </header>
    </div>

    <section style="background-color: #eee;">
        <div class="container py-5">
            <div class="row">
                <div class="col-lg-4">
                    <div class="card mb-4">
                        <div class="card-body text-center">
                            <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava3.webp"
                                alt="avatar" class="rounded-circle img-fluid" style="width: 150px;">
                            <h5 class="my-3">John Smith</h5>
                            <p class="text-muted mb-1">Full Stack Developer</p>
                            <p class="text-muted mb-4">Bay Area, San Francisco, CA</p>
                            <div class="d-flex justify-content-center mb-2">
                                <button type="button" class="btn btn-primary"
                                    onclick="window.location.href='editProfile.html'">Edit Profile</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-8">
                    <div class="card mb-4">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-sm-3">
                                    <p class="mb-0">First Name</p>
                                </div>
                                <div class="col-sm-9">
                                    <p class="text-muted mb-0">Johnatan Smith</p>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-3">
                                    <p class="mb-0">Last Name</p>
                                </div>
                                <div class="col-sm-9">
                                    <p class="text-muted mb-0">Johnatan Smith</p>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-3">
                                    <p class="mb-0">Email</p>
                                </div>
                                <div class="col-sm-9">
                                    <p class="text-muted mb-0">example@example.com</p>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-3">
                                    <p class="mb-0">Phone</p>
                                </div>
                                <div class="col-sm-9">
                                    <p class="text-muted mb-0">(097) 234-5678</p>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-3">
                                    <p class="mb-0">CNIC</p>
                                </div>
                                <div class="col-sm-9">
                                    <p class="text-muted mb-0">(098) 765-4321</p>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-3">
                                    <p class="mb-0">Address</p>
                                </div>
                                <div class="col-sm-9">
                                    <p class="text-muted mb-0">Bay Area, San Francisco, CA</p>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </section>

    <div class="container">
        <h2>Payments</h2>
    </div>

    <section style=" background-color: #eee;">
        <div class="container py-5">
            <div class="col-lg-15">
                <div class="card mb-10">

                    <div class="table-responsive table-card mb-1">
                        <table class="table align-middle table-nowrap" id="orderTable">
                            <thead class="table-light">
                                <tr>
                                    <th class="sort fw-medium" data-sort="amount">Amount</th>
                                    <th class="sort fw-medium" data-sort="student-id">Student ID</th>
                                    <th class="sort fw-medium" data-sort="type">Type</th>
                                    <th class="sort fw-medium" data-sort="status">Status</th>
                                </tr>
                            </thead>
                            <tbody class="list form-check-all">
                                <% List<Payments> payments  = (List<Payments>)request.getAttribute("payments");
                                if(payments!=null){
                                	for(Payments payment : payments){
                                
                                %>
                                <tr>
                                    <td class="amount"><%= payment.getAmount() %></td>
                                    <td class="student-id"><%= payment.getPayeeID() %></td>
                                    <td class="payment_method"><%= payment.getPaymentType() %></td>
                                    <td class="status"><span
                                            class="badge bg-success-subtle text-success  text-uppercase"><%= payment.getStatus() %></span>
                                    </td>

                                </tr>
                                <% } }else {} %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        </div>
    </section>

    <div class="container">
        <h2>Hostels</h2>
    </div>

    <section style=" background-color: #eee;">
        <div class="container py-5">
            <div class="col-lg-15">
                <div class="card mb-10">

                    <div class="table-responsive table-card mb-1">
                        <table class="table align-middle table-nowrap" id="orderTable">
                            <thead class="table-light">
                                <tr>
                                    <th class="sort fw-medium" data-sort="hostel-id">Hostel ID</th>
                                    <th class="sort fw-medium" data-sort="hostel-name">Hostel Name</th>
                                    <th class="sort fw-medium" data-sort="location">location</th>
                                    <th class="sort fw-medium" data-sort="distance">distance</th>
                                    <th class="sort fw-medium" data-sort="Actions">Actions</th>
                                </tr>
                            </thead>
                            <tbody class="list form-check-all">
                                	<% List<Hostel> hostels  = (List<Hostel>)request.getAttribute("hostels");
                                if(hostels!=null){
                                	for(Hostel hostel : hostels){
                                
                                %>
                                <tr>
                                    <td class="hostel-id"><%= hostel.getHostelID() %></td>
                                    <td class="hostel-name"><%= hostel.getHostelName() %></td>
                                    <td class="location"><%= hostel.getLocation() %></td>
                                    <td class="distance"><%= hostel.getDistance() %> km</td>
                                    <td class="Actions">
                                        <a href="viewHostel?hostelID=<%= hostel.getHostelID() %>" class="btn btn-primary">View</a>
                                        <a href="editHostel?hostelID=<%= hostel.getHostelID() %>" class="btn btn-success">Edit</a>
                                        <a href="deleteHostel?hostelID=<%= hostel.getHostelID() %>" class="btn btn-danger">Delete</a>
                                    </td>

									
                                </tr>
                                <% } 
                                }else {} %>
                             
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <hr>
            <a href="addHostel.jsp" class="btn btn-success">+Add Hostel</a>
        </div>
    </section>

    <div class="container">
        <h2>Students Registered</h2>
    </div>

    <section style=" background-color: #eee;">
        <div class="container py-5">
            <div class="col-lg-15">
                <div class="card mb-10">

                    <div class="table-responsive table-card mb-1">
                        <table class="table align-middle table-nowrap" id="orderTable">
                            <thead class="table-light">
                                <tr>
                                    <th class="sort fw-medium" data-sort="student-id">Student ID</th>
                                    <th class="sort fw-medium" data-sort="student-name">Student Name</th>
                                    <th class="sort fw-medium" data-sort="Actions">Actions</th>
                                </tr>
                            </thead>
                            <tbody class="list form-check-all">
                            <% List<user> users  = (List<user>)request.getAttribute("users");
                                if(users!=null){
                                	for(user user : users){
                                
                                %>
                                <tr>
                                    <td class="student-id"><%= user.getUserID() %></td>
                                    <td class="student-name"><%= user.getName() %></td>
                                    <td class="Actions">
                                        <a href="getPayment" class="btn btn-primary">Get Payment</a>
                                    </td>
                                </tr>
                                <% } 
                                }else {} %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </section>

    


    <!-- Bootstrap JS -->

</body>

</html>