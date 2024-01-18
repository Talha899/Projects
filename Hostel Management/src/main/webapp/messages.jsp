<% 
if(session.getAttribute("userID")==null)
{
	response.sendRedirect("login.jsp");
}

%>
<%@page import="jclass.model.name_id"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Name List with Chat</title>
    <!-- Bootstrap CSS link -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-GLhlTQ8iK7tWn0I5HZ9ZccZEaYmZgT+USFV/qfNqQ9aI2MIigjPj78WbW8bXpWl" crossorigin="anonymous">
    <style>
        body {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
            background-color: #f8f9fa;
        }

        .container {
            background-color: #ffffff;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            width: 400px;
            text-align: center;
        }

        h1 {
            color: #007bff;
        }

        .list-group-item {
            background-color: #ffffff;
            border: none;
            margin-bottom: 10px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        h2 {
            color: #343a40;
            margin-bottom: 0;
        }

        .btn-primary {
            background-color: #007bff;
            border: none;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>Name List with Chat</h1>

    <ul class="list-group">
        <!-- Replace these names with your own list -->
        <% List<name_id> listOfIds1 = (List<name_id>) request.getAttribute("listOfIds1");
        if (listOfIds1 != null && !listOfIds1.isEmpty()) {
            for (name_id m : listOfIds1) {
        %>
        <li class="list-group-item">
            <h2>Name: <%= m.getName() %></h2>
            <a href="namegetter?senderID=<%=session.getAttribute("userID") %>&receiverID=<%= m.getId() %>" class="btn btn-primary">View Chat</a>
        </li>
        <% }
        } else {
            out.println("There are no messages");
        }
        %>
        <!-- Add more names as needed -->
    </ul>
</div>
</body>
</html>
