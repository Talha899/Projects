<% 
if(session.getAttribute("userID")==null )
{
	response.sendRedirect("login.jsp");
}
if(session.getAttribute("type")!="admin" )
{
	response.sendRedirect("Logout");
}
%>
<!DOCTYPE html>
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
        <div class="row justify-content-center mt-5">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header">
                        <h3 class="text-center">Add Hostel</h3>
                    </div>
                    <div class="card-body">
                        <form method="post" action="addHostel">
						    <label for="hostelname" class="form-label">Hostel Name</label>
						    <input type="text" class="form-control" id="hostelname" name="hostelname" required>
						
						    <label for="location" class="form-label">Location</label>
						    <input type="text" class="form-control" id="location" name="location" required>
						
						    <label for="hostelImage" class="form-label">Hostel's Image</label>
						    <input type="file" class="form-control" id="hostelImage" name="hostelImage">
						
						    <label for="distance" class="form-label">Distance</label>
						    <input type="number" class="form-control" id="distance" name="distance" min="0" required>
						
						    <hr>
						
						    <button type="submit" class="btn btn-primary">Add</button>
						</form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Bootstrap JS -->

</body>

</html>