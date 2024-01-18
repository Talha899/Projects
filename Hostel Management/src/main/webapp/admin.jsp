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
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Page</title>
    <link rel="stylesheet" href="css/bootstrap.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    
</head>

<body class="container-fluid" style = "width:40rem;">
    <h2 class="bg-primary text-white text-center">Welcome, Admin!</h2>

    <table class="table table-hover">
        <!-- View Users Section -->
        <tr>
            <td><h3>View Users</h3></td>
            <td><a href="viewUserServlet">View Users</a></td>
        </tr>

        <!-- Delete User Section -->
        <tr>
            <td><h3>Delete User</h3></td>
            <td>
                <form action="deleteUserServlet" method="post">
                    Enter User ID to delete: <input type="text" name="userId">
                    <input type="hidden" name="action" value="deleteUser">
                    <input type="submit" value="Delete User">
                </form>
            </td>
        </tr>

        <!-- View Reports Section -->
        <tr>
            <td><h3>View Reports</h3></td>
            <td><a href="viewReportServlet">View Reports</a></td>
        </tr>
    </table>
</body>
</html>
