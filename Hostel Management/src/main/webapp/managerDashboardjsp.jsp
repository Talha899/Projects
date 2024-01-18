<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manager Dashboard Page</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="bootstrap-5.0.2-dist/css/bootstrap.min.css">
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
                <button type="button" class="btn btn-outline-primary me-2">Login</button>
                <button type="button" class="btn btn-primary">Logout</button>
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
                                    <th class="sort fw-medium" data-sort="hostel-id">Hostel ID</th>
                                    <th class="sort fw-medium" data-sort="due_date">Due Date</th>
                                    <th class="sort fw-medium" data-sort="date_paid">Date Paid</th>
                                    <th class="sort fw-medium" data-sort="type">Type</th>
                                    <th class="sort fw-medium" data-sort="status">Status</th>
                                </tr>
                            </thead>
                            <tbody class="list form-check-all">
                                <tr>
                                    <td class="amount">$2145.20</td>
                                    <td class="student-id">1</td>
                                    <td class="hostel-id">2</td>
                                    <td class="order_date">11 Feb, 2021</td>
                                    <td class="delivery_date">22 Feb, 2021</td>
                                    <td class="payment_method">COD</td>
                                    <td class="status"><span
                                            class="badge bg-success-subtle text-success  text-uppercase">Delivered</span>
                                    </td>

                                </tr>
                                <tr>
                                    <td class="amount">$203.65</td>
                                    <td class="student-id">1</td>
                                    <td class="hostel-id">2</td>
                                    <td class="order_date">08 Oct, 2021</td>
                                    <td class="delivery_date">24 Oct, 2021</td>
                                    <td class="payment_method">Visa</td>
                                    <td class="status"><span
                                            class="badge bg-danger-subtle text-danger  text-uppercase">Cancelled</span>
                                    </td>

                                </tr>
                                <tr>
                                    <td class="amount">$1876.02</td>
                                    <td class="student-id">1</td>
                                    <td class="hostel-id">2</td>
                                    <td class="order_date">25 Nov, 2021</td>
                                    <td class="delivery_date">03 Dec, 2021</td>
                                    <td class="payment_method">COD</td>
                                    <td class="status"><span
                                            class="badge bg-primary-subtle text-primary  text-uppercase">Returns</span>
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
                                    <th class="sort fw-medium" data-sort="no-of-students">No. Of Students</th>
                                    <th class="sort fw-medium" data-sort="address">Address</th>
                                    <th class="sort fw-medium" data-sort="seats-available">Occupations Available</th>
                                    <th class="sort fw-medium" data-sort="Actions">Actions</th>
                                </tr>
                            </thead>
                            <tbody class="list form-check-all">
                                <tr>
                                    <td class="hostel-id">1</td>
                                    <td class="hostel-name">Sadam hostel</td>
                                    <td class="no-of-students">35</td>
                                    <td class="address">faisal town b-block</td>
                                    <td class="seats-available">15</td>
                                    <td class="Actions">
                                        <a href="rooms.html" class="btn btn-primary">View</a>
                                        <a href="editHostel.html" class="btn btn-success">Edit</a>
                                        <a href="" class="btn btn-danger">Delete</a>
                                    </td>


                                </tr>
                                <tr>
                                    <td class="hostel-id">1</td>
                                    <td class="hostel-name">Sadam hostel</td>
                                    <td class="no-of-students">35</td>
                                    <td class="address">faisal town b-block</td>
                                    <td class="seats-available">15</td>
                                    <td class="Actions">
                                        <a href="rooms.html" class="btn btn-primary">View</a>
                                        <a href="editHostel.html" class="btn btn-success">Edit</a>
                                        <a href="" class="btn btn-danger">Delete</a>
                                    </td>

                                </tr>
                                <tr>
                                    <td class="hostel-id">1</td>
                                    <td class="hostel-name">Sadam hostel</td>
                                    <td class="no-of-students">35</td>
                                    <td class="address">faisal town b-block</td>
                                    <td class="seats-available">15</td>
                                    <td class="Actions">
                                        <a href="rooms.html" class="btn btn-primary">View</a>
                                        <a href="editHostel.html" class="btn btn-success">Edit</a>
                                        <a href="" class="btn btn-danger">Delete</a>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <a href="addHostel.html" class="btn btn-success">+Add Hostel</a>
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
                                    <th class="sort fw-medium" data-sort="hostel-id">Hostel ID</th>
                                    <th class="sort fw-medium" data-sort="room-id">Room ID</th>
                                    <th class="sort fw-medium" data-sort="Actions">Actions</th>
                                </tr>
                            </thead>
                            <tbody class="list form-check-all">
                                <tr>
                                    <td class="student-id">1</td>
                                    <td class="student-name">Laraib Akhtar</td>
                                    <td class="hostel-id">2</td>
                                    <td class="room-id">3</td>
                                    <td class="Actions">
                                        <a href="viewProfile.html" class="btn btn-primary">View</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="student-id">1</td>
                                    <td class="student-name">Laraib Akhtar</td>
                                    <td class="hostel-id">2</td>
                                    <td class="room-id">3</td>
                                    <td class="Actions">
                                        <a href="viewProfile.html" class="btn btn-primary">View</a>
                                    </td>

                                </tr>
                                <tr>
                                    <td class="student-id">1</td>
                                    <td class="student-name">Laraib Akhtar</td>
                                    <td class="hostel-id">2</td>
                                    <td class="room-id">3</td>
                                    <td class="Actions">
                                        <a href="viewProfile.html" class="btn btn-primary">View</a>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <div class="container">
        <h2>Features</h2>
    </div>

    <section style=" background-color: #eee;">
        <div class="container py-5">
            <div class="col-lg-15">
                <div class="card mb-10">

                    <div class="table-responsive table-card mb-1">
                        <table class="table align-middle table-nowrap" id="orderTable">
                            <thead class="table-light">
                                <tr>
                                    <th class="sort fw-medium" data-sort="feature-id">Feature ID</th>
                                    <th class="sort fw-medium" data-sort="feature-name">Feature Name</th>
                                </tr>
                            </thead>
                            <tbody class="list form-check-all">
                                <tr>
                                    <td class="feature-id">1</td>
                                    <td class="feature-name">ac</td>
                                </tr>
                                <tr>
                                    <td class="feature-id">1</td>
                                    <td class="feature-name">ac</td>

                                </tr>
                                <tr>
                                    <td class="feature-id">1</td>
                                    <td class="feature-name">ac</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <a href="addFeature.html" class="btn btn-success">+Add Feature</a>
        </div>
    </section>


    <!-- Bootstrap JS -->
    <script src="bootstrap-5.0.2-dist/js/bootstrap.min.js"></script>

</body>

</html>