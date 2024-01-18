<!DOCTYPE html>
<%@page import="jclass.model.room"%>
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
                <a href="" class="btn btn-primary">Logout</a>
            </div>
        </header>
    </div>

    <div class="container">
        <h2>rooms</h2>
    </div>

    <section style=" background-color: #eee;">
        <div class="container py-5">
            <div class="col-lg-15">
                <div class="card mb-10">

                    <div class="table-responsive table-card mb-1">
                        <table class="table align-middle table-nowrap" id="orderTable">
                            <thead class="table-light">
                                <tr>
                                    <th class="sort fw-medium" data-sort="room-id">room ID</th>
                                    <th class="sort fw-medium" data-sort="no-of-students">No. Of Students</th>
                                    <th class="sort fw-medium" data-sort="seats-available">Total Capacity</th>
                                    <th class="sort fw-medium" data-sort="Actions">Actions</th>
                                </tr>
                            </thead>
                            <tbody class="list form-check-all">
                            <% List<room> rooms  = (List<room>)request.getAttribute("rooms");
                                if(rooms!=null){
                                	for(room room : rooms){
                                
                                %>
                                <tr>
                                    <td class="room-id"><%= room.getRoomId() %></td>
                                    <td class="no-of-students"><%= room.getNoOfOccupants() %></td>
                                    <td class="seats-available"><%= room.getTotalOccupants()%></td>
                                    <td class="Actions">
                                    	<a href="viewroom?roomID=<%= room.getRoomId() %>" class="btn btn-primary">View</a>
                                        <a href="editroom?roomID=<%= room.getRoomId() %>" class="btn btn-success">Edit</a>
                                        <a href="deleteroom?roomID=<%= room.getRoomId() %>" class="btn btn-danger">Delete</a>
                                    </td>


                                </tr>
                                <% } }else {} %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <hr>
            <a href="addroom" class="btn btn-success">+Add room</a>
        </div>
    </section>

    <!-- Bootstrap JS -->

</body>

</html>