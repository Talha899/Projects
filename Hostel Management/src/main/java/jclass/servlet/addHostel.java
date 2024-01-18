package jclass.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jclass.connection.DBCon;

@WebServlet("/addHostel")
public class addHostel extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("addHostel.jsp");
        dispatcher.forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String hostelName = request.getParameter("hostelname");
        String location = request.getParameter("location");
        int distance = Integer.parseInt(request.getParameter("distance"));
        
        try (Connection connection = DBCon.getConnetion()) {
            String insertQuery = "INSERT INTO hostel (hostelName, location, distance,managerID) VALUES (?, ?, ?,2)";
            try (PreparedStatement preparedStatement = connection.prepareStatement(insertQuery)) {
                preparedStatement.setString(1, hostelName);
                preparedStatement.setString(2, location);
                preparedStatement.setInt(3, distance);

                preparedStatement.executeUpdate();
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            RequestDispatcher dispatcher = request.getRequestDispatcher("error.jsp");
	        dispatcher.forward(request, response);
	        return;
            // Handle the exception as needed, e.g., redirect to an error page
        }
        
        
	}

}
