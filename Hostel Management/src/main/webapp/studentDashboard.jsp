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
<%@page import="jclass.model.user"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>



<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Dashboard</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="bootstrap-5.0.2-dist/css/bootstrap.min.css">
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
                <li><a href="studentDashboard.html" class="nav-link px-2 link-secondary">Dashboard</a></li>
                <li><a href="dismessage" class="nav-link px-2 link-dark">Chat</a></li>
                <li><a href="displayroom.jsp" class="nav-link px-2 link-dark">Search</a></li>
            </ul>

            <div class="col-md-3 text-end">
             <a href="Logout" class="btn btn-primary">Logout</a>
            
            </div>
        </header>
    </div>

    <section style="background-color: #eee;">
    
    
      <% List<user> users1 = (List<user>)request.getAttribute("users1");
              if (users1 != null && !users1.isEmpty()) {
                for (user u : users1) {
      %>
        <div class="container py-5">
            <div class="row">
                <div class="col-lg-4">
                    <div class="card mb-4">
                        <div class="card-body text-center">
                            <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava3.webp"
                                alt="avatar" class="rounded-circle img-fluid" style="width: 150px;">
                            <h5 class="my-3"><%=u.getUsername() %></h5>
                            <p class="text-muted mb-1">Age: <%=u.getAge() %></p>
                            <p class="text-muted mb-4">Gender: <%=u.getGender() %> </p>
                           
                        </div>
                    </div>
                </div>
                
                
                
                <div class="col-lg-8">
                    <div class="card mb-4">
                        <div class="card-body">
                      
                            <div class="row">
                                <div class="col-sm-3">
                                    <p class="mb-0">Name</p>
                                </div>
                                <div class="col-sm-9">
                                    <p class="text-muted mb-0"><%=u.getName()%></p>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-3">
                                    <p class="mb-0">Email</p>
                                </div>
                                <div class="col-sm-9">
                                    <p class="text-muted mb-0"><%=u.getEmail()%></p>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-3">
                                    <p class="mb-0">Phone</p>
                                </div>
                                <div class="col-sm-9">
                                    <p class="text-muted mb-0"><%=u.getContact()%></p>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-3">
                                    <p class="mb-0">CNIC</p>
                                </div>
                                <div class="col-sm-9">
                                    <p class="text-muted mb-0"><%=u.getCNIC()%></p>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-3">
                                    <p class="mb-0">Address</p>
                                </div>
                                <div class="col-sm-9">
                                    <p class="text-muted mb-0"><%=u.getAddress()%></p>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    
          <% }
                    } else {
                    	  out.println("There are no rooms kindly select from filter");
                    }
                    %>
    
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
                                    <th class="sort fw-medium" data-sort="due_date">Due Date</th>
                                    <th class="sort fw-medium" data-sort="date_paid">Date Paid</th>
                                    <th class="sort fw-medium" data-sort="type">Type</th>
                                    <th class="sort fw-medium" data-sort="status">Status</th>
                                    <th class="fw-medium" data-sort="action">Action</th>
                                </tr>
                            </thead>
                            <tbody class="list form-check-all">
                                <tr>
                                    <td class="amount">$2145.20</td>
                                    <td class="order_date">11 Feb, 2021</td>
                                    <td class="delivery_date">22 Feb, 2021</td>
                                    <td class="payment_method">COD</td>
                                    <td class="status"><span
                                            class="badge bg-success-subtle text-success  text-uppercase">Delivered</span>
                                    </td>
                                    <td>
                                        <span class="badge bg-light text-primary border border-primary">Paid</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="amount">$203.65</td>
                                    <td class="order_date">08 Oct, 2021</td>
                                    <td class="delivery_date">24 Oct, 2021</td>
                                    <td class="payment_method">Visa</td>
                                    <td class="status"><span
                                            class="badge bg-danger-subtle text-danger  text-uppercase">Cancelled</span>
                                    </td>
                                    <td>
                                        <span class="badge bg-light text-primary border border-primary">Paid</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="amount">$1876.02</td>
                                    <td class="order_date">25 Nov, 2021</td>
                                    <td class="delivery_date">03 Dec, 2021</td>
                                    <td class="payment_method">COD</td>
                                    <td class="status"><span
                                            class="badge bg-primary-subtle text-primary  text-uppercase">Returns</span>
                                    </td>
                                    <td>
                                        <a href="payment.jsp" class="btn btn-primary">Pay</a>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        </div>
    </section>



    <!-- Bootstrap JS -->
    <script src="bootstrap-5.0.2-dist/js/bootstrap.min.js"></script>

</body>

</html>